/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *Interactive with table Views from database
 * @author khanh
 */
public class ViewDAO extends DBContext{
    
    /**
     *Get views of website
     * 
     * @return an int. It is a number of views.
     * @throws Exception
     * @author khanh
     */
    public int getViews(){
        String sql = "SELECT * FROM [Views]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt("ViewsPage");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    /**
     *Update views of website
     * 
     * @throws Exception
     * @author khanh
     */
    public void updateViews(){
        String sql = "UPDATE [Views] SET ViewsPage = ViewsPage + 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
