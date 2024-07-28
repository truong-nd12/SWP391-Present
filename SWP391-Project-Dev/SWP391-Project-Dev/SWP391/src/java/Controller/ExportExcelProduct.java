/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BrandDAO;
import DAL.ProductDAO;
import DAL.TypeDAO;
import Model.Brand;
import Model.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ExportExcelProduct", urlPatterns = {"/ExportExcelProduct"})
public class ExportExcelProduct extends HttpServlet {

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
            out.println("<title>Servlet ExportExcelProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcelProduct at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=porductlist.xls");
        List<Model.Product> listP = (List<Model.Product>) request.getAttribute("listP");
        String name = request.getParameter("name");
        int bid = Integer.parseInt(request.getParameter("brand_id"));
        int tid = Integer.parseInt(request.getParameter("type_id"));
        String pricemin = request.getParameter("pricemin");
        String pricemax = request.getParameter("pricemax");
        String listP2 = request.getParameter("listP2");
        ProductDAO dao = new ProductDAO();
        TypeDAO dao1 = new TypeDAO();
        BrandDAO dao2 = new BrandDAO();
        String listT = dao1.getTypeByID(tid);
        String listB = dao2.getBrandByID(bid);
        boolean check = true;

        if (listP2.equals("def")) {
            listP = dao.getProductBySearchToExport(name, bid, tid, pricemin, pricemax);
        }
        if (listP2.equals("abc")) {
            listP = dao.getProductListToExport();
            check = false;
        }
//        if (listP2 != null && listP == null) {
//            listP = dao.getProductListToExport();
//        }
        XSSFWorkbook wordkbook = new XSSFWorkbook();
        XSSFSheet sheet = wordkbook.createSheet("Danh sách sản phẩm");
        XSSFRow row = null;
        Cell cell = null;
        row = sheet.createRow(2);
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("DANH SACH SAN PHAM");

        row = sheet.createRow(3);
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("STT");

        cell = row.createCell(1, CellType.STRING);
        cell.setCellValue("ID");

        cell = row.createCell(2, CellType.STRING);
        cell.setCellValue("TEN");

        cell = row.createCell(3, CellType.STRING);
        cell.setCellValue("GIA");

        cell = row.createCell(4, CellType.STRING);
        cell.setCellValue("SO LUONG");

        cell = row.createCell(5, CellType.STRING);
        cell.setCellValue("GIAM GIA");

        cell = row.createCell(6, CellType.STRING);
        cell.setCellValue("CHI TIET SAN PHAM");

        cell = row.createCell(7, CellType.STRING);
        cell.setCellValue("THOI GIAN BAO HANH");

        cell = row.createCell(8, CellType.STRING);
        cell.setCellValue("THUONG ");

        cell = row.createCell(9, CellType.STRING);
        cell.setCellValue("LOAI");

        cell = row.createCell(10, CellType.STRING);
        cell.setCellValue("NGAY TAO ");

        cell = row.createCell(11, CellType.STRING);
        cell.setCellValue("TAO TAI KHOAN");

        cell = row.createCell(12, CellType.STRING);
        cell.setCellValue("TRANG THAI");

        for (int i = 0; i < listP.size(); i++) {
            row = sheet.createRow(4 + i);

            cell = row.createCell(0, CellType.NUMERIC);
            cell.setCellValue(i + 1);

            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue(listP.get(i).getProduct_id());

            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue(listP.get(i).getProduct_name());

            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue(listP.get(i).getPrice());

            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue(listP.get(i).getQuantity());

            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue(listP.get(i).getSale());

            cell = row.createCell(6, CellType.STRING);
            cell.setCellValue(listP.get(i).getDescription());

            cell = row.createCell(7, CellType.STRING);
            cell.setCellValue(listP.get(i).getGuarantee_time());

            cell = row.createCell(8, CellType.STRING);
            cell.setCellValue(dao2.getBrandByID(listP.get(i).getBrand()));

            cell = row.createCell(9, CellType.STRING);
            cell.setCellValue(dao1.getTypeByID(listP.get(i).getType()));

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); // Định dạng ngày tháng
            String createdDateStr = dateFormat.format(listP.get(i).getCreatedDate());
            cell = row.createCell(10, CellType.STRING);
            cell.setCellValue(createdDateStr);

            cell = row.createCell(11, CellType.STRING);
            cell.setCellValue(listP.get(i).getCreatedAccount());

            cell = row.createCell(12, CellType.STRING);
            cell.setCellValue(listP.get(i).isStatus());
        }
        wordkbook.write(response.getOutputStream());
        wordkbook.close();
        if (check == true) {
            request.setAttribute("type_id", tid);
            request.setAttribute("brand_id", bid);
            request.setAttribute("name", name);
            request.setAttribute("pricemin", pricemin);
            request.setAttribute("pricemax", pricemax);
            request.setAttribute("listT", listT);
            request.setAttribute("listB", listB);
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
        processRequest(request, response);
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
