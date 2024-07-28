/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_News;

import DAL.*;
import Model.*;
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
public class Blog extends HttpServlet {

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
            out.println("<title>Servlet Blog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Blog at " + request.getContextPath() + "</h1>");
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
        int num = request.getParameter("num") == null ? 3 : Integer.parseInt(request.getParameter("num"));
        NewsTypeDAO newtypedao = new NewsTypeDAO();
        BrandDAO brandDAO = new BrandDAO();
        NewImgDAO imgDAO = new NewImgDAO();
        List<Brand> brandList = brandDAO.getAll();
        List<News> newses = new ArrayList<>();
        NewDAO newsDAO = new NewDAO();
        List<New_Types> typelist = newtypedao.getAllNews_Type();
        String searchValue = request.getParameter("search") == null ? "" : request.getParameter("search");
        String type = request.getParameter("type") == null ? "" : newtypedao.getNewsIdByName(request.getParameter("type"));
        Pagination pagination = new Pagination(request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page")),
                newsDAO.countNews1(searchValue, type), 0, num);
        session.setAttribute("news_type", typelist);
        session.setAttribute("brands", brandList);
        newses = newsDAO.getAllNews1(pagination, searchValue, type);
        request.setAttribute("img", imgDAO);
        request.setAttribute("account", new AdminDAO());
        request.setAttribute("typeName", newtypedao);
        request.setAttribute("newlist", newses);
        request.setAttribute("comment", new CommentDAO());
        request.setAttribute("threelist", newsDAO.getThreeNewsRecent());
        request.setAttribute("types", typelist);
        request.setAttribute("paging", pagination);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
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
