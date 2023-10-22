package io.github.lucianodacunha.appservlet.controller;

import io.github.lucianodacunha.appservlet.dao.Database;
import io.github.lucianodacunha.appservlet.model.Machine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/new")
public class NewMachineServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String type = req.getParameter("type");
        String model = req.getParameter("model");
        Integer year = Integer.valueOf(req.getParameter("year"));

        Machine machine = new Machine(type, model, year);
        Database db = new Database();
        db.add(machine);

        resp.sendRedirect("list");
    }

}
