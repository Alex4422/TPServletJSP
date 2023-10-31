package model;


public class Product {

    private int product_id;
    private int product_category_id;
    private String name;
    private String description;
    private double price;
    private int available_stock;

    public Product(int product_id, int product_category_id, String name, String description, double price, int available_stock) {
        this.product_id = product_id;
        this.product_category_id = product_category_id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.available_stock = available_stock;
    }

    public Product(int product_category_id, String name, String description, double price, int available_stock){
        this.product_category_id = product_category_id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.available_stock = available_stock;
    }

    @Override
    public String toString() {
        return "Product{" +
                "product_id=" + product_id +
                ", product_category_id=" + product_category_id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", available_stock=" + available_stock +
                '}';
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getProduct_category_id() {
        return product_category_id;
    }

    public void setProduct_category_id(int product_category_id) {
        this.product_category_id = product_category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailable_stock() {
        return available_stock;
    }

    public void setAvailable_stock(int available_stock) {
        this.available_stock = available_stock;
    }
}
