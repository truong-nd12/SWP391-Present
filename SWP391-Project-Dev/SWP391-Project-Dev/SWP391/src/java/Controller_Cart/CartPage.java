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
import Model.Product;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CartPage extends HttpServlet {

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
            out.println("<title>Servlet CartPage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartPage at " + request.getContextPath() + "</h1>");
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
        Customer cus = (Customer) session.getAttribute("acc");
        if (cus == null) {
            response.sendRedirect("LoginPage");
        } else {
            Cart cart = new Cart();
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            }
            if (request.getParameter("id") != null) {
                int pid = Integer.parseInt(request.getParameter("id"));
                if (request.getParameter("remove") == null) {
                    OrderDAO order = new OrderDAO();
                    Item item;
                    Product pr = order.getNameById(pid);
                    double price = pr.getPrice() *(1-pr.getSale()/100.0);
                    if (request.getParameter("quantity") != null) {
                        item = new Item(pr, Integer.parseInt(request.getParameter("quantity")), price);
                    } else {
                        item = new Item(pr, 1, price);
                    }
                    int quantity = request.getParameter("quantity") == null ? 1 : Integer.parseInt(request.getParameter("quantity"));
                    if (cart.getItemById(pid) != null) {
                        if (cart.getItemById(pid).getQuality() + quantity <= pr.getQuantity()) {
                            cart.addItem(item);
                        } else {
                            request.setAttribute("err", "Xin lỗi nhưng số lượng sản phẩm  không đủ. Vui lòng kiểm tra lại");
                        }
                    } else {
                        if (quantity > pr.getQuantity()) {
                            request.setAttribute("err", "Xin lỗi nhưng số lượng sản phẩm  không đủ. Vui lòng kiểm tra lại");
                        } else {
                            cart.addItem(item);
                        }
                    }
                } else {
                    cart.removeItem(pid);
                }
            }
            if (session.getAttribute("pro1") != null) {
                request.setAttribute("err", "Xin lỗi nhưng số lượng sản phẩm không đủ. Vui lòng kiểm tra lại");
                session.removeAttribute("pro1");
            }
            request.setAttribute("pro", new ProductDAO());
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonData = sb.toString();
        Gson gson = new Gson();
        DataObject data = gson.fromJson(jsonData, DataObject.class);
        String key1 = data.getKey1();
        String key2 = data.getKey2();
        int pid = Integer.parseInt(key1);
        OrderDAO order = new OrderDAO();
        Product pr = order.getNameById(pid);
        double price = pr.getPrice() *(1-pr.getSale()/100.0);
        Item item = new Item(pr, 1, price);
        Cart cart = (Cart) session.getAttribute("cart");
        Object o = session.getAttribute("cart");
        if (key2.equals("1")) {
            cart.deleteItem(item);
        } else {
            cart.addItem(item);
        }
        session.setAttribute("cart", cart);
    }

    public class DataObject {

        private String key1;
        private String key2;

        public String getKey1() {
            return key1;
        }

        public String getKey2() {
            return key2;
        }

        public void setKey1(String key1) {
            this.key1 = key1;
        }

        public void setKey2(String key2) {
            this.key2 = key2;
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
