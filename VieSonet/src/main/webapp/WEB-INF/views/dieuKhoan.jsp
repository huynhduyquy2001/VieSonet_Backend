<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>


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

<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Alumni+Sans+Inline+One&family=Bangers&family=Chakra+Petch:ital,wght@0,400;1,300;1,400;1,700&family=Grenze&family=Patrick+Hand&family=Roboto&display=swap"
	rel="stylesheet">

<title>Điều khoản Viesonet</title>
</head>

<body style="padding-top: 55px; padding-bottom: 55px;">
	
	<!-- style="box-shadow: 0 1px 2px rgb(0 0 0 / 10%);" -->
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
	<div class="container ">
		<div class="row">
			<div class="col-md-6 img-thumbnail">
				<div style="padding: 4%;">
					<h4 class="nhan">
						<b>Điều khoản dịch vụ</b>
					</h4>
					<div style="text-align: justify;">
						Chúng tôi tạo ra các công nghệ và dịch vụ nhằm hỗ trợ mọi người
						kết nối với nhau, xây dựng cộng đồng cũng như phát triển doanh
						nghiệp. Các Điều khoản này điều chỉnh việc bạn sử dụng Facebook,
						Messenger và các sản phẩm, tính năng, ứng dụng, dịch vụ, công nghệ
						cũng như phần mềm khác mà chúng tôi cung cấp (Sản phẩm của Chúng
						tôi hoặc Sản phẩm), trừ khi chúng tôi nêu rõ là áp dụng các điều
						khoản riêng (và không áp dụng các điều khoản này). Các Sản phẩm
						này do Chúng tôi Platforms, Inc. cung cấp cho bạn. <br> Bạn
						không mất phí sử dụng Facebook hay các sản phẩm và dịch vụ khác
						thuộc phạm vi điều chỉnh của những Điều khoản này, trừ khi chúng
						tôi có quy định khác. Thay vào đó, doanh nghiệp, tổ chức và những
						cá nhân khác sẽ phải trả tiền cho chúng tôi để hiển thị quảng cáo
						về sản phẩm và dịch vụ của họ cho bạn. Khi sử dụng Sản phẩm của
						chúng tôi, bạn đồng ý để chúng tôi hiển thị quảng cáo mà chúng tôi
						cho rằng có thể phù hợp với bạn và sở thích của bạn. Chúng tôi sử
						dụng dữ liệu cá nhân của bạn để xác định những quảng cáo được cá
						nhân hóa sẽ hiển thị cho bạn.
					</div>
				</div>
			</div>
			<div class="col-md-6 img-thumbnail">
				<div style="padding: 4%;">
					<h4 class="nhan">
						<b>Chính sách quyền riêng tư</b>
					</h4>
					<div style="text-align: justify;">Chúng tôi muốn bạn nắm được
						loại thông tin chúng tôi thu thập, cũng như cách chúng tôi sử dụng
						và chia sẻ thông tin đó. Vì thế, bạn nên đọc Chính sách quyền
						riêng tư của chúng tôi. Như vậy, bạn sẽ sử dụng Sản phẩm của Chúng
						tôi theo cách phù hợp với mình. Chính sách quyền riêng tư giải
						thích cách chúng tôi thu thập, sử dụng, chia sẻ, lưu giữ và chuyển
						thông tin. Chúng tôi còn cho biết những quyền bạn có. Từng mục
						trong Chính sách này đều cung cấp ví dụ hữu ích và sử dụng cách
						diễn đạt đơn giản hơn để các biện pháp của chúng tôi trở nên dễ
						hiểu. Ngoài ra, chúng tôi đã thêm liên kết đến các thông tin và
						nguồn lực để bạn có thể tìm hiểu thêm về những chủ đề liên quan
						đến quyền riêng tư mà bạn quan tâm. Chúng tôi thấy rằng bạn cần
						phải biết cách kiểm soát quyền riêng tư của mình. Do đó, chúng tôi
						cũng sẽ chỉ cho bạn nơi bạn có thể quản lý thông tin trong phần
						cài đặt Sản phẩm của Chúng tôi mà bạn sử dụng. Bạn có thể để định
						hình trải nghiệm của mình.</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="col-md-12 img-thumbnail">
			<h4 class="nhan">
				<b>Chúng tôi làm gì để giữ cho Viesonet luôn là môi trường lành
					mạnh cho mọi người?</b>
			</h4>
			Chúng tôi đề ra những quy định mà mọi người bắt buộc phải né tránh <br>
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">HÀNH VI
							PHẠM TỘI VÀ BẠO LỰC</button>
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="true" aria-controls="collapseTwo">NỘI
							DUNG PHẢN CẢM</button>
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="true" aria-controls="collapseThree">TÍNH
							TOÀN VẸN VÀ TÍNH XÁC THỰC</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body" style="color: #5A4F48;">
							<ul>
								<li>Ngôn từ gây thù ghét</li>
								<li>Nội dung bạo lực và phản cảm</li>
								<li>Ảnh khỏa thân người lớn và hoạt động tình dục</li>
								<li>Gạ gẫm tình dục</li>
							</ul>
						</div>
					</div>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body" style="color: #5A4F48;">
							<ul>
								<li>Bạo lực và khích nộ</li>
								<li>Cá nhân và tổ chức nguy hiểm</li>
								<li>Cấu kết gây hại và cổ xúy tội ác</li>
								<li>Hàng hóa và dịch vụ bị hạn chế</li>
								<li>Gian lận và lừa đảo</li>
							</ul>
						</div>
					</div>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body" style="color: #5A4F48;">
							<ul>
								<li>Danh tính thực và tính toàn vẹn của tài khoản</li>
								<li>Hành vi gian dối</li>
								<li>Thông tin sai lệch</li>
								<li>An ninh mạng</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
			<ul>

			</ul>
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

	<!-- <script>
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


    </script> -->
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