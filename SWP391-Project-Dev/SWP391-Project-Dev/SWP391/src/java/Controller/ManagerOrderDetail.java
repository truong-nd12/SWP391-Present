/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.OrderDAO;
import Model.Order_Detail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerOrderDetail", urlPatterns = {"/ManagerOrderDetail"})
public class ManagerOrderDetail extends HttpServlet {

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
            out.println("<title>Servlet ManagerOrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerOrderDetail at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        OrderDAO orderdao = new OrderDAO();
        if (request.getParameter("status") != null) {
            orderdao.updateOrderPaymentStatus(id, Integer.parseInt(request.getParameter("status")));
        }
        int count = 0;
        if (request.getParameter("addtag") != null) {
            for (Order_Detail or : orderdao.getOrderDetailByCusId(id)) {
                for (int i = 1; i <= or.getQuantity(); i++) {
                    if (orderdao.getServiceTagByTag(request.getParameter("a_" + or.getProduct_id() + "_" + i),or.getProduct_id()) == null) {
                        count++;
                    }
                }
            }
            if (count == 0) {
                for (Order_Detail or : orderdao.getOrderDetailByCusId(id)) {
                    for (int i = 1; i <= or.getQuantity(); i++) {
                        orderdao.updateServiceTag(id, request.getParameter("a_" + or.getProduct_id() + "_" + i), or.getProduct_id());
                    }
                }
            } else {
                request.setAttribute("err", "Vui lòng kiểm tra giá trị của bảo hành");
            }
        }
        request.setAttribute("orderdetail", orderdao.getOrderDetailByCusId(id));
        request.setAttribute("order", orderdao.getOrderById(id));
        request.setAttribute("pro", orderdao);
        request.setAttribute("ship", orderdao.getShipById(id));
        String[] address = orderdao.getShipById(id).getAddress().split(", ");
        request.setAttribute("address", address);
        request.getRequestDispatcher("ManagerOrderDetail.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        OrderDAO orderdao = new OrderDAO();
        if (request.getParameter("corder") != null) {
            orderdao.updateOrderStatus(id, 4);
            for (Order_Detail or : orderdao.getOrderDetailByCusId(id)) {
                orderdao.updateAddProduct(or.getQuantity(), or.getProduct_id());
            }
        } else if (request.getParameter("conorder") != null) {
            orderdao.updateOrderStatus(id, 1);
        } else if (request.getParameter("sorder") != null) {
            orderdao.updateOrderStatus(id, 2);
            orderdao.updateOrderDeliveryDate(id);
        } else if (request.getParameter("rorder") != null) {
            orderdao.updateOrderStatus(id, 5);
            orderdao.updateServiceTagOrderId(id);
            orderdao.updateOrderReceiveDate(id);
            for (Order_Detail or : orderdao.getOrderDetailByCusId(id)) {
                orderdao.updateAddProduct(or.getQuantity(), or.getProduct_id());
            }
        } else {
            orderdao.updateOrderStatus(id, 3);
            orderdao.updateOrderReceiveDate(id);
        }
        doGet(request, response);
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
