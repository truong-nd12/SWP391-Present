/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Product {
    private int product_id;
    private String product_name;
    private double price;
    private int quantity;
    private int sale;
    private String description;
    private int guarantee_time;
    private int brand;
    private int type;
    private Date CreatedDate;
    private Date ModifiedDate;
    private int CreatedAccount;
    private int ModifiedAccount;
    private boolean Status;
    private int averageStars;

    public int getAverageStars() {
        return averageStars;
    }

    public void setAverageStars(int averageStars) {
        this.averageStars = averageStars;
    }
    private List<Image> img_list = new ArrayList();

    public List<Image> getImg_list() {
        return img_list;
    }

    public void setImg_list(List<Image> img_list) {
        this.img_list = img_list;
    }

    public Product() {
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product(int product_id, String product_name, double price, int quantity, int sale, String description, int guarantee_time, int brand, int type, Date CreatedDate, Date ModifiedDate, int CreatedAccount, int ModifiedAccount, boolean Status) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.price = price;
        this.quantity = quantity;
        this.sale = sale;
        this.description = description;
        this.guarantee_time = guarantee_time;
        this.brand = brand;
        this.type = type;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.CreatedAccount = CreatedAccount;
        this.ModifiedAccount = ModifiedAccount;
        this.Status = Status;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getGuarantee_time() {
        return guarantee_time;
    }

    public void setGuarantee_time(int guarantee_time) {
        this.guarantee_time = guarantee_time;
    }

    public int getBrand() {
        return brand;
    }

    public void setBrand(int brand) {
        this.brand = brand;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public Date getModifiedDate() {
        return ModifiedDate;
    }

    public void setModifiedDate(Date ModifiedDate) {
        this.ModifiedDate = ModifiedDate;
    }

    public int getCreatedAccount() {
        return CreatedAccount;
    }

    public void setCreatedAccount(int CreatedAccount) {
        this.CreatedAccount = CreatedAccount;
    }

    public int getModifiedAccount() {
        return ModifiedAccount;
    }

    public void setModifiedAccount(int ModifiedAccount) {
        this.ModifiedAccount = ModifiedAccount;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", product_name=" + product_name + ", price=" + price + ", quantity=" + quantity + ", sale=" + sale + ", description=" + description + ", guarantee_time=" + guarantee_time + ", brand=" + brand + ", type=" + type + ", CreatedDate=" + CreatedDate + ", ModifiedDate=" + ModifiedDate + ", CreatedAccount=" + CreatedAccount + ", ModifiedAccount=" + ModifiedAccount + ", Status=" + Status + ", averageStars=" + averageStars + ", img_list=" + img_list + '}';
    }

}
