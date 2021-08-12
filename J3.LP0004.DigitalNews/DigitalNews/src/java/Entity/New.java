/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author khanh
 */
public class New {
    private int id;
    private String title;
    private String description;
    private String image;
    private String author;
    private Date datePost;
    private String summary;

    public New() {
    }

    public New(int id, String title, String description, String image, String author, Date datePost, String summary) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.author = author;
        this.datePost = datePost;
        this.summary = summary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDatePost() {
        SimpleDateFormat dateFormat1 = new SimpleDateFormat("MMM dd yyyy - hh:mm:");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("a");
        String date = dateFormat1.format(this.datePost) + dateFormat2.format(this.datePost).toLowerCase();
        return date; 
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Override
    public String toString() {
        return id + "\t" + datePost; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
