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

						<li class="nav-item"><a class="nav-link" href="#"><small
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: 'Roboto', sans-serif; letter-spacing: 0.1em;">Điều
									khoản</small></a></li>

					</ul>

				</div>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div>
		<button onclick="guiMa()">Con lạy mười phương chư phật cho con chạy dùm !</button>
	</div>
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
					<form >
						<div class="row">
							<center>
								<h3 style="color: #F27323;">QUÊN MẬT KHẨU</h3>
								<hr style="width: 30%;">
								${message }
							</center>
							<div class="col-md-8">
								<input class="form-control ip" type="text"
									placeholder="Email đăng ký?" name="email"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
							</div>

							<div class="col-md-4">
								<br>
								
							</div>
							
							<br>
							<center>
								<button class="lgin">Xem mật khẩu</button>
							</center>
							
					</form>
					<button class="lgin" >Gửi mã</button>
				</div>
				<br> <a href="" onclick="guiMa()"> Đăng nhập </a> <span class="psw">Chưa
					có <a href="/ASM_Java4/dangKy" style="color: #F5A425;">tài
						khoản?</a>
				</span>

			</div>
		</div>
	</div>
	
	</div>
	
</body>
<script src="${pageContext.request.contextPath}/quenMatKhauLoad.js">
	
</script>
</html>