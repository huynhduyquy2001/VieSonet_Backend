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
	<%@include file="_header.jsp"%>
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
	            success : function(data) {
	                $("#danhSachTimKiem").empty();
	                data.forEach(function(item) {
	                    var html = '<div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">' +
	                        '<div class="user-profile">' +
	                        '<a href="/nguoiDung/' + item[2] + '"><img src="images/' + item[1] + '" alt="" style="border-radius: 6px; width: 70px;"></a>' +
	                        '<div>' +
	                        '<label for="">' + item[0] + '</label><br>' +
	                        '<small>'+item[4]+'</small>' +
	                        '</div>' +
	                        '</div>' +
	                        '<div>' +
	                        '<!-- <a name="" id="" class="btn btn-primary" href="#" role="button">Kết bạn</a> -->' +
	                        '</div>' +
	                        '</div>';

	                    $("#danhSachTimKiem").append(html);
	                });
	            },
	            error : function(xhr, status, error) {
	                console.log(error); // Thông báo lỗi nếu có
	            }
	        });
	    }
	}


	</script>
	
</body>

</html>