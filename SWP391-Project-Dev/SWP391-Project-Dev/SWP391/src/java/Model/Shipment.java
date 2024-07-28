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
public class Shipment {
    private int ship_id;
    private int order_id;
    private String address;
    private Date delivery_date;
    private Date receiving_date;
    private String phone;
    private String name;
    private String note;

    public Shipment() {
    }

    public Shipment(int ship_id, int order_id, String address, Date delivery_date, Date receiving_date, String phone, String name, String note) {
        this.ship_id = ship_id;
        this.order_id = order_id;
        this.address = address;
        this.delivery_date = delivery_date;
        this.receiving_date = receiving_date;
        this.phone = phone;
        this.name = name;
        this.note = note;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(Date delivery_date) {
        this.delivery_date = delivery_date;
    }

    public Date getReceiving_date() {
        return receiving_date;
    }

    public void setReceiving_date(Date receiving_date) {
        this.receiving_date = receiving_date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}