<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS end -->
<script src="https://kit.fontawesome.com/f737751420.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<title>Đăng nhập</title>
<style>
.ip[type=text], .ip[type=password], .ip[type=email] {
	width: 100%;
	padding: 8px 20px;
	margin: 8px 0;
	border: none;
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
	background: transparent;
	border-radius: 0;
	transition: 0.5s;
	padding-left: 0;
}

.ip:focus {
	border-bottom: 1px solid #3B998B;
	box-shadow: none;
}

.lgin {
	background-color: #0D69B3;
	color: white;
	padding: 2px;
	border: none;
	cursor: pointer;
	width: 40%;
	transition: 0.3s;
	border-radius: 3px;
}

.lgin:hover {
	background: #A59565;
}

.cancelbtn {
	width: auto;
	padding: 7px 18px;
	background-color: #A59565;
	border: none;
	color: white;
	transform: skewX(-20deg);
}

span.psw {
	float: right;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

@media screen and (max-width: 768px) {
	.anhDangNhap {
		display: none;
	}
}
</style>
</head>

<body>
	<div class="split-background"></div>
	<div
		style="position: fixed; right: 0; max-height: 90vh; opacity: 0.15; bottom: 0; z-index: -100;">
		<img src="images/cayTre2.png"
			class="header animate__animated animate__fadeInUp"
			style="max-height: 90vh;" alt="">
	</div>
	<header class="header animationTop3"style="background: transparent;">
		<nav class="navbar navbar-expand-sm navbar-light"
			style="border: none; padding-top: 0; padding-bottom: 0;">
			<div class="container">
				<a class="navbar-brand nhan"
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

						<li class="nav-item"><a class="nav-link" href="/dieukhoan"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Điều
									khoản</small></a></li>

					</ul>
					<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
						<li class="nav-item"><a class="nav-link" href="/dangky"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;"><button
										class="btnBorder" >Đăng kí</button></small></a></li>
					</ul>
				</div>

			</div>
		</nav>
	</header>
	<div>
		<img class="animate__animated animate__rotateInDownLeft"
			src="images/chim-lac-1.png" width="15%"
			style="position: absolute; top: 40px; left: 0;" alt=""> <img
			src="images/hoaSen.png" width="10%"
			class="animate__animated animate__fadeInUp"
			style="position: absolute; bottom: 0; right: 0;" alt="">
		<div class="container" id="loginForm"
			style="width: 60%; min-width: 350px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
			<div class="row" style="padding: 0; border-radius: 10px;">
				<div
					class="col-md-4  col-sm-12 animationTop2 delay-02 img-thumbnail"
					style="padding: 3%; border-radius: 10px; position: relative; background-color: white; box-shadow: 15px 15px 5px rgba(0, 0, 0, 0.1);">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image"
						style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); max-width: 100%; max-height: 80%;">
				</div>
				<div
					class="col-md-8 col-sm-12 animate__animated animate__jackInTheBox img-thumbnail"
					style="padding: 3%; box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.1);">
					<img
						src="images/kisspng-ballpoint-pen-quill-clip-art-crisp-vector-5add507b855400.3244341015244534995461.png"
						alt=""
						style="position: absolute; right: -50px; bottom: 10px; width: 100px;">
					<center>
						<form action="/dangnhap" method="post"
							style="text-align: left; width: 100%;">
							<div class="row">
								<center>
									<h4 class="nhan" style="color: #0D69B3;">
										<b>ĐĂNG NHẬP</b>
									</h4>

									${message }
									<hr style="width: 30%;">
								</center>

								<div class="mb-3">
									<input type="text" class="form-control ip" name="sdt" id=""
										value="${user }" aria-describedby="helpId"
										placeholder="Số điện thoại?" pattern="[0-9]{10}" required>
								</div>
								<div class="mb-3">
									<input type="password" class="form-control ip" name="matKhau"
										id="" value="${pass }" aria-describedby="helpId"
										placeholder="Mật khẩu?" required>
								</div>
								<label><input type="checkbox" name="ghiNho" value="true"><small>Ghi
										nhớ tài khoản?</small></label>
							</div>
							<br>
							<center>
								<button class="lgin" style="background-color: #007ACC;">Đăng
									nhập</button>
							</center>
							<br> <a href="/quenmatkhau"> <small>Quên mật
									khẩu?</small>
							</a>
						</form>
					</center>
				</div>
			</div>
		</div>
	</div>

	<script>
		var loginBtn = document.getElementById("loginBtn");
		var registerBtn = document.getElementById("registerBtn");
		var loginForm = document.getElementById("loginForm");
		var registerForm = document.getElementById("registerForm");

		loginBtn.addEventListener("click", function() {
			loginForm.removeAttribute("hidden");
			registerForm.setAttribute("hidden", "true");
		});

		registerBtn.addEventListener("click", function() {
			loginForm.setAttribute("hidden", "true");
			registerForm.removeAttribute("hidden");
		});
	</script>
</body>

</html>