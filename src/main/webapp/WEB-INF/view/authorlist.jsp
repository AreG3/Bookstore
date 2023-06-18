<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Authors</title>
</head>
<body>
        <h2>Authors:</h2>

        <div>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
                <c:forEach var="autor" items="${autorzy}" >
                    <tr>
                        <td>${autor.imie}</td>
                        <td>${autor.nazwisko}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <sec:authorize access="hasRole('ADMIN')">
            <div>
                <input type="button" value="Add Author"
                       onclick="window.location.href='authorformadd';return false;" />
            </div>
        </sec:authorize>

        <div>
            <p>
                <a class="link" href="${pageContext.request.contextPath}/books/list">Return</a>
            </p>
        </div>

</body>
</html>
