/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import Controller_Cart.CartPage;
import DAL.CustomerDAO;
import DAL.GuaranteeDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Cart;
import Model.Customer;
import Model.Guarantee;
import Model.Item;
import Model.Order;
import Model.Product;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 *
 */
@WebServlet(name = "DetailGuarantee", urlPatterns = {"/detail-guarantee"})
public class DetailGuarantee extends HttpServlet {

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
            out.println("<title>Servlet DetailGuarantee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailGuarantee at " + request.getContextPath() + "</h1>");
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
        Cart cart = new Cart();
        session.setAttribute("cartguarantee", cart);
        String url = "GuaranteeDetailAdmin.jsp";
        GuaranteeDAO guaranteeDAO = new GuaranteeDAO();
        String guaranteeId = request.getParameter("guaranteeId");

        Guarantee guarantee_record = guaranteeDAO.getGuaranteeByIdInDetailGuarantee(Integer.parseInt(guaranteeId));
        String cre = request.getParameter("creatorId");
        request.setAttribute("creatorId", cre);

        //product
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

        //month left
        int monthLeft = getMonthLeft(order, product);
        if (monthLeft < 0) {
            String outOfDate = "Ngày hết hạn";
            request.setAttribute("remain", outOfDate);
        } else {
            request.setAttribute("remain", monthLeft);
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    //calculate month left
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
        HttpSession session = request.getSession();
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonData = sb.toString();
        Gson gson = new Gson();
        CartPage.DataObject data = gson.fromJson(jsonData, CartPage.DataObject.class);
        String key1 = data.getKey1();
        String key2 = data.getKey2();
        OrderDAO order = new OrderDAO();
        Product pr = order.getProductByName(key1);
        String error = "";
        //---cart--//
        if (pr != null) {
            double price = pr.getPrice() * (1 - pr.getSale() / 100.0);
            System.out.println("Product" + pr);
            Cart cart = new Cart();
            Object o = session.getAttribute("cartguarantee");
            if (o != null) {
                cart = (Cart) o;
            }
            Item item = new Item(pr, Integer.parseInt(key2), price);
            if (cart.getItemById(pr.getProduct_id()) != null) {
                if (cart.getItemById(pr.getProduct_id()).getQuality() + Integer.parseInt(key2) <= pr.getQuantity()) {
                    cart.addItem(item);
                } else {
                    error = "error";
                }
            } else {
                if (Integer.parseInt(key2) > pr.getQuantity()) {
                    error = "error";
                } else {
                    cart.addItem(item);
                }
            }
            session.setAttribute("cartguarantee", cart);
        }
        //cart//
        System.out.println("Sản phẩm" + pr);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject jsonDat = new JsonObject();
        if (pr == null || !error.isEmpty()) {
            jsonDat.addProperty("key1", "");
        } else {
            jsonDat.addProperty("key1", pr.getProduct_name());
            jsonDat.addProperty("key2", key2);
            jsonDat.addProperty("key3", Integer.parseInt(key2) * pr.getPrice() * (1 - (pr.getSale() / 100.0)));
        }
        response.getWriter().write(jsonDat.toString());
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
