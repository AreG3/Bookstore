    <%--
  Created by IntelliJ IDEA.
  User: luke
  Date: 15.05.2019
  Time: 00:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List books</title>
</head>
<body>
        <h2>Books:</h2>

        <div>
            <table>
                <tr>
                    <th>Nazwa</th>
                    <th>Wydawnictwo</th>
                    <th>Cena</th>
                    <th>Kategoria</th>
                </tr>
                <c:forEach var="book" items="${books}">
                <c:url var="update" value="/books/updateBookForm">
                <c:param name="bookId" value="${book.id}"/></c:url>
                    <tr>
                        <td>${book.nazwa}</td>
                        <td>${book.wydawnictwo}</td>
                        <td>${book.cena}</td>
                        <td>${book.kategoria.nazwa}</td>
                        <td>
                        </td>
                    </tr>
                <td><a href="${update}">edytuj</a></td>
                </c:forEach>


            </table>
        </div>

        <div>
            <input type="button" value="Add Book"
                   onclick="window.location.href='formadd2';return false;" />
        </div>

        <div>
<p>
    <a href="${pageContext.request.contextPath}/logout "> Logout </a>
</p>
                </div>

</body>
</html>
