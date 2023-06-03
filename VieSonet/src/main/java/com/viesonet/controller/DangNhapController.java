package com.viesonet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DangNhapController {

	@GetMapping("/dangnhap")
	public String dangNhap() {
		return "dangNhap";
	}
}
