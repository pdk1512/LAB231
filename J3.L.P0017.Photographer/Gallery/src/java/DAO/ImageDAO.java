/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Image;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *Interactive with table Picture from database
 * @author khanh
 */
public class ImageDAO extends DBContext {

    /**
     *Get avatar image for gallery
     * 
     * @param id. It is an int number.
     * @return a string. It is an url for avatar image
     * @throws Exception
     * @author khanh
     */
    public String getAvatarImage(int id) {
        String sql = "SELECT TOP 1 image_url FROM Picture \n"
                + "WHERE gallery_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("image_url");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *Get all images from gallery
     * 
     * @param galleryId. It is an int number.
     * @return a list. It is a list of Image
     * @throws Exception
     * @author khanh
     */
    public List<Image> getImageByGalleryId(int galleryId) {
        List<Image> images = new ArrayList<>();
        String sql = "SELECT * FROM Picture\n"
                + "WHERE gallery_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, galleryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image(rs.getInt("id"),
                        rs.getString("image_url"));
                images.add(image);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return images;
    }

    /**
     *Get total numbers of images from gallery
     * 
     * @param galleryId. It is an int number.
     * @return an int number. It is total numbers images
     * @throws Exception
     * @author khanh
     */
    public int getTotalImage(int galleryId) {
        String sql = "SELECT COUNT(*) AS total_image FROM Picture\n"
                + "WHERE gallery_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, galleryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total_image");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     *Get images for each page from gallery
     * 
     * @param galleryId. It is an int number.
     * @param page. It is an int number.
     * @return a list. It is a list of Image
     * @throws Exception
     * @author khanh
     */
    public List<Image> getPageImage(int galleryId, int page) {
        List<Image> imagePaging = new ArrayList<>();
        String sql = "SELECT * FROM Picture\n"
                + "WHERE gallery_id = ?\n"
                + "ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 8 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, (page - 1) * 8);
            ps.setInt(1, galleryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image(rs.getInt("id"),
                        rs.getString("image_url"));
                imagePaging.add(image);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return imagePaging;
    }

    /**
     *Get numbers of page to display images
     * 
     * @param galleryId. It is an int number.
     * @return an int number. It is total pages
     * @throws Exception
     * @author khanh
     */
    public int getImagePage(int galleryId) {
        String sql = "SELECT COUNT(*) AS totalPic FROM Picture\n"
                + "WHERE gallery_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, galleryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("totalPic");
                int countPage = 0;
                countPage = total / 8;
                if (total % 8 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
}
