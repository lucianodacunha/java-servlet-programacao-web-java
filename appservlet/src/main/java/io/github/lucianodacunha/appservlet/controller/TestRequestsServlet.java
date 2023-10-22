package io.github.lucianodacunha.appservlet.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/testrequests")
public class TestRequestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String machine = req.getParameter("machine");
        PrintWriter out = resp.getWriter();
        out.println("<p>Cadastrando nova máquina</p>");
        out.println("<p>Item <b>" + machine +"</b> cadastrado com sucesso.</p>");
        out.println("<br><br>");
        out.println("<p>Acessado através de um <b>GET</b></p>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String machine = req.getParameter("machine");
        PrintWriter out = resp.getWriter();
        out.println("<p>Cadastrando nova máquina</p>");
        out.println("<p>Item <b>" + machine +"</b> cadastrado com sucesso.</p>");
        out.println("<p>Acessado através de um <b>POST</b></p>");
    }
}
