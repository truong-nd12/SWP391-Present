/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductData {
    private List<Product> listP;
    private List<Brand> listB;
    private List<Type> listT;

    public ProductData(List<Product> listP, List<Brand> listB, List<Type> listT) {
        this.listP = listP;
        this.listB = listB;
        this.listT = listT;
    }

    public List<Product> getListP() {
        return listP;
    }

    public void setListP(List<Product> listP) {
        this.listP = listP;
    }

    public List<Brand> getListB() {
        return listB;
    }

    public void setListB(List<Brand> listB) {
        this.listB = listB;
    }

    public List<Type> getListT() {
        return listT;
    }

    public void setListT(List<Type> listT) {
        this.listT = listT;
    }
}
