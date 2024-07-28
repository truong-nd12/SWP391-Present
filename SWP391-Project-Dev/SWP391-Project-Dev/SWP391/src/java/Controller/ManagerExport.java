/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.OrderDAO;
import Model.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Dell
 */
@WebServlet(name="ManagerExport", urlPatterns={"/ManagerExport"})
public class ManagerExport extends HttpServlet {
   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String month=request.getParameter("month");
        String year=request.getParameter("year");
        OrderDAO order = new OrderDAO();
        List<Order> or = order.getAllOrderByYearandMonth(Integer.parseInt(year), Integer.parseInt(month));
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Sheet1");
        int rowNum = 1;
        int colNum = 1;
        double price = 0;
        Row row = sheet.createRow(rowNum++);
        Cell cell = row.createCell(colNum++);
        cell.setCellValue((String) "Tất cả đơn hàng đã hoàn thành:" + month + "-" + year);
        rowNum += 1;
        row = sheet.createRow(rowNum++);
        colNum = 1;
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "ID Đơn hàng: ");
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "ID Khách hàng: ");
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "Ngày đặt hàng: ");
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "Tổng: ");
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "Phương thức thanh toán: ");
        for (Order ord : or) {
            row = sheet.createRow(rowNum++);
            colNum = 1;
            cell = row.createCell(colNum++);
            cell.setCellValue((Integer) ord.getOrder_id());
            cell = row.createCell(colNum++);
            cell.setCellValue((Integer) ord.getCus_id());
            cell = row.createCell(colNum++);
            cell.setCellValue((String) ord.getOrder_date().toString());
            cell = row.createCell(colNum++);
            cell.setCellValue((Double) ord.getTotalPrice());
            price += ord.getTotalPrice();
            cell = row.createCell(colNum++);
            cell.setCellValue((String) ord.getPayment_method());
        }
        rowNum += 1;
        row = sheet.createRow(rowNum++);
        colNum = 1;
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "Tổng");
        cell = row.createCell(colNum++);
        cell.setCellValue((Integer) or.size());
        row = sheet.createRow(rowNum++);
        colNum = 1;
        cell = row.createCell(colNum++);
        cell.setCellValue((String) "Tổng");
        cell = row.createCell(colNum++);
        cell.setCellValue((Double) price);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=AllCompletedOrder"+month+"-"+year+".xlsx");
        workbook.write(response.getOutputStream());
        workbook.close();
    } 

    @Override
    public String getServletInfo() {
        return "Mô tả";
    }// </editor-fold>

}
