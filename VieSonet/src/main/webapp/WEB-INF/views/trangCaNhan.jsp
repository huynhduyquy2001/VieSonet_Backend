
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">

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

<link rel="stylesheet" href="/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Alumni+Sans+Inline+One&family=Bangers&family=Chakra+Petch:ital,wght@0,400;1,300;1,400;1,700&family=Grenze&family=Patrick+Hand&family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



</head>
<title>Trang cá nhân</title>
<style type="text/css">
.dropdown-item {
	padding-top: 0;
	padding-bottom: 0;
}

.red-heart {
	color: red; /* Màu đỏ cho trái tim đã thích */
}

.gray-heart {
	color: gray; /* Màu xám cho trái tim chưa thích */
}
</style>
<style>
#menuTrai {
	position: absolute;
	top: 0;
	transition: 0.5s;
	/* Đảm bảo thẻ div hiển thị trên các phần tử khác */
}

#menuTrai.fixed {
	position: fixed;
	top: 30px;
	transition: 0.5s;
}

.baiDang {
	display: none;
}

@media screen and (max-width: 768px) {
	.baiDang {
		display: block;
	}
	.menuTrai {
		display: none;
	}
}

.btn-transparent {
	background-color: transparent;
	border: 0;
}
</style>
</head>

<body style="padding-top: 30px; padding-bottom: 70px;">
	<div class="split-background"></div>
	<header class="header animationTop3">
		<nav class="navbar navbar-expand-sm navbar-light"
			style="border: none; padding-top: 0; padding-bottom: 0;">
			<div class="container">
				<a class="navbar-brand nhan" href="/"
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
					<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
						<li class="nav-item"><a class="nav-link" href="/timKiem"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: sans-serif; letter-spacing: 0.1em; color: black;"><i
									class="fa-solid fa-magnifying-glass"></i></small></a></li> &nbsp;&nbsp;
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							onclick="danhDauDaDoc(); return false;" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="fa-regular fa-bell"></i> <span id="soLuongThongBao">${thongBaoChuaXem}</span>
						</a>
							<div class="dropdown-menu" id="danhSachThongBao"
								style="overflow: hidden; max-height: 60vh; overflow-y: scroll; left: -100px">
								<c:if test="${empty thongBao}">
									<small>Bạn chưa có thông báo nào!</small>
								</c:if>

								<c:forEach items="${thongBao}" var="item">
									<a onclick="loadBinhLuan(${item.baiViet.maBaiViet})">
										<div class="user-profile"
											style="width: 250px; padding-left: 3%; padding-right: 5px;${!item.trangThai ? 'background-color: #EBE9E7;' : ''}">
											<img src="images/${item.baiViet.nguoiDung.anhDaiDien}" alt="">
											<div>
												<p style="font-size: 13px">${item.noiDung}</p>
												<div style="justify-content: space-between; display: flex;">
													<small style="font-size: 11px"> <script
															type="text/javascript">
                                                        var currentTime = new Date();
                                                        var activityTime = new Date('${item.ngayThongBao}');
                                                        var timeDiff = currentTime.getTime() - activityTime.getTime();
                                                        var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
                                                        var monthsDiff = Math.floor(daysDiff / 30);
                                                        var yearsDiff = Math.floor(monthsDiff / 12);

                                                        if (daysDiff < 1) {
                                                            document.write('1 ngày trước');
                                                        } else if (monthsDiff < 1) {
                                                            document.write(daysDiff + ' ngày trước');
                                                        } else if (yearsDiff < 1) {
                                                            document.write(monthsDiff + ' tháng trước');
                                                        } else {
                                                            document.write('<fmt:formatDate value="${item.ngayThongBao}" pattern="dd-MM-yyyy HH:mm" />');
                                                        }
                                                    </script>
													</small> <small style="font-size: 12px"> <a
														style="cursor: pointer;"
														onclick="xoaThongBao(${item.maThongBao})">x</a>
													</small>
												</div>
											</div>
										</div>
									</a>
									<hr style="opacity: 0.05; margin: 0">
								</c:forEach>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							class="nav-link dropdown-toggle" href="/profile" id="dropdownId"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><small><img
									src="images/${taiKhoan.anhDaiDien}" width="30px"
									style="border-radius: 50%; border: 1px solid gray" alt=""></small></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId"
								style="padding-left: 3px; left: -100px; line-height: 35px">
								<a class="dropdown-item" href="/profile"> <small>Xem
										trang cá nhân</small></a> <a class="dropdown-item" href="/DanhSachBanBe">
									<small>Danh sách bạn bè</small>
								</a> <a class="dropdown-item" href="/GoiYKB"> <small>Gợi
										ý kết bạn</small></a>
								<c:if test="${sessionScope.vt == 2 || sessionScope.vt == 3}">
									<!-- Nội dung chỉ hiển thị khi có vai trò 'admin' -->
									<a class="dropdown-item" href="/quanly/quanLyBaiViet"> <small>Quản
											lý</small></a>
								</c:if>
								<a class="dropdown-item" href="/doimatkhau"> <small>Đổi
										mật khẩu</small></a> <a class="dropdown-item" href="/dieukhoan"> <small>Điều
										khoản</small></a> <a class="dropdown-item" href="/dangxuat"> <small>Đăng
										xuất</small></a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="row" style="margin-top: 10px; position: relative;">
		<div class="video-overlay"></div>
		<img src="images/${nguoiDung.anhBia}" alt="" class="img-thumbnail"
			style="max-height: 300px; width: 100%; object-fit: cover; overflow: hidden; z-index: -10; padding: 0">
		<div class="col-md-5 "
			style="position: absolute; transform: translateY(-50%); top: 50%; left: 20px;">
			<div class="row">

				<div class="col-4">
					<img data-bs-toggle="modal" data-bs-target="#staticBackdrop"
						src="images/${nguoiDung.anhDaiDien}" width="100%"
						style="border-radius: 50%;" class="img-thumbnail" alt="">
				</div>
				<div class="col-5" style="color: white;">


					<h3>${nguoiDung.hoTen}</h3>
					<small>
						<ul style="line-height: 30px;">
							<li><b><i class="fa-light fa-mountain-sun"></i> Quê
									quán:</b> ${nguoiDung.diaChi}</li>
							<li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b>
								${nguoiDung.moiQuanHe}</li>
							<li><b><i class="fa-regular fa-envelope"></i> Email:</b>
								${nguoiDung.email}</li>
							<li><b><i class="fa-regular fa-registered"></i> Ngày
									tham gia:</b> ${nguoiDung.ngayTao}</li>

							<li><b><i class="fa-light fa-user-group"></i> Danh sách
									bạn bè:</b> ${SlBanbe}</li>
						</ul>
					</small>
				</div>
				<div class="col-1">
					<!-- Dropdown nè -->
					<div class="dropdown">
						<button class="btn dropdown-toggle text-white" type="button"
							id="dropdownMenuButton" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa fa-cog text-white"></i> <b style="color: white;">Chỉnh
								sửa</b>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"">
							<button data-bs-toggle="modal" data-bs-target="#modalId"
								style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: white;">
								<small>Đổi TT cá nhân</small>
							</button>
							<hr>
							<button data-bs-toggle="modal" href="#exampleModalToggle1"
								style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: white;">
								<small>Đổi ảnh đại diện</small>
							</button>
							<hr>
							<button data-bs-toggle="modal" href="#exampleModalToggle12"
								style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: white;">
								<small>Đổi ảnh bìa</small>
							</button>
						</ul>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- Modal đổi ảnh đại diện-->
	<form action="/profile/avatar" method="POST" modelAttribute="nguoiDung"
		enctype="multipart/form-data">
		<div class="modal fade" id="exampleModalToggle1" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel1" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalToggleLabel">
							<b style="margin-left: 170px;">Đăng ảnh đại diện</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Mô tả -->
						</p>
						<small style="font-size: 12px">
							<div>
								<select name="cheDo"
									style="border: none; background-color: transparent;">
									<option selected value="1">Công khai</option>
									<option value="2">Bạn bè</option>
									<option value="3">Chỉ mình tôi</option>
								</select>
							</div>
						</small>
						<textarea name="moTaBaiViet" placeholder="Mô tả?" id="" cols="55"
							rows="3" style="border: 0;">Đổi ảnh đại diện nào!!</textarea>
						<br>
						<center>
							<img id="img1" src="" width="45%" style="border-radius: 10px;">
						</center>
						<br>

					</div>
					<div class="modal-footer post-upload-textarea"
						style="padding: 0; padding-left: 10px; padding-right: 10px;">
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupFile011"><img
								src="images/${pageContext.request.contextPath}"
								style="width: 20px; margin-right: 13px;">Photo/Video</label> <input
								type="file" class="form-control" id="inputGroupFile011"
								name="photo_file">

						</div>
						<button
							style="width: 500px; background-color: #5A4F48; border: none;"
							class="btn btn-primary">Đăng ảnh đại diện</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Modal đổi ảnh bìa-->
	<form action="/profile/background" method="POST"
		modelAttribute="nguoiDung" enctype="multipart/form-data">
		<div class="modal fade" id="exampleModalToggle12" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel1" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalToggleLabel">
							<b style="margin-left: 170px;">Đăng ảnh bìa</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<center>
							<img id="img1" src="" width="45%" style="border-radius: 10px;">
						</center>
						<br>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupFile011"><img
								src="images/${pageContext.request.contextPath}"
								style="width: 20px; margin-right: 13px;">Photo/Video</label> <input
								type="file" class="form-control" id="inputGroupFile011"
								name="photo_file2">
						</div>
					</div>
					<div class="modal-footer post-upload-textarea"
						style="padding: 0; padding-left: 10px; padding-right: 10px;">
						<textarea name="" placeholder="Mô tả?" id="" cols="30" rows="3"></textarea>
						<br>
						<button
							style="width: 500px; background-color: #5A4F48; border: none;"
							class="btn btn-primary">Đăng ảnh</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Modal Body -->
	<!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
	<form method="Post" action="/profile/update" modelAttribute="nguoiDung">
		<div class="modal fade" id="modalId" tabindex="-1"
			data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
			aria-labelledby="modalTitleId" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="background-color: white;">
					<div class="modal-body">
						<ul style="line-height: 30px;">
							<li><b><i class="fa-regular fa-pen-to-square"></i> Tên
									tài khoản:</b> <input class="form-control input-hbh"
								style="border-radius: 0; border: none; border-bottom: 1px solid gray; width: 50%;"
								type="text" placeholder="Họ tên?" value="${nguoiDung.hoTen}"
								name="hoTen" /></li>
							<li><b><i class="fa-light fa-mountain-sun"></i> Quê
									quán:</b> <input class="form-control input-hbh"
								style="border-radius: 0; border: none; border-bottom: 1px solid gray;"
								type="text" placeholder="Quê quán?" value="${nguoiDung.diaChi}"
								name="diaChi" /></li>
							<li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b>
								<input class="form-control input-hbh"
								style="border-radius: 0; border: none; border-bottom: 1px solid gray;"
								type="text" placeholder="Mối quan hệ?"
								value="${nguoiDung.moiQuanHe}" name="moiQuanHe" /></li>
							<li><b><i class="fa-regular fa-envelope"></i> Email:</b> <input
								class="form-control input-hbh"
								style="border-radius: 0; border: none; border-bottom: 1px solid gray;"
								type="text" placeholder="Email?" value="${nguoiDung.email}"
								name="email" /></li>
							<li><b><i class="fa-regular fa-venus-mars"></i> Giới
									tính:</b>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gioiTinh"
										id="rbNam" value="true"
										${nguoiDung.gioiTinh == true ? "checked" : ""}> <label
										class="form-check-label" for="rbNam">Nam</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gioiTinh"
										id="rbNu" value="false"
										${nguoiDung.gioiTinh == false ? "checked" : ""}> <label
										class="form-check-label" for="rbNu">Nữ</label>
								</div></li>
							<li><b><i class="fa-regular fa-envelope"></i> Giới
									thiệu:</b> <input class="form-control input-hbh"
								style="border-radius: 0; border: none; border-bottom: 1px solid gray;"
								type="text" placeholder="Giới thiệu?"
								value="${nguoiDung.gioiThieu}" name="gioiThieu" /></li>


						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn01">Lưu</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Optional: Place to the bottom of scripts -->
	<script>
        const myModal = new bootstrap.Modal(document.getElementById('modalId'), options)

    </script>
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="position: relative;">
				<div class="menuTrai" id="menuTrai">
					<div
						style="border-radius: 6px; box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
						<b>Bài đăng</b>
						<div class="write-post-container nenTrangChu img-thumbnail"
							style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
							<div class="user-profile">

								<img src="images/${nguoiDung.anhDaiDien}" alt="">
								<div>
									<label>${nguoiDung.hoTen}</label> <br>

								</div>
							</div>

							<div class="post-upload-textarea">
								<textarea data-bs-toggle="modal" href="#exampleModalToggle"
									name="" placeholder="Bạn muốn đăng gì?" id="" cols="30"
									rows="1"></textarea>
								<div class="add-post-links">
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#exampleModalToggle">
										<a href="#"><i class="fa-regular fa-image"></i>
											Hình ảnh</a>
									</button>
								</div>


							</div>

						</div>
						<hr>
						<div style="display: flex; justify-content: space-between;">
							Lời mời kết bạn(${SlKb}) &nbsp; <a href="/DanhSachBanBe"><small><small
									style="color: #F27323;">Xem tất cả>></small></small></a>
						</div>
						<c:forEach items="${topKetBan}" var="topKb">
							<div>
								<div class="user-profile">
									<a href="/nguoiDung/${topKb.nguoiDung.sdt}"><img
										src="images/${topKb.nguoiDung.anhDaiDien}"
										class="img-thumbnail" alt=""></a>
									<div>
										<label class="nhan"
											style="font-size: 13px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 130px">${topKb.nguoiDung.hoTen}</label>
										<small style="display: flex;"> <a
											class="dropdown-item" href="profile/dongy/${topKb.maLoiMoi}"
											style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1); font-size: small;">
												<center>Đồng ý</center>
										</a> <a class="dropdown-item"
											href="profile/tuchoi/${topKb.maLoiMoi}"
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
											<a class="dropdown-item"
												href="profile/dongy/${topKb.maLoiMoi}"
												style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1);">
												<center>Đồng ý</center>
											</a> <a class="dropdown-item"
												href="iprofile/tuchoi/${topKb.maLoiMoi}"
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
			</div>
		</div>
		<div class="col-md-7 offset-md-5">
			<div
				style="box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
				<center>
					<div>
						<i class="fa-sharp fa-solid fa-bomb"></i> <br>
						<textarea class="text-center" data-bs-toggle="modal"
							href="#modalId" name=""
							placeholder="Bạn muốn đăng gì?" id="" cols="60" rows="3"
							style="border: none; background: transparent; resize: none;">${nguoiDung.gioiThieu}</textarea>
					</div>
				</center>

				<div class="baiDang"
					style="border-radius: 6px; box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
					Bài đăng:
					<div class="write-post-container nenTrangChu img-thumbnail"
						style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
						<div class="user-profile">
							<img src="images/${NguoiDung.anhDaiDien}" alt="">
							<div>
								<label>${NguoiDung.hoTen}</label> <br> <small> Công
									khai <i class="fas fa-caret-down"></i>
								</small>
							</div>
						</div>

						<div class="post-upload-textarea">
							<textarea data-bs-toggle="modal" href="#exampleModalToggle"
								name="" placeholder="Bạn muốn đăng gì?" id="" cols="30" rows="1"></textarea>
							<div class="add-post-links">
								<button type="button" class="btn" data-bs-toggle="modal"
									data-bs-target="#modalId">
									<a href="#"><i class="fa-regular fa-image"></i> Photo/Video</a>
								</button>
							</div>


						</div>

					</div>



				</div>
			</div>
			<b>Bài viết</b>
			<hr>
			<c:forEach items="${BaiVietCaNhan}" var="BaiViet">
				<div
					class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
					style="margin-bottom: 20px; border-radius: 0;">
					<div
						style="padding: 10px; border: 1px solid rgba(210, 199, 188, 1); margin: 0;">
						<div
							style="display: flex; align-items: center; justify-content: space-between;">
							<div class="tooltip2">
									<div class="user-profile ">
										<a href="/nguoiDung/${BaiViet.nguoiDung.sdt}"><img
											src="images/${BaiViet.nguoiDung.anhDaiDien}"
											class="img-thumbnail" alt=""></a>
										<div>

										<c:if test="${BaiViet.cheDo.maCheDo == 1}">
											<label class="nhan">${BaiViet.nguoiDung.hoTen}</label>
											<i class="fa-solid fa-earth-americas fa-xs"></i>
										</c:if>
										<c:if test="${BaiViet.cheDo.maCheDo == 2}">
											<label class="nhan">${BaiViet.nguoiDung.hoTen}</label>
											<i class="fa-solid fa-user-group-simple fa-xs"></i>
										</c:if>
										<c:if test="${BaiViet.cheDo.maCheDo == 3}">
											<label class="nhan">${BaiViet.nguoiDung.hoTen}</label>
											<i class="fa-solid fa-user-lock fa-xs"></i>
										</c:if>

										<br> <small style="font-size: 12px; color: #65676b">
											<script type="text/javascript">
                                            var currentTime = new Date();
                                            var activityTime = new Date('${BaiViet.ngayDang}');
                                            var timeDiff = currentTime.getTime() - activityTime.getTime();
                                            var seconds = Math.floor((timeDiff / 1000)%60);
                                            var minuteDiff = Math.floor((timeDiff / 1000)/60);
                                            var hourDiff = Math.floor(timeDiff / (1000 * 3600));
                                            var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
                                            var monthsDiff = Math.floor(daysDiff / 30);
                                            var yearsDiff = Math.floor(monthsDiff / 12);
											
                                            if (daysDiff === 0) {
                                                if(minuteDiff === 0){
                                                	document.write(seconds +  ' giây trước');
                                                }else if(hourDiff === 0 && minuteDiff < 60){
                                                	document.write(minuteDiff +  ' phút trước');
                                                }
                                                else if(minuteDiff > 60){
                                                	document.write(hourDiff +  ' giờ trước');
                                                }
                                            } else if (daysDiff < 1) {
                                                document.write('1 ngày trước');
                                            } else if (monthsDiff < 1) {
                                                document.write(daysDiff + ' ngày trước');
                                            } else if (yearsDiff < 1) {
                                                document.write(monthsDiff + ' tháng trước');
                                            }

                        				</script>
										</small>
									</div>
								</div>
								<span class="tooltip2-text"> <a href="">
											<div class="row">
												<div class="col-5">
													<a href="/nguoiDung/${BaiViet.nguoiDung.sdt}"><img
														src="images/${BaiViet.nguoiDung.anhDaiDien}"
														class="img-thumbnail" alt=""></a>
												</div>
												<div class="col-7" style="padding: 0; margin: 0;">
													<label for="" style="padding: 0; margin: 0;"> <small>${BaiViet.nguoiDung.hoTen}</small>
													</label> <small><small> <small>
																<ul style="line-height: 20px; text-align: left;">
																	<li><b><i class="fa-light fa-mountain-sun"></i>
																			Sống tại:</b> ${BaiViet.nguoiDung.diaChi}</li>
																	<li><i class="fa-regular fa-heart"></i> <b>Mối
																			quan hệ:</b> ${BaiViet.nguoiDung.moiQuanHe}</li>
																	<li><b><i class="fa-light fa-user-group"></i>
																			Email:</b> ${BaiViet.nguoiDung.email}</li>
																</ul>
														</small>
													</small></small>
												</div>
												<div>
													<center></center>
												</div>
											</div>
									</a>
									</span>
							</div>
							<div>
								<div class="btn-group">
									<span class="btn dropdown-toggle" type="button" id="triggerId"
										data-bs-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> </span>
									<div class="dropdown-menu btn-cap-nhat-bai-viet"
										aria-labelledby="triggerId">
										<!-- href="#exampleModalToggle123" -->
										<button data-bs-toggle="modal"
											onclick="hienBaiViet(${BaiViet.maBaiViet})"
											style="border: 1px solid white; border-radius: 6px; background: transparent; margin: 0; line-height: 0">
											<small>Chỉnh sửa bài viết</small>
										</button>
										<hr>
										<a href="/profile/anbaiviet/${BaiViet.maBaiViet}">
											<button
												style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background: transparent">
												<small>Xóa bài viết</small>
											</button>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div style="margin-top: 10px; color: #847577">
							<div onclick="loadBinhLuan(${BaiViet.maBaiViet}, ${maBaiVietDaThich})">
								${BaiViet.moTa}
								<center>
									<a onclick="loadBinhLuan(${BaiViet.maBaiViet}, ${maBaiVietDaThich })">
									<img class="lazy" data-src="images/${BaiViet.hinhAnh}"
										width="60%" alt=""
										style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;"></a>
								</center>
							</div>
							<div class="post-reaction">
								<div class="activity-icons">

									<div onclick="thichBaiViet(${BaiViet.maBaiViet},this)"
										class="${maBaiVietDaThich.contains(BaiViet.maBaiViet) ? 'red-heart' : 'gray-heart'}">
										<i class="fa-duotone fa-heart"></i> &nbsp; <span
											class="like-count">${BaiViet.luotThich}</span>
									</div>
									<div
										onclick="loadBinhLuan(${BaiViet.maBaiViet}, ${maBaiVietDaThich })">
										<i class="fa-regular fa-comment"></i>&nbsp;
										${BaiViet.luotBinhLuan}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


		<!-- Modal đăng bài -->
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content"
					style="background-color: rgba(246, 245, 244, 1);">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalToggleLabel">
							<b style="margin-left: 170px;">Đăng bài viết</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="/profile/dangbai" method="post"
						enctype="multipart/form-data">
						<div class="modal-body">

							<div class="user-profile">
								<img src="/images/${nguoiDung.anhDaiDien}" alt="">
								<div>
									<label>${nguoiDung.hoTen}
										</p> <small style="font-size: 12px">
											<div>
												<select name="cheDo"
													style="border: none; background-color: transparent;">
													<option selected value="1">Công khai</option>
													<option value="2">Bạn bè</option>
													<option value="3">Chỉ mình tôi</option>
												</select>
											</div>
									</small>
								</div>
							</div>

							<br>
							<textarea name="moTaBaiDang" placeholder="Bạn muốn đăng gì?"
								id="" cols="30" rows="3"
								style="width: 100%; border: 0px; outline: none; border-bottom: 1px solid #ccc; background: transparent; resize: none;"></textarea>

							<br>
							<center>
								<img id="img" src="" width="45%"
									style="border-radius: 10px; border: 1px solid rgb(184, 182, 182)">
							</center>
						</div>
						<div class="modal-footer">
							<div class="input-group mb-3">
								<label class="input-group-text" for="inputGroupFile01">
									<i class="fa-regular fa-image"></i>Photo/Video
								</label> <input type="file" class="form-control" name="photo_file1"
									id="inputGroupFile01">
							</div>

							<button
								style="width: 500px; background-color: #5A4F48; border: none;"
								class="btn btn-primary" data-bs-target="#exampleModalToggle2"
								data-bs-toggle="modal" data-bs-dismiss="modal">Đăng bài</button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<div class="modal fade" id="baiVietChiTiet" tabindex="-1"
			role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
			<div class="modal-dialog modal-sm modal-fullscreen" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="row">
							<div data-bs-dismiss="modal" style="cursor: pointer;">X</div>
							<div
								class="col-md-12 trai order-sm-2 col-xs-12 order-1 justify-center"></div>
						</div>
					</div>

				</div>
			</div>
		</div>


		<!-- Modal -->
		<!-- Modal chỉnh sửa bài viết -->
		<div class="modal fade" id="modalChinhSua" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content"
					style="background-color: rgba(246, 245, 244, 1);">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalToggleLabel">
							<b style="margin-left: 170px;">Chỉnh sửa bài viết</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<div class="user-profile">
								<img id="avtCuaToi" src="" alt="">
								<div>
									<label id="tenCuaToi"></label> <small style="font-size: 12px">
										<div>
											<select id="cheDoCuaToi" name="cheDoCuaToi"
												style="border: none; background-color: transparent;">
												<option selected value="1">Công khai</option>
												<option value="2">Bạn bè</option>
												<option value="3">Chỉ mình tôi</option>
											</select>
										</div>
									</small>
								</div>
							</div>

							<br>
							<textarea id="moTaCuaToi" name="moTaCuaToi"
								placeholder="Bạn muốn đăng gì?" id="" cols="30" rows="3"
								style="width: 100%; border: 0px; outline: none; border-bottom: 1px solid #ccc; background: transparent; resize: none;"></textarea>

							<br>
							<center>
								<img id="hinhAnhCuaToi" name="hinhAnhCuaToi" src="" width="45%"
									style="border-radius: 10px; border: 1px solid rgb(184, 182, 182)">
							</center>
						</div>
						<div class="modal-footer">
							<div class="input-group mb-3">
								<label class="input-group-text" for="inputGroupFile01">
									<i class="fa-regular fa-image"></i>Hình ảnh
								</label> <input type="file" class="form-control" name="photo_file_fix"
									id="inputMyGroupFile">
							</div>

							<button id="chinhSuaBaiViet"
								style="width: 500px; background-color: #5A4F48; border: none;"
								class="btn btn-primary" data-bs-target="#exampleModalToggle2"
								data-bs-toggle="modal" data-bs-dismiss="modal">Chỉnh
								sửa</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Modal hiện danh sách bình luận -->
		<div class="modal fade" id="danhSachBinhLuan" tabindex="-1"
			role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
			<div class="modal-dialog modal-sm modal-fullscreen" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="row">
							<div data-bs-dismiss="modal" style="cursor: pointer;">X</div>
							<div class="col-md-6 trai order-sm-2 col-xs-12 order-1"></div>
							<div class="col-md-6 phai order-sm-1 col-xs-12"></div>

						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- load ảnh -->
		<script>
        let img = document.getElementById('img');
        let input = document.getElementById('inputGroupFile01');
        let img1 = document.getElementById('img1');
        let input1 = document.getElementById('inputGroupFile011');

        input.onchange = (e) => {
            if (input.files[0])
                img.src = URL.createObjectURL(input.files[0]);
        }
        input1.onchange = (e) => {
            if (input1.files[0])
                img1.src = URL.createObjectURL(input1.files[0]);
        } 
    </script>
		<script>
        window.onscroll = function () {
            var fixedDiv = document.getElementById("menuTrai");
            var scrollPosition = window.scrollY;
            var windowHeight = window.innerHeight - 300;
            
            // Kiểm tra vị trí cuộn của trình duyệt
            if (scrollPosition >= windowHeight) {
                fixedDiv.classList.add("fixed");
            } else {
                fixedDiv.classList.remove("fixed");
            }
        };

    </script>
		<script src="${pageContext.request.contextPath}/loadBaiViet.js"></script>
		<script
			src="${pageContext.request.contextPath}/loadCommentsProfile.js"></script>
		<script src="${pageContext.request.contextPath}/lazy.js"></script>
		<script src="${pageContext.request.contextPath}/thoiTiet.js"></script>

		<script type="text/javascript">
		function hienBaiViet(maBaiViet) {
			
			  $.ajax({
			    url: "/hienBaiViet/" + maBaiViet,
			    type: "GET",
			    success: function(data) {
			    	  $("#moTaCuaToi").val(data[0]);
			    	  $("#avtCuaToi").attr("src", "/images/" + data[6]);
			    	  $("#cheDoCuaToi").val(data[9]);
			    	  $("#tenCuaToi").text(data[5]);

			    	  // Gán giá trị vào src của ảnh
			    	  $("#hinhAnhCuaToi").attr("src", "/images/" + data[1]);
			    	  $("#chinhSuaBaiViet").attr("formaction", "chinhSuaBaiViet/"+maBaiViet);
			    	  $("#modalChinhSua").modal('show');
			    	},

			    error: function (xhr, status, error) {
			      console.log(error); // In lỗi ra console để debug
			      // Xử lý logic khi gặp lỗi
			    }
			  });
			}
		</script>
</body>

</html>