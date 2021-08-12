/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DAO.ImageDAO;

/**
 *
 * @author khanh
 */
public class Gallery {
    private int id;
    private String title;
    private String description;
    private String avtImage;

    public Gallery() {
    }

    public Gallery(int id, String title, String description, String avtImage) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.avtImage = avtImage;
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


    public String getAvtImage() {
        ImageDAO daoi = new ImageDAO();
        return daoi.getAvatarImage(id);
    }

    public void setAvtImage(String avtImage) {
        this.avtImage = avtImage;
    }

  
    
    
    
    
}
