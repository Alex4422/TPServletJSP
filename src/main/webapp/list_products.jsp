<%@ page import="model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 09/10/2022
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    List<Product> listProducts = (List<Product>)  request.getAttribute("listingAllProducts");
%>

        <table>
            <thead><tr>

                <th colspan=\"2\"> X  </th>
                <th colspan=\"2\"> UP  </th>
                <th colspan=\"2\">product_id </th>
                <th colspan=\"2\">product_category_id</th>
                <th colspan=\"2\">name </th>
                <th colspan=\"2\">description </th>
                <th colspan=\"2\">price </th>
                <th colspan=\"2\">available stock </th>

            </thead></tr>

            <%
                for(Product product: listProducts){ %>
                    <tr>
                        <td colspan=\"2\"> <a href="./ControllerServlet?action=DELETE_A_PRODUCT&productId=<%=product.getProduct_id()%>"> X  </a>  </td>

                        <td colspan=\"2\"> <a href="./ControllerServlet?action=UPDATE_PRODUCT_FORM&productId=<%=product.getProduct_id()%>"> UP  </a>  </td>

                        <td colspan=\"2\"> <%=product.getProduct_id()%>  </td>
                        <td colspan=\"2\"> <%=product.getProduct_category_id()%>  </td>
                        <td colspan=\"2\"> <%=product.getName()%>  </td>
                        <td colspan=\"2\"> <%=product.getDescription()%>  </td>
                        <td colspan=\"2\"> <%=product.getPrice()%>  </td>
                        <td colspan=\"2\"> <%=product.getAvailable_stock()%>  </td>
                    </tr>
                <%  }
            %>

        </table>
    </body>

</html>
