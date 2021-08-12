/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Contact;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *Interactive with table Contact from database
 * @author khanh
 */
public class ContactDAO extends DBContext{
    
    /**
     *Get Contact
     * 
     * @return a Contact.
     * @throws Exception
     * @author khanh
     */
    public Contact getContact(){
        String sql = "SELECT * FROM Contact";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Contact contact = new Contact(rs.getString("address"), 
                        rs.getString("city"), 
                        rs.getString("country"), 
                        rs.getString("telephone"), 
                        rs.getString("email"), 
                        rs.getString("map"));
                return contact;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
}
