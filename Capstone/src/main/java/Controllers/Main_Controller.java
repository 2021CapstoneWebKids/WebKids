package Controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import DataBase.JDBC_Repository_Main;

@Controller
public class Main_Controller {

	@Autowired
	private JDBC_Repository_Main jdbc;
	
	@RequestMapping(value = {"/index" , "/Main"})
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("Main.jsp");
		return mav;
	}
	
	@RequestMapping(value = "Create_QRcode.do")
	public void createQRCodeImage()throws WriterException, IOException {
		try {
			
			QRCodeWriter writer = new QRCodeWriter();
	        String param = "QR코드 테스트";
	        param = new String(param.getBytes("UTF-8"), "ISO-8859-1");
	        BitMatrix matrix = writer.encode(param, BarcodeFormat.QR_CODE, 500, 500);

	        int qrColor = 0xff020202;
	        int backgroundColor = 0xFFFFFFFF;

	        MatrixToImageConfig config = new MatrixToImageConfig(qrColor, backgroundColor);
	        
	        BufferedImage image = new BufferedImage(10, 10, BufferedImage.TYPE_BYTE_BINARY);
	        BufferedImage qrimage = MatrixToImageWriter.toBufferedImage(matrix, config);
	        
	        
			ImageIO.write(qrimage, "jpg", new File("C:\\Users\\user\\Desktop\\2021캡스톤\\QRCODE.jpg"));
			System.out.println("QR코드생성완료\n");
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
	}
}
