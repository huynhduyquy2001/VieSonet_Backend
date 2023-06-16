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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/f737751420.js"></script>
    <link rel="stylesheet" href="/style.css">
    <title>Thống kê</title>
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
    <div class="container" style="margin-top: 50px;">
        <div class="row" style="margin: 0; padding: 0;">
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
            <div class="col-md-9 animate__animated animate__backInRight" style="background-color: white;">
                <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 10px;">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                            data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                            aria-selected="true">Bài viết vi phạm & số lượt báo cáo</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                            data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane"
                            aria-selected="false">Số người đăng ký tài khoản</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                            data-bs-target="#three-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane"
                            aria-selected="false">Bài viết có lượt thích cao nhất</button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
                        aria-labelledby="pills-home-tab" tabindex="0">
                        <!-- Chart line -->
                        <div class="card"> <br>
                        <div class="col-4" style="padding-left: 20px"> 
                         		<form class="input-group">
                         			<select class="form-control" name="Nam" id="Nam">
                            			<option value="0" selected="selected">Chọn năm</option>
                            			<c:forEach var="n" items="${NamHienCo}">
                            				<option value="${n.nam}">${n.nam}</option>
                            			</c:forEach>
                            	</select>
                            	<button onclick="thongKe1()" type="button" class="btn btn-primary">Xem</button>
                         		</form>		
                         </div>
                            <div class="card-body">
                            	<br>
                                <div class="position-relative mb-4" id="bieuDo1">
                                    <canvas id="visitors-chart" ></canvas>
                                </div>
                                <div class="d-flex flex-row justify-content-end">
                                    <span class="mr-2">
                                        <i class="fas fa-square" style="color: #3B998B; font-size: 15px;"></i> <span style="font-size: 12px;">Bài viết vi phạm</span>
                                    </span>
                                    &nbsp; &nbsp; &nbsp;
                                    <span>
                                        <i class="fas fa-square" style="color: #E53F31; font-size: 15px;"></i> <span style="font-size: 12px;">Số lượt báo cáo</span> 
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="pills-profile-tab"
                        tabindex="0">
                        <div class="card"> <br>
                        <div class="col-4"> 
                         <div class="input-group">
                         &nbsp&nbsp&nbsp
                         		<select class="form-control" id="chonNam">
                            			<option value="0" selected="selected">Chọn năm</option>
                            			<c:forEach var="n" items="${NamHienCo1}">
                            				<option value="${n.nam}">${n.nam}</option>
                            			</c:forEach>
                            	</select>
                            	<button onclick="thongKe2()" type="button" class="btn btn-primary">Xem</button>
                         </div>   		
                         </div> 
                            <div class="card-body">
                                <div class="position-relative mb-4" id="bieuDo2">
                                    <canvas id="myChart" height="150"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="tab-pane fade" id="three-tab-pane" role="tabpanel" aria-labelledby="pills-contact-tab"
                    tabindex="0">
                    <div class="row">
                        <div class="col-4">
                            <div class="input-group mt-2">
                                <input type="date" id="date" name="date" class="form-control">
                                <button type="button" onclick="thongKe3()" class="btn btn-info">Lọc</button>
                            </div>
                            <hr width="450px">
                        </div>
                        <div class="col-12">
                            <div style="overflow-y: hidden;overflow-y: scroll; height: 70vh;">
                                <div class="table-responsive">
                                    <table class="table table-responsive">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%" class="text-center"> 
                                                    Hình Ảnh
                                                </th>
                                                <th style="width: 15%">
                                                    Mã bài viết
                                                </th>
                                                <th style="width: 15%">
                                                    Người đăng
                                                </th>
                                                <th style="width: 30%;">
                                                    Mô tả
                                                </th>
                                                <th style="width: 10%"> 
                                                    Lượt thích
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableLoad">
                                            <c:forEach var="tk" items="${tkLuotThich}">
                                            	 <tr>
                                                <td class="text-center">
                                                    <img alt="${tk.hinhAnh}" class="table-avatar" src="/images/${tk.hinhAnh}"
                                                        width="65%" style="border-radius: 6px;">
                                                </td>
                                                <td style="padding-top: 25px;">
                                                    ${tk.maBaiViet}
                                                </td>
                                                <td style="padding-top: 25px;">
                                                    ${tk.nguoiDang}
                                                </td>
                                                <td style="padding-top: 25px;">
                                                    ${tk.moTa}
                                                </td>
                                                <td style="padding-top: 25px;" class="text-center">
                                                    ${tk.luotThich}
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
        </div>
    </div>
    </div>
    <!-- Chart -->
    <script>
        //Biểu đồ 1
        $(function () {
        	var dsBaiVietViPham = ${thongKeJson};
        	var dsSoLuotBaoCao = ${thongKeJson1};
        	var data1= [];
        	var data2 = [];
        	for(var i = 0; i<dsBaiVietViPham.length; i++){
        		data1.push(dsBaiVietViPham[i].soBaiVietViPham) 
        		
        	}
        	for(var i = 0; i<dsSoLuotBaoCao.length; i++){
        		data2.push(dsSoLuotBaoCao[i].soLuotBaoCao) 
        		
        	}
        	//Vẽ biểu đồ
        			// Lấy thẻ canvas và lưu vào biến myChart
        			var myChart1 = document.getElementById('visitors-chart').getContext('2d');

        			// Tạo biểu đồ đường
        			var ticksStyle = {
                        fontColor: '#495057',
                        fontStyle: 'bold'
                    }
                    
        			var chart1 = new Chart(myChart1, {
        				data: {
                            labels: ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"],
                            datasets: [{
                            	 
                                type: 'line',
                                //thông số đường line 1
                                data: data1,
                                backgroundColor: 'transparent',
                                borderColor: '#3B998B',
                                pointBorderColor: '#3B998B',
                                pointBackgroundColor: '#3B998B',
                                fill: false
                                // pointHoverBackgroundColor: '#007bff',
                                // pointHoverBorderColor    : '#007bff'
                            },
                            {
                                type: 'line',
                                //thông số đường line 2
                                data: data2,
                                backgroundColor: 'transparent',
                                borderColor: '#FF5733',
                                pointBorderColor: '#FF5733',
                                pointBackgroundColor: '#FF5733',
                                fill: false
                                // pointHoverBackgroundColor: '#ced4da',
                                // pointHoverBorderColor    : '#ced4da'
                            }]
                        },
                        options: {
                            maintainAspectRatio: false,
                            tooltips: {
                                mode: 'index',
                                intersect: true
                            },
                            hover: {
                                mode: 'index',
                                intersect: true
                            },
                            legend: {
                                display: false
                            },
                            scales: {
                                yAxes: [{
                                    // display: false,
                                    gridLines: {
                                        display: true,
                                        lineWidth: '4px',
                                        color: 'rgba(0, 0, 0, .2)',
                                        zeroLineColor: 'transparent'
                                    },
                                    ticks: $.extend({
                                        beginAtZero: true,
                                        max: 20,
    				                    stepSize: 5
                                    }, ticksStyle)
                                }],
                                xAxes: [{
                                    display: true,
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: ticksStyle
                                }]
                            }
                        }
        			});

            //Biểu đồ 2
            var dsDangKy = ${thongKeJson2};
            var data3 = []
            for(var i = 0; i < dsDangKy.length;i++){
            	data3.push(dsDangKy[i].soLuotDangKy)
            }
            var ctx = document.getElementById('myChart').getContext('2d');
            var chartData = {
    				labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
    				datasets: [
    					{
    					
    						backgroundColor: 'rgba(255,99,132,0.2)',
    						borderColor: 'rgba(255,99,132,1)',
    						borderWidth: 1,
    						hoverBackgroundColor: 'rgba(255,99,132,0.4)',
    						hoverBorderColor: 'rgba(255,99,132,1)',
    						data: data3
    					}
    				]
    			};
    			// tạo biểu đồ
    			var myChart2 = new Chart(ctx, {
    				type: 'bar',
    				data: chartData,
    				options: {
    				    legend: {
    				            display: false, // ẩn nút click
    				        },
    				        scales: {
    				            yAxes: [{
    				            	ticks: {
    				                    beginAtZero: true,
    				                 	max: 20,
    				                    stepSize: 5
    				                  }
    				            }]
    				          }
    				  },
    			});

        })
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/loadReport.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    
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