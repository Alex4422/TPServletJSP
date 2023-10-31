<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
    <body>
        <h1> <%= " Welcome to the shop: main menu " %> </h1>
        <br/>

        <a href="ControllerServlet?action=SHOW_CATEGORIES">List of all categories</a>
        <br/><br/><br/>

        <a href="ControllerServlet?action=SHOW_PRODUCTS">List of all Products</a>
        <br/><br/><br/>

        <a href="ControllerServlet?action=SHOW_ADD_PRODUCT_FORM">Add a new Product</a>
        <br/><br/><br/>

        <a href="ControllerServlet?action=SHOW_ADD_CATEGORY_FORM">Add a new Category</a>
        <br/><br/><br/>

    </body>
</html>