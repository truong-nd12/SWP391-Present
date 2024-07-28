/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Order;
import Model.Order_Detail;
import Model.Shipment;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import static com.itextpdf.text.PageSize.A6;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import helper.Convert;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/ManagerExportPdf"})
public class ManagerExportPdf extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ord=request.getParameter("orderid");
        OrderDAO order = new OrderDAO();
        ProductDAO pro = new ProductDAO();
        Order or = order.getOrderById(Integer.parseInt(ord));
        Shipment ship = order.getShipById(Integer.parseInt(ord));
        List<Order_Detail> od = order.getOrderDetailByCusId(Integer.parseInt(ord));
        Convert convert = new Convert();
        Document document = new Document();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=Invoice_Order"+ord+".pdf");
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
        } catch (DocumentException ex) {
            Logger.getLogger(ManagerExportPdf.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            BaseFont baseFont = BaseFont.createFont("helper/vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(baseFont, 12);
            document.setPageSize(A6);
            document.open();
            document.add(new Paragraph("Smart Tech Store", new Font(baseFont, 15)));
            document.add(new Paragraph("\n", new Font(baseFont, 8))); // Create a table with 3 columns
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Mã đơn hàng:  " + or.getOrder_id() + "", false, 9));
            table.addCell(createCell("Ngày đặt hàng: " + or.getOrder_date().toString() + "", false, 9));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Thông tin cửa hàng: ", false, 10));
            table.addCell(createCell("Thông tin vận chuyển: ", false, 10));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Smart Tech Store ", false, 8));
            table.addCell(createCell("Tên:" + ship.getName() + "", false, 8));
            table.addCell(createCell("Địa chỉ: DH FPT, Thach That, Ha Noi", false, 8));
            table.addCell(createCell("Địa chỉ: " + ship.getAddress() + " ", false, 8));
            table.addCell(createCell("Số điện thoại: 0866911235", false, 8));
            table.addCell(createCell("Số điện thoại:" + ship.getPhone() + " ", false, 8));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.addCell(createCell("Sản phẩm", false, 9));
            table.addCell(createCell("Giá", false, 9));
            table.addCell(createCell("Số lượng", false, 9));
            document.add(table);
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            document.add(new com.itextpdf.text.Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(3);
            table.setWidthPercentage(100);
            for (Order_Detail orderdetail : od) {
                table.addCell(createCell(pro.getNameById(orderdetail.getProduct_id()).getProduct_name(), false, 8));
                table.addCell(createCell(convert.convertToVietnameseDong(orderdetail.getPrice()), false, 8));
                table.addCell(createCell(orderdetail.getQuantity() + "", false, 8));
            }
            document.add(table);
            document.add(new com.itextpdf.text.Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Tổng tiền: ", false, 9));
            table.addCell(createCell(convert.convertToVietnameseDong(or.getTotalPrice()), false, 9));
            document.add(table);
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(new com.itextpdf.text.Paragraph("\n", new Font(baseFont, 8)));
            document.add(table);
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Ghi chú: ", false, 9));
            table.addCell(createCell(ship.getNote(), false, 9));
            document.add(table);
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(createCell("-Vui lòng quay video khi nhận sản phẩm.", false, 8));
            table.addCell(createCell("-Bạn nhận được sản phẩm, kiểm tra rồi thanh toán cho nhân viên giao hàng.", false, 8));
            document.add(table);
            document.close();
        } catch (DocumentException | FileNotFoundException e) {
            e.printStackTrace();
            System.out.println("hello");
        }

    }

    private static PdfPCell createCell(String content, boolean header, float fontSize) throws DocumentException, IOException {
        BaseFont baseFont = BaseFont.createFont("helper/vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        PdfPCell cell = new PdfPCell(new Phrase(content, new Font(baseFont, fontSize)));
        cell.setBorder(0);
        if (header) {
            cell.setBackgroundColor(new BaseColor(220, 220, 220));
        }

        return cell;
    }

}
