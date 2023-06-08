package com.viesonet.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultValue) {
		if (name != null) {
			return request.getParameter(name);
		}
		return defaultValue;
	}

	public int getInt(String name, int defaultValue) {
		if (name != null) {
			return Integer.parseInt(request.getParameter(name));
		}
		return defaultValue;
	}

	public double getDouble(String name, double defaultValue) {
		if (name != null) {
			return Double.parseDouble(request.getParameter(name));
		}
		return defaultValue;
	}

	public Boolean getBoolean(String name, boolean defaultValue) {
		if (name != null) {
			return Boolean.parseBoolean(request.getParameter(name));
		}
		return defaultValue;
	}

	public Date getDate(String name, String pattern) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(pattern);
			String temp = request.getParameter(name);
			Date date = formatter.parse(temp);
			return date;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public File save(MultipartFile file, String path) {
		File dir = new File(request.getServletContext().getRealPath(path));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

}
