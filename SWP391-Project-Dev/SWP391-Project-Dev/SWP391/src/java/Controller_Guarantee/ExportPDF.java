/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Guarantee;

import Controller.ManagerExportPdf;
import DAL.GuaranteeDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import Model.Customer;
import Model.Order;
import Model.Order_Detail;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import static com.itextpdf.text.PageSize.A5;
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
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ExportPDF")
public class ExportPDF extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String guaranteeId = request.getParameter("guaranteeId");
        Document document = new Document();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=Warranty " + guaranteeId + ".pdf");
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
        } catch (DocumentException ex) {
            Logger.getLogger(ManagerExportPdf.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            BaseFont baseFont = BaseFont.createFont("helper/vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(baseFont, 12);
            ProductDAO prDao = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();
            GuaranteeDAO guaranteeDAO = new GuaranteeDAO();
            Model.Guarantee guarantee_record = guaranteeDAO.getGuaranteeByIdInDetailGuarantee(Integer.parseInt(guaranteeId));
            Product product = prDao.getNameById(guarantee_record.getProduct());
            Customer customer = guaranteeDAO.getCustomerByOrderID(guarantee_record.getOrder_id());
            Order order = orderDAO.getOrderById(guarantee_record.getOrder_id());
            document.setPageSize(A6);
            document.open();
            document.add(new Paragraph("Tên cửa hàng: Smart Tech Store", new Font(baseFont, 12)));
            document.add(new Paragraph("\n", new Font(baseFont, 8))); // Create a table with 3 columns
            PdfPTable table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(createCell("Giấy chứng nhận bảo hành", false, 15));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Thông tin khách hàng", false, 10));
            table.addCell(createCell("Thời hạn bảo hành", false, 10));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.addCell(createCell("Tạo " + guaranteeDAO.getCreatorNameById(guarantee_record.getCreator_id()), false, 8));
            SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
            table.addCell(createCell("Ngày bắt đầu: " + date.format(order.getOrder_date()), false, 8));
            table.addCell(createCell("Tên khách hàng: " + customer.getCus_name(), false, 8));
            table.addCell(createCell("Ghi chú: " + guarantee_record.getNote(), false, 8));
            table.addCell(createCell("Số điện thoại: " + customer.getPhone(), false, 8));

            table.addCell(createCell("Ngày trả lại" + date.format(guarantee_record.getReturn_date()), false, 8));
            document.add(table);
            document.add(new Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.addCell(createCell("Sản phẩm", false, 8));
            table.addCell(createCell("Thời hạn bảo hành", false, 8));
            table.addCell(createCell("Loại bảo hành", false, 8));
            document.add(table);
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            document.add(new com.itextpdf.text.Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.addCell(createCell("" + product.getProduct_name(), false, 8));
            table.addCell(createCell("" + product.getGuarantee_time(), false, 8));
            table.addCell(createCell("" + guarantee_record.getType(), false, 8));
            document.add(table);
            document.add(new com.itextpdf.text.Paragraph("\n", new Font(baseFont, 8)));
            table = new PdfPTable(1);
            table.setWidthPercentage(100);
            table.addCell(new PdfPCell());
            document.add(table);
            table = new PdfPTable(2);
            table.setWidthPercentage(100);
        // Add "Customer Sign" cell
            table.addCell(createCell("Ký tên khách hàng", false, 9));
        // Create a cell for "Shop Sign" and set its alignment to right
            PdfPCell shopSignCell = createCell("Ký tên cửa hàng", false, 9);
            shopSignCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(shopSignCell);

            document.add(table);
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu có
            response.getWriter().write("Đã xảy ra lỗi trong quá trình tạo PDF: " + e.getMessage());
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
