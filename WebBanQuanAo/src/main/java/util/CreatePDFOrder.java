package util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import model.Order;
import model.OrderItem;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class CreatePDFOrder {
    private String rootFolder;
    private String filename;
    private Order order;

    public CreatePDFOrder() {

    }

    public CreatePDFOrder(String filename, Order order) {
        this.filename = filename;
        this.order = order;
    }

    public void createPdf() {
        Document document = new Document();

        try {
            String fileUrl = rootFolder + "/orders/download/" + filename + ".pdf";
            fileUrl = fileUrl.replace("/", "\\\\");
            FileOutputStream FOS = new FileOutputStream(fileUrl.trim());
            // khởi tạo một PdfWriter truyền vào document và FileOutputStream
            PdfWriter.getInstance(document, FOS);
            // mở file để thực hiện viết
            document.open();
            // thêm nội dung sử dụng add function

            String fontUrl = rootFolder + "/assets/fonts/ARIALUNI.TTF";
            fontUrl = fontUrl.replace("/", "\\\\");
            BaseFont baseFont = BaseFont.createFont(fontUrl.trim(), BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
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
            for (OrderItem orderItem : order.getItems()) {
                Paragraph productName = new Paragraph(orderItem.getProduct().getName(), font);
                String imgUrl = rootFolder + orderItem.getProduct().getThumbnail();
                Image image = Image.getInstance(imgUrl);
                image.scaleAbsolute(100, 100);
                productName.setSpacingBefore(15);
                document.add(image);
            }
            // đóng file
            document.close();
            FileUtil.copyFile(fileUrl, "E:\\GocHocTap\\intellij\\Antoanbaomathttt\\WebBanQuanAo\\src\\main\\webapp\\orders\\download\\" + filename + ".pdf", false);

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

    public void setRootFolder(String rootFolder) {
        rootFolder = rootFolder.replace("\\", "/");
        rootFolder = rootFolder.substring(0, rootFolder.lastIndexOf("/WebBanQuanAo"));
        this.rootFolder = rootFolder;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
