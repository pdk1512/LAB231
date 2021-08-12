/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GalleryDAO;
import DAO.IntroDAO;
import DAO.SocialDAO;
import DAO.ViewDAO;
import Entity.Gallery;
import Entity.Introduction;
import Entity.Share;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khanh
 */
public class HomeServlet extends HttpServlet {

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
        try {
            GalleryDAO daoG = new GalleryDAO();
            IntroDAO daoI = new IntroDAO();
            SocialDAO daoS = new SocialDAO();
            ViewDAO daoV = new ViewDAO();
            HttpSession session = request.getSession();

            //Get number of page
            String sPage = request.getParameter("page");
            int page = sPage == null ? 1 : Integer.parseInt(sPage);

            //Get gallery for page
            List<Gallery> listG = daoG.getGallery(page);
            request.setAttribute("ListG", listG);

            //Get introduction
            Introduction introduction = daoI.getIntro();
            request.setAttribute("Intro", introduction);

            //Get social link
            Share linkSocial = daoS.getSocialLink();
            request.setAttribute("links", linkSocial);

            //Get total gallery page
            int totalPage = daoG.getGalleryPage();
            request.setAttribute("TotalPage", totalPage);

            //Get current number page
            request.setAttribute("currentPage", page);
            
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } catch(Exception e)  {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, e);
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
