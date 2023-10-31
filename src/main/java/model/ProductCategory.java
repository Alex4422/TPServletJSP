package model;

public class ProductCategory {

    private int productCategoryID;
    private String name;
    private String description;

    public ProductCategory(int pProductCategoryID, String pName, String pDescription){
        super();
        this.productCategoryID = pProductCategoryID;
        this.name = pName;
        this.description = pDescription;
    }

    public ProductCategory(String pName, String pDescription){
        super();
        this.name = pName;
        this.description = pDescription;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
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
}
