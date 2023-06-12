package com.viesonet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DieuKhoanController {
	@GetMapping("/dieukhoan")
	public String dieuKhoan() {
		return "dieuKhoan";
	}
}
