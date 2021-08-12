/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Share;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *Interactive with table Share from database
 * @author khanh
 */
public class SocialDAO extends DBContext{
    
    /**
     *Get social share links
     * 
     * @return a Share.
     * @throws Exception
     * @author khanh
     */
    public Share getSocialLink(){
        String sql = "SELECT * FROM Share";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Share link = new Share(rs.getString("facebook_url"), 
                        rs.getString("twitter_url"), 
                        rs.getString("google_url"));
                return link;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
}
