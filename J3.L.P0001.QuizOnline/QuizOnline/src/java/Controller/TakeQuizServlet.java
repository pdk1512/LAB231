/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuestionDAO;
import Entity.Exam;
import Entity.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khanh
 */
public class TakeQuizServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        QuestionDAO daoQ = new QuestionDAO();
        int numOfQues = Integer.parseInt(request.getParameter("numOfQues"));
        //If user input numOfQues < 0 and > total question in DB -> back to TakeQuiz.jsp to reinput
        if(numOfQues <= 0 || numOfQues > daoQ.getTotalQuestion()){
            String alert = "Number of questions must from 1 to " + daoQ.getTotalQuestion();
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);
        }
        else{
            //Get the list randomly questions 
            List<Question> listQ = daoQ.getQuestionRandom(numOfQues);
            Exam exam = new Exam(numOfQues, listQ);
            HttpSession session = request.getSession(true);
            //Set the exam object as a session -> startquiz
            session.setAttribute("exam", exam);
            request.getRequestDispatcher("startquiz").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
