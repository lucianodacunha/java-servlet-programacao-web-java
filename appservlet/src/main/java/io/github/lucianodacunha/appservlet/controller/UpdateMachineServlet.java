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

@WebServlet(urlPatterns = "/update")
public class UpdateMachineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = Long.valueOf(req.getParameter("id"));
        Database db = new Database();
        Machine machine = db.findById(id);

        req.setAttribute("machine", machine);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("form.jsp");
        requestDispatcher.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = Long.valueOf(req.getParameter("id"));
        String type = req.getParameter("type");
        String model = req.getParameter("model");
        Integer year = Integer.valueOf(req.getParameter("year"));

        Database db = new Database();
        Machine machine = db.findById(id);
        machine.setType(type);
        machine.setModel(model);
        machine.setYear(year);

        resp.sendRedirect("list");
    }
}
