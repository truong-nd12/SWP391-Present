/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Cart;

import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Cart;
import Model.Customer;
import Model.Item;
import Model.Shipment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author Dell
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOut extends HttpServlet {

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
            out.println("<title>Servlet CheckOut</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
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
        Cart cart = (Cart) session.getAttribute("cart");
        Customer cus = (Customer) session.getAttribute("acc");
        ProductDAO pro=new ProductDAO();
        int count = 0;
        for (Item item : cart.getItems()) {
            if (item.getQuality() > pro.getProductById(item.getProduct().getProduct_id()).get(0).getQuantity() ) {
                count = 1;
            }
            System.out.println(item.getQuality()+""+item.getProduct().getQuantity());
        }
        if (count == 1) {
            session.setAttribute("pro1", new ProductDAO());
            response.sendRedirect("CartPage");
        } else {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address") + ", " + request.getParameter("ward") + ", " + request.getParameter("district") + ", " + request.getParameter("city");
            String note = request.getParameter("note");
            String payment = request.getParameter("cash");
            Shipment ship = new Shipment(0, 0, address, null, null, phone, name, note);
            OrderDAO order = new OrderDAO();
            order.addOrder(cus, cart, ship, 0, payment);
            for (Item item : cart.getItems()) {
                order.updateRemoveProduct(item.getQuality(), item.getProduct().getProduct_id());
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
            response.sendRedirect("OrderPage");
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
