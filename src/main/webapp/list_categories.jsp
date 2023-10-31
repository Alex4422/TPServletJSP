<%@ page import="model.ProductCategory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 09/10/2022
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  List<ProductCategory> listProductCategory = ( List<ProductCategory>)  request.getAttribute("listingAllCategories");
%>

  <table>
    <thead><tr>
      <th colspan=\"2\"> X  </th>
      <th colspan=\"2\"> UP  </th>
      <th colspan=\"2\">product_category_id </th>
      <th colspan=\"2\">name</th>
      <th colspan=\"2\">description </th>
    </thead></tr>

<%
  for(ProductCategory productCategory: listProductCategory){ %>
    <tr>
      <td colspan=\"2\"> <a href="./ControllerServlet?action=DELETE_A_CATEGORY&categoryId=<%=productCategory.getProductCategoryID()%>"> X </a>  </td>

      <td colspan=\"2\"> <a href="./ControllerServlet?action=UPDATE_A_CATEGORY_FORM&categoryId=<%=productCategory.getProductCategoryID()%>"> UP  </a>  </td>

      <td colspan=\"2\"> <%=productCategory.getProductCategoryID()%>  </td>
      <td colspan=\"2\"> <a href="./ControllerServlet?action=SHOW_SPECIFIC_PRODUCT_FOR_A_CATEGORY&productCategoryID=<%=productCategory.getProductCategoryID()%>"> <%=productCategory.getName()%> </a> </td>
      <td colspan=\"2\"> <%=productCategory.getDescription()%>  </td>
    </tr><%  }
%>


  </table>

</body>
</html>
