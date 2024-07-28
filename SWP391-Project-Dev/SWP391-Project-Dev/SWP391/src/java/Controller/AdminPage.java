/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AdminDAO;
import DAL.CustomerDAO;
import Model.Admin;
import Model.Customer;
import Model.Pagination.Pagination;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class AdminPage extends HttpServlet {

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
        doGet(request, response);
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
        String url = "login_1.jsp";
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        int num = request.getParameter("num") == null ? 5 : Integer.parseInt(request.getParameter("num"));
        AdminDAO adminDao = new AdminDAO();
        CustomerDAO cusDAO = new CustomerDAO();
        Customer cus = new Customer();
        if (account != null && account.getRole_id() == 1) {
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");
            Pagination pagination = new Pagination(request.getParameter("page") == null || request.getParameter("sub") != null ? 1 : Integer.parseInt(request.getParameter("page")),
                    cusDAO.countCus(search), 0, num);
            request.setAttribute("paging", pagination);
            request.setAttribute("count", cusDAO.countCus(search));
            List<Admin> adminList = adminDao.getAll(search.trim());
            List<Customer> cusList = new ArrayList<>();
            if (num == 1000) {
                cusList = cusDAO.getAll(pagination, search.trim());
            } else {
                cusList = cusDAO.getAll1(search.trim());
            }
            request.setAttribute("adlist", adminList);
            request.setAttribute("cuslist", cusList);
            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                if (request.getParameter("ban") != null) {
                    request.setAttribute("adlist", adminDao.BanAcc(id));
                    request.setAttribute("cuslist", cusDAO.BanAcc(pagination, search.trim(), id));
                } else {
                    request.setAttribute("adlist", adminDao.UnBanAcc(id));
                    request.setAttribute("cuslist", cusDAO.UnBanAcc(pagination, search.trim(), id));
                }
            }
            url = "ManagementAccount.jsp";
        }
        request.getRequestDispatcher(url).forward(request, response);
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
