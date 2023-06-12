<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
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
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f737751420.js"></script>
<link rel="stylesheet" href="style.css">
<title>Quên mật khẩu</title>
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
	background-color: #F27323;
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
</style>
</head>

<body>
	<div class="split-background"></div>
	<header class="header animationTop3">
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

						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Điều
									khoản</small></a></li>

					</ul>

				</div>
			</div>
		</nav>
	</header>

	<div>
		<img class="animate__animated animate__fadeInDown"
			src="images/chim-lac-1.png" width="15%"
			style="position: absolute; top: 40px; left: 0;" alt=""> <img
			src="images/hoaSen.png" width="10%"
			class="animate__animated animate__fadeInUp"
			style="position: absolute; bottom: 0; right: 0;" alt="">
		<div class="container"
			style="width: 60%; min-width: 350px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
			<div class="row" style="padding: 0; border-radius: 10px;">
				<div class="col-md-4  col-sm-12 animationTop2 img-thumbnail"
					style="padding: 3%; border-radius: 10px; position: relative; background-color: white; box-shadow: 15px 15px 5px rgba(0, 0, 0, 0.1);">
					<img
						src="https://img.stickers.cloud/packs/eb138055-05e0-4a23-8a7f-748298e46252/png/6fbef0b0-7c9b-4c4f-9629-d03b3709f9de.png"
						class="img-fluid" alt="Sample image"
						style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); max-width: 100%; max-height: 80%;">
				</div>
				<div
					class="col-md-8 col-sm-12 img-thumbnail animate__animated animate__backInRight"
					style="padding: 3%; box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.1);">

					<div class="row">
						<center>
							<h3 style="color: #F27323;">QUÊN MẬT KHẨU</h3>
							<hr style="width: 30%;">
							<div id="message"></div>
						</center>
						<div class="col-md-7">
							<input class="form-control ip" type="text"
								placeholder="Email đăng ký?" id="email"
								>
						</div>

						<div class="col-md-5">
							<br>
							<button class="lgin" onclick="guiMa()">Gửi mã</button>
						</div>
						<div class="col-md-12">
							<br> <input class="form-control ip" type="text"
								placeholder="Mã đã cung cấp" id="matMa">
						</div>
						<center>
							<button class="lgin" onClick="xemMatKhau()">Xác nhận</button>
						</center>
					</div>
					<br> <a href="/dangnhap"> Đăng nhập </a> <span class="psw">Chưa
						có <a href="/dangky" style="color: #F5A425;">tài
							khoản?</a>
					</span>

				</div>
			</div>
		</div>

	</div>

</body>
<script >
function guiMa() {
	var email = document.getElementById("email").value;

	if (!email) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập địa chỉ email";
		return;
	}
	
	$.ajax({
		url: "/quenmatkhau/guima",
		type: "GET",
		data: {
			mail: email
		},
		success: function(data) {
			var tb = data;
			var mess = document.getElementById("message");
			mess.innerHTML = "";
			mess.innerHTML += tb;
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}


function xemMatKhau() {
	var matMa = document.getElementById("matMa").value;
	var email = document.getElementById("email").value;
	if (!email) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập địa chỉ email";
		return;
	}
	if (!matMa) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập mật mã đã gửi hoặc bấm vào nút gửi mã nếu chưa";
		return;
	}

	$.ajax({
		url: "/quenmatkhau/xemmatkhau",
		type: "GET",
		data: {
			ma: matMa,
			mail: email
		},
		success: function(data) {
			if (data == "Mật mã đúng") {
				window.location.href = "/DoiMatKhau";
			}else{
				var mess = document.getElementById("message")
				mess.innerHTML = data;
			}

		}
	});
}

</script>
</html>