/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Introduction;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *Interactive with table Introduction from database
 * @author khanh
 */
public class IntroDAO extends DBContext{
    
    /**
     *Get Introduction
     * 
     * @return a Introduction.
     * @throws Exception
     * @author khanh
     */
    public Introduction getIntro(){
        String sql = "SELECT * FROM Introduction";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Introduction intro = new Introduction(rs.getString("banner"), 
                        rs.getString("description"), 
                        rs.getString("about"));
                return intro;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
