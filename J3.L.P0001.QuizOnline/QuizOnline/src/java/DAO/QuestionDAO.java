/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author khanh
 */
public class QuestionDAO extends DBContext{
    
    /**
     *Get total number of questions
     * 
     * @return an int number.
     * @throws Exception
     * @author khanh
     */
    public int getTotalQuestion(){
        String sql = "SELECT COUNT (*) AS TotalQuestion FROM Question";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getInt("TotalQuestion");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    /**
     *Get questions randomly 
     * 
     * @param numOfQues. It is an int number.
     * @return a list of question.
     * @throws Exception
     * @author khanh
     */
    public List<Question> getQuestionRandom(int numOfQues){
        List<Question> listQues = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Question\n" 
                    + "ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numOfQues);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Question q = new Question(rs.getInt("ID"), 
                        rs.getString("Question"), 
                        rs.getString("Option1"), 
                        rs.getString("Option2"), 
                        rs.getString("Option3"), 
                        rs.getString("Option4"), 
                        rs.getInt("Solution"), 
                        rs.getDate("DateCreated").toString(), 
                        rs.getString("Author"));
                listQues.add(q);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listQues;
    }
    
    /**
     *Get questions by author
     * 
     * @param author. It is a string.
     * @return a list of question.
     * @throws Exception
     * @author khanh
     */
    public List<Question> getQuestionByAuthor(String author){
        List<Question> listQues = new ArrayList<>();
        String sql = "SELECT * FROM Question\n" +
                "WHERE Author = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, author);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Question q = new Question(rs.getInt("ID"), 
                        rs.getString("Question"), 
                        rs.getString("Option1"), 
                        rs.getString("Option2"), 
                        rs.getString("Option3"), 
                        rs.getString("Option4"), 
                        rs.getInt("Solution"), 
                        rs.getString("DateCreated"), 
                        rs.getString("Author"));
                listQues.add(q);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listQues;
    }
    
    /**
     *Add new question to DB
     * 
     * @param question. It is a string.
     * @param option1. It is a string.
     * @param option2. It is a string.
     * @param option3. It is a string.
     * @param option4. It is a string.
     * @param solution. It is an int number.
     * @param author. It is a string.
     * @throws Exception
     * @author khanh
     */
    public void addQuestion(String question, String option1, String option2, 
            String option3, String option4, int solution, String author){
        String sql = "INSERT INTO Question VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, question);
            st.setString(2, option1);
            st.setString(3, option2);
            st.setString(4, option3);
            st.setString(5, option4);
            st.setInt(6, solution);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            st.setDate(7, java.sql.Date.valueOf(formatter.format(date)));
            st.setString(8, author);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /**
     *Get total number of questions by author
     * 
     * @param author. It is a string.
     * @return a number of question.
     * @throws Exception
     * @author khanh
     */
    public int getNumOfQuestionByAuthor(String author){
        String sql = "SELECT COUNT (*) AS TotalQuestion FROM Question WHERE Author = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, author);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getInt("TotalQuestion");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
}
