/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.*;
import Model.*;
import Model.Pagination.Pagination;
import Model.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Product extends HttpServlet {

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
            out.println("<title>Servlet Product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Product at " + request.getContextPath() + "</h1>");
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
        ProductDAO productDAO = new ProductDAO();
        BrandDAO brandDAO = new BrandDAO();
        TypeDAO typeDAO = new TypeDAO();
        String searchValue = request.getParameter("search") == null ? "" : request.getParameter("search");
        String brand = request.getParameter("brand") == null ? "" : request.getParameter("brand");
        String type = request.getParameter("type") == null ? "" : request.getParameter("type");
        String price = request.getParameter("price") == null ? "" : request.getParameter("price");
        double min = 0;
        double max = 100000000;
        if (!price.isEmpty()) {
            if (price.equals("price1")) {
                min = 0;
                max = 5000000;
            } else if (price.equals("price2")) {
                min = 5000000;
                max = 10000000;
            } else if (price.equals("price3")) {
                min = 10000000;
                max = 20000000;
            } else if (price.equals("price4")) {
                min = 20000000;
            }
        }
        Pagination pagination = new Pagination(request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page")),
                productDAO.countAllProductUser(searchValue, brand, type, min, max), 0, 6);
        List<Model.Product> p = productDAO.getAllProductUser(pagination, searchValue, brand, type, min, max);
        request.setAttribute("products", p);
        request.setAttribute("err", productDAO.countAllProductUser(searchValue, brand, type, min, max));
        List<Brand> brands = brandDAO.getAll();
        request.setAttribute("brands", brands);
        List<Type> types = typeDAO.getAll();
        request.setAttribute("types", types);
        request.setAttribute("paging", pagination);
        request.getRequestDispatcher("Product.jsp").forward(request, response);
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
