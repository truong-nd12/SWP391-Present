/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import DAL.GuaranteeDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Customer;
import Model.Guarantee;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author XUAN PHUC
 */
@WebServlet(name = "DetailGuarranteeUser", urlPatterns = {"/DetailGuarranteeUser"})
public class DetailGuarranteeUser extends HttpServlet {

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
            out.println("<title>Servlet DetailGuarranteeUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailGuarranteeUser at " + request.getContextPath() + "</h1>");
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
        GuaranteeDAO guaranteeDAO = new GuaranteeDAO();
        String guaranteeId = request.getParameter("record_id");
        Guarantee guarantee_record = guaranteeDAO.getGuaranteeByIdInDetailGuarantee(Integer.parseInt(guaranteeId));
        String cre = request.getParameter("creatorId");
        request.setAttribute("creatorId", cre);
        ProductDAO prDao = new ProductDAO();
        Product product = prDao.getNameById(guarantee_record.getProduct());
        Customer customer = guaranteeDAO.getCustomerByOrderID(guarantee_record.getOrder_id());
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrderById(guarantee_record.getOrder_id());
        request.setAttribute("order", order);
        request.setAttribute("product", product);
        request.setAttribute("customer", customer);
        request.setAttribute("guarantee_record", guarantee_record);
        request.setAttribute("guaranteeDAO", guaranteeDAO);
        int monthLeft = getMonthLeft(order, product);
        if (monthLeft < 0) {
            String outOfDate = "Out of date";
            request.setAttribute("remain", outOfDate);
        } else {
            request.setAttribute("remain", monthLeft);
        }
        request.getRequestDispatcher("GuaranteeDetail.jsp").forward(request, response);
    }

    private int getMonthLeft(Order order, Product product) {
        Date today = new Date();

        long passed = today.getTime() - order.getOrder_date().getTime();
        int passedMonth = (int) (passed / 2629800000l);

        return product.getGuarantee_time() - passedMonth;
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
