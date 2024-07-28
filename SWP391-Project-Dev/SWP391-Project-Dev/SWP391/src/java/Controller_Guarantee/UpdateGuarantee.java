/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import DAL.GuaranteeDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Cart;
import Model.Customer;
import Model.Item;
import Model.Order;
import Model.Product;
import Model.Shipment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 *
 */
@WebServlet(name = "UpdateGuarantee", urlPatterns = {"/update-guarantee"})
public class UpdateGuarantee extends HttpServlet {

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
        GuaranteeDAO guaranteeDAO = new GuaranteeDAO();
        String recordId = request.getParameter("guaranteeId");
        String status = request.getParameter("status");
        String returnDate = request.getParameter("dateReturn");

        //Xử lý update creatorID
        String creatorId = request.getParameter("creatorId");
        if (creatorId != null) {
            guaranteeDAO.updateCreatorByRecordId(Integer.parseInt(creatorId), Integer.parseInt(recordId));
        }
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO prDao = new ProductDAO();
        Model.Guarantee guarantee_record = guaranteeDAO.getGuaranteeByIdInDetailGuarantee(Integer.parseInt(recordId));
        Customer customer = guaranteeDAO.getCustomerByOrderID(guarantee_record.getOrder_id());
        String type = request.getParameter("type");
        if (type != null) {
            guaranteeDAO.updateTypeByRecordId(type, Integer.parseInt(recordId));
            if (!type.equals("Lỗi do nhà sản xuất")) {
                Cart cart = (Cart) session.getAttribute("cartguarantee");
                Shipment ship = new Shipment(0, 0, "ĐH FPT, Xã Tân Xã, Huyện Thạch Thất, Thành phố Hà Nội", null, null, "0866911235", "Smart Tech Store", "");
                if (cart != null) {
                    orderDAO.addOrderCartGuarantee(customer, cart, ship);
                    for (Item item : cart.getItems()) {
                        orderDAO.updateRemoveProduct(item.getQuality(), item.getProduct().getProduct_id());
                    }
                    cart = new Cart();
                    session.setAttribute("cartguarantee", cart);
                }
            }
        }
        LocalDate currentDate = LocalDate.now();
        Product product = prDao.getNameById(guarantee_record.getProduct());
        if (Integer.parseInt(status) == 4) {
            guaranteeDAO.updateManagerGuaranteeStatus(Integer.parseInt(recordId), Integer.parseInt(status), currentDate+"");
        } else {
            guaranteeDAO.updateManagerGuaranteeStatus(Integer.parseInt(recordId), Integer.parseInt(status), returnDate);
        }
        request.setAttribute("creatorId", creatorId);
        guarantee_record = guaranteeDAO.getGuaranteeByIdInDetailGuarantee(Integer.parseInt(recordId));
        Order order = orderDAO.getOrderById(guarantee_record.getOrder_id());
        int monthLeft = getMonthLeft(order, product);
        if (monthLeft < 0) {
            String outOfDate = "Hết hạn";
            request.setAttribute("remain", outOfDate);
        } else {
            request.setAttribute("remain", monthLeft);
        }
        request.setAttribute("order", order);
        request.setAttribute("product", product);
        request.setAttribute("customer", customer);
        request.setAttribute("guarantee_record", guarantee_record);
        request.setAttribute("guaranteeDAO", guaranteeDAO);
        request.getRequestDispatcher("GuaranteeDetailAdmin.jsp").forward(request, response);

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
