/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dell
 */
public class New_Types {
    private int news_type_id;
    private String type_name;

    public New_Types() {
    }

    public New_Types(int news_type_id, String type_name) {
        this.news_type_id = news_type_id;
        this.type_name = type_name;
    }

    public int getNews_type_id() {
        return news_type_id;
    }

    public void setNews_type_id(int news_type_id) {
        this.news_type_id = news_type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
    
}
