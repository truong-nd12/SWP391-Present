/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BrandDAO;
import DAL.ProductDAO;
import DAL.TypeDAO;
import Model.Brand;
import Model.Type;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SearchController extends HttpServlet {

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
            out.println("<title>Servlet SearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String bid = request.getParameter("brand_id");
        String tid = request.getParameter("type_id");
        String pricemin = request.getParameter("pricemin").replace(".", "");
         String pricemax = request.getParameter("pricemax").replace(".", "");
        String ep = request.getParameter("ep");
        int num = request.getParameter("num") == null ? 9 : Integer.parseInt(request.getParameter("num"));
        ProductDAO dao = new ProductDAO();
        TypeDAO dao1 = new TypeDAO();
        BrandDAO dao2 = new BrandDAO();
        List<Type> listT = dao1.getAll();
        List<Brand> listB = dao2.getAll();
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        List<Product> listP = dao.getProductBySearch(name, bid, tid, pricemin, pricemax, indexPage, num);
        int allProduct = dao.countAllProductSearch(name, bid, tid, pricemin, pricemax);
        int endPage = allProduct / num;
        if (allProduct % num != 0) {
            endPage++;
        }
        request.setAttribute("type_id", tid);
        request.setAttribute("brand_id", bid);
        request.setAttribute("ep", ep);
        request.setAttribute("name", name);
        request.setAttribute("num", num);
        request.setAttribute("pricemin", pricemin);
        request.setAttribute("pricemax", pricemax);
        request.setAttribute("tag1", indexPage);
        request.setAttribute("endPage1", endPage);
        request.setAttribute("listT", listT);
        request.setAttribute("listB", listB);
        request.setAttribute("listP", listP);
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
