/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.New;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khanh
 */
public class NewDAO extends DBContext {

    /**
     *Get the most recent new
     * 
     * @return a New object.
     * @throws Exception
     * @author khanh
     */
    public New getLastNew() {
        String sql = "SELECT TOP 1 * FROM News\n"
                + "ORDER BY [Date] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new New(rs.getInt("ID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getString("Author"),
                        rs.getDate("Date"),
                        rs.getString("Summary"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    

    /**
     *Get the 5 most other recent news
     * 
     * @return a List of New object.
     * @param id. It is an int number.
     * @throws Exception
     * @author khanh
     */
    public List<New> getLast5OtherNews(int id) {
        List<New> listTop5 = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM News\n"
                + "WHERE ID NOT IN(SELECT ID WHERE ID = ?)\n"
                + "ORDER BY [Date] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                New n = new New(rs.getInt("ID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getString("Author"),
                        rs.getDate("Date"),
                        rs.getString("Summary"));
                listTop5.add(n);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listTop5;
    }

    /**
     *Get the new to display
     * 
     * @return a New object.
     * @throws Exception
     * @author khanh
     */
    public New getNew(int id) {
        String sql = "SELECT * FROM News WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new New(rs.getInt("ID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getString("Author"),
                        rs.getDate("Date"),
                        rs.getString("Summary"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *Get the list of search news in paging
     * 
     * @return a List of New object.
     * @param page. It is an int number.
     * @param search. It is a string to search.
     * @throws Exception
     * @author khanh
     */
    public List<New> searchNew(String search, int page) {
        List<New> listSearch = new ArrayList<>();
        String sql = "SELECT * FROM News\n"
                + "WHERE Title LIKE ?\n"
                + "ORDER BY [Date] DESC\n"
                + "OFFSET ? ROWs\n"
                + "FETCH FIRST 2 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setInt(2, (page-1)*2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                New n = new New(rs.getInt("ID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getString("Author"),
                        rs.getDate("Date"),
                        rs.getString("Summary"));
                listSearch.add(n);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listSearch;
    }
   
    /**
     *Get the total page to display search news
     * 
     * @return an int number.
     * @param search. It is a string to search.
     * @throws Exception
     * @author khanh
     */
    public int getPageNews(String search) {
        String sql = "SELECT COUNT(*) AS Total FROM News\n"
                + "WHERE Title LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                int total = rs.getInt("Total"); 
                int countPage = 0;
                countPage = total / 2;
                if (total % 2 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
