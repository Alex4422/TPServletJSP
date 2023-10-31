package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    /**
     *
     * @param productID
     */
    public static void deleteProduct(int productID){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{

            String sql = "DELETE FROM PRODUCT" +
                         " WHERE product_id=?;";

            myStmt = con.prepareStatement(sql);
            myStmt.setInt(1, productID);
            myStmt.execute();

        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        }

    }

    /**
     *
     * @param pProduct
     * @throws SQLException
     */
    public static void addProduct(Product pProduct){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{

            String sql = "insert into product "
                    + "(product_category_id, name, description, price, available_stock) "
                    + "values (?, ?, ?, ?, ?)";

            myStmt = con.prepareStatement(sql);

            myStmt.setInt(1, pProduct.getProduct_category_id());
            myStmt.setString(2, pProduct.getName());
            myStmt.setString(3, pProduct.getDescription());
            myStmt.setDouble(4, pProduct.getPrice());
            myStmt.setInt(5, pProduct.getAvailable_stock());

            myStmt.execute();

        }catch (SQLException e){
            System.out.println("ERROR: " + e);
        }

    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static List<Product> getAllProductsForASpecificCategory(int pProductCategoryID){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();
        List<Product> listProductForASpecificCategory = new ArrayList<>();

        String sql = "select * from product  " +
                    "inner join product_category on product.product_category_id = product_category.product_category_id" +
                    " where product_category.product_category_id = " + pProductCategoryID;

        try {
            myStmt = con.prepareStatement(sql);

            ResultSet result = myStmt.executeQuery(sql);

            while (result.next()) {

                int productID = result.getInt("product_id");
                int productCategoryID = result.getInt("product_category_id");
                String name = result.getString("name");
                String description = result.getString("description");
                double price = result.getDouble("price");
                int availableStock = result.getInt("available_stock");

                Product product = new Product(productID, productCategoryID, name, description, price, availableStock);

                listProductForASpecificCategory.add(product);
            }

        } catch (SQLException e) {

            System.out.println("ERROR: " + e);
        }

        return listProductForASpecificCategory;
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static Product getAProductById(int productId) {

        Connection con = DBConnection.getConnection();
        Product product = null;

        try {

            String sqlGetAllProducts = "select * from product where product_id = " + productId + ";";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sqlGetAllProducts);

            while (result.next()) {

                int productID = result.getInt("product_id");
                int productCategoryID = result.getInt("product_category_id");
                String name = result.getString("name");
                String description = result.getString("description");
                double price = result.getDouble("price");
                int availableStock = result.getInt("available_stock");

                product = new Product(productID, productCategoryID, name, description, price, availableStock);

            }

        } catch (Exception e) {
            System.out.println("error: " + e);
        }

        return product;
    }

    /**
     *
     * @return
     */
    public static List<Product> getAllProducts() {

        Connection con = DBConnection.getConnection();
        List<Product> listProduct = new ArrayList<>();

        try{

            String sqlGetAllProducts = "select * from product;";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sqlGetAllProducts);

            while (result.next()) {

                int productID = result.getInt("product_id");
                int productCategoryID = result.getInt("product_category_id");
                String name = result.getString("name");
                String description = result.getString("description");
                double price = result.getDouble("price");
                int availableStock = result.getInt("available_stock");

                Product product = new Product(productID, productCategoryID, name, description, price, availableStock);

                listProduct.add(product);

            }

        }catch(Exception e){
            System.out.println("error: " + e);
        }

        return listProduct;
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static List<ProductCategory> getAllCategoryProducts() {

        Connection con = DBConnection.getConnection();
        List<ProductCategory> listProductCategory = new ArrayList<>();

        try {
            String sqlGetAllCategoryProducts = "SELECT * FROM product_category ORDER BY name;";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sqlGetAllCategoryProducts);

            while (result.next()) {
                int id = result.getInt("product_category_id");
                String name = result.getString("name");
                String description = result.getString("description");

                ProductCategory category = new ProductCategory(id, name, description);
                listProductCategory.add(category);
            }

    }
        catch (Exception e){}

        return listProductCategory;

    }

    /**
     *
     * @param pProduct
     */
    public static void updateProduct(Product pProduct){

        System.out.println(pProduct.toString());

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{

            String sql = "update product "
                    + "SET product_category_id = ?, name = ?, description = ?, price = ?, available_stock = ? "
                    + " WHERE product_id = ? ;";

            myStmt = con.prepareStatement(sql);

            myStmt.setInt(1, pProduct.getProduct_category_id());
            myStmt.setString(2, pProduct.getName());
            myStmt.setString(3, pProduct.getDescription());
            myStmt.setDouble(4, pProduct.getPrice());
            myStmt.setInt(5, pProduct.getAvailable_stock());
            myStmt.setInt(6, pProduct.getProduct_id());

            myStmt.execute();

        }catch (SQLException e){
            System.out.println("ERROR: " + e);
        }
    }

    /**
     *
     * @param pProductCategory
     */
    public static void addProductCategory(ProductCategory pProductCategory){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{
            String sql = "insert into product_category "
                    + "(name, description) "
                    + "values (?, ?)";

            myStmt = con.prepareStatement(sql);

            myStmt.setString(1, pProductCategory.getName());
            myStmt.setString(2, pProductCategory.getDescription());

            myStmt.execute();

        }catch (SQLException e){
            System.out.println("ERROR: " + e);
        }
    }

    /**
     *
     * @param pCategoryID
     */
    public static void deleteCategory(int pCategoryID){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{

            String sql = "DELETE FROM product_category" +
                    " WHERE product_category_id = ?;";

            myStmt = con.prepareStatement(sql);

            myStmt.setInt(1, pCategoryID);

            myStmt.execute();

        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        }

    }

    /**
     *
     * @param pCategoryId
     * @return
     */
    public static ProductCategory getACategoryById(int pCategoryId) {

        Connection con = DBConnection.getConnection();
        ProductCategory productCategory = null;

        try {

            String sqlGetACategory = "select * from product_category where product_category_id = " + pCategoryId + ";";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sqlGetACategory);

            while (result.next()) {

                int categoryID = result.getInt("product_category_id");
                String name = result.getString("name");
                String description = result.getString("description");

                productCategory = new ProductCategory(categoryID, name, description);

            }

        } catch (Exception e) {
            System.out.println("error: " + e);
        }

        return productCategory;
    }

    /**
     *
     * @param pProductCategory
     */
    public static void updateCategory(ProductCategory pProductCategory){

        PreparedStatement myStmt = null;
        Connection con = DBConnection.getConnection();

        try{

            String sql = "update product_category "
                    + "SET name = ?, description = ? "
                    + " WHERE product_category_id = ? ;";

            myStmt = con.prepareStatement(sql);

            myStmt.setString(1, pProductCategory.getName());
            myStmt.setString(2, pProductCategory.getDescription());
            myStmt.setInt(3, pProductCategory.getProductCategoryID());

            myStmt.execute();

        }catch (SQLException e){
            System.out.println("ERROR: " + e);
        }
    }
}






