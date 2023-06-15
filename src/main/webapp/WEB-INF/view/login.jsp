<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Login</title>
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
    </style>
</head>
<body>
<h3>Login</h3>
<c:if test="${param.error != null && not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <p class="error"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
</c:if>
<form:form method="post">
    <table>
        <tbody>
        <tr class="form-group">
            <td><label for="username">Nickname:</label></td>
            <td><input type="text" id="username" name="username" /></td>
        </tr>
        <tr class="form-group">
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Login</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
