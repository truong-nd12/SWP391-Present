/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CustomerDAO;
import Model.Customer;
import helper.EmailConfig;
import helper.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import helper.MD5;

/**
 *
 * @author Dell
 */
public class OTPServlet extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        String forgotPassEmail = (String) session.getAttribute("forgotPassEmail");
        String otp = RandomString.generateRandomString();
        try {
            EmailConfig ec = new EmailConfig();
            ec.SendEmail(forgotPassEmail, "Mã OTP của bạn: " + otp);
            session.setAttribute("otp", otp);
        } catch (MessagingException ex) {
        }
        request.setAttribute("forgotPassEmail", forgotPassEmail);
        request.getRequestDispatcher("OTPPage.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        String otp = (String) session.getAttribute("otp");
        String forgotPassEmail = (String) session.getAttribute("forgotPassEmail");
        String[] otpParts = request.getParameterValues("otp");
        String inputotp = "";
        int cusId = (int) session.getAttribute("cus_id");
        CustomerDAO cus = new CustomerDAO();
        String pass = request.getParameter("pass");
        if (pass == null) {
            for (String i : otpParts) {
                inputotp += i;
            }
            if (inputotp.trim().equals(otp)) {
                request.setAttribute("correct", otp);
                request.getRequestDispatcher("OTPPage.jsp").forward(request, response);
            } else {
                request.setAttribute("err", "OTP không chính xác hoặc đã cũ");
                request.getRequestDispatcher("OTPPage.jsp").forward(request, response);
            }
        } else {
            cus.UpdateCusPass(MD5.getMd5(pass), cusId);
            request.setAttribute("correct", "correct");
            request.setAttribute("success", "Thay đổi mật khẩu thành công !!!");
            request.getRequestDispatcher("OTPPage.jsp").forward(request, response);
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
