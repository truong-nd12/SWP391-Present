/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BrandDAO;
import DAL.ProductDAO;
import DAL.TypeDAO;
import Model.Admin;
import Model.Brand;
import Model.Type;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "updateproduct", urlPatterns = "/updateproduct")
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        ProductDAO dao = new ProductDAO();
        BrandDAO dao1 = new BrandDAO();
        TypeDAO dao2 = new TypeDAO();
        int id = Integer.parseInt(request.getParameter("pid"));
        List<Product> listP = dao.getProductById(id);
        List<Brand> listB = dao1.getAll();
        List<Type> listT = dao2.getAll();
        request.setAttribute("listP", listP);
        request.setAttribute("listB", listB);
        request.setAttribute("listT", listT);
        request.getRequestDispatcher("UpdateProductPage.jsp").forward(request, response);
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
        Admin adminacc = (Admin) session.getAttribute("acc");
        ProductDAO productDAO = new ProductDAO();
        BrandDAO dao1 = new BrandDAO();
        TypeDAO dao2 = new TypeDAO();
        try {
            List<Brand> listB = dao1.getAll();
            List<Type> listT = dao2.getAll();
            request.setAttribute("listB", listB);
            request.setAttribute("listT", listT);
            if (adminacc != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                double price = helper.helper.convertVndToDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String description = request.getParameter("description");
                int sale = Integer.parseInt(request.getParameter("sale").trim());
                int guarantee = Integer.parseInt(request.getParameter("guarantee"));
                int typeId = Integer.parseInt(request.getParameter("type"));
                int brandId = Integer.parseInt(request.getParameter("brand"));
                Product product = productDAO.UpdateProductById(id, adminacc.getAccount_id(), name, price, quantity, sale, description, guarantee, brandId, typeId);
                response.sendRedirect("managementproduct");
            } else {
                request.getRequestDispatcher("login_1.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("update: " + ex.getMessage());
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
