/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AdminDAO;
import DAL.CustomerDAO;
import Model.Admin;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AccountProfile", urlPatterns = {"/AccountProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AccountProfile extends HttpServlet {

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
            out.println("<title>Servlet AccountProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountProfile at " + request.getContextPath() + "</h1>");
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
        int acc_id = Integer.parseInt(request.getParameter("id"));
        AdminDAO ad = new AdminDAO();
        CustomerDAO cus = new CustomerDAO();
        if (request.getParameter("role") != null) {
            Admin admin = ad.getAccByName(ad.getAccNameById(acc_id));
            request.setAttribute("admin", admin);
        } else {
            Customer customer = cus.getCusId(acc_id);
            request.setAttribute("account", customer);
        }
        request.getRequestDispatcher("AccountProfile.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Admin admin = new Admin();
        AdminDAO ad = new AdminDAO();
        String fileName = "";
        Part filePart = request.getPart("photo");
        fileName = (String) filePart.getSubmittedFileName();
        if (filePart.getSize() != 0) {
            if (isImage(fileName)) {
                Path path = Paths.get(fileName);
                String applicationPath = request.getServletContext().getRealPath("/images");
                String[] result = applicationPath.split("build");
                String s = "";
                for (String re : result) {
                    s += re;
                }
                filePart.write(s + "/" + path.getFileName());
                ad.UpdateAccImg(name, email, phone, fileName, id);
                request.setAttribute("admin", ad.getAccByName(ad.getAccNameById(id)));
                request.getRequestDispatcher("AccountProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("admin", ad.getAccByName(ad.getAccNameById(id)));
                request.setAttribute("err", "Tập tin này không hợp lệ. Vui lòng tải lên tập tin hình ảnh");
                request.getRequestDispatcher("AccountProfile.jsp").forward(request, response);
            }
        } else {
            ad.UpdateAccWithoutImg(name, email, phone, id);
            request.setAttribute("admin", ad.getAccByName(ad.getAccNameById(id)));
            request.getRequestDispatcher("AccountProfile.jsp").forward(request, response);
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
