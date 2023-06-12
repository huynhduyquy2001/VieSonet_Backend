package com.viesonet.interceptor;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.HandlerInterceptor;

import com.viesonet.dao.NguoiDungDAO;
import com.viesonet.entity.NguoiDung;
import com.viesonet.service.SessionService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;

@Component
public class AccessTimeInterceptor implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Autowired
	NguoiDungDAO nguoiDungDao;

	@PersistenceContext
    private EntityManager entityManager;

	@Override
    @Transactional
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // Lấy ngày và giờ hiện tại
        LocalDateTime ngayGioDang = LocalDateTime.now();
        // Chuyển đổi sang kiểu Timestamp
        Timestamp timestamp = Timestamp.valueOf(ngayGioDang);
        String sdt = session.get("sdt");
        NguoiDung obj = entityManager.find(NguoiDung.class, sdt);
        obj.setThoiGianTruyCap(timestamp);
        // Lưu trữ hoặc xử lý thời gian truy cập tại đây
        entityManager.merge(obj);
    }
}
