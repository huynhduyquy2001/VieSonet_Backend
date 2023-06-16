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
	<img src="" class="animate__animated animate__fadeInUp"
		style="position: fixed; right: 0; max-height: 90vh; z-index: -2;"
		alt="">
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
								<c:if test="${empty thongBao}"> <small>Bạn chưa có thông báo nào!</small> </c:if>

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
				<div
					style="border: 1px solid rgba(210, 199, 188, 1); padding: 10px;">
					<h5>
						<b class="nhan">Danh sách tìm kiếm</b>
					</h5>
					<hr width="30%" style="opacity: 0.1;">
					<!-- Hiện tìm kiêm danh sách bạn bè của người dùng  -->
						${message}
					<div class="row" id="danhSachTimKiem"
						style="padding: 10px; overflow-y: hidden; overflow-y: scroll; max-height: 85vh;">

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	function timKiem() {
	    $("#timKiemForm").submit(function(event) {
	        event.preventDefault();
	    });
	    const tuKhoa = document.getElementById("tuKhoaCuaToi").value.trim();
	    
	    const input = document.getElementById("tuKhoaCuaToi");
		const output = document.getElementById("output");
		output.innerHTML = input.value;
	    
	    const regex = /^(0\d{9}|0\d{11})$/;
	    if (regex.test(tuKhoa)) {
	        // Thực hiện cuộc gọi AJAX để tìm kiếm số điện thoại
	        $.ajax({
	            url: "timKiemsdt",
	            type: "POST",
	            data: {
	                tuKhoaCuaToi: tuKhoa
	            },
	            success: function(data) {
	               
	                if (data.startsWith("/nguoiDung/")) {
	                    // Nếu dữ liệu trả về là một đường dẫn chuyển hướng
	                    window.location.href = data;
	                } else {
	                    // Nếu dữ liệu trả về là thông báo lỗi
	                    alert(data); // Hiển thị thông báo lỗi trong console
	                }
	                
	            },
	            error: function(xhr, status, error) {
	                
	            }
	        });
	    } else {
	        
	        // Thực hiện cuộc gọi AJAX để tìm kiếm theo tên
	        $.ajax({
	            url: "timKiemTheoTen",
	            type: "POST",
	            data: {
	                tuKhoaCuaToi: tuKhoa
	            },
	            success: function(data) {
	                $("#danhSachTimKiem").empty();
	                data.forEach(function(item) {
	                    var currentTime = new Date();
	                    var activityTime = new Date(item[4]);
	                    var timeDiff = currentTime.getTime() - activityTime.getTime();
	                    var seconds = Math.floor((timeDiff / 1000) % 60);
	                    var minuteDiff = Math.floor(timeDiff / (1000 * 60));
	                    var hourDiff = Math.floor(timeDiff / (1000 * 3600));
	                    var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
	                    var monthsDiff = Math.floor(daysDiff / 30);
	                    var yearsDiff = Math.floor(monthsDiff / 12);

	                    var timeString = "";
	                    if (daysDiff === 0) {
	                        if (minuteDiff === 0) {
	                            timeString = seconds + " giây trước";
	                        } else if (hourDiff === 0 && minuteDiff < 60) {
	                            timeString = minuteDiff + " phút trước";
	                        } else if (minuteDiff > 60) {
	                            timeString = hourDiff + " giờ trước";
	                        }
	                    } else if (daysDiff < 1) {
	                        timeString = "1 ngày trước";
	                    } else if (monthsDiff < 1) {
	                        timeString = daysDiff + " ngày trước";
	                    } else if (yearsDiff < 1) {
	                        timeString = monthsDiff + " tháng trước";
	                    }

	                    var html = '<div class="col-md-6" style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">' +
	                        '<div class="user-profile">' +
	                        '<a href="/nguoiDung/' + item[2] + '">' +
	                        '<img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;">' +
	                        '</a>' +
	                        '<div>' +
	                        '<label for="">' + item[0] + '</label><br>' +
	                        '<small style="font-size: 12px; color: #65676b">' + timeString + '</small>' +
	                        '</div>' +
	                        '</div>' +
	                        '<div>' +
	                        '</div>' +
	                        '</div>';

	                    $("#danhSachTimKiem").append(html);
	                });
	            },
	            error: function(xhr, status, error) {
	                console.log(error); // Thông báo lỗi nếu có
	            }

	        });
	    }
	}


	</script>
	
</body>

</html>