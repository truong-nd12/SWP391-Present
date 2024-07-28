/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.OrderDAO;
import com.google.gson.Gson;
import Model.Admin;
import Model.Brand;
import Model.Order;
import Model.Pagination.Pagination;
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
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerPage", urlPatterns = {"/ManagerPage"})
public class ManagerPage extends HttpServlet {

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
        doGet(request, response);
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
        String url = "login_1.jsp";
        String[] orderPrice = {"Dưới 5.000.000 đ", "5.000.000đ - 10.000.000đ", "10.000.000đ - 20.000.000đ", "20.000.000đ trở lên"};
        String[] orderStatus = {"Để xác nhận", "Gửi hàng", "Nhận", "Đã hoàn thành", "Đã hủy", "Trả lại"};
        HttpSession session = request.getSession();
        session.setAttribute("orderPrice", orderPrice);
        session.setAttribute("orderStatus", orderStatus);
        Admin account = (Admin) session.getAttribute("acc");
        OrderDAO orderDAO = new OrderDAO();
        if (account != null) {
            String cusname = request.getParameter("cusname") == null ? "" : request.getParameter("cusname");
            String date = request.getParameter("date") == null ? "" : request.getParameter("date");
            String price = request.getParameter("price") == null ? "" : request.getParameter("price");
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            if (request.getParameter("action") != null) {
                request.setAttribute("order", orderDAO.getAllOrder());
            } else {
                Pagination pagination = new Pagination(request.getParameter("page") == null || request.getParameter("sub") != null ? 1 : Integer.parseInt(request.getParameter("page")),
                        orderDAO.getTotalOrder(cusname, date, price, status), 0, 15);
                request.setAttribute("order", orderDAO.getAllOrderPaging(pagination, cusname, date, price, status));
                request.setAttribute("paging", pagination);
            }
            url = "ManagerOrder.jsp";
            String sday = "" ;
            String snumber = "" ;
            for (int i = 0; i < orderDAO.getAllOrder().size(); i++) {
                if (orderDAO.getAllOrder().get(i).getStatus() != 4) {
                    sday += orderDAO.getAllOrder().get(i).getOrder_date()+",";
                    snumber +=orderDAO.getAllOrder().get(i).getTotalPrice()+",";
                }
            }
            request.setAttribute("sday", sday);
            request.setAttribute("snumber", snumber);
        }
        request.setAttribute("ordertotal", orderDAO.getAllOrder());
        request.getRequestDispatcher(url).forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
