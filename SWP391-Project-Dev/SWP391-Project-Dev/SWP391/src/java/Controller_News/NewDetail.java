/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_News;

import DAL.*;
import Model.Brand;
import Model.Customer;
import Model.New_Types;
import Model.News;
import Model.Pagination.Pagination;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "NewDetail", urlPatterns = {"/NewDetail"})
public class NewDetail extends HttpServlet {

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
            out.println("<title>Servlet NewDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewDetail at " + request.getContextPath() + "</h1>");
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
        NewsTypeDAO newtypedao = new NewsTypeDAO();
        BrandDAO brandDAO = new BrandDAO();
        NewImgDAO imgDAO = new NewImgDAO();
        List<Brand> brandList = brandDAO.getAll();
        NewDAO newsDAO = new NewDAO();
        List<New_Types> typelist = newtypedao.getAllNews_Type();
        int id = Integer.parseInt(request.getParameter("id"));
        session.setAttribute("news_type", typelist);
        session.setAttribute("brands", brandList);
        request.setAttribute("img", imgDAO);
        request.setAttribute("comment", new CommentDAO());
        request.setAttribute("news", newsDAO.getById(id));
        request.setAttribute("account", new AdminDAO());
        request.setAttribute("cus", new CustomerDAO());
        request.setAttribute("typeName", newtypedao);
        request.setAttribute("threelist", newsDAO.getThreeNewsRecent());
        request.setAttribute("relatelist", newsDAO.getThreeNews(newsDAO.getById(id).getNews_type()));
        request.setAttribute("types", typelist);
        request.getRequestDispatcher("newdetail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String comment = request.getParameter("comment");
        Customer cus = (Customer) session.getAttribute("acc");
        if (cus != null) {
            int cus_id = cus.getCustomer_id();
            int new_id = Integer.parseInt(request.getParameter("id"));
            new CommentDAO().addComment(new_id, cus_id, comment);
            doGet(request, response);
        } else {
            response.sendRedirect("LoginPage");
        }
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
