/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Gallery;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *Interactive with table Gallery from database
 * @author khanh
 */
public class GalleryDAO extends DBContext {

    /**
     *Get galleries for each page
     * 
     * @param page. It is an int number.
     * @return a list. It is a gallery list
     * @throws Exception
     * @author khanh
     */
    public List<Gallery> getGallery(int page) {
        List<Gallery> listG = new ArrayList<>();
        String sql = "SELECT * FROM Gallery\n"
                + "ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 3 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 3);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setTitle(rs.getString("title"));
                gallery.setDescription(rs.getString("description"));
                listG.add(gallery);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listG;
    }

    /**
     *Get numbers of page to display galleries
     * 
     * @return an int number. It is total pages
     * @throws Exception
     * @author khanh
     */
    public int getGalleryPage() {
        String sql = "SELECT count(*) AS total_gallery FROM Gallery";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("total_gallery");
                int countPage = 0;
                countPage = total / 3;
                if (total % 3 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     *Get gallery by id
     * 
     * @param galleryId. It is an int number.
     * @return a gallery. 
     * @throws Exception
     * @author khanh
     */
    public Gallery getGalleryById(int galleryId) {
        String sql = "SELECT * FROM Gallery WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, galleryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setTitle(rs.getString("title"));
                gallery.setDescription(rs.getString("description"));
                return gallery;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    
}
