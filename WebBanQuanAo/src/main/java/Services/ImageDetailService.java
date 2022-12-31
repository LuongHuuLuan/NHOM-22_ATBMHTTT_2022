package Services;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

import dao.ImageDao;

public class ImageDetailService {
//	public static String updateImageDetail(String codeProduct, String codeColor, Part part, String oldPath, String readPath) throws IOException {
//		String imgPath = UploadService.uploadFile(part, readPath);
//		String message = ImageDao.updateImageDetailProduct(codeProduct, codeColor, imgPath, oldPath);
//		StringBuffer preparePath = new StringBuffer(readPath);
//		preparePath.deleteCharAt(preparePath.length() - 1);
//		if(message.equals("Cập nhật thành công")) {
//			File thumnail = new File(preparePath.toString() + oldPath);
//			thumnail.delete();
//		}
//		return message;
//	}
}
