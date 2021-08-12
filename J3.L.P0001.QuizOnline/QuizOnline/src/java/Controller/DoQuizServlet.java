/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Exam;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khanh
 */
public class DoQuizServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        Exam exam = (Exam) session.getAttribute("exam");
        String order = request.getParameter("question_no");
        int quizOrder = Integer.parseInt(order);

        //Count the score 
        String mark = request.getParameter("mark");
        int score = Integer.parseInt(mark);
        String[] answers = request.getParameterValues("answers");
        if (answers != null) {
            String solution = "";
            //Get string answers
            for (int i = 0; i < answers.length; i++) {
                solution += answers[i];
            }
            //Compare to solution
            if (exam.getListQues().get(quizOrder).getSolution() == Integer.parseInt(solution)) {
                score++;
            }
        }

        //Set data to display result
        if (quizOrder + 1 == exam.getNumOfQues() || request.getParameter("timeOut") == "1") {
            String result;
            double finalMark = ((double) score / exam.getNumOfQues()) * 10;
            if (finalMark >= 5) {
                result = "Passed";
            } else {
                result = "Not Passed";
            }
            //Format display result
            DecimalFormat df = new DecimalFormat("#.##");
            request.setAttribute("result", result);
            request.setAttribute("mark", df.format(finalMark).toString());
            request.setAttribute("percent", df.format(finalMark * 10).toString());
            session.removeAttribute("exam");
            request.getRequestDispatcher("Result.jsp").forward(request, response);
        }
        //Set data to continue exam
        else { 
            String minute = request.getParameter("minutes");
            String second = request.getParameter("seconds");
            request.setAttribute("minute", minute);
            request.setAttribute("second", second);
            request.setAttribute("mark", score);
            request.setAttribute("noQuiz", quizOrder + 1);
            request.setAttribute("quiz", exam.getListQues().get(quizOrder + 1));
            if (quizOrder + 1 == exam.getNumOfQues() - 1) {
                request.setAttribute("button_text", "Finish");
            } else {
                request.setAttribute("button_text", "Next");
            }
            request.getRequestDispatcher("DoQuiz.jsp").forward(request, response);
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

        response.sendRedirect("TakeQuiz.jsp");

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
