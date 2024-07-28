/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQualityById(int id) {
        return getItemById(id).getQuality();
    }

    public void addItem(Item i) {
        if (getItemById(i.getProduct().getProduct_id()) != null) {
            Item it = getItemById(i.getProduct().getProduct_id());
            it.setQuality(it.getQuality() + i.getQuality());
        } else {
            items.add(i);
        }
    }
    public void deleteItem(Item i) {
        if (getItemById(i.getProduct().getProduct_id()).getQuality()>1) {
            Item it = getItemById(i.getProduct().getProduct_id());
            it.setQuality(it.getQuality() - i.getQuality());
        } else {
            removeItem(i.getProduct().getProduct_id());
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item it : items) {
            t += it.getPrice()*it.getQuality();
        }
        return t;
    }
}
