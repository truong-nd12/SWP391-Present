/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller_Feedback;

import DAL.FeedbackDAO;
import DAL.OrderDAO;
import Model.Customer;
import Model.feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name="sendFeedBack", urlPatterns={"/sendFeedBack"})
public class sendFeedBack extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sendFeedBack</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sendFeedBack at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            FeedbackDAO feedBackDAO = new FeedbackDAO();
            OrderDAO orderdao = new OrderDAO();
            OrderDAO orderDetailDAO = new OrderDAO();
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("acc");
            int productId = Integer.parseInt(request.getParameter("Pid"));
            int orderId = Integer.parseInt(request.getParameter("Oid"));
            String stars = request.getParameter("stars");
            String content = request.getParameter("description");
            if (cus != null) {
                feedback Feedback = new feedback(0, content, productId, orderId, null, Integer.parseInt(stars));
                feedBackDAO.insertFeedBack(Feedback, orderId);
                request.setAttribute("order", orderdao.getOrderById(orderId));
                request.setAttribute("pro", orderdao);
                request.setAttribute("orderdetail", orderDetailDAO.getOrderDetailByCusId(orderId));
                request.setAttribute("ship", orderdao.getShipById(orderId));
                String[] address = orderdao.getShipById(orderId).getAddress().split(", ");
                request.setAttribute("address", address);
                request.setAttribute("feedback", feedBackDAO);
                response.sendRedirect("OrderDetail?id="+orderId+"&ERRO=1");
            } else {
                request.getRequestDispatcher("login_1.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("sendFeedback: " + e.getMessage());
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
