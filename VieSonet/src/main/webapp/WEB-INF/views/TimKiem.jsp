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
<title>Tìm Kiếm</title>
</head>
<body>
	<img src="images/cayTre.png"
		class="animate__animated animate__fadeInUp"
		style="position: fixed; right: 0; max-height: 90vh; z-index: -2;"
		alt="">
	<header class="header animate__animated animate__fadeInUp">
		<nav class="navbar navbar-expand-sm navbar-light"
			style="border: none; padding-top: 0; padding-bottom: 0;">
			<div class="container">
				<a class="navbar-brand nhan" href="#"
					style="color: #5A4F48; font-weight: bolder; font-family: 'robo';">
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
					<form class="d-flex my-2 my-lg-0"
						onsubmit="displayText(); return false;">
						<input class="form-control me-sm-2 input-hbh" name="sdt1"
							id="name"
							style="border-radius: 0; border: none; border-bottom: 1px solid gray; transform: skew(0); background-color: transparent;"
							type="text" placeholder="Search">
						<button class="btn btn-outline-success my-2 my-sm-0"
							onclick="showName()" hidden="" type="submit">Search</button>
					</form>

					<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><small><img
									src="images/avt.jpg" width="30px" style="border-radius: 50%;"
									alt=""></small></a>
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
			<div
				class="col-md-3 menuTrai animate__animated animate__bounceInLeft">
				<div class="img-thumbnail nenTrangChu menuQuanLi"
					style="border-radius: 0; padding: 8px;">
					<div
						style="position: relative; padding: 7px; padding-top: 10px; border: 1px solid rgba(210, 199, 188, 1);">
						<div>
							<h5>
								<b class="nhan">Từ khóa bạn đã tìm</b>
							</h5>
							<!-- Hiện chuỗi nhập từ thanh tìm kiếm-->
							<center>
								<div id="outputDiv">
									<p id="output"></p>
								</div>
							</center>
							<hr style="opacity: 0.1;">
						</div>
						<div>
							<h5>
								<b class="nhan">Bộ lọc</b>
							</h5>
							<!-- Nav tabs -->
							<ul class="nav flex-column nav-tabs" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="home-tab"
										data-bs-toggle="tab" data-bs-target="#home" type="button"
										role="tab" aria-controls="home" aria-selected="true">
										<i class="fa-solid fa-bars"></i>&nbsp;Tất cả
									</button>
								</li>

								<li class="nav-item" role="presentation">
									<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
										data-bs-target="#profile" type="button" role="tab"
										aria-controls="profile" aria-selected="false">
										<i class="fa-light fa-users"></i>&nbsp;Bạn bè
									</button>
								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>

			<div
				class="col-md-8  img-thumbnail nenTrang animate__animated animate__bounceInRight"
				style="margin-left: 10px; background-color: white; opacity: 0.9; border-radius: 0; padding: 8px;">
				<div class="mb-3">
					<label for="" class="form-label">Tìm kiếm </label>
					<form id="timKiemForm">
						<div class="input-group">
							<input type="text" class="form-control" name="tuKhoaCuaToi"
								id="tuKhoaCuaToi" value="${sdt1}" placeholder="Tìm kiếm...">
							<button class="btn btn-primary" type="submit" onclick="timKiem()"
								style="background-color: #A89386; border: none">Tìm
								kiếm</button>
						</div>
					</form>
				</div>
				<c:if test="${!empty error}">
					<div>
						<h5 style="color: red;">${error}</h5>
					</div>
				</c:if>
				${message}

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home" role="tabpanel"
						aria-labelledby="home-tab">Tất cả</div>
					<div class="tab-pane" id="profile" role="tabpanel"
						aria-labelDledby="profile-tab">Bạn bè</div>
				</div>

				<div
					style="border: 1px solid rgba(210, 199, 188, 1); padding: 10px;">
					<h5>
						<b class="nhan">Danh sách tìm kiếm</b>
					</h5>
					<hr width="30%" style="opacity: 0.1;">
					<!-- Hiện tìm kiêm danh sách bạn bè của người dùng  -->

					<div class="row" id="danhSachTimKiem"
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
									<a href="#"><i class="fas fa-ellipsis-v"></i></a>
								</div>
							</div>
						</c:if>
						</div>
						</c:forEach>
						<c:forEach var="nguoiDung" items="${danhSachTimKiem}">
						
						</c:forEach>
					</div>
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
		function displayText() {
			var input = document.getElementsByName("inputText")[0].value;
			var output = document.getElementById("outputDiv");
			output.innerHTML = input;
		}
		function printString() {
			const input = document.getElementById("input-string");
			const output = document.getElementById("output");
			output.innerHTML = input.value;
		}
	</script>
	<script>
		function timKiem() {
			const input = document.getElementById("tuKhoaCuaToi");
			const output = document.getElementById("output");
			output.innerHTML = input.value;
			
			$("#timKiemForm").submit(function(event) {
				event.preventDefault();
			});
			
			var tuKhoa = $("#tuKhoaCuaToi").val();
			const kt = tuKhoa.trim();
			const regex = /^(0\d{9}|0\d{11})$/;
			<%
				String sdt = (String) session.getAttribute("sdt");
			%>
			function SDT(myDataJS){
				data.forEach(function item() {
				 otherUser = item[2];
				})
			}
			var otherUser;	
			var myDataJS = '<%=sdt%>';
			console.log('Giá trị của myDataJS là: ' + myDataJS);
			console.log('Giá trị của item là: ' + otherUser);
			if (myDataJS == tuKhoa) {
				$
						.ajax({
							url : "/timKiemsdt",
							method : "GET",
							data : {
								tuKhoaCuaToi : tuKhoa
							},
							success : function(data) {
								$("#danhSachTimKiem").empty();
								data
										.forEach(function(item) {
											var html = '<div class="col-md-6">'
													+ '<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">'
													+ '<div class="user-profile">'
													+ '<img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;">'
													+ '<div>'
													+ '<label for="">'
													+ item[0]
													+ '</label> <br>'
													+ '<small>Hoạt động: 1 phút trước</small>'
													+ '</div>' + '</div>'
													+ '<div>'
													//+ '<a name="" id="" class="btn btn-primary" href="#" role="button">Kết bạn</a>'
													+ '</div>' + '</div>'
													+ '</div>';

											$("#danhSachTimKiem").append(html);
										});
							},
							error : function(xhr, status, error) {
								console.log(error); // Thông báo lỗi nếu có
							}
						});
			} else if (regex.test(kt) == true) {
				$
						.ajax({
							url : "/timKiemsdt",
							method : "GET",
							data : {
								tuKhoaCuaToi : tuKhoa
							},
							success : function(data) {
								$("#danhSachTimKiem").empty();
								data
										.forEach(function(item) {
											var html = '<div class="col-md-6">'
													+ '<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">'
													+ '<div class="user-profile">'
													+ '<img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;">'
													+ '<div>'
													+ '<label for="">'
													+ item[0]
													+ '</label> <br>'
													+ '<small>Hoạt động: 1 phút trước</small>'
													+ '</div>'
													+ '</div>'
													+ '<div>'
													+ '<a name="" id="" class="btn btn-primary" href="/timKiem/ketBan/{maKB}" role="button">Kết bạn</a>'
													+ '</div>'
													+ '</div>'
													+ '</div>';

											$("#danhSachTimKiem").append(html);
										});
							},
							error : function(xhr, status, error) {
								console.log(error); // Thông báo lỗi nếu có
							}
						});
			} else {
				$.ajax({
							url : "/timKiemTheoTen",
							method : "GET",
							data : {
								tuKhoaCuaToi : tuKhoa
							},
							success : function(data) {
								$("#danhSachTimKiem").empty();
								data
										.forEach(function(item) {
											var html = '<div class="col-md-6">'
													+ '<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">'
													+ '<div class="user-profile">'
													+ '<img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;">'
													+ '<div>'
													+ '<label for="">'
													+ item[0]
													+ '</label> <br>'
													+ '<small>Hoạt động: 1 phút trước</small>'
													+ '</div>'
													+ '</div>'
													+ '<div>'
													+ '<a name="" id="" class="btn btn-primary" href="/timKiem/ketBan/{maKB}" role="button">Kết bạn</a>'
													+ '</div>' + '</div>'
													+ '</div>';

											var html1 = '<div class="col-md-6">'
													+ '<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">'
													+ '<div class="user-profile">'
													+ '<img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;">'
													+ '<div>'
													+ '<label for="">'
													+ item[0]
													+ '</label> <br>'
													+ '<small>Hoạt động: 1 phút trước</small>'
													+ '</div>'
													+ '</div>'
													+ '<div>'
													+ '</div>'
													+ '</div>' + '</div>';
											if (item[2] == myDataJS) {
												$("#danhSachTimKiem").append(html1);
														
											} else
												$("#danhSachTimKiem").append(html);				
										});
							},
							error : function(xhr, status, error) {
								console.log(error); // Thông báo lỗi nếu có
							}
						});
			}
		}
	</script>
</body>

</html>