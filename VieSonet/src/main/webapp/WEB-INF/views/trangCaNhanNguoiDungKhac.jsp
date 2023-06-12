    <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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



</head>
    <title>Trang cá nhân</title>
    <style type="text/css">
.dropdown-item {
	padding-top: 0;
	padding-bottom: 0;
}

.red-heart {
	color: red; /* Màu đỏ cho trái tim đã thích */
}

.gray-heart {
	color: gray; /* Màu xám cho trái tim chưa thích */
}</style>
    <style>
        #menuTrai {
            position: absolute;
            top: 0;
            transition: 0.5s;
            /* Đảm bảo thẻ div hiển thị trên các phần tử khác */
        }

        #menuTrai.fixed {
            position: fixed;
            top: 30px;
            transition: 0.5s;
        }

        .baiDang {
            display: none;
        }

        @media screen and (max-width: 768px) {
            .baiDang {
                display: block;
            }
            .menuTrai{
                display: none;
            }
        }
    </style>
</head>

<body style="padding-top: 30px; padding-bottom: 70px;">
    <div class="split-background"></div>
    <header class="header animate__animated animate__fadeInUp">
        <nav class="navbar navbar-expand-sm navbar-light" style="border: none;padding-top: 0; padding-bottom: 0;">
            <div class="container">
                <a class="navbar-brand nhan" href="/index" style="color: #5A4F48; font-weight: bolder; font-family: 'robo';">
                    <img src="/images/chimLac.png" height="30px" alt=""> VIE_SONET</a>
                <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/index" aria-current="page" style=" white-space: nowrap;
                            overflow: hidden; 
                            text-overflow: ellipsis;font-family: 'Roboto', sans-serif;letter-spacing: 0.1em;">Trang chủ
                                <span class="visually-hidden">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><small style=" white-space: nowrap;
                                overflow: hidden; 
                                text-overflow: ellipsis;font-family: 'Roboto', sans-serif;letter-spacing: 0.1em; ">Điều
                                    khoản</small></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><small style=" white-space: nowrap;
                                overflow: hidden; 
                                text-overflow: ellipsis;font-family: 'Roboto', sans-serif;letter-spacing: 0.1em; ">Quản
                                    lí</small></a>
                        </li>
                    </ul>
                    <form class="d-flex my-2 my-lg-0">
                        <input class="form-control me-sm-2 input-hbh"
                            style="border-radius: 0; border: none; border-bottom: 1px solid gray; transform: skew(0); background-color: transparent;"
                            type="text" placeholder="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" hidden type="submit">Search</button>
                    </form>

                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="/profile" id="dropdownId" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><small><img src="/images/${nguoiDungHienTai.anhDaiDien}" width="30px"
                                        style="border-radius: 50%;" alt=""></small></a>
                            <div class="dropdown-menu" aria-labelledby="dropdownId"
                                style="width: 350px; padding-left: 3px;">
                                <div class="profile-darkButton">
                                    <div class="user-profile">
                                         <a href="/profile"><img src="/images/${nguoiDungHienTai.anhDaiDien}" alt=""></a>
                                        <div>
                                            <p> ${nguoiDungHienTai.hoTen}</p>
                                            <small>Xem trang cá nhân của bạn</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropdown-item"
                                    style="display: flex; justify-content: space-between; align-items: center;">
                                    <small>Chế độ tối:</small>
                                    <div class="nut">
                                        <input type="checkbox" class="checkbox" id="checkbox"
                                            onclick="toggleDarkMode()">
                                        <label class="switch" for="checkbox">
                                            <span class="slider" style="width: 12px;height: 12px;"></span>
                                        </label>
                                    </div>
                                </div>
                                <a class="dropdown-item" href="/dangnhap"><small>Đăng nhập</small></a>
                                <a class="dropdown-item" href="#"><small>Đăng ký</small></a>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="row" style="margin-top: 10px; position: relative;">
        <div class="video-overlay">
        </div>
        <img src="/images/${nguoiDung.anhBia}" alt="" class="img-thumbnail"
            style="max-height: 300px; width: 100%; object-fit: cover; overflow: hidden; z-index: -10; ">
        <div class="col-md-5 " style=" position: absolute; transform: translateY(-50%); top: 50%; left: 20px;">
            <div class="row">
            
                <div class="col-4">
                    <img data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="/images/${nguoiDung.anhDaiDien}" width="87%"
                        style="border-radius: 50%;" class="img-thumbnail" alt="">
                </div>
                <div class="col-7" style="color: white;">
                    
                    
                    <h3>${nguoiDung.hoTen}</h3>
                    <small>
                        <ul style="line-height: 30px;">
                            <li><b><i class="fa-light fa-mountain-sun"></i> Quê quán:</b> ${nguoiDung.diaChi}</li>
                            <li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b> ${nguoiDung.moiQuanHe}</li>
                            <li><b><i class="fa-regular fa-envelope"></i> Email:</b> ${nguoiDung.email}</li>
                            <li><b><i class="fa-regular fa-registered"></i> Ngày tham gia:</b> ${nguoiDung.ngayTao}</li>
                            <li><b><i class="fa-light fa-user-group"></i> Danh sách bạn bè:</b> ${SlBanbe}</li>
                        </ul>
                       </small>
                       <c:if test="${checker==true}">
	                       <button style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
	                        <small style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: white;">
	                    		Bạn bè ✓
	                    	</small>
	                    	</button>
	                    	<button style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
	                    	<a href="/profile/huyketban/${nguoiDung.sdt}/${mbb}">
							<small style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: white;">
	                    		Xóa bạn X
	                    	</small>
	                    	</button>
					    </c:if>
					    <c:if test="${checker==false && trangThai == 0}">
					        <button style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
					        <a href="/profile/guiLmkb/${nguoiDung.sdt}"><small style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: white;">
		                     	Thêm bạn bè +
		                    </small></a>
		                    </button>
					    </c:if>
					    <!-- Người dùng gửi người lạ -->
					    <c:if test="${checker==false && trangThai == 1}">
					        <button  style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
					        <a href="/profile/tuchoi/${lmkb}/nguoiDung/${nguoiDung.sdt}"><small style=" white-space: nowrap;	overflow: hidden; text-overflow: ellipsis; color: white;">
		                    	Hủy lời mời kết bạn X
		                    </small></a>
		                    </button>
					    </c:if>
					    <!-- Người lạ gửi người dùng -->
					    <c:if test="${checker==false && trangThai == 2}">
					        <button style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
					        <a href="/profile/dongy/${lmkb}/nguoiDung/${nguoiDung.sdt}"><small style=" white-space: nowrap;overflow: hidden; text-overflow: ellipsis; color: white;">
		                    	Chấp nhận ✓
		                    </small>
		                    </button></a>
		                    <button style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;">
		                    <a href="/profile/tuchoi/${lmkb}/nguoiDung/${nguoiDung.sdt}"><small style=" white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: white;">
		                    	Xóa X
		                    </small></a>
		                    </button>	
					    </c:if>
                </div>
                
            </div>
          
            
            
            
            
        </div>
    </div>
    <!-- Modal đổi ảnh đại diện-->
    <form action="/profile/avatar" method="POST" modelAttribute="nguoiDung" enctype="multipart/form-data">
    <div class="modal fade" id="exampleModalToggle1" aria-hidden="true" aria-labelledby="exampleModalToggleLabel1"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel"><b style="margin-left: 170px;">Đăng ảnh đại
                            diện</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <center><img id="img1" src="" width="45%" style="border-radius: 10px;">
                    </center> <br>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupFile011"><img src="/images/${pageContext.request.contextPath}" style="width: 20px;
                     margin-right: 13px;">Photo/Video</label>
                        <input type="file" class="form-control" id="inputGroupFile011" name="photo_file">
                    </div>
                </div>
                <div class="modal-footer post-upload-textarea"
                    style="padding: 0; padding-left: 10px; padding-right: 10px;">
                    <textarea name="" placeholder="Mô tả?" id="" cols="30" rows="3"></textarea><br>
                    <button style="width: 500px; background-color: #5A4F48; border: none;" class="btn btn-primary">Đăng
                        ảnh</button>
                </div>
            </div>
        </div>
    </div>
	</form>
	
	 <!-- Modal đổi ảnh bìa-->
	<form action="/profile/background" method="POST" modelAttribute="nguoiDung" enctype="multipart/form-data">
    <div class="modal fade" id="exampleModalToggle12" aria-hidden="true" aria-labelledby="exampleModalToggleLabel1"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel"><b style="margin-left: 170px;">Đăng ảnh bìa</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <center><img id="img1" src="" width="45%" style="border-radius: 10px;">
                    </center> <br>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupFile011"><img src="/images/${pageContext.request.contextPath}" style="width: 20px;
                     margin-right: 13px;">Photo/Video</label>
                        <input type="file" class="form-control" id="inputGroupFile011" name="photo_file2">
                    </div>
                </div>
                <div class="modal-footer post-upload-textarea"
                    style="padding: 0; padding-left: 10px; padding-right: 10px;">
                    <textarea name="" placeholder="Mô tả?" id="" cols="30" rows="3"></textarea><br>
                    <button style="width: 500px; background-color: #5A4F48; border: none;" class="btn btn-primary">Đăng
                        ảnh</button>
                </div>
            </div>
        </div>
    </div>
	</form>
	
    <!-- Modal Body -->
    <!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
    <form method="POST" action="/profile/update" modelAttribute="nguoiDung">
    <div class="modal fade" id="modalId" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
        aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="background-color: white;">
                <div class="modal-body">
                    <ul style="line-height: 30px;">
                        <li><b><i class="fa-regular fa-pen-to-square"></i> Tên tài khoản:</b> 
                        <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray; width: 50%; "
                                type="text" placeholder="Họ tên?" value="${nguoiDung.hoTen}" name="hoTen"/> 
                        </li>
                        <li><b><i class="fa-light fa-mountain-sun"></i> Quê quán:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Quê quán?" value="${nguoiDung.diaChi}" name="diaChi"/>
                        </li>
                        <li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Mối quan hệ?" value="${nguoiDung.moiQuanHe}" name="moiQuanHe"/>
                        </li>
                        <li><b><i class="fa-regular fa-envelope"></i> Email:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Email?" value="${nguoiDung.email}" name="email"/>
                        </li>
                        <li><b><i class="fa-regular fa-envelope"></i> Giới thiệu:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Giới thiệu?" value="${nguoiDung.gioiThieu}" name="gioiThieu"/>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn01">Save</button>
                </div>
            </div>
        </div>
    </div>
	</form>

    <!-- Optional: Place to the bottom of scripts -->
    <script>
        const myModal = new bootstrap.Modal(document.getElementById('modalId'), options)

    </script>
    <div class="container">
        	<!-- Chỉnh giao diện bài đăng -->
            <div class="col-md-10 offset-md-1">
                <div style=" box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
                    <center>
                        <div>
                            <br>
                            ${nguoiDung.gioiThieu}
                        </div>
                    </center>
                   
                    
                    </div>
                    <b>Bài viết</b>
                    <hr>
                    <c:forEach items="${BaiVietCaNhan}" var="BaiViet">
                    <div class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft"
                        style="margin-bottom: 20px;  border-radius: 0;">
                        <div style="padding: 10px; border: 1px solid rgba(210,199,188,1); margin: 0;">
                            <div style=" display: flex; align-items: center; justify-content: space-between; ">
                                <div class="tooltip2">	
                                    <div class="user-profile ">
                                        <img src="/images/${BaiViet.nguoiDung.anhDaiDien}" class="img-thumbnail" alt="">
                                        <div>
                                            <label class="nhan">${BaiViet.nguoiDung.hoTen}</label> <br> 
                                            <small>${BaiViet.ngayDang} </small> <br>
                                        </div>
                                    </div>
                                    <span class="tooltip2-text">
                                        <a href="">
                                            <img src="/images/${BaiViet.nguoiDung.anhDaiDien}" class="img-thumbnail" alt="">
                                            <div>
                                                <label for="">${BaiViet.nguoiDung.hoTen}  </label> <br>
                                                <center>
                                                    <small>
                                                        <small>
                                                            <ul style="line-height: 20px; text-align: left;">
                                                                <li><b><i class="fa-light fa-mountain-sun"></i> Quê
                                                                        quán:</b>
                                                                    ${BaiViet.nguoiDung.diaChi}</li>
                                                                <li><i class="fa-regular fa-heart"></i> <b>Mối quan
                                                                        hệ:</b>
                                                                    ${BaiViet.nguoiDung.moiQuanHe}</li>
                                                                <li><b><i class="fa-light fa-user-group"></i> Danh sách
                                                                        bạn
                                                                        bè:</b> ${SlBanbe}</li>
                                                            </ul>
                                                        </small>
                                                    </small>
                                                </center>
                                            </div>
                                        </a>
                                    </span>
                                </div>
                                <div>
                                    <div class="btn-group">
                                        <span class="btn dropdown-toggle" type="button" id="triggerId"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                        </span>
                                        <div class="dropdown-menu btn-cap-nhat-bai-viet" aria-labelledby="triggerId">
                                            <!-- href="#exampleModalToggle123" --> 
                                            <button data-bs-toggle="modal" 
                                           onclick="loadBaiViet(${BaiViet.maBaiViet})"
                                            
                style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background:transparent"><small>
                    Chỉnh sửa bài viết</small></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div style="margin-top: 10px; color: #847577">
								<div onclick="loadBinhLuan(${BaiViet.maBaiViet})">
									${BaiViet.moTa}
									<center>
										<img class="lazy" data-src="/images/${BaiViet.hinhAnh}"
											width="100%" alt=""
											style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;">
									</center>
								</div>
                               <div class="post-reaction">
								<div class="activity-icons">
										<input type="hidden" name="maBaiViet" value="${baiViet.maBaiViet}" data-id="${baiViet.maBaiViet}">
										<div onclick="thichBaiViet(${BaiViet.maBaiViet},this)"
											class="${maBaiVietDaThich.contains(BaiViet.maBaiViet) ? 'red-heart' : 'gray-heart'}">
											<i class="fa-duotone fa-heart"></i> &nbsp;
											${BaiViet.luotThich}
										</div>


										<div onclick="loadBinhLuan(${BaiViet.maBaiViet})">
											<i class="fa-regular fa-comment"></i>&nbsp;
											${BaiViet.luotBinhLuan}
										</div>
									</div>
							</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            
    
    <!-- Modal đăng bài --> 
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
				<form action="/profile/dangbai" method="post"
					 enctype="multipart/form-data">
					<div class="modal-body">
					
						<div class="user-profile">
							<img src="/images/${NguoiDung.hoTen}" alt="">
							<div>
								<label>${NguoiDung.hoTen}
									</p> <small style="font-size: 12px">
										<div>
											<select name="cheDo"
												style="border: none; background-color: transparent;">
												<option selected value="1">Công khai</option>
												<option value="2">Bạn bè</option>
												<option value="3">Chỉ mình tôi</option>
											</select>
										</div>
								</small>
							</div>
						</div>
						
						<br>
						<textarea name="moTaBaiDang" placeholder="Bạn muốn đăng gì?" id=""
							cols="30" rows="3"
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
							</label> <input type="file" class="form-control" name="photo_file"
								id="inputGroupFile01">
						</div>

						<button
							style="width: 500px; background-color: #5A4F48; border: none;"
							class="btn btn-primary" data-bs-target="#exampleModalToggle2"
							data-bs-toggle="modal" data-bs-dismiss="modal">Đăng bài</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
   <!-- Modal chỉnh sửa bài viết -->
   <!--   <div class="modal fade" id="exampleModalToggle123" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content"
				style="background-color: rgba(246, 245, 244, 1);">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel">
						<b style="margin-left: 170px;">Chỉnh sửa bài viết</b>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="/baiviet/update" method="post"
					 enctype="multipart/form-data">
					<div class="modal-body">
					
						<div class="user-profile">
							<img src="images/${nguoiDung.anhDaiDien}" alt="">
							<div>
								<label>${nguoiDung.hoTen}
									</p> <small style="font-size: 12px">
										<div>
											<select name="cheDo"
												style="border: none; background-color: transparent;">
												<option selected value="1">Công khai</option>
												<option value="2">Bạn bè</option>
												<option value="3">Chỉ mình tôi</option>
											</select>
										</div>
								</small>
							</div>
						</div>
						
						<br>
						<textarea  name="moTaBaiDang" placeholder="Bạn muốn đăng gì?" id=""
							cols="30" rows="3" 
							style="width: 100%; border: 0px; outline: none; border-bottom: 1px solid #ccc; background: transparent; resize: none;">
							</textarea>
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
							</label> <input type="file" class="form-control" name="photo_file"
								id="inputGroupFile01">
						</div>

						<button
							style="width: 500px; background-color: #5A4F48; border: none;"
							class="btn btn-primary" data-bs-target="#exampleModalToggle2"
							data-bs-toggle="modal" data-bs-dismiss="modal">Đăng bài</button>
					</div>
				</form>
			</div>
		</div>
	</div> -->
   
   <div class="modal fade" id="baiVietChiTiet" tabindex="-1"
		role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-fullscreen" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div data-bs-dismiss="modal" style="cursor: pointer;">X</div>
						<div class="col-md-12 trai order-sm-2 col-xs-12 order-1 justify-center"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
   
   
    <!-- Modal -->
    <!-- Modal hiện danh sách bình luận -->
	<div class="modal fade" id="danhSachBinhLuan" tabindex="-1"
		role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-fullscreen" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div data-bs-dismiss="modal" style="cursor: pointer;">X</div>
						<div class="col-md-6 trai order-sm-2 col-xs-12 order-1"></div>
						<div class="col-md-6 phai order-sm-1 col-xs-12"></div>

					</div>
				</div>

			</div>
		</div>
	</div>
    <!-- load ảnh -->
    <script>
        let img = document.getElementById('img');
        let input = document.getElementById('inputGroupFile01');
        let img1 = document.getElementById('img1');
        let input1 = document.getElementById('inputGroupFile011');

        input.onchange = (e) => {
            if (input.files[0])
                img.src = URL.createObjectURL(input.files[0]);
        }
        input1.onchange = (e) => {
            if (input1.files[0])
                img1.src = URL.createObjectURL(input1.files[0]);
        } 
    </script>
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

    <script src="${pageContext.request.contextPath}/lazy.js"></script>
    <script>
        window.onscroll = function () {
            var fixedDiv = document.getElementById("menuTrai");
            var scrollPosition = window.scrollY;
            var windowHeight = window.innerHeight - 300;
            
            // Kiểm tra vị trí cuộn của trình duyệt
            if (scrollPosition >= windowHeight) {
                fixedDiv.classList.add("fixed");
            } else {
                fixedDiv.classList.remove("fixed");
            }
        };

    </script>
	<script src="${pageContext.request.contextPath}/loadBaiViet.js"></script>
    <script src="${pageContext.request.contextPath}/loadCommentsProfile.js"></script>
	<script src="${pageContext.request.contextPath}/lazy.js"></script>
	<script src="${pageContext.request.contextPath}/thoiTiet.js"></script>
</body>

</html>