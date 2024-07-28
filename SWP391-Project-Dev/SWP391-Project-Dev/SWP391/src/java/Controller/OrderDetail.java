/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.FeedbackDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Order_Detail;
import Model.Shipment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Dell
 */
@WebServlet(name = "OrderDetail", urlPatterns = {"/OrderDetail"})
public class OrderDetail extends HttpServlet {

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
            out.println("<title>Servlet OrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath() + "</h1>");
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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            FeedbackDAO feedBackDAO = new FeedbackDAO();
            if (request.getParameter("feedbackid") != null){
            int feedbackid = Integer.parseInt(request.getParameter("feedbackid"));
            feedBackDAO.DeleteFeedbackById(feedbackid);
            }
            OrderDAO orderdao = new OrderDAO();
            System.out.println("fid"+request.getParameter("feedbackid"));
//            request.setAttribute("feedback", feedBackDAO.getFeedbackById(id));
            request.setAttribute("orderdetail", orderdao.getOrderDetailByCusId(id));
            request.setAttribute("order", orderdao.getOrderById(id));
            request.setAttribute("pro", orderdao);
            
            request.setAttribute("feedback", feedBackDAO);
            request.setAttribute("ship", orderdao.getShipById(id));
            String[] address = orderdao.getShipById(id).getAddress().split(", ");
            request.setAttribute("address", address);
            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("OrderPage");
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
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address") + ", " + request.getParameter("ward") + ", " + request.getParameter("district") + ", " + request.getParameter("city");
        String note = request.getParameter("note");
        OrderDAO orderdao = new OrderDAO();
        Shipment ship = new Shipment(0, id, address, null, null, phone, name, note);
        orderdao.updateShip(ship);
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
