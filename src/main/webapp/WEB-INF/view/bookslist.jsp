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
                <th>Title</th>
                <th>Publisher</th>
                <th>Prize</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.nazwa}</td>
                    <td>${book.wydawnictwo}</td>
                    <td>${book.cena}</td>
                    <td>${book.kategoria.nazwa}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/books/updateBookForm?bookId=${book.id}">edit</a>
                        <a href="${pageContext.request.contextPath}/books/deleteBook?bookId=${book.id}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div>
        <input type="button" value="Add Book" onclick="window.location.href='formadd2'; return false;" />
    </div>

    <div>
        <p>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </p>
    </div>

</body>
</html>
