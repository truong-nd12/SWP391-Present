/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dell
 */
public class Brand {
    private int brand_id;
    private String brand_name;
    private boolean status;
    private String description;
    private String image;

    public Brand() {
    }

    public Brand(int brand_id, String brand_name, boolean status) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.status = status;
    }
    
    public Brand(String brand_name, String des, String img) {
       
        this.brand_name = brand_name;
        this.description = des;
        this.image = img;
    }

    public Brand(int brand_id, String brand_name, boolean status, String description, String image) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.status = status;
        this.description = description;
        this.image = image;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Brand{" + "brand_id=" + brand_id + ", brand_name=" + brand_name + ", status=" + status + ", description=" + description + ", image=" + image + '}';
    }
    
}
