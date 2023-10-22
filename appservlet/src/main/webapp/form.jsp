<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nova Máquina</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <a class="navbar-brand" href="#">Top navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline mt-2 mt-md-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<main role="main" class="container">
  <c:choose>
    <c:when test="${empty machine}">
      <h1>Cadastro de nova máquina</h1>
      <c:url value="/new" var="newServlet" />
      <form action="${newServlet}" method="post">
        <div class="form-group">
          <label for="type" class="form-text">Máquina:</label>
          <input type="text" name="type" id="type" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="model" class="form-text">Modelo:</label>
          <input type="text" name="model" id="model" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="year" class="form-text">Ano:</label>
          <input type="text" name="year" id="year" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
      </form>
    </c:when>
    <c:otherwise>
      <h1>Atualização de máquina</h1>
      <c:url value="/update" var="update" />
      <form action="${update}" method="post">
        <input type="hidden" name="id" value="${machine.id}">
        <div class="form-group">
          <label for="type" class="form-text">Máquina:</label>
          <input type="text" name="type" id="type" class="form-control" value="${machine.type}" required>
        </div>
        <div class="form-group">
          <label for="model" class="form-text">Modelo:</label>
          <input type="text" name="model" id="model" class="form-control" value="${machine.model}" required>
        </div>
        <div class="form-group">
          <label for="year" class="form-text">Ano:</label>
          <input type="text" name="year" id="year" class="form-control" value="${machine.year}" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
      </form>
    </c:otherwise>
  </c:choose>
</main>
</body>
</html>