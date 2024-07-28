/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AdminDAO;
import DAL.CustomerDAO;
import helper.EmailConfig;
import helper.MD5;
import helper.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.mail.MessagingException;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddAccount", urlPatterns = {"/AddAccount"})
public class AddAccount extends HttpServlet {

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
            out.println("<title>Servlet AddAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccount at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("AddAccount.jsp").forward(request, response);
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
        String account = request.getParameter("account");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = RandomString.generateRandomString();
        String phone = request.getParameter("phone");
        String address = request.getParameter("address") == null ? "" : request.getParameter("address");
        CustomerDAO cus = new CustomerDAO();
        AdminDAO admin = new AdminDAO();
        if (cus.getCusName(name) != null || admin.getAccByName(name) != null) {
            request.setAttribute("err", "Tên này đã được sử dụng !!!");
        } else if (cus.getCusEmail(email) != null || admin.getAccByEmail(email) != null) {
            request.setAttribute("err", "Email này đã được sử dụng !!!");
        } else {
            if (account.equals("customer")) {
                request.setAttribute("success", "Đã thêm thành công !!!");
                cus.addCustomer(name, email, phone, MD5.getMd5(pass), address);
            } else {
                request.setAttribute("success", "Đã thêm thành công !!!");
                admin.addAdd(name, MD5.getMd5(pass), email, phone);
            }
            try {
                EmailConfig ec = new EmailConfig();
                ec.SendEmail(email, "Mật khẩu tài khoản của bạn " + pass + ". Vui lòng đổi mật khẩu sau khi đăng nhập vào website");
            } catch (MessagingException ex) {
                System.out.println(ex);
            }

        }
        request.getRequestDispatcher("AddAccount.jsp").forward(request, response);
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
