package com.viesonet.controller;

import java.util.Arrays;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.MailService;
import com.viesonet.service.ParamService;
import com.viesonet.service.SessionService;

import jakarta.mail.internet.MimeMessage;

@Controller
public class QuenMatKhauController {
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	@Autowired
	JavaMailSender sender;
	@Autowired
	NguoiDungDAO dao;
	@Autowired
	MailService mailer;

	private int[] randomNumbers;

	public int[] getRandomNumbers() {
		Random random = new Random();
		int[] numbers = new int[4];
		for (int i = 0; i < numbers.length; i++) {
			numbers[i] = random.nextInt(10);
		}
		return numbers;
	}

	@GetMapping("/quenmatkhau")
	public String quenMatKhau() {
		randomNumbers = getRandomNumbers();
		System.out.println(Arrays.toString(randomNumbers).replaceAll("\\[|\\]|,|\\s", ""));
		return "quenMatKhau";
	}

	@ResponseBody
	@RequestMapping("/quenmatkhau/guima")
	public String guiMa(Model m, @RequestParam String mail) {
		NguoiDung nDung = dao.findByEmail(mail);
		MimeMessage message = sender.createMimeMessage();
		System.out.println(Arrays.toString(randomNumbers).replaceAll("\\[|\\]|,|\\s", ""));
		if(nDung.getTrangThai() == false) {
			return "Tài khoản này đã bị khóa";
		}
		try {
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("VIE_SONET");
			helper.setTo(mail);
			helper.setSubject("MẬT MÃ CỦA BẠN - Vie_SoNet");
			randomNumbers = getRandomNumbers();
			helper.setText(
					"XIN CHÀO BẠN, LÀ Vie_Sonet ĐÂY" + "<br>" + "Bạn là <h3>" + nDung.getHoTen() + "</h3> đúng không?"
							+ "<br>" + "Mình đến đây để gửi mật mã cho bạn và mật mã của bạn là: " + "<h3>"
							+ Arrays.toString(randomNumbers).replaceAll("\\[|\\]|,|\\s", "") + "<h3> <br>"
							+ "Bạn nhớ là đừng để mật mã mình bị lộ ra ngoài nha!" + "<br>" + "Vie_Sonet THÂN CHÀO!",
					true);
		} catch (Exception e) {
			System.out.println(e);
			return "Mail này chưa đăng ký tài khoản";
		}
		sender.send(message);
		return "Mật mã đã được gửi đến mail của bạn";

	}

	@ResponseBody
	@RequestMapping("/quenmatkhau/xemmatkhau")
	public String xemMatKhau(Model m, @RequestParam String ma, @RequestParam String mail) {
		NguoiDung nDung = dao.findByEmail(mail);
		String expectedMa = Arrays.toString(randomNumbers).replaceAll("\\[|\\]|,|\\s", "");
		if (!ma.equals(expectedMa)) {
			return "Mật mã chưa đúng";
		} else {
			session.set("sdt", nDung.getSdt());
			return "Mật mã đúng";
		}
	}

}
