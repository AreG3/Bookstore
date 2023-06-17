<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Books</title>
    <style>
        /* Style dla formularza */
        form {
            margin-top: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 5px;
        }

        .label {
            text-align: right;
        }

        .input {
            padding: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .save {
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

        .link {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h2>ADD BOOK</h2>

    <form:form action="saveBook" modelAttribute="bookDTO" method="POST">
        <table>
            <tbody>
                <form:hidden path="id" />
                <tr>
                    <td class="label"><label>Title:</label></td>
                    <td><form:input path="nazwa" class="input" /></td>
                </tr>

                <tr>
                    <td class="label"><label>Publisher:</label></td>
                    <td><form:input path="wydawnictwo" class="input" /></td>
                </tr>

                <tr>
                    <td class="label"><label>Prize:</label></td>
                    <td><form:input path="cena" class="input" /></td>
                </tr>

                <tr>
                    <td class="label"><label for="categories">Category:</label></td>
                    <td>
                        <form:select path="kategoriaid" id="categories">
                            <form:options items="${categories}" itemValue="id" itemLabel="nazwa" />
                        </form:select>
                    </td>
                </tr>

                <tr>
                    <td class="label"><label for="authors">Autorzy:</label></td>
                    <td>
                        <form:select path="autorzy" id="authors" multiple="true">
                            <form:options items="${authors}" itemValue="id" itemLabel="fullName" />
                        </form:select>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="Save" class="save" /></td>
                </tr>
            </tbody>
        </table>
    </form:form>

    <p>
        <a class="link" href="${pageContext.request.contextPath}/books/list">Return</a>
    </p>
</body>
</html>
