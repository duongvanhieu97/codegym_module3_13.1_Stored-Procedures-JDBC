<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body,table {
            text-align: center;
        }
        table{
            width: 500px;
            margin: 0 auto;
            border: 2px solid blue;
        }
        th{
            color: green;
            font-size: larger;
            font-weight: bold;
            border: 1px solid black;
            border-collapse: collapse;
        }
        td{
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<h1>User Management</h1>
<form class="form-group search-form" action="/users" method="post">
    <input name="search" class="form-control search-input" type="text" placeholder="Type something to search">
    <input type="hidden" name="action" value="searchBy">
    <button type="submit" class="btn btn-primary search-btn">Seacrh</button>
    <a href="/users?action=create"
       class="btn btn-primary search-btn">Add</a>
    <a href="/users" class="btn btn-primary search-btn">Menu</a>
</form>
<div align="center">
    <caption><h2>List of Users</h2></caption>
    <table border="1" cellpadding="5" class="table">
        <tr style="background-color: #d2d0d0">
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${requestScope['listUser']}">
            <tr>
                <td><c:out value="${user.getId()}"/></td>
                <td><a href="/users?action=view&id=${user.getId()}">${user.getName()}</a></td>
                <td><c:out value="${user.getEmail()}"/></td>
                <td><c:out value="${user.getCountry()}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.getId()}">Edit</a>
                    <a href="/users?action=delete&id=${user.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>