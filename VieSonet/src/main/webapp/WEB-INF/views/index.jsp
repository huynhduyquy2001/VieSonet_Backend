<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<title>Trang chủ</title>
</head>

<body>
	<div class="split-background"></div>
	<img src="images/cayTre.png"
		style="position: fixed; right: 0; max-height: 90vh; z-index: -2; opacity: 0.8;"
		alt="">
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
				<div class="menuRight">
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
						<div class="row">
							<div class="col-6">
								<div class="card">
									<div class="card-header">
										<h6 class="nhan">Lời mời kết bạn</h6>
									</div>
									<div class="card-body">
										4 <br>
										<h6>
											<small>Xem tất cả>></small>
										</h6>
									</div>

								</div>
							</div>
							<div class="col-6">
								<div class="card">
									<div class="card-header">
										<h6 class="nhan">Danh sách bạn bè</h6>
									</div>
									<div class="card-body">
										532 <br>
										<h6>
											<small>Xem tất cả>></small>
										</h6>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<b class="nhan">BẢNG TIN</b>
				</div>
				<c:forEach items="DanhSachBv" var="BaiViet">
				</c:forEach>
				<div
					class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
					style="margin-bottom: 20px; border-radius: 0;">
					<div
						style="padding: 10px; border: 1px solid rgba(210, 199, 188, 1); margin: 0;">
						<div
							style="display: flex; align-items: center; justify-content: space-between;">
							<div class="tooltip2">
								<div class="user-profile ">
									<img src="images/avt.jpg" class="img-thumbnail" alt="">
									<div>
										<label for="">${BaiViet.nguoiDung.anhDaiDien}</label> <br> <small>30-4-1975_09:18
											pm</small>
									</div>
								</div>
								<span class="tooltip2-text"> <a href="">
										<div class="row">
											<div class="col-5">
												<img src="images/avt.jpg" class="img-thumbnail" alt="">

											</div>
											<div class="col-7">
												<label for=""><small>Trần Văn Minh Híu</small></label>
											</div>
											<div>

												<center>
													<small> <small>
															<ul style="line-height: 20px; text-align: left;">
																<li><b><i class="fa-light fa-mountain-sun"></i>
																		Quê quán:</b> Đồng Tháp</li>
																<li><i class="fa-regular fa-heart"></i> <b>Mối
																		quan hệ:</b> Độc thân</li>
																<li><b><i class="fa-light fa-user-group"></i>
																		Danh sách bạn bè:</b> 304</li>
															</ul>
													</small>
													</small>
												</center>
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
							<div style="margin-top: 10px;">
								Hôm nay gất là dui đó nghen, hãy like cho tui 1 phát lào mấy a
								zai
								<center>
									<img class="lazy" data-src="images/caMap.jpg" width="100%"
										alt=""
										style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;">
								</center>
								<div class="post-reaction">
									<div class="activity-icons">
										<div>
											<i class="fa-regular fa-thumbs-up"></i> &nbsp; 120
										</div>
										<div>
											<i class="fa-regular fa-comment"></i>&nbsp; 52
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-5 menuLeft"
				style="position: fixed; top: 70px; right: 5%;">
				<div>
					<b class="nhan">ĐĂNG BÀI</b>
				</div>
				<div>
					<div
						class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInRight"
						style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); background-color: white; background-image: url('https://static.showit.co/1600/g7PseL2CSPG9fiMdTX0bNA/63707/3.jpg'); background-size: cover; border-radius: 0;">
						<div class="user-profile">
							<img src="images/avt.jpg" alt="">
							<div>
								<b class="nhan">Huỳnh Duy Quý</b> <br> <small> Công
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
					<hr>
					<div class="row">
						<div class="col-md-6 animate__animated animate__backInLeft">
							<div class="card">
								<div class="card-header">
									<h6 class="nhan">Lời mời kết bạn</h6>
								</div>
								<div class="card-body">
									4 <br>
									<h6>
										<small>Xem tất cả>></small>
									</h6>
								</div>

							</div>
						</div>
						<div class="col-md-6 animate__animated animate__backInRight">
							<div class="card">
								<div class="card-header">
									<h6 class="nhan">Danh sách bạn bè</h6>
								</div>
								<div class="card-body">
									532 <br>
									<h6>
										<small>Xem tất cả>></small>
									</h6>
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
	<!-- load ảnh -->



	<script>
        let img = document.getElementById('img');
        let input = document.getElementById('inputGroupFile01');
        input.onchange = (e) => {
            if (input.files[0])
                img.src = URL.createObjectURL(input.files[0]);
        } 
    </script>
	<script src="main.js"></script>

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
	<script src="js/lazy.js"></script>

</body>

</html>