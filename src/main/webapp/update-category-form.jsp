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
    ProductCategory productCategory = (ProductCategory) request.getAttribute("Category");
    List<ProductCategory> listProductCategory = (List<ProductCategory>) request.getAttribute("listingAllCategories");
%>

      <h2>Update a Category</h2>

      <form action="ControllerServlet" method = "GET">

          <input type="hidden" name="action" value="SUBMIT_TO_UPDATE_A_CATEGORY">
          <input type="hidden" name="product_id" value="<%=productCategory.getProductCategoryID()%>">

          <table>
              <tbody>

                <tr>
                    <td><label>name: </label></td>
                    <td><input type="text" name="name" value = "<%=productCategory.getName()%>"  /> </td>
                </tr>

                <tr>
                    <td><label>description: </label></td>
                    <td><input type="text" name="description" value = "<%=productCategory.getDescription()%>" /> </td>
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
