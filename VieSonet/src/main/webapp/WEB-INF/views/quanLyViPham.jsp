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
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f737751420.js"></script>
<link rel="stylesheet" href="/style.css">
    <title>Quản lý vi phạm</title>
    <style>
        .menuDropdown {
            display: none;
        }

        @media screen and (max-width: 768px) {
            .menuQuanLi {
                display: none;
            }

            .menuDropdown {
                display: block;
            }

        }
    </style>
</head>

<body>
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
    <div class="container" style="margin-top: 60px;">

        <div class="row">
            <div class="col-md-3 img-thumbnail nenTrangChu menuQuanLi animate__animated animate__backInLeft" style="border-radius: 0; padding: 8px;">
                <div style="min-height: 80vh; position: relative; padding: 7px; padding-top: 50px; border: 1px solid rgba(210,199,188,1);">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanlyvipham" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;&nbsp;
                                <small><label>Quản lí vi phạm</label></small>
                            </a>
                        </li>
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanLyNguoiDung" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-solid fa-users"></i>&nbsp;&nbsp;
                                <small><label>Quản lí người dùng</label></small>
                            </a>
                        </li>
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanLyBaiViet" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-sharp fa-regular fa-list-dropdown"></i>&nbsp;&nbsp;
                                <small><label>Quản lí bài viết</label></small>
                            </a>
                        </li>
                        
                        <c:if test="${sessionScope.vt == 3}">
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/thongKe" class="nav-link" style="border-radius: 0;">
                                <i class="fa-solid fa-chart-column"></i> &nbsp;&nbsp;
                                <small><label for="">Thống kê</label></small>
                            </a>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 animate__animated animate__backInRight "
                style="padding-left: 3%; padding-right: 3%;  border-right: 1px solid rgba(210,199,188,1);">
                       <div class="row">
                            <div class="col-7 mt-5">
                                <h5><b>Danh sách</b></h5>
                                <hr>
                                <div class="table-responsive"  style="overflow-y: hidden;overflow-y: scroll; height: 70vh;">
                                    <table class="table table-responsive table-hover" border="1px">
                                        <thead>
                                            <tr>
                                                <th style="width: 25%;">  
                                                    Mã vi phạm
                                                </th>
                                                <th>
                                                    Loại vi phạm
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ds}" var="item">
                                            <tr>
                                                <td style="padding-left: 40px;">
                                                    ${item.maLoai }
                                                </td>
                                                <td >
                                                    ${item.chiTiet }
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-5 mt-5">
                                <div class="mb-3 mt-5">
                                    <label for="" class="form-check-label">Mã vi phạm</label>
                                    <input type="text" class="form-control ip" id="maViPham"  
                                        aria-describedby="helpId" placeholder="Nhập..." pattern="[0-9]*" required>
                                </div>
                                <div class="mb-3 mt-2">
                                    <label for="" class="form-check-label">Loại vi phạm</label>
                                    <input type="text" class="form-control ip" id="chiTiet" 
                                        aria-describedby="helpId" placeholder="Nhập..." required>
                                </div>
                                <div id="message"></div>
                                <div class="mb-3 mt-5">        
                                  
                                    <button type="button" class="btn btn-danger" style="background-color: #368E9D; border: transparent" onclick="them()">Thêm</button>
                                    <button type="button" class="btn btn-danger" onclick="sua()">Sửa</button>  
                                </div>
                            </div>
                    
                       </div>
            </div>
        </div>

    </div>

    <!-- load áº£nh -->
   
    <script>
        var header = document.querySelector('header');
        var lastScrollTop = 0;
        window.addEventListener('scroll', function () {
            var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            if (lastScrollTop == 0) {
                document.getElementById("container").style.marginTop = "70px";
            }
            if (scrollTop > lastScrollTop) {
                header.classList.add('hidden');
                document.getElementById("container").style.marginTop = "10px";
                document.getElementById("tinTuc").style.top = "10px";
                document.getElementById("danhSachBanBe").style.top = "10px";

            } else if (scrollTop < lastScrollTop) {
                header.classList.remove('hidden');
                document.getElementById("container").style.marginTop = "70px";
                document.getElementById("tinTuc").style.top = "70px";
                document.getElementById("danhSachBanBe").style.top = "70px";
            }
            lastScrollTop = scrollTop;
        });


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
<script src="${pageContext.request.contextPath}/qLiViPhamLoad.js"></script>
</body>

</html>