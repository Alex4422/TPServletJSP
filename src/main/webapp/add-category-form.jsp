<%@ page import="model.ProductCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DAO" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="model.Product" %><%--
  Created by IntelliJ IDEA.
  User: alexandre
  Date: 19/08/2022
  Time: 12:5208
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    Product product = (Product) request.getAttribute("productJsp");
%>


      <h2>Add a category</h2>

      <form action="ControllerServlet" method = "GET">

          <input type="hidden" name="action" value="ADD_CATEGORY_FORM">

          <table>
              <tbody>
                <tr>
                    <td><label>name: </label></td>
                    <td><input type="text" name="name" /> </td>

                </tr>

                <tr>
                    <td><label>description: </label></td>
                    <td><input type="text" name="description" /> </td>

                </tr>

                <tr>
                    <td><label></label></td>
                    <td><input type="submit" value="Save"></td>
                </tr>

              </tbody>

          </table>

      </form>

      <div style = "clear: both;"></div>

      <p>
          <a href="./index.jsp">Back to List</a>
      </p>

</body>
</html>
