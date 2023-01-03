package util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import model.Order;
import model.OrderItem;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.concurrent.Phaser;

public class CreatePDFOrder {
    private String filename;
    private String rootFolder;
    private Order order;
    private String orderUrl;
    private String fontUrl;


    public CreatePDFOrder(String filename, Order order) {
        this.filename = filename;
        this.rootFolder = rootFolder;
        this.orderUrl = orderUrl;
        this.fontUrl = fontUrl;
        this.order = order;
    }

    public void createPdf() {
        Document document = new Document();

        try {
            String fileUrl = rootFolder + "/orders/download/" + filename + ".pdf";
            fileUrl = fileUrl.replace("/", "\\\\");
            FileOutputStream FOS = new FileOutputStream(fileUrl.trim());
//            FileOutputStream FOS = new FileOutputStream(this.orderUrl);
            // khởi tạo một PdfWriter truyền vào document và FileOutputStream
            PdfWriter.getInstance(document, FOS);
            // mở file để thực hiện viết
            document.open();
            // thêm nội dung sử dụng add function

            String fontUrl = rootFolder + "/assets/fonts/ARIALUNI.TTF";
            fontUrl = fontUrl.replace("/", "\\\\");
            BaseFont baseFont = BaseFont.createFont(fontUrl.trim(), BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
//            BaseFont baseFont = BaseFont.createFont(this.fontUrl, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            Font font = new Font(baseFont);

            Paragraph title = new Paragraph("Thông tin hóa đơn của bạn", font);
            title.setSpacingBefore(15);
            title.setAlignment(Element.ALIGN_CENTER);
            Paragraph recipient = new Paragraph("Khách hàng: " + order.getRecipient(), font);
            Paragraph phone = new Paragraph("Số điện thoại: " + order.getOrderPhone(), font);
            Paragraph address = new Paragraph("Địa chỉ: " + order.getOrderAddress(), font);
            Paragraph date = new Paragraph("Ngày đặt: " + order.getCreatedDate(), font);
            Paragraph productInfor = new Paragraph("Sản phẩm đã mua:", font);
            productInfor.setAlignment(Element.ALIGN_CENTER);
            productInfor.setSpacingBefore(15);

            document.add(title);
            document.add(recipient);
            document.add(phone);
            document.add(address);
            document.add(date);
            document.add(productInfor);

            PdfPTable t = new PdfPTable(6);
            PdfPCell productNameCell = new PdfPCell(new Phrase("Tên sản phẩm", font));
            t.addCell(productNameCell);
            PdfPCell productThumbnailCell = new PdfPCell(new Phrase("Ảnh sản phẩm", font));
            t.addCell(productThumbnailCell);
            PdfPCell productDetailCell = new PdfPCell(new Phrase("Màu,size,số lượng", font));
            t.addCell(productDetailCell);
            PdfPCell productPriceCell = new PdfPCell(new Phrase("Giá", font));
            t.addCell(productPriceCell);
            PdfPCell productDiscountCell = new PdfPCell(new Phrase("Giảm", font));
            t.addCell(productDiscountCell);
            PdfPCell productTotalCell = new PdfPCell(new Phrase("Tổng", font));
            t.addCell(productTotalCell);

            double totalPrice = 0;
            DecimalFormat formatter = new DecimalFormat("###,###,###");
            for (OrderItem orderItem : order.getItems()) {
                Phrase productName = new Phrase(orderItem.getProduct().getName(), font);
                String imgUrl = rootFolder + orderItem.getProduct().getThumbnail();
                Image image = Image.getInstance(imgUrl);
                image.scaleAbsolute(100, 100);
                Phrase productDetail = new Phrase(orderItem.getColor().getName() + ", " + orderItem.getSize().getCode() + ", " + orderItem.getAmount(), font);
                Phrase price = new Phrase(formatter.format(orderItem.getPrice()) + " VNĐ", font);
                Phrase discount = new Phrase(orderItem.getDiscount() + "%", font);
                double total = (orderItem.getPrice() * orderItem.getAmount()) - (orderItem.getPrice() * orderItem.getAmount() * (orderItem.getDiscount() / 100));
                totalPrice += total;
                Phrase totalPhare = new Phrase(formatter.format(total) + " VNĐ", font);
                t.addCell(productName);
                t.addCell(image);
                t.addCell(productDetail);
                t.addCell(price);
                t.addCell(discount);
                t.addCell(totalPhare);
            }
            t.setSpacingBefore(20);
            document.add(t);

            Paragraph totalOrder = new Paragraph("Tổng giá trị hóa đơn: " + formatter.format(totalPrice) + " VNĐ", font);
            totalOrder.setSpacingBefore(15);
            document.add(totalOrder);

            // đóng file
            document.close();
            FileUtil.copyFile(fileUrl, "E:\\GocHocTap\\intellij\\Antoanbaomathttt\\WebBanQuanAo\\src\\main\\webapp\\orders\\download\\" + filename + ".pdf", false);
//            FileUtil.copyFile(orderUrl, "E:\\GocHocTap\\intellij\\Antoanbaomathttt\\WebBanQuanAo\\src\\main\\webapp\\orders\\download\\order-" + order.getId() + ".pdf", false);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String getRootFolder() {
        return rootFolder;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setRootFolder(String rootFolder) {
        rootFolder = rootFolder.replace("\\", "/");
        rootFolder = rootFolder.substring(0, rootFolder.lastIndexOf("/WebBanQuanAo"));
        this.rootFolder = rootFolder;
    }

    public String getOrderUrl() {
        return orderUrl;
    }

    public void setOrderUrl(String orderUrl) {
        this.orderUrl = orderUrl;
    }

    public String getFontUrl() {
        return fontUrl;
    }

    public void setFontUrl(String fontUrl) {
        this.fontUrl = fontUrl;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
