/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Dell
 */
public class feedback {

    private int id;
    private String content;
    private int productId;
    private int orderId;
    private Date dateSend;
    private int stars;

    public feedback() {
    }

    public feedback(int id, String content, int productId, int orderId, Date dateSend, int stars) {
        this.id = id;
        this.content = content;
        this.productId = productId;
        this.orderId = orderId;
        this.dateSend = dateSend;
        this.stars = stars;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }


    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    @Override
    public String toString() {
        return "feedback{" + "id=" + id + ", content=" + content + ", productId=" + productId + ", orderId=" + orderId + ", dateSend=" + dateSend + ", stars=" + stars + '}';
    }

    

}
