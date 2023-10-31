package com.example.tpservletjsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.DAO;
import model.Product;
import model.ProductCategory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("SHOW_CATEGORIES")) {

            List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();
            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_categories.jsp");
            request.setAttribute("listingAllCategories", listProductCategory);
            dispatcher.forward(request, response);

        }
        if (action.equals("SHOW_PRODUCTS")) {

            List<Product> listProducts = DAO.getAllProducts();
            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_products.jsp");
            request.setAttribute("listingAllProducts", listProducts);
            dispatcher.forward(request, response);
        }

        if (action.equals("SHOW_ADD_PRODUCT_FORM")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("./add-product-form.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("ADD_PRODUCT_FORM")) {

            int productCategoryId = 0;
            String name = "";
            String description = "";
            Double price = 0.0;
            int availableStock = 0;

            try {
                productCategoryId = Integer.parseInt(request.getParameter("category"));
                name = request.getParameter("name");
                description = request.getParameter("description");
                price = Double.valueOf(request.getParameter("price"));
                availableStock = Integer.parseInt(request.getParameter("available_stock"));

            } catch (Exception exception) {
                System.out.println("Error during parameters reading: " + exception);
            }

            Product product = new Product(productCategoryId, name, description, price, availableStock);
            DAO.addProduct(product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("SHOW_SPECIFIC_PRODUCT_FOR_A_CATEGORY")) {

            int productCategoryId = 0;

            try{
                productCategoryId = Integer.parseInt(request.getParameter("productCategoryID"));

            }catch (NumberFormatException nfe){
                System.out.println("Error during parameter reading: " + nfe);
            }

            List<Product> listProductsForASpecificCategory = DAO.getAllProductsForASpecificCategory(productCategoryId);
            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_products.jsp");
            request.setAttribute("listingAllProducts", listProductsForASpecificCategory);

            dispatcher.forward(request, response);

        }

        if (action.equals("DELETE_A_PRODUCT")) {

            int productId = 0;

            try{
                productId = Integer.parseInt(request.getParameter("productId"));
            }catch(NumberFormatException nfe){
                System.out.println("Error during parameter reading: " + nfe);
            }

            DAO.deleteProduct(productId);
            List<Product> listProducts = DAO.getAllProducts();
            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_products.jsp");
            request.setAttribute("listingAllProducts", listProducts);

            dispatcher.forward(request, response);
        }

        if (action.equals("UPDATE_PRODUCT_FORM")) {

            int productId = 0;

            try{
                productId = Integer.parseInt(request.getParameter("productId"));
            }catch(NumberFormatException nfe){
                System.out.println("Error during parameter reading: " + nfe);
            }

            Product product;
            product = DAO.getAProductById(productId);
            List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();

            RequestDispatcher dispatcher = request.getRequestDispatcher("./update-product-form.jsp");

            request.setAttribute("product",product);
            request.setAttribute("listingAllCategories", listProductCategory);

            dispatcher.forward(request, response);
        }

        if (action.equals("SUBMIT_TO_UPDATE_A_PRODUCT")) {

            int productId = 0;
            int productCategoryId = 0;
            String name = "";
            String description = "";
            Double price = 0.0;
            int availableStock = 0;

            try {
                productCategoryId = Integer.parseInt(request.getParameter("category"));
                name = request.getParameter("name");
                description = request.getParameter("description");
                price = Double.valueOf(request.getParameter("price"));
                availableStock = Integer.parseInt(request.getParameter("available_stock"));
                productId =  Integer.parseInt(request.getParameter("product_id"));

            } catch (Exception exception) {
                System.out.println("Error during parameters reading: " + exception);
            }

            Product product = new Product( productId, productCategoryId, name, description, price, availableStock);
            DAO.updateProduct(product);

            List<Product> listProducts = DAO.getAllProducts();

            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_products.jsp");
            request.setAttribute("listingAllProducts", listProducts);
            dispatcher.forward(request, response);
        }

        if (action.equals("SHOW_ADD_CATEGORY_FORM")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("./add-category-form.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("ADD_CATEGORY_FORM")) {

            String name = "";
            String description = "";

            try {
                name = request.getParameter("name");
                description = request.getParameter("description");

            } catch (Exception exception) {
                System.out.println("Error during parameters reading: " + exception);
            }

            ProductCategory productCategory = new ProductCategory(name, description);

            DAO.addProductCategory(productCategory);
            List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();
            RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("DELETE_A_CATEGORY")) {

            int categoryId = 0;

            try{
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
            }catch(NumberFormatException nfe){
                System.out.println("Error during parameter reading: " + nfe);
            }

            DAO.deleteCategory(categoryId);

            List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();
            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_categories.jsp");
            request.setAttribute("listingAllCategories", listProductCategory);

            dispatcher.forward(request, response);

        }

        if (action.equals("UPDATE_A_CATEGORY_FORM")) {

            int CategoryId = 0;

            try{
                CategoryId = Integer.parseInt(request.getParameter("categoryId"));
            }catch(NumberFormatException nfe){
                System.out.println("Error during parameter reading: " + nfe);
            }

            ProductCategory productCategory;
            productCategory = DAO.getACategoryById(CategoryId);
            List<ProductCategory> listProductCategory = DAO.getAllCategoryProducts();

            RequestDispatcher dispatcher = request.getRequestDispatcher("./update-category-form.jsp");
            request.setAttribute("Category", productCategory);
            request.setAttribute("listingAllCategories", listProductCategory);

            dispatcher.forward(request, response);
        }

        if (action.equals("SUBMIT_TO_UPDATE_A_CATEGORY")) {

            int productCategoryId = 0;
            String name = "";
            String description = "";

            //TODO: correction to do; doesn't work!
            try {
                productCategoryId = Integer.parseInt(request.getParameter("category"));
                name = request.getParameter("name");
                description = request.getParameter("description");

            } catch (Exception exception) {
                System.out.println("Error during parameters reading: " + exception);
            }

            ProductCategory productCategory = new ProductCategory(productCategoryId, name, description);
            DAO.updateCategory(productCategory);
            List<ProductCategory> listProductCategories = DAO.getAllCategoryProducts();

            RequestDispatcher dispatcher = request.getRequestDispatcher("./list_categories.jsp");
            request.setAttribute("listingAllCategories", listProductCategories);

            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
