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
public class Guarantee {

    private int record_id;
    private int product;
    private int order_id;
    private Date g_date;
    private int status;
    private Date return_date;
    private String image;
    private String note;
    private String type;
    private String service_tag;
    private Integer creator_id;

    public Guarantee() {
    }

    public Guarantee(int record_id, int product, int order_id, Date g_date, int status, Date return_date, String image, String note, String type, String service_tag) {
        this.record_id = record_id;
        this.product = product;
        this.order_id = order_id;
        this.g_date = g_date;
        this.status = status;
        this.return_date = return_date;
        this.image = image;
        this.note = note;
        this.type = type;
        this.service_tag = service_tag;
    }
    public Guarantee(int record_id, int product, int order_id, Date g_date, int status, Date return_date, String image, String note, String type, String service_tag, int creator_id) {
        this.record_id = record_id;
        this.product = product;
        this.order_id = order_id;
        this.g_date = g_date;
        this.status = status;
        this.return_date = return_date;
        this.image = image;
        this.note = note;
        this.type = type;
        this.service_tag = service_tag;
        this.creator_id = creator_id;
    }

    public Guarantee(int product, int order_id, Date g_date, String image) {
        this.product = product;
        this.order_id = order_id;
        this.g_date = g_date;
        this.image = image;
    }

    public Guarantee(int product, int order_id, Date g_date, String image, String note, String service) {
        this.product = product;
        this.order_id = order_id;
        this.g_date = g_date;
        this.image = image;
        this.note = note;
        this.service_tag = service;
    }

    public Guarantee(int record_id, String service_tag, int order_id, Date g_date, int status, Date return_date, String image) {
        this.record_id = record_id;
        this.service_tag = service_tag;
        this.order_id = order_id;
        this.g_date = g_date;
        this.image = image;
        this.status = status;
        this.return_date = return_date;
    }

    public Guarantee(int product, String service_tag, int order_id, Date g_date, int status, String image, String note) {
        this.product = product;
        this.service_tag = service_tag;
        this.order_id = order_id;
        this.g_date = g_date;
        this.image = image;
        this.status = status;
        this.note = note;
    }

    //add constructor
    public Guarantee(int productID, int orderID, String img, String note, String tag) {
        this.product = productID;
        this.order_id = orderID;
        this.g_date = new Date();
        this.image = img;
        this.note = note;
        this.status = 1;
        this.service_tag = tag;
    }

    public int getRecord_id() {
        return record_id;
    }

    public void setRecord_id(int record_id) {
        this.record_id = record_id;
    }

    public int getProduct() {
        return product;
    }

    public void setProduct(int product) {
        this.product = product;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Date getG_date() {
        return g_date;
    }

    public void setG_date(Date g_date) {
        this.g_date = g_date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getReturn_date() {
        return return_date;
    }

    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(int creator_id) {
        this.creator_id = creator_id;
    }
  public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getService_tag() {
        return service_tag;
    }

    public void setService_tag(String service_tag) {
        this.service_tag = service_tag;
    }

    @Override
    public String toString() {
        return "Guarantee{" + "record_id=" + record_id + ", product=" + product + ", order_id=" + order_id + ", g_date=" + g_date + ", status=" + status + ", return_date=" + return_date + ", image=" + image + ", note=" + note + ", type=" + type + ", service_tag=" + service_tag + ", creator_id=" + creator_id + '}';
    }
    

}
