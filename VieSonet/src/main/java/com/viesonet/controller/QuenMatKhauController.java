package com.viesonet.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.ParamService;

import jakarta.mail.internet.MimeMessage;

@Controller
public class QuenMatKhauController {
	@Autowired
	ParamService paramService;
	@Autowired
	JavaMailSender sender;
	@Autowired
	NguoiDungDAO dao;
	
	
	@GetMapping("/quenmatkhau")
	public String quenMatKhau() {
		return "quenMatKhau";
	}
	
	
//	public int[] getRandomNumbers() {
//        Random random = new Random();
//        int[] numbers = new int[4];
//
//        for (int i = 0; i < numbers.length; i++) {
//            numbers[i] = random.nextInt(10);
//        }
//        return numbers;
//    }
//	
	@ResponseBody
	@RequestMapping("/quenmatkhau1")
	public String guiMa(Model m, @RequestParam String mail) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
	    String ds = objectMapper.writeValueAsString("Vy");
//		String matMa = paramService.getString("matMa", "");
//		NguoiDung nDung = dao.findByEmail(mail);
//		System.out.println();
//		try {
//			MimeMessage message = sender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom("Vyltpc04067@fpt.edu.vn");
//			helper.setTo(mail);
//			helper.setSubject("MẬT MÃ CỦA BẠN - VIE_SONET");
//			helper.setText("XIN CHÀO BẠN, LÀ Vie_Sonet ĐÂY" + "<br>" + "Bạn là " + nDung.getHoTen() + "đúng không?"
//					+ "<br>" + "Mình đến đây để gửi mật mã cho bạn và mật mã của bạn là: " + "<h3>" + getRandomNumbers()
//					+ "<h3> <br>" + "Bạn nhớ là đừng để mật mã mình bị lộ ra ngoài nha!" + "<br>"
//					+ "Vie_Sonet THÂN CHÀO!", "html");
//			m.addAttribute("message", "Đã gửi mật mã đến bạn vui lòng check mail");
//		} catch (Exception e) {
//			m.addAttribute("message", "Lỗi không gửi được email");
//		}
//		
//		try {
//			if (!matMa.equals(getRandomNumbers())) {
//				m.addAttribute("message1", "Mật mã không đúng");
//			}else {
//				m.addAttribute("message", "Mật khẩu của bạn là: "+ nDung.getMatKhau());
//			}
//		} catch (Exception e) {
//			m.addAttribute("message", "Email này chưa được đăng ký");
//		}
		return ds;
	}

}
