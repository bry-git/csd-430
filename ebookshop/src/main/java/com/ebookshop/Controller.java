package com.ebookshop;

import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@WebServlet
public class Controller extends HttpServlet {

    private String resourceUrl;
    //private PrintWriter out;
    private DataAccessObject db;

    public Controller() {
        this.resourceUrl = "/WEB-INF/jsp/";
        this.db = new DataAccessObject();
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse res) {
        System.out.println("CONTROLLER : '" + req.getMethod() +"' "+ req.getServletPath());
        try {
            PrintWriter out = res.getWriter();
            out = res.getWriter();
            String path = req.getServletPath();

            switch (path) {
                case "/":
                    req.getRequestDispatcher(this.resourceUrl + "landing.jsp").forward(req, res);
                    break;

                case "/books":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        res.setContentType("application/json");
                        res.setCharacterEncoding("UTF-8");

                        List<Book> books = this.db.getBooks();
                        System.out.println(books);

                        String booksJson = new Gson().toJson(books);
                        out.print(booksJson);
                        out.flush();
                    }
                    else if(Objects.equals(req.getMethod(), "POST")) {

                    }
                    break;

                case "/cart":
                    if(Objects.equals(req.getMethod(), "GET")) {

                        req.getRequestDispatcher(this.resourceUrl + "checkout.jsp").forward(req, res);
                    }
                    else if(Objects.equals(req.getMethod(), "POST")) {

                        req.getRequestDispatcher(this.resourceUrl + "checkout.jsp").forward(req, res);
                    }
                    break;

                case "/test":
                    if(Objects.equals(req.getMethod(), "GET")) {
                        req.getRequestDispatcher(this.resourceUrl + "index.jsp").forward(req, res);
                    }
                    else if(Objects.equals(req.getMethod(), "POST")) {
                        System.out.println(req);
                    }
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
