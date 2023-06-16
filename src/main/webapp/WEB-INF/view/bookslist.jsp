<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List books</title>
    <style>
        /* Style dla tabeli */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Style dla przycisków */
        .button {
            display: inline-block;
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

        .button:hover {
            background-color: #45a049;
        }

        /* Style dla linków */
        .link {
            color: #007bff;
            text-decoration: none;
        }
    </style>
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
                <sec:authorize access="hasRole('USER')">
                    <th>Actions</th>
                </sec:authorize>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.nazwa}</td>
                    <td>${book.wydawnictwo}</td>
                    <td>${book.cena}</td>
                    <td>${book.kategoria.nazwa}</td>
                    <sec:authorize access="hasRole('USER')">
                    <td>
                    <a class="link" href="${pageContext.request.contextPath}/books/updateBookForm?bookId=${book.id}">edit</a>
                    <a class="link" href="${pageContext.request.contextPath}/books/deleteBook?bookId=${book.id}">delete</a>
                    </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                <input type="hidden" name="bookId" value="${book.id}" />
                                <button type="submit">Do koszyka</button>
                            </form>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div>
        <button class="button" onclick="window.location.href='formadd2'; return false;">Add Book</button>
    </div>

    <div>
        <p>
            <a class="link" href="${pageContext.request.contextPath}/logout">Logout</a>
        </p>
    </div>

</body>
</html>
