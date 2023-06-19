<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Register</title>
    <style>
        /* Style dla formularza */
        body {
            font-family: Arial, sans-serif;
        }

        h3 {
            text-align: center;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 80px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 5px;
            width: 200px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }

        nav {
            background-color: #f2f2f2;
            padding: 10px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<h3>Register</h3>
<c:if test="${not empty validator}">
    <p class="error"><c:out value="${validator}"/></p>
</c:if>
<form:form method="post" modelAttribute="user">
    <table>
        <tbody>
        <tr class="form-group">
            <td><label for="username">Nickname:</label></td>
            <td><form:input path="username" id="username" /></td>
        </tr>
        <tr class="form-group">
            <td><label for="password">Password:</label></td>
            <td><form:password path="password" id="password" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Register</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
        <div>
            <p>
                <a class="link" href="${pageContext.request.contextPath}/login">Already have an account? Click here to login!</a>
            </p>
        </div>
</body>
</html>
