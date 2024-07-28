/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BrandDAO;
import DAL.ProductDAO;
import DAL.TypeDAO;
import Model.Admin;
import Model.Brand;
import Model.Product;
import Model.Type;
import helper.UploadFile;
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
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addproduct", urlPatterns = {"/addproduct"})
@MultipartConfig
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        try {
            Admin adminacc = (Admin) session.getAttribute("acc");
            if (adminacc != null) {

                BrandDAO dao1 = new BrandDAO();
                TypeDAO dao2 = new TypeDAO();
                List<Brand> listB = dao1.getAll();
                List<Type> listT = dao2.getAll();
                request.setAttribute("listB", listB);
                request.setAttribute("listT", listT);

            } else {
                request.getRequestDispatcher("login_1.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("AddProductPage.jsp").forward(request, response);
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
        Admin adminacc = (Admin) session.getAttribute("acc");
        ProductDAO productDAO = new ProductDAO();
        BrandDAO dao1 = new BrandDAO();
        TypeDAO dao2 = new TypeDAO();
        try {

            List<Brand> listB = dao1.getAll();
            List<Type> listT = dao2.getAll();
            request.setAttribute("listB", listB);
            request.setAttribute("listT", listT);
            if (adminacc != null) {
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price").replace(".", ""));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String description = request.getParameter("description");
                int sale = Integer.parseInt(request.getParameter("sale").trim());
                int guarantee = Integer.parseInt(request.getParameter("guarantee"));
                int typeId = Integer.parseInt(request.getParameter("type"));
                int brandId = Integer.parseInt(request.getParameter("brand"));
                if (productDAO.getProductByName(name) != null) {
                    request.setAttribute("ERROR", "Tên sản phẩm trùng lặp");
                    request.getRequestDispatcher("AddProductPage.jsp").forward(request, response);
                } else {
                    //add product
                    Product addProduct = productDAO.addNewProduct(adminacc.getAccount_id(), name, price, quantity, sale, description, guarantee, brandId, typeId);
                    productDAO.addServiceTag(addProduct.getQuantity(),addProduct.getProduct_id());
                    String fileName = "";
                    List<Part> fileParts = new ArrayList<>();
                    Collection<Part> parts = request.getParts();
                    try {
                        for (Part part : parts) {
                            if (part.getName().equals("photo")) {
                                fileParts.add(part);
                            }
                        }
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
                                productDAO.addImages(fileName, addProduct.getProduct_id());
                                productDAO.addProductImg(addProduct.getProduct_id());
                                response.sendRedirect("managementproduct");

                            } else {
                                request.setAttribute("ERROR", "Tệp không hợp lệ!");
                                request.getRequestDispatcher("AddProductPage.jsp").forward(request, response);
                            }
                        }
                    } catch (Exception ex) {
                        System.out.println("addimg: " + ex.getMessage());
                    }
                }
            } else {
                request.getRequestDispatcher("login_1.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("g:" + ex.getMessage());
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
