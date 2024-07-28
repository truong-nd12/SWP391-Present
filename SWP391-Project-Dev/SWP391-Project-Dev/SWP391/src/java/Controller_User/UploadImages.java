/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_User;

import DAL.CustomerDAO;
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
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Dell
 */
@WebServlet(name = "UploadImages", urlPatterns = {"/UploadImages"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UploadImages extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadImages</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadImages at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("ProfileDetailPage.jsp").forward(request, response);
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
        Customer cus = new Customer();
        CustomerDAO cusdao = new CustomerDAO();
        cus = (Customer) session.getAttribute("acc");
        String fileName = "";
        Part filePart = request.getPart("photo");
        fileName = (String) filePart.getSubmittedFileName();
        if (isImage(fileName)) {
            Path path = Paths.get(fileName);
            String applicationPath = request.getServletContext().getRealPath("/images");
            String[] result = applicationPath.split("build");
            String s = "";
            for (String re : result) {
                s += re;
            }
            filePart.write(s + "/" + path.getFileName());
            cusdao.UpdateCusAvatar(fileName, cus.getCustomer_id());
            session.setAttribute("acc", cusdao.getCusId(cus.getCustomer_id()));
            request.getRequestDispatcher("ProfileDetailPage.jsp").forward(request, response);
        } else {
            request.setAttribute("err", "Tập tin này không hợp lệ. Vui lòng tải lên hình ảnh");
            request.getRequestDispatcher("ProfileDetailPage.jsp").forward(request, response);
        }

    }

    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length()-4, fileName.length());
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
