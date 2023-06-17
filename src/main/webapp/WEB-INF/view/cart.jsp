<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cart</title>
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
    <h2>Cart:</h2>

    <div>
        <table>
            <tr>
                <th>Title</th>
                <th>Publisher</th>
                <th>Price</th>
                <th>Category</th>
                <th>Authors</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td><c:out value="${book.nazwa}" /></td>
                    <td><c:out value="${book.wydawnictwo}" /></td>
                    <td><c:out value="${book.cena}" /></td>
                    <td><c:out value="${book.kategoria.nazwa}" /></td>
                    <td class="author-cell">
                                            <c:forEach var="author" items="${book.autorzy}">
                                                ${author.imie} ${author.nazwisko} <br />
                                            </c:forEach>
                    </td>
                    <td style="padding-left: 25px">
                                                    <form action="${pageContext.request.contextPath}/cart/delete" method="post">
                                                        <input type="hidden" name="bookId" value="${book.id}"/>
                                                        <button type="submit" class="btn btn-secondary">Usun</button>
                                                    </form>
                                                </td>
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
