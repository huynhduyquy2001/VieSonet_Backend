<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
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
</head>

<body>
	<div
		style="position: fixed; right: 0; max-height: 90vh; opacity: 0.1; bottom: 0;">

	</div>
	<!-- <img src="images/sunset-reduced.jpg" style="position: fixed; left: 0; max-height: 100vh; z-index: -2; width: 100%; top: 40px; opacity: 0.4; bottom: 0; height: 100%; object-fit: cover;" alt=""> -->
	<!-- style="box-shadow: 0 1px 2px rgb(0 0 0 / 10%);" -->
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
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: sans-serif; font-variant: small-caps; letter-spacing: 0.1em; color: black;">Trang
								chủ <span class="visually-hidden">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: sans-serif; font-variant: small-caps; letter-spacing: 0.1em; color: black;">Điều
									khoản</small></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: sans-serif; font-variant: small-caps; letter-spacing: 0.1em; color: black;">Quản
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
									src="images/avt.jpg" width="30px" style="border-radius: 50%;"
									alt=""></small></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId"
								style="width: 350px; padding-left: 3px;">
								<div class="profile-darkButton">
									<div class="user-profile">
										<img src="images/avt.jpg" alt="">
										<div>
											<p>Alex Carry</p>
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
			<div class="col-md-6">
				<div >
					<div>
						<b class="nhan">ĐĂNG BÀI</b>
					</div>
					<div>
						<div class="write-post-container nenTrangChu img-thumbnail"
							style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
							<div class="user-profile">
								<img src="images/avt.jpg" alt="">
								<div>
									<label for="">Huỳnh Duy Quý</label> <br>s <small>
										Công khai <i class="fas fa-caret-down"></i>
									</small>
								</div>
							</div>
							<div class="post-upload-textarea">
								<textarea data-bs-toggle="modal" href="#exampleModalToggle"
									name="" placeholder="Bạn muốn đăng gì?" id="" cols="30"
									rows="1"></textarea>
								<div class="add-post-links">
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#modalId">
										<a href="#"><i class="fa-regular fa-image"></i>
											Photo/Video</a>
									</button>
								</div>


							</div>

						</div>
						<hr>
						
					</div>
				</div>
				<div>
					<b class="nhan">BẢNG TIN</b>
				</div>
				<c:forEach items="${DanhSachBv}" var="BaiViet">
					<div
						class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
						style="margin-bottom: 20px; border-radius: 0; box-shadow: 0 0 0;">
						<div
							style="padding: 10px; border: 1px solid rgba(210, 199, 188, 1); margin: 0;">
							<div
								style="display: flex; align-items: center; justify-content: space-between;">
								<div class="tooltip2">
									<div class="user-profile ">
										<img src="images/${BaiViet.nguoiDung.anhDaiDien}"
											class="img-thumbnail" alt="">
										<div>
											<label class="nhan">${BaiViet.nguoiDung.hoTen}</label> <br>
											<small style="font-size: 12px; color: #65676b">${BaiViet.ngayDang}</small>
										</div>
									</div>
									<span class="tooltip2-text"> <a href="">
											<div class="row">
												<div class="col-5">
													<img src="images/${BaiViet.nguoiDung.anhDaiDien}"
														class="img-thumbnail" alt="">
												</div>
												<div class="col-7" style="padding: 0; margin: 0;">
													<label for="" style="padding: 0; margin: 0;"> <small>${BaiViet.nguoiDung.hoTen}</small>
													</label> <small><small> <small>
																<ul style="line-height: 20px; text-align: left;">
																	<li><b><i class="fa-light fa-mountain-sun"></i>
																			Quê quán:</b> ${BaiViet.nguoiDung.diaChi}</li>
																	<li><i class="fa-regular fa-heart"></i> <b>Mối
																			quan hệ:</b> ${BaiViet.nguoiDung.moiQuanHe}</li>
																	<li><b><i class="fa-light fa-user-group"></i>
																			Danh sách bạn bè:</b> ??</li>
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
										<div class="dropdown-menu" aria-labelledby="triggerId">
											<a class="dropdown-item" href="#">Báo cáo vi phạm</a>
										</div>
									</div>
								</div>
							</div>
							<a href="">
								<div style="margin-top: 10px; color: #847577">
									${BaiViet.moTa}
									<center>
										<img class="lazy" data-src="images/${BaiViet.hinhAnh}"
											width="100%" alt=""
											style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;">
									</center>
							</a>
							<div class="post-reaction">
								<div class="activity-icons">
									<div>
										<i class="fa-regular fa-thumbs-up"></i> &nbsp;
										${BaiViet.luotThich}
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
		<div class="col-md-5 menuLeft"
			style="position: fixed; top: 70px; right: 5%;">
			<div class="row animate__animated animate__backInLeft">
				<div class="row" style="margin-left: 2px">
				<div class="col-md-6">
				<div 
					style="background-color: #f2f2f2; border-radius: 5px; border: 1px solid grey; background: url(images/thoiThiet.webp); background-size: cover; color: #234662; padding: 0; width: 100%; max-height: 188px">
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
				<hr>
				<div>
				<div>
                        <div class="user-profile">
                            <img src="images/avt.jpg" class="img-thumbnail" alt="">
                            <div>
                                <label for="">Trần Văn Minh Híu</label>
                                <small style="display: flex;">
                                    <a class="dropdown-item" href="#"
                                        style="background-color: rgba(234,229,224,0.8);border-color: rgba(90,79,72,1); font-size: small;">
                                        <center>Đồng ý</center>
                                    </a>
                                    <a class="dropdown-item" href="#"
                                        style="background-color: #A89386; color: white; font-size: small;">
                                        <center>Xóa</center>
                                    </a>
                                </small>
                            </div>
                        </div>
                        <div>
                            <div class="btn-group">
                                <div class="dropdown-menu" aria-labelledby="triggerId" style="padding: 0;">
                                    <a class="dropdown-item" href="#"
                                        style="background-color: rgba(234,229,224,0.8);border-color: rgba(90,79,72,1);">
                                        <center>Đồng ý</center>
                                    </a>
                                    <a class="dropdown-item" href="#" style="background-color: #A89386; color: white;">
                                        <center>Xóa</center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
				</div>
				
				<div class="col-md-6">
					<label class="nhan" style="box-sizing: border-box; padding-left: 10px">Danh sách bạn bè(113)</label>
					<br> <br>
                        <div
                            style=" display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                            <div class="user-profile">
                                <img src="images/avt.jpg" class="img-thumbnail" alt="" style="border-radius: 50%;">
                                <div>
                                    <label for="">Huỳnh Tuấn Vỹ</label> <br>
                                    <small style="font-size: 12px">Hoạt động: 1 phút trước</small>
                                </div>
                            </div>
                            <div>
                                <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div>
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
				<div class="modal-body">
					<div class="user-profile">
						<img src="images/avt.jpg" alt="">
						<div>
							<p>Alex Carry</p>
							<small>
								<div>
									<select style="border: none; background-color: transparent;">
										<option selected>Công khai</option>
										<option value="">Bạn bè</option>
										<option value="">Chỉ mình tôi</option>
									</select>
								</div>
							</small>
						</div>
					</div>
					<br>
					<textarea name="" placeholder="Bạn muốn đăng gì?" id="" cols="30"
						rows="3"
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
							class="fa-regular fa-image"></i>Photo/Video
						</label> <input type="file" class="form-control" id="inputGroupFile01">
					</div>

					<button
						style="width: 500px; background-color: #5A4F48; border: none;"
						class="btn btn-primary" data-bs-target="#exampleModalToggle2"
						data-bs-toggle="modal" data-bs-dismiss="modal">Đăng bài</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal hiện danh sách bình luận -->
	<div class="modal fade" id="danhSachBinhLuan" tabindex="-1" role="dialog"
                        aria-labelledby="modalTitleId" aria-hidden="true">
                        <div class="modal-dialog modal-sm modal-fullscreen" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="row">
                                        <div data-bs-dismiss="modal" style="cursor: pointer;">X</div>
                                        <div class="col-md-6 trai order-sm-2 col-xs-12 order-1">
                                            
                                        </div>
                                        <div class="col-md-6 phai order-sm-1 col-xs-12">
                                            
                                        </div>

                                    </div>
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
</body>

</html>
</html>