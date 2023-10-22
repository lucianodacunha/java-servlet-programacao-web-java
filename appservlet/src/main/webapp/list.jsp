<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Lista Máquinas</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
          crossorigin="anonymous">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<body>
    <div class="container">
    <h1>Listar Máquinas</h1>
        <c:choose>
            <c:when test="${empty machines}">
                <div class="alert alert-warning">
                    Nehnum registro encontrado
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Modelo</th>
                        <th scope="col">Ano</th>
                        <th scope="col">Remover</th>
                        <th scope="col">Atualizar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${machines}" var="machine">
                        <tr>
                            <th scope="row">${machine.id}</th>
                            <td>${machine.type}</td>
                            <td>${machine.model}</td>
                            <td>${machine.year}</td>
                            <c:url var="delete" value="/delete">
                                <c:param name="id" value="${machine.id}"></c:param>
                            </c:url>
                            <td><a href="${delete}"><i class="fas fa-trash"></i></a></td>
                            <c:url var="update" value="/update">
                                <c:param name="id" value="${machine.id}"></c:param>
                            </c:url>
                            <td><a href="${update}"><i class="fas fa-edit"></i></a></td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
 </div>
</body>
</html>