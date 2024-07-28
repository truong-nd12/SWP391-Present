/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_News;

import DAL.NewDAO;
import Model.Admin;
import Model.News;
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

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddNews", urlPatterns = {"/AddNews"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddNews extends HttpServlet {

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
            out.println("<title>Servlet AddNews</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNews at " + request.getContextPath() + "</h1>");
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
        NewDAO newsDAO = new NewDAO();
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("news", newsDAO.getById(id));
        }
        request.getRequestDispatcher("AddNewsPage.jsp").forward(request, response);
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
        NewDAO newsDAO = new NewDAO();
        HttpSession session = request.getSession();
        Admin acc = (Admin) session.getAttribute("acc");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String sid = request.getParameter("id");
        int tid = Integer.parseInt(request.getParameter("news_type"));
        int bid = Integer.parseInt(request.getParameter("brand"));
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
                newsDAO.addImage(fileName);
                if (!sid.isEmpty()) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    newsDAO.UpdateNews(title, content, bid, tid, acc.getAccount_id(), id);
                    request.setAttribute("news", newsDAO.getById(Integer.parseInt(request.getParameter("id"))));
                    request.setAttribute("suc", "Câpj nhật thành công !!!");
                } else {
                    newsDAO.addNews(title, content, bid, tid, acc.getAccount_id());
                    request.setAttribute("suc", "Thêm thành công !!!");
                }
                request.getRequestDispatcher("AddNewsPage.jsp").forward(request, response);
            } else {
                if (!sid.isEmpty()) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("news", newsDAO.getById(id));
                } else {
                    News news = new News();
                    news.setTitle(title);
                    news.setBrand(bid);
                    news.setNews_type(tid);
                    news.setContent(content);
                    request.setAttribute("news", news);
                }
                request.setAttribute("err", "Tập tin này không hợp lệ. Vui lòng tải lên tập tin hình ảnh");
                request.getRequestDispatcher("AddNewsPage.jsp").forward(request, response);
            }
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            newsDAO.UpdateNewsWithoutImg(title, content, bid, tid, acc.getAccount_id(), id);
            request.setAttribute("suc", "Cập nhật thành công !!!11111");
            request.setAttribute("news", newsDAO.getById(id));
            request.getRequestDispatcher("AddNewsPage.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        // Check if the extension is one of the supported image formats
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
