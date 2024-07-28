/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 *
 */
@WebServlet(name = "UpdateProductImg", urlPatterns = {"/UpdateProductImg"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateProductImg extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductImg</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductImg at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById1(id);
        request.setAttribute("id", id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("UpdateProductImg.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById1(id);
        String fileName = "";
        List<Part> fileParts = new ArrayList<>();
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getName().equals("photo")) {
                fileParts.add(part);
            }
        }
        try {
//            if (product.getImg_list().size() > 1) {
//                dao.DelProductImg(id);
//            }
            dao.DelProductImg(id);
            for (Part filePart : fileParts) {
                fileName = filePart.getSubmittedFileName();

                if (isImage(fileName)) {
                    Path path = Paths.get(fileName);
                    String applicationPath = request.getServletContext().getRealPath("/product_image");
                    String[] result = applicationPath.split("build");
                    String s = "";
                    for (String re : result) {
                        s += re;
                    }
                    filePart.write(s + "/" + path.getFileName());
                    dao.addImages(fileName, id);
                    dao.addProductImg(id);

                } else {
                    request.setAttribute("id", id);
                    request.setAttribute("product", product);
                    request.setAttribute("err", "This file is invalid. Please Upload Images");
                    request.getRequestDispatcher("UpdateProductImg.jsp").forward(request, response);
                    return; // Thêm return để ngăn chặn tiếp tục xử lý nếu có lỗi
                }
            }
            response.sendRedirect("managementproduct");
        } catch (Exception ex) {
            System.out.println("updateimg: " + ex.getMessage());
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

    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        // Check if the extension is one of the supported image formats
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp");
    }
}
