package com.csd430.mod8;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import com.google.gson.Gson;
import sun.net.www.http.ChunkedOutputStream;

@WebServlet
public class Controller extends HttpServlet {
    private DAO dao;
    public Controller() {
        try {
            this.dao = new DAO();
        } catch (ClassNotFoundException e) {
            System.out.println("unable to find MySQL driver in classpath" + e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        router(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        router(req, res);
    }

    private void router(HttpServletRequest req, HttpServletResponse res) {
        System.out.println("CONTROLLER : '" + req.getMethod() +"' "+ req.getServletPath());
        String path = req.getServletPath();

        try {
            PrintWriter out = res.getWriter();

            switch(path) {
                case "/":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        handleGetRoot(req, res);
                    }
                    break;
                case "/create":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        handleGetCreate(req, res);
                    }
                    break;
                case "/insert":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        handleGetInsert(req, res);
                    }
                    break;
                case "/teams":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        handleGetTeams(req, res);
                    } else if(Objects.equals(req.getMethod(), "POST")) {
                        handlePostTeam(req, res);
                    }
                    break;
            }
        } catch (ServletException e) {
            res.setStatus(500);
        } catch (IOException e) {
            res.setStatus(404);
        }
    }

    public void handleGetRoot(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("Landing.jsp").forward(req, res);
    }

    public void handleGetCreate(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.dao.createBaseballTeamTable();
    }

    public void handleGetInsert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.dao.addTeams();
    }

    public void handleGetTeams(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        List<BaseballTeam> teams = this.dao.getAllTeams();
        String teamsJson = new Gson().toJson(teams);
        PrintWriter out = res.getWriter();
        out.print(teamsJson);
        out.flush();
    }

    public void handlePostTeam(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Gson g = new Gson();
        List<BaseballTeam> team = g.fromJson(req.getParameter("team"), List.class);
        this.dao.addTeam(team);
    }

    public void destroy() {
    }
}