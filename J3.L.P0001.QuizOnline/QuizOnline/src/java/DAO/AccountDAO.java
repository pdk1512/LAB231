/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author khanh
 */
public class AccountDAO extends DBContext{
    
    /**
     *Get account to login
     * 
     * @param user. It is a string.
     * @param pass. It is a string.
     * @return a account.
     * @throws Exception
     * @author khanh
     */
    public Account getAccount(String user, String pass){
        String sql = "SELECT * FROM Account WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return new Account(rs.getString("Username"), 
                        rs.getString("Password"), 
                        rs.getInt("Type"), 
                        rs.getString("Email"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     *Get account to check username
     * 
     * @param user. It is a string.
     * @return a account.
     * @throws Exception
     * @author khanh
     */
    public Account getAccountByUsername(String user) {
        String sql = "SELECT * FROM Account\n"
                + "WHERE Username = '" + user + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString("Username"), 
                        rs.getString("Password"), 
                        rs.getInt("Type"), 
                        rs.getString("Email"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     *Add new account to DB
     * 
     * @param username. It is a string.
     * @param password. It is a string.
     * @param type. It is an int number.
     * @param email. It is a string.
     * @throws Exception
     * @author khanh
     */
    public void addAccont(String username, String password, int type, String email){
        String sql = "INSERT INTO Account\n"
                + "VALUES(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, type);
            st.setString(4, email);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
