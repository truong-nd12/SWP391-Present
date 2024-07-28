/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.TypeDAO;
import DAL.BrandDAO;
import DAL.ProductDAO;
import Model.Admin;
import Model.Product;
import Model.Brand;
import Model.Type;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ManagementProduct extends HttpServlet {

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
        Admin adminacc = (Admin) session.getAttribute("acc");
        if (adminacc == null) {
            request.getRequestDispatcher("login_1.jsp").forward(request, response);
            return;
        }
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }

        int indexPage = Integer.parseInt(index);
        ProductDAO dao = new ProductDAO();
        BrandDAO dao1 = new BrandDAO();
        TypeDAO dao2 = new TypeDAO();
        List<Product> listP = dao.getProductByIndex(indexPage);
        List<Brand> listB = dao1.getAll();
        List<Type> listT = dao2.getAll();
        int num = request.getParameter("num") == null ? 9 : Integer.parseInt(request.getParameter("num"));
        int allProduct = dao.countAllProduct();
        int endPage = allProduct / num;
        if (allProduct % num != 0) {
            endPage++;
        }
        String ep = null;
        request.setAttribute("ep", ep);
        request.setAttribute("tag", indexPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listP", listP);
        request.setAttribute("listB", listB);
        request.setAttribute("listT", listT);
        if (request.getParameter("name") != null) {
            request.setAttribute("name", request.getParameter("name"));
        }
        request.getRequestDispatcher("AdminManagementProduct.jsp").forward(request, response);
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
