/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import DAL.GuaranteeDAO;
import Model.Admin;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author XUAN PHUC
 */
@WebServlet(name = "ManagernentGuarantee", urlPatterns = {"/ManagernentGuarantee"})
public class ManagernentGuarantee extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagernentGuarantee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagernentGuarantee at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Admin ad = (Admin) session.getAttribute("acc");
        if (ad == null) {
            response.sendRedirect("LoginPage");
        }else {
            String search_tag = request.getParameter("search");
            if(search_tag != null){
                GuaranteeDAO dao = new GuaranteeDAO();
                List<Model.Guarantee> search = dao.searchByTag(search_tag);
                request.setAttribute("lst", search);
            }else{
                GuaranteeDAO dao = new GuaranteeDAO();
                List<Model.Guarantee> lst = dao.getListManagermentGuarantee();
                request.setAttribute("lst", lst);
            }
            
            String creaName = request.getParameter("creatorName");
            request.setAttribute("creatorName", creaName );
            request.setAttribute("search", search_tag);
            request.getRequestDispatcher("ManagementGuarantee.jsp").forward(request, response);
        }
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
