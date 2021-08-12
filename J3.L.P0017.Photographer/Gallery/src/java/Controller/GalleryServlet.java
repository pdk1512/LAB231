/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GalleryDAO;
import DAO.ImageDAO;
import DAO.SocialDAO;
import Entity.Gallery;
import Entity.Image;
import Entity.Share;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GalleryServlet extends HttpServlet {

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
            ImageDAO daoImg = new ImageDAO();
            SocialDAO daoS = new SocialDAO();
            GalleryDAO daoG = new GalleryDAO();
            HttpSession session = request.getSession();

            //Get gallery id from link
            int galleryId = Integer.parseInt(request.getParameter("gid"));
            request.setAttribute("Gid", galleryId);

            //Take all images from gallery id above
            List<Image> allImg = daoImg.getImageByGalleryId(galleryId);
            request.setAttribute("AllPic", allImg);

            //Take the total images from gallery id above
            int totalImg = daoImg.getTotalImage(galleryId);
            request.setAttribute("TotalImg", totalImg);

            //Take the url of 1st pic from gallery id above
            String firstPic = allImg.get(0).getImage_url();
            request.setAttribute("firstUrl", firstPic);

            //Take the order of page
            String sPage = request.getParameter("page");
            int page = sPage == null ? 1 : Integer.parseInt(sPage);

            //Take images for each page
            List<Image> listImg = daoImg.getPageImage(galleryId, page);
            request.setAttribute("ListImg", listImg);

            //Take the total of pages 
            int totalPage = daoImg.getImagePage(galleryId);
            request.setAttribute("TotalPage", totalPage);

            //Take the link social share 
            Share linkSocial = daoS.getSocialLink();
            request.setAttribute("links", linkSocial);

            //Take the 3 galleries gallery for menu
            List<Gallery> listG = daoG.getGallery(1);
            request.setAttribute("ListG", listG);

            Gallery gallery = daoG.getGalleryById(galleryId);
            request.setAttribute("Gallery", gallery);

            //Send the current page for css
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("Gallery.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(GalleryServlet.class.getName()).log(Level.SEVERE, null, e);
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
