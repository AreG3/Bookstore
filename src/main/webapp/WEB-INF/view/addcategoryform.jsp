<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
    <h2>Add Category:</h2>

    <form action="${pageContext.request.contextPath}/authors/categories/saveCategory" method="post">
        <label for="nazwa">Name:</label>
        <input type="text" id="nazwa" name="nazwa" required />

        <input type="submit" value="Save" />
    </form>

    <div>
        <p>
            <a class="link" href="${pageContext.request.contextPath}/authors/categories/list">Return</a>
        </p>
    </div>
</body>
</html>
