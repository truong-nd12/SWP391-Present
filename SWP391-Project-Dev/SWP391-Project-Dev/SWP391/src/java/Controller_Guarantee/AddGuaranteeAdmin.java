/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import DAL.GuaranteeDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import Model.Guarantee;
import Model.Order;
import Model.Product;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author XUAN PHUC
 */
@WebServlet(name = "AddGuaranteeAdmin", urlPatterns = {"/AddGuaranteeAdmin"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddGuaranteeAdmin extends HttpServlet {

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
            out.println("<title>Servlet AddGuaranteeAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddGuaranteeAdmin at " + request.getContextPath() + "</h1>");
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
        Admin ad = (Admin) session.getAttribute("acc");
        if (ad == null) {
            response.sendRedirect("LoginPage");
        } else {
            request.getRequestDispatcher("AddGuarantee.jsp").forward(request, response);
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
        String serviceTag = request.getParameter("serviceTag");
        String note = request.getParameter("note");
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //add image
        String fileName = "";
        Part filePart = request.getPart("photo");
        fileName = (String) filePart.getSubmittedFileName();
        if (isImage(fileName)) {
            Path path = Paths.get(fileName);
            String applicationPath = request.getServletContext().getRealPath("/guarantee_image");
            String[] result = applicationPath.split("build");
            String s = "";
            for (String re : result) {
                s += re;
            }
            filePart.write(s + "/" + path.getFileName());
            try {
                GuaranteeDAO guaranteeDAO = new GuaranteeDAO();
                int orderID = guaranteeDAO.getOrderIdByServiceTagId(serviceTag);
                if (guaranteeDAO.CheckStatusInGuaranteeToAddGuarantee(serviceTag)) {
                    request.setAttribute("ERROR", "Sản phẩm này đang trong thời gian bảo hành");
                    request.getRequestDispatcher("AddGuarantee.jsp").forward(request, response);
                } else {
                    if (orderID == 0) {
                        request.setAttribute("ERROR", "Sản phẩm này không theo thứ tự");
                        request.getRequestDispatcher("AddGuarantee.jsp").forward(request, response);
                    }
                    Date today = new Date();
                    Order order = orderDAO.getOrderById(orderID);
                    int productID = productDAO.getProductIDByServiceTag(serviceTag);
                    Product product = productDAO.getNameById(productID);

                    //get guarantee months left
                    //Tính thời gian đã trôi qua kể từ khi đặt hàng đến ngày hiện tại.
                    long passed = today.getTime() - order.getOrder_date().getTime();
                    //Chuyển đổi thời gian đã trôi qua sang đơn vị tháng
                    int passedMonth = (int) (passed / 2629800000l);
                    //Tính số tháng còn lại trong thời gian bảo hành của sản phẩm.
                    int monthLeft = product.getGuarantee_time() - passedMonth;
                    if (monthLeft < 0) {
                        request.setAttribute("ERROR", "Sản phẩm không còn được đảm bảo");
                        request.getRequestDispatcher("AddGuarantee.jsp").forward(request, response);
                    } else {
                        guaranteeDAO.addNewGuarantee(productID, orderID, fileName, note, serviceTag);
                        response.sendRedirect("ManagernentGuarantee");
                    }

                }

            } catch (Exception ex) {
                Logger.getLogger(AddGuaranteeAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.setAttribute("ERROR", "Vui lòng tải lên tệp hình ảnh");
            request.getRequestDispatcher("AddGuarantee.jsp").forward(request, response);
        }

    }

    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        // Check if the extension is one of the supported image formats
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp");
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
