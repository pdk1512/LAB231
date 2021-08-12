/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ViewDAO;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author khanh
 */
public class ViewsListener implements HttpSessionListener{

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ViewDAO daoV = new ViewDAO();
        try {
            daoV.updateViews();
            //Format view to a string has 6 digits
            String view = String.format("%06d", daoV.getViews());
            se.getSession().setAttribute("Views", view);
        } catch (Exception e) {
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }
    
}
