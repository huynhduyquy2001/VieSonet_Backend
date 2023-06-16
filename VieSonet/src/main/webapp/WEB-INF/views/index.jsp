<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>


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
<title>Trang chủ</title>
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

div.dropdown-menu.baoCao {
	transform: translate(-80%, 39px);
}
</style>
</head>
<body>
	<div
		style="position: fixed; right: 0; max-height: 90vh; opacity: 0.1; bottom: 0;">
	</div>
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

	<div class="container" id="container"
		style="transition: 0.5s; margin-top: 70px;">
		<div class="row">
			<div class="col-md-5" style="z-index: 10;">
				<div>

					<div>
						<div
							class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
							style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
							<div class="user-profile">
								<a href="/profile"><img src="images/${taiKhoan.anhDaiDien}"
									alt=""></a>
								<div>
									<label for="">${taiKhoan.hoTen}</label>
								</div>
							</div>
							<div class="post-upload-textarea">
								<textarea data-bs-toggle="modal" href="#exampleModalToggle"
									name="" placeholder="Bạn muốn đăng gì?" id="" cols="30"
									rows="1"></textarea>
								<div class="add-post-links">
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#modalId">
										<a data-bs-toggle="modal" href="#exampleModalToggle"><i
											class="fa-regular fa-image"></i> Hình ảnh</a>
									</button>
								</div>
							</div>
						</div>
						<hr>
					</div>
				</div>

				<c:forEach items="${DanhSachBv}" var="BaiViet">
					<div
						class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
						style="margin-bottom: 20px; border-radius: 0; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); padding: 0; padding-top: 10px; padding-bottom: 10px">
						<div style="margin: 0;">
							<div
								style="display: flex; align-items: center; justify-content: space-between; padding-left: 10px">
								<div class="tooltip2">
									<div class="user-profile ">
										<a href="/nguoiDung/${BaiViet.nguoiDung.sdt}"><img
											src="images/${BaiViet.nguoiDung.anhDaiDien}"
											class="img-thumbnail" alt=""></a>
										<div>
											<label class="nhan"><c:if test="${BaiViet.cheDo.maCheDo == 1}">
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
                                            </c:if> </label> <br>
											<small style="font-size: 12px; color: #65676b"> <script
													type="text/javascript">
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
                                                 if(hourDiff === 0 && minuteDiff < 60){
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
										<div class="dropdown-menu baoCao" aria-labelledby="triggerId"
											style="transform: translate(-80%, 39px);">
											<a class="dropdown-item" data-bs-toggle="modal" st
												data-bs-target="#modalBaoCao"
												onclick="toCao(${BaiViet.maBaiViet})">Báo cáo vi phạm</a>
										</div>
									</div>
								</div>
							</div>
							<div style="margin-top: 10px; color: #847577">
								<div onclick="loadBinhLuan(${BaiViet.maBaiViet})">
									<div style="box-sizing: border-box; padding-left: 5px; padding-right: 5px">
									${BaiViet.moTa}
									</div>
									<center>
										<div class="bg-image hover-zoom">
											<img class="lazy " data-src="images/${BaiViet.hinhAnh}"
												width="100%" alt=""
												style="margin-top: 10px; margin-bottom: 10px;">
										</div>

									</center>
								</div>

								<div class="post-reaction" style="padding-left: 10px">
									<div class="activity-icons">
										<div onclick="thichBaiViet(${BaiViet.maBaiViet},this)"
											class="${maBaiVietDaThich.contains(BaiViet.maBaiViet) ? 'red-heart' : 'gray-heart'}">
											<i class="fa-duotone fa-heart"></i> &nbsp; <span
												class="like-count">${BaiViet.luotThich}</span>
										</div>
										<div onclick="loadBinhLuan(${BaiViet.maBaiViet})">
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
			<div class="col-md-6 menuLeft animate__animated animate__backInRight"
				style="position: fixed; top: 70px; right: 5%;">
				<div class="row ">
					<div class="row" style="margin-left: 2px">
						<div class="col-md-6">
							<div
								style="background-color: #f2f2f2; border: 1px solid grey; background: url(images/thoiThiet.webp); background-size: cover; color: #234662; padding: 0; width: 100%; max-height: 188px">
								<div id="weather-info"
									style="background-color: rgba(0, 0, 0, 0.4); margin: 0; padding: 10px; color: #F2E5C9;">
									<h5 style="color: white">Dự báo thời tiết</h5>
									<ul style="font-size: 13px">
										<li><b>Thành phố:</b> <span id="city"></span></li>
										<li><b>Nhiệt độ:</b> <span id="temperature"></span> °C</li>
										<li><b>Mô tả:</b> <span id="description"></span></li>
										<li><b>Độ ẩm:</b> <span id="humidity"></span>%</li>
										<li><b>Tốc độ gió:</b> <span id="wind-speed"></span> m/s</li>
									</ul>
								</div>
							</div>
							<div>
								<a href="/GoiYKB"><label class="nhan">Lời mời kết
										bạn(${SlKb})</label></a>

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
													class="dropdown-item" href="index/dongy/${topKb.maLoiMoi}"
													style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1); font-size: small;">
														<center>Đồng ý</center>
												</a> <a class="dropdown-item"
													href="index/tuchoi/${topKb.maLoiMoi}"
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
														href="index/dongy/${topKb.maLoiMoi}"
														style="background-color: rgba(234, 229, 224, 0.8); border-color: rgba(90, 79, 72, 1);">
														<center>Đồng ý</center>
													</a> <a class="dropdown-item"
														href="index/tuchoi/${topKb.maLoiMoi}"
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

						<div class="col-md-6">
							<a href="/DanhSachBanBe"><label class="nhan"
								style="box-sizing: border-box; padding-left: 10px">Danh
									sách bạn bè(${SlBanbe})</label></a> <br> <br>

							<c:forEach items="${topBanbe}" var="banBe">
								<div
									style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
									<div class="user-profile">
										<c:if test="${banBe.banBe.sdt == sessionScope.sdt}">
											<a href="/nguoiDung/${banBe.nguoiDung.sdt}"> <img
												src="images/${banBe.nguoiDung.anhDaiDien}"
												class="img-thumbnail" alt="" style="border-radius: 50%;">
											</a>
										</c:if>
										<c:if test="${banBe.banBe.sdt != sessionScope.sdt}">
											<a href="/nguoiDung/${banBe.banBe.sdt}"> <img
												src="images/${banBe.banBe.anhDaiDien}" class="img-thumbnail"
												alt="" style="border-radius: 50%;">
											</a>

										</c:if>

										<div>
											<c:if test="${banBe.banBe.sdt == sessionScope.sdt}">
												<label for="">${banBe.nguoiDung.hoTen}</label>
												<br>
												<small style="font-size: 12px"> Hoạt động: <small style="font-size: 12px; color: #65676b"> <script
													type="text/javascript">
                                            var currentTime = new Date();
                                            var activityTime = new Date('${banBe.nguoiDung.thoiGianTruyCap}');
                                            var timeDiff = currentTime.getTime() - activityTime.getTime();
                                            var seconds = Math.floor((timeDiff / 1000)%60);
                                            var minuteDiff = Math.floor((timeDiff / 1000)/60);
                                            var hourDiff = Math.floor(timeDiff / (1000 * 3600));
                                            var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
                                            var monthsDiff = Math.floor(daysDiff / 30);
                                            var yearsDiff = Math.floor(monthsDiff / 12);
											
                                            if (daysDiff === 0) {
                                                 if(hourDiff === 0 && minuteDiff < 60){
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
												</small>
											</c:if>
											<c:if test="${banBe.banBe.sdt != sessionScope.sdt}">
												<label for="">${banBe.banBe.hoTen}</label>
												<br>
												<small style="font-size: 12px"> Hoạt động: <script
													type="text/javascript">
                                            var currentTime = new Date();
                                            var activityTime = new Date('${banBe.banBe.thoiGianTruyCap}');
                                            var timeDiff = currentTime.getTime() - activityTime.getTime();
                                            var seconds = Math.floor((timeDiff / 1000)%60);
                                            var minuteDiff = Math.floor((timeDiff / 1000)/60);
                                            var hourDiff = Math.floor(timeDiff / (1000 * 3600));
                                            var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
                                            var monthsDiff = Math.floor(daysDiff / 30);
                                            var yearsDiff = Math.floor(monthsDiff / 12);
											
                                            if (daysDiff === 0) {
                                                 if(hourDiff === 0 && minuteDiff < 60){
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
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>






						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Modal -->
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
				<form id="postForm" action="/index/dangbai" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="user-profile">
							<img src="images/${taiKhoan.anhDaiDien}" alt="">
							<div>
								<label>${taiKhoan.hoTen} <small style="font-size: 12px">
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
						<textarea name="moTaBaiDang" placeholder="Bạn đang nghĩ gì?" id=""
							cols="30" rows="3"
							style="width: 100%; border: 0px; outline: none; border-bottom: 1px solid #ccc; background: transparent; resize: none;"></textarea>

						<br>
						<center>
							<img id="img" src="" width="45%"
								style="border-radius: 10px; border: 1px solid rgb(184, 182, 182)">
						</center>
					</div>
					<div class="modal-footer">
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupFile01"> <i
								class="fa-regular fa-image"></i>Hình ảnh
							</label> <input type="file" class="form-control" name="photo_file"
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
	<!-- Modal báo cáo -->
	<div class="modal fade" id="modalBaoCao" tabindex="-1" role="dialog"
		aria-labelledby="modalTitleId" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitleId">Nội dung tố cáo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<select name="loaiViPham" id="viPham" class="form-control">
						<c:forEach var="viPham" items="${danhSachViPham}">
							<option value="${viPham.maLoai}">${viPham.chiTiet}</option>
						</c:forEach>
					</select>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary">Báo cáo</button>
				</div>
			</div>
		</div>
	</div>
	<!-- load ảnh -->
	<script>
        let img = document.getElementById('img');
        let input = document.getElementById('inputGroupFile01');
        input.onchange = (e) => {
            if (input.files[0])
                img.src = URL.createObjectURL(input.files[0]);
            
        } 
    </script>

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
            document.querySelector('.dropdown-menu').classList.toggle("dark-mode2");

            document.querySelector('textarea').style.color = "white";
            for (var i = 0; i < navlink.length; i++) {
                navlink[i].style.color = "white";
            }
            for (var i = 0; i < a.length; i++) {
                a[i].style.color = "white";
            }
        }

    </script>

	<script src="${pageContext.request.contextPath}/loadComments.js"></script>
	<script src="${pageContext.request.contextPath}/lazy.js"></script>
	<script src="${pageContext.request.contextPath}/thoiTiet.js"></script>
	<script type="text/javascript">
	  function danhDauDaDoc() {
		    fetch('danhDauDaDoc', { method: 'POST' }) // Gửi yêu cầu POST đến đường dẫn "danhDauDaDoc"
		      .then(response => {
		        // Xử lý kết quả nếu cần
		      })
		      .catch(error => {
		        // Xử lý lỗi nếu có
		      });
		  }
	</script>

</body>

</html>
</html>