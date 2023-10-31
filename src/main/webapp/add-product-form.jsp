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

      <h2>Add a product</h2>

      <form action="ControllerServlet" method = "GET">

          <input type="hidden" name="action" value="ADD_PRODUCT_FORM">

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

                <select name="category" id="cat">

                <%  List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();
                    ListIterator<ProductCategory> rs = listProductCategory.listIterator();

                    while (rs.hasNext()) {
                        ProductCategory productCategory = rs.next();
                        int product_category_id = productCategory.getProductCategoryID();
                        String name = productCategory.getName();
                        String description = productCategory.getDescription();
                %>

                        <option value="<%= product_category_id %>"  ><%= name %></option>

                    <% } %>
                    </select>

                <tr>
                    <td><label>price: </label></td>
                    <td><input type="text" name="price" /> </td>
                </tr>


                <tr>
                    <td><label>available stock: </label></td>
                    <td><input type="text" name="available_stock" /> </td>
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
