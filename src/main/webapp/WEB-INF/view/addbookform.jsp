<%--
  Created by IntelliJ IDEA.
  User: luke
  Date: 15.05.2019
  Time: 00:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Books</title>
</head>
<body>
ADD BOOK
<form:form action="saveBook" modelAttribute="bookDTO" method="POST">

    <table>
        <tbody>
        <form:hidden path="id"/>
        <tr>
            <td><label>Title:</label></td>
            <td><form:input path="nazwa" /></td>
        </tr>

        <tr>
            <td><label>Publisher:</label></td>
            <td><form:input path="wydawnictwo" /></td>
        </tr>

        <tr>
            <td><label>Prize:</label></td>
            <td><form:input path="cena" /></td>
        </tr>
        <tr>
            <td><label for="categories">Category:</label></td>
            <td><form:select path="kategoriaid" id="categories"> <form:options items="${categories}" itemValue="id" itemLabel="nazwa"/></form:select></td>
        </tr>

        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Save" class="save" /></td>
        </tr>


        </tbody>
    </table>


</form:form>


<p>
    <a href="${pageContext.request.contextPath}/books/list "> return  </a>
</p>
</body>
</html>
