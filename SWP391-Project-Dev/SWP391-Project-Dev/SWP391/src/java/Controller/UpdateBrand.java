/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BrandDAO;
import Model.Brand;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 *
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateBrand extends HttpServlet {

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
            out.println("<title>Servlet UpdateBrand</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBrand at " + request.getContextPath() + "</h1>");
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
        BrandDAO brandDAO = new BrandDAO();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("brand", brandDAO.getBrandById(id));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("UpdateBrandPage.jsp").forward(request, response);
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
        BrandDAO brandDAO = new BrandDAO();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String des = request.getParameter("description");
        String fileName = "";
        Part filePart = request.getPart("photo");
        fileName = (String) filePart.getSubmittedFileName();
        if (filePart.getSize() != 0) {
            if (isImage(fileName)) {
                Path path = Paths.get(fileName);
                String applicationPath = request.getServletContext().getRealPath("/brand_image");
                String[] result = applicationPath.split("build");
                String s = "";
                for (String re : result) {
                    s += re;
                }
                if (!request.getParameter("id").isEmpty()) {
                    filePart.write(s + "/" + path.getFileName());
                    brandDAO.UpdateBrandWithImage(Integer.parseInt(id), name, des, fileName);
                    // UpdateBrand servlet
                    request.setAttribute("succ", "Cập nhật thành công !!!");
                } else {
                    if (!name.trim().isEmpty()) {
                        Brand brand = brandDAO.getBrandByName(name);
                        if (brand == null) {
                            filePart.write(s + "/" + path.getFileName());
                            brand = new Brand(name, des, fileName);
                            brandDAO.AddBrand(brand);
                            request.setAttribute("succ", "Thêm thành công !!!");
                        } else {

                            request.setAttribute("err1", "Không thể thêm tên trùng lặp thương hiệu!");
                        }

                    }
                }
            } else {
                request.setAttribute("err", "Tập tin này không hợp lệ. Vui lòng tải lên tập tin hình ảnh");
            }
        } else {
            int bid = Integer.parseInt(id);
            brandDAO.UpdateBrand(bid, name, des);
            request.setAttribute("succ", "Cập nhật thành công !!!");
        }
        doGet(request, response);
    }

    private boolean isImage(String fileName) {
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
