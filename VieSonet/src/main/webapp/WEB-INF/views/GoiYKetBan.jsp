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
<title>Gợi ý kết bạn</title>
</head>
<body>
	<div class="split-background"></div>
	<img src=""
		class="header animate__animated animate__fadeInUp"
		style="position: fixed; right: 0; max-height: 90vh; z-index: -2;"
		alt="">
	<header class="header animationTop3">
		<nav class="navbar navbar-expand-sm navbar-light"
			style="border: none; padding-top: 0; padding-bottom: 0;">
			<div class="container">
				<a class="navbar-brand nhan" href="#"
					style="color: #222; font-weight: bolder; font-family: 'robo';">
					<img src="images/chimLac.png" height="30px" alt=""> VIE_SONET
				</a>
				<button class="navbar-toggler d-lg-none" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
					aria-controls="collapsibleNavId" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavId">
					<ul class="navbar-nav me-auto mt-2 mt-lg-0">
						<li class="nav-item"><a class="nav-link active" href="#"
							aria-current="page"
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Trang
								chủ <span class="visually-hidden">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Điều
									khoản</small></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Quản
									lí</small></a></li>
					</ul>
					<form class="d-flex my-2 my-lg-0">
						<input class="form-control me-sm-2 input-hbh"
							style="border-radius: 0; border: none; border-bottom: 1px solid gray; transform: skew(0); background-color: transparent;"
							type="text" placeholder="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" hidden
							type="submit">Search</button>
					</form>

					<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><small><img
									src="images/${dsNguoiDung2.anhDaiDien}" width="30px"
									style="border-radius: 50%;" alt=""></small></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId"
								style="width: 350px; padding-left: 3px;">
								<div class="profile-darkButton">
									<div class="user-profile">
										<img src="images/${dsNguoiDung2.anhDaiDien}" alt="">
										<div>
											<p>${dsNguoiDung2.hoTen}</p>
											<small>Xem trang cá nhân của bạn</small>
										</div>
									</div>
								</div>
								<div class="dropdown-item"
									style="display: flex; justify-content: space-between; align-items: center;">
									<small>Chế độ tối:</small>
									<div class="nut">
										<input type="checkbox" class="checkbox" id="checkbox"
											onclick="toggleDarkMode()"> <label class="switch"
											for="checkbox"> <span class="slider"
											style="width: 12px; height: 12px;"></span>
										</label>
									</div>
								</div>
								<a class="dropdown-item" href="#"><small>Đăng nhập</small></a> <a
									class="dropdown-item" href="#"><small>Đăng ký</small></a>
							</div></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>
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
										href="GoiYKB/dongy/${topKb.maLoiMoi}"
										style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1); font-size: small;">
											<center>Đồng ý</center>
									</a> <a class="dropdown-item"
										href="GoiYKB/tuchoi/${topKb.maLoiMoi}"
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
										<a class="dropdown-item" href="GoiYKB/dongy/${topKb.maLoiMoi}"
											style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1);">
											<center>Đồng ý</center>
										</a> <a class="dropdown-item"
											href="GoiYKB/tuchoi/${topKb.maLoiMoi}"
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
					<b class="nhan">Danh sách gợi ý kết bạn</b>
				</h5>
				${message}
				<hr width="30%" style="opacity: 0.1;">
				<div class="row"
					style="padding: 10px; overflow-y: hidden; overflow-y: scroll; max-height: 85vh;">
					<c:forEach items="${list}" var="ND">
						<div class="col-md-6">
							<c:if test="${ND.sdt != sessionScope.sdt }">
								<div
									style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">

									<div class="user-profile">
										<img src="images/${ND.anhDaiDien}" class="img-thumbnail"
											alt="" style="border-radius: 50%;">
										<div>

											<label for="">${ND.hoTen}</label> <br> <small
												style="font-size: 12px">Hoạt động: 1 phút trước</small>
										</div>
									</div>
									<div>
										<a name="" id="" class="btn btn-primary"
											href="/GoiYKB/ketBan/${ND.sdt}" role="button" style=" background-color: #A89386; border-color: transparent;">Kết bạn</a>
									</div>
								</div>
							</c:if>
							<c:if test="${ND.sdt == sessionScope.sdt }">
								<div
									style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">

									<div class="user-profile">
										<img src="images/${ND.anhDaiDien}" class="img-thumbnail"
											alt="" style="border-radius: 50%;">
										<div>

											<label for="">${ND.hoTen}</label> <br> <small
												style="font-size: 12px">Hoạt động: 1 phút trước</small>
										</div>
									</div>
									<div>
										<a name="" id="" class="btn btn-primary"
											href="/GoiYKB/ketBan/${ND.sdt}" role="button" style=" background-color: #A89386; border-color: transparent;">Kết bạn</a>
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