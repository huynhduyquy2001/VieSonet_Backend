<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f737751420.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Alumni+Sans+Inline+One&family=Bangers&family=Chakra+Petch:ital,wght@0,400;1,300;1,400;1,700&family=Grenze&family=Patrick+Hand&family=Playfair+Display+SC&family=Road+Rage&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Alumni+Sans+Inline+One&family=Bangers&family=Chakra+Petch:ital,wght@0,400;1,300;1,400;1,700&family=Grenze&family=Patrick+Hand&family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Danh sách bạn bè</title>
</head>
<body>
	<div class="split-background"></div>
	
	<%@include file="_header.jsp"%>
	<div class="container" id="container"
		style="transition: 0.5s; margin-top: 70px;">
		<div class="row">
			<div class="col-md-4 dsBb animate__animated animate__backInLeft"
				style="background-color: white;">
				<div>
					<h5>
						<b class="nhan">Lời mời kết bạn (${SlKb})</b>
					</h5>
					<hr style="opacity: 0.1; width: 20%;">
				</div>
				<div class="row">
					<div style="display: flex; justify-content: space-between;">
						&nbsp; <small><small style="color: #F27323;">Xem
								tất cả>></small></small>
					</div>
					<c:forEach items="${topKetBan}" var="topKb">
						<div>
							<div class="user-profile">
								<a href="#"><img src="images/${topKb.nguoiLa.anhDaiDien}"
									class="img-thumbnail" alt=""></a>
								<div>
									<label class="nhan"
										style="font-size: 13px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 130px">${topKb.nguoiLa.hoTen}</label>
									<small style="display: flex;"> <a class="dropdown-item"
										href="DanhSachBanBe/dongy/${topKb.maLoiMoi}"
										style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1); font-size: small;">
											<center>Đồng ý</center>
									</a> <a class="dropdown-item" href="DanhSachBanBe/tuchoi/${topKb.maLoiMoi}"
										style="background-color: #A89386; color: white; font-size: small;">
											<center>Xóa</center>
									</a>
									</small>
								</div>
							</div>
							<div>
								<div class="btn-group">
									<div class="dropdown-menu" aria-labelledby="triggerId"
										style="padding: 0;">
										<a class="dropdown-item" href="DanhSachBanBe/dongy/${topKb.maLoiMoi}"
											style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1);">
											<center>Đồng ý</center>
										</a> <a class="dropdown-item" href="DanhSachBanBe/tuchoi/${topKb.maLoiMoi}"
											style="background-color: #A89386; color: white;">
											<center>Xóa</center>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="col-md-8 animate__animated animate__backInRight"
				style="opacity: 0.9; box-sizing: border-box;">
				<h5>
					<b class="nhan">Danh sách bạn bè (${SlBanbe})</b>
				</h5>
				<hr width="30%" style="opacity: 0.1;">
				<div class="row"
					style="padding: 10px; overflow-y: hidden; overflow-y: scroll; max-height: 85vh;">
					<c:forEach items="${danhSachBanBe}" var="banBe">
					<div class="col-md-6">
						<c:if test="${banBe.banBe.sdt == sessionScope.sdt}">
							<div
								style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
								<div class="user-profile">
									<img src="images/${banBe.nguoiDung.anhDaiDien}"
										class="img-thumbnail" alt="" style="border-radius: 50%;">
									<div>
							
										<label for="">${banBe.nguoiDung.hoTen}</label> <br> <small
											style="font-size: 12px">Hoạt động: 1 phút trước</small>
										
									</div> 
								</div>
								<div>
									<a href="/DanhSachBanBe/xoa/${banBe.maBanBe}" role="button" class="btn btn-primary"style=" background-color: #A89386; border-color: transparent;">Hủy kết bạn</a>	
								</div>
							</div>
						</c:if>
						<c:if test="${banBe.banBe.sdt != sessionScope.sdt}">
							<div
								style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
								<div class="user-profile">
									<img src="images/${banBe.banBe.anhDaiDien}"
										class="img-thumbnail" alt="" style="border-radius: 50%;">
									<div>
										<label for="">${banBe.banBe.hoTen}</label> <br> <small
											style="font-size: 12px">Hoạt động: 1 phút trước</small>
											
									</div>
								</div>
								<div>
									<a href="/DanhSachBanBe/xoa/${banBe.maBanBe}" role="button" class="btn btn-primary" style=" background-color: #A89386; border-color: transparent;">Hủy kết bạn</a>
								</div>
							</div>
						</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		function toggleDarkMode() {
			var body = document.body;
			var header = document.querySelector('.header');
			var navlink = document.querySelectorAll('.nav-link');
			var a = document.querySelectorAll('a');
			var inputhbh = document.querySelector('.input-hbh');
			body.classList.toggle("dark-mode");
			header.classList.toggle("dark-mode2");
			inputhbh.classList.toggle("dark-mode2");
			inputhbh.style.color = "white";
			document.querySelector('.dropdown-menu').classList
					.toggle("dark-mode2");

			document.querySelector('textarea').style.color = "white";
			for (var i = 0; i < navlink.length; i++) {
				navlink[i].style.color = "white";
			}
			for (var i = 0; i < a.length; i++) {
				a[i].style.color = "white";
			}
		}
	</script>
</body>
</html>