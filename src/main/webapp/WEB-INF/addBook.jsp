<%@ page import="com.example.exercice.models.Book"%>
<%@ page import="com.example.exercice.FormServlet" %><%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 07/09/2023
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>


<jsp:useBean id="title" type="java.lang.String" scope="request" />
<jsp:useBean id="author" type="java.lang.String" scope="request" />
<jsp:useBean id="date" type="java.lang.String" scope="request" />
<jsp:useBean id="type" type="java.lang.String" scope="request" />
<jsp:useBean id="isbn" type="java.lang.String" scope="request" />
<jsp:useBean id="books" type="java.util.List<com.example.exercice.models.Book>" scope="request" />
<jsp:useBean id="confirmation" type="java.lang.Boolean" scope="request" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>formulaire</title>
</head>
<body>
<main>
    <h2>
        Please enter book information below
    </h2>
    <hr>

    <form action="FormServlet" method="post">
        <div><label for="title"> Title : </label>
            <input type="text" name = "title" id= "title" value="<%=title%>" required>
        </div>

        <div><label for="author"> Author : </label>
            <input type="text" name = "author" id = "author" value="<%=author%>">
        </div>

        <div><label for="date"> Date of publication : </label>
            <input type="date" name = "date" id = "date" value="<%=date%>">
        </div>

        <div><label for="type"> Type of publication (novel, article, biography, essay...) : </label>
            <input type="text" name = "type" id="type" value="<%=type%>">
        </div>

        <div><label for="isbn">ISBN (please enter correct identifier, format should be xx-xxxx-xxxx-xx) : </label>
            <input type="number" name="isbn" id="isbn"  pattern="[0-9]{2}-[0-9]{4}-[0-9]{4}-[0-9]{2}" value="<%=isbn%>">
        </div>
        <button>Submit</button>
    </form>
    <hr>

        <% if (confirmation) { %>
        <p>Book added successfully :) <3</p>
        <% } %>



</main>

</body>
</html>
