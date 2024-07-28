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
public class News {
    private int news_id;
    private String title;
    private String content;
    private int brand;
    private int news_type;
    private Date CreatedDate;
    private Date ModifiedDate;
    private int CreatedBy;
    private int ModifiedBy;
    private int img_id;
    private int isDel;

    public News() {
    }

    public News(int news_id, String title, String content, int brand, int news_type, Date CreatedDate, Date ModifiedDate, int CreatedBy, int ModifiedBy, int img_id, int isDel) {
        this.news_id = news_id;
        this.title = title;
        this.content = content;
        this.brand = brand;
        this.news_type = news_type;
        this.CreatedDate = CreatedDate;
        this.ModifiedDate = ModifiedDate;
        this.CreatedBy = CreatedBy;
        this.ModifiedBy = ModifiedBy;
        this.img_id = img_id;
        this.isDel = isDel;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getBrand() {
        return brand;
    }

    public void setBrand(int brand) {
        this.brand = brand;
    }

    public int getNews_type() {
        return news_type;
    }

    public void setNews_type(int news_type) {
        this.news_type = news_type;
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

    public int getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(int CreatedBy) {
        this.CreatedBy = CreatedBy;
    }

    public int getModifiedBy() {
        return ModifiedBy;
    }

    public void setModifiedBy(int ModifiedBy) {
        this.ModifiedBy = ModifiedBy;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_url(int img_id) {
        this.img_id = img_id;
    }

    public int isIsDel() {
        return isDel;
    }

    public void setIsDel(int isDel) {
        this.isDel = isDel;
    }
    
}
