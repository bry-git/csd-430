package com.ebookshop;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet
public class Controller extends HttpServlet {

    private String resourceUrl;
    private PrintWriter out;
    private DataAccessObject db;

    public Controller() {
        this.resourceUrl = "/WEB-INF/jsp/";
        this.db = new DataAccessObject();
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse res) {
        try {
            out = res.getWriter();
            String path = req.getServletPath();

            switch (path) {
                case "/":
                    req.getRequestDispatcher(this.resourceUrl + "landing.jsp").forward(req, res);
                    break;

                case "/books":
                    if(req.getMethod() == "GET") {
                        req.setAttribute("books", this.db.mockGetBooks());
                        req.getRequestDispatcher(this.resourceUrl + "books.jsp").forward(req, res);
                    }
                    else if(req.getMethod() == "POST") {
                        //handle a post
                    }
                    break;

                case "/cart":
                    req.getRequestDispatcher(this.resourceUrl + "checkout.jsp").forward(req, res);
                    break;
            }
        } catch (ServletException e) {
            res.setStatus(500);
        } catch (IOException e) {
            res.setStatus(404);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        processRequest(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        processRequest(req, res);
    }

}
