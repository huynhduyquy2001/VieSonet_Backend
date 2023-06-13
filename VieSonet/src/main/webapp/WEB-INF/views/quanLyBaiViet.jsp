<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        .menuDropdown{
            display: none;
        }
        @media screen and (max-width: 768px) {
            .menuQuanLi{
                display: none;
            }
            .menuDropdown{
                display: block;
            }
            
        }
        
    </style>
    <title>Trang bài viết</title>
</head>

<body style="padding-top: 70px; padding-bottom: 70px; color: #A59565;">
    <div class="split-background"></div>
    <header class="header animationTop3">
		<nav class="navbar navbar-expand-sm navbar-light"
			style="border: none; padding-top: 0; padding-bottom: 0;">
			<div class="container">
				<a class="navbar-brand nhan" href="/"
					style="color: #222; font-weight: bolder; font-family: 'robo';">
					<img src="/images/chimLac.png" height="30px" alt=""> VIE_SONET
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
							href="#" role="button" aria-haspopup="true" aria-expanded="false"><i
								class="fa-regular fa-bell"></i> <span id="soLuongThongBao">(${thongBaoChuaXem})</span></a>
							<div class="dropdown-menu" id="danhSachThongBao"
								style="overflow: hidden; max-height: 60vh; overflow-y: scroll; left: -100px">
								<c:forEach items="${thongBao}" var="item">
									<a onclick="loadBinhLuan(${item.baiViet.maBaiViet})">
										<div class="user-profile"
											style="width: 250px; padding-left: 3%;">
											<img src="${pageContext.request.contextPath}/images/${item.nguoiDung.anhDaiDien}" alt="">
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
                                document.write('<fmt:formatDate value="${item.ngayThongBao}"
										pattern="dd-MM-yyyy HH:mm" />');
                            }
                        </script>
													</small> <small style="font-size: 12px"><a
														style="cursor: pointer;"
														onclick="xoaThongBao(${item.maThongBao})">x</a></small>
												</div>
											</div>
										</div>

									</a>
								</c:forEach>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							class="nav-link dropdown-toggle" href="/profile" id="dropdownId"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><small><img
									src="/images/${taiKhoan.anhDaiDien}" width="30px"
									style="border-radius: 50%; border: 1px solid gray" alt=""></small></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId"
								style="padding-left: 3px; left: -100px; line-height: 35px">
								<a class="dropdown-item" href="/profile"> <small>Xem
										trang cá nhân</small></a> <a class="dropdown-item" href="/DanhSachBanBe">
									<small>Danh sách bạn bè</small>
								</a> <a class="dropdown-item" href="/GoiYKB"> <small>Lời
										mời kết bạn</small></a> 
										<c:if test="${sessionScope.vt == 2 || sessionScope.vt == 3}">
										  <!-- Nội dung chỉ hiển thị khi có vai trò 'admin' -->
										  <a class="dropdown-item" href="/quanly/quanLyBaiViet"> <small>Quản lý</small></a>
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
    <div class="container">
        <div class="row">
            <div class="col-md-3 img-thumbnail nenTrangChu menuQuanLi animate__animated animate__backInLeft" style="border-radius: 0; padding: 8px;">
                <div style="min-height: 80vh; position: relative; padding: 7px; padding-top: 50px; border: 1px solid rgba(210,199,188,1);">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanlyvipham" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;&nbsp;
                                <small><label>Quản lý vi phạm</label></small>
                            </a>
                        </li>
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanLyNguoiDung" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-solid fa-users"></i>&nbsp;&nbsp;
                                <small><label>Quản lý người dùng</label></small>
                            </a>
                        </li>
                        
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/quanly/quanLyBaiViet" class="nav-link" style=" border-radius: 0;">
                                <i class="fa-sharp fa-regular fa-list-dropdown"></i>&nbsp;&nbsp;
                                <small><label>Quản lý bài viết</label></small>
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
            <div class="col-md-9 animate__animated animate__backInRight " style="padding-left: 3%; padding-right: 3%; padding-top: 2%; border-right: 1px solid rgba(210,199,188,1);">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                            type="button" role="tab" aria-controls="home" aria-selected="true">Danh sách tố cáo</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">Danh sách bài viết vi phạm</button>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="table-responsive" style="overflow-y: hidden;overflow-y: scroll; height: 73vh;">
                            <table class="table  table-responsive">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center">Mã bài viết</th>
                                        <th scope="col" class="text-center">Số lượt bị báo cáo</th>
                                        <th scope="col" class="text-center">Tình trạng</th>
                                        <th scope="col" class="text-center">Tác vụ</th>
                                    </tr>
                                </thead>
                                <tbody id="tableLoad">
                                    <c:forEach var="ds" items="${dsToCao}">
                                       <tr>
                                        <td class="anNoiDung text-center">${ds.maBaiViet}</td>
                                        <td class="anNoiDung text-center" style=" max-width: 250px;">
                                            <small>${ds.soLuong}</small>
                                        </td>
                                        <td class="text-center"> <small>${ds.soLuong > 3 ?'Vi Phạm':'Xem xét'}</small> </td>
                                        <td class="text-center">
                                            <a href="#" onclick="chiTietBaiViet(${ds.maBaiViet})" data-bs-placement="top" title="Xem chi tiết bài viết"
                                                style="background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;"
                                                class="btn btn-info btn-sm info-button">
                                                <i class="fa-light fa-eye"></i>
                                            </a>
                                            <a href="#" onclick="danhDauViPham(${ds.maBaiViet})" data-bs-placement="top" title="Đánh dấu vi phạm"
                                                style="background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;"
                                                class="btn btn-info btn-sm info-button">
                                                <i class="fa-solid fa-flag-pennant"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive" style="overflow-y: hidden;overflow-y: scroll; height: 73vh;">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th scope="col">Ngày đăng</th>
                                        <th scope="col">Người đăng</th>
                                        <th scope="col" class="text-center">Tác vụ</th>
                                    </tr>
                                </thead>
                                <tbody id="tableLoad2">
                                    <c:forEach var="ds" items="${dsViPham}">
                                    	<tr>
                                        <td class="anNoiDung" style="max-width: 150px;"><small> 
                                        <script type="text/javascript">
                                        document.write('<fmt:formatDate value="${ds.ngayDang}"
        										pattern="dd-MM-yyyy" />');
                                        </script>
                                         </small>
                                        </td>
                                        <td class="anNoiDung" style=" max-width: 250px;">
                                            <small>${ds.hoTen}</small>
                                        </td>
                                        <td class="text-center">
                                        <a onclick="xemBaiViet(${ds.maBaiViet})" href="#" data-bs-placement="top" title="Xem chi tiết bài viết"
                                                style="background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;"
                                                class="btn btn-info btn-sm info-button">
                                                <i class="fa-light fa-eye"></i> 
                                                
                                            </a>
                                            <a data-bs-toggle="tooltip" data-bs-placement="top" title="Gỡ khỏi danh sách vi phạm"
                                                href="#" onclick="xoaBaiVietViPham(${ds.maBaiViet})"
                                                style="background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;"
                                                class="btn btn-info btn-sm info-button">
                                                <i class="fa-solid fa-file-import"></i> 
                                            </a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal 1-->
        <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modalBody">
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
		</div>
        
    <script type="text/javascript" src="${pageContext.request.contextPath}/loadQuanLyBaiViet.js"></script>
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

</body>

</html>