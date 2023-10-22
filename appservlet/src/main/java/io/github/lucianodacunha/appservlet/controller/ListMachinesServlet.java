package io.github.lucianodacunha.appservlet.controller;

import io.github.lucianodacunha.appservlet.dao.Database;
import io.github.lucianodacunha.appservlet.model.Machine;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/list")
public class ListMachinesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Database db = new Database();
        List<Machine> machines = db.list();

        req.setAttribute("machines", machines);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(req, resp);
    }
}
