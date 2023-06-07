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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <title>Quản lý người dùng</title>
</head>
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

<body>
    <header class="header animate__animated animate__fadeInUp">
        <nav class="navbar navbar-expand-sm navbar-light" style="border: none;padding-top: 0; padding-bottom: 0;">
            <div class="container">
                <a class="navbar-brand nhan" href="#" style="color: #5A4F48; font-weight: bolder; font-family: 'robo';">
                    <img src="images/chimLac.png" height="30px" alt=""> VIE_SONET</a>
                <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="#" aria-current="page" style=" white-space: nowrap;
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
                            <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><small><img src="images/avt.jpg" width="30px"
                                        style="border-radius: 50%;" alt=""></small></a>
                            <div class="dropdown-menu" aria-labelledby="dropdownId"
                                style="width: 350px; padding-left: 3px;">
                                <div class="profile-darkButton">
                                    <div class="user-profile">
                                        <img src="images/avt.jpg" alt="">
                                        <div>
                                            <p> Alex Carry</p>
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
                                <a class="dropdown-item" href="#"><small>Đăng nhập</small></a>
                                <a class="dropdown-item" href="#"><small>Đăng ký</small></a>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container" style="margin-top: 60px;">

        <div class="row">
            <div class="col-md-3 img-thumbnail nenTrangChu menuQuanLi animate__animated animate__backInLeft"
                style="border-radius: 0; padding: 8px;">
                <div
                    style="min-height: 80vh; position: relative; padding: 7px; padding-top: 50px; border: 1px solid rgba(210,199,188,1);">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="#" class="nav-link" style=" border-radius: 0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
                                </svg> &nbsp;&nbsp;
                                <small><label>Quản lý người dùng</label></small>
                            </a>
                        </li>
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="#" class="nav-link" style=" border-radius: 0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-card-checklist" viewBox="0 0 16 16">
                                    <path
                                        d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                    <path
                                        d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                                </svg> &nbsp;&nbsp;
                                <small><label>Quản lý bài viết</label></small>
                            </a>
                        </li>

                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="/thongKe" class="nav-link" style="border-radius: 0;">
                                <i class="fa-solid fa-chart-column"></i> &nbsp;&nbsp;
                                <small><label for="">Thống kê</label></small>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9  animate__animated animate__backInRight"
                style="padding-left: 3%; padding-right: 3%;  border-right: 1px solid rgba(210,199,188,1);">
                <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 10px;">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                            data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                            aria-selected="true">Tác vụ</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                            data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane"
                            aria-selected="false">Danh sách</button>
                    </li>
                </ul>
                <!-- Nội dung tabs -->
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
                        tabindex="0" style="padding-top: 20px;">
                        <div class="container" style="margin-top: 20px;">
                            <div class="row">
                                <div class="col-md-6">
                                    <center>
                                        <c:if test="${!not empty thongTin }">
                                        	<img id="img" class="img-thumbnail" src="${pageContext.request.contextPath}/images/avatar.png"
                                            style="border-radius: 50%; max-height: 280px;">
                                        </c:if>
                                        <c:if test="${not empty thongTin }">
                                        	<img id="img" class="img-thumbnail" src="${pageContext.request.contextPath}/images/${thongTin.anhDaiDien}"
                                            style="border-radius: 50%; max-height: 280px;">
                                        </c:if>
                                    </center>
                                    <hr>  
                                    <center><h4>Ảnh đại diện</h4></center>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <input type="text" class="form-control ip" name="sdt" id="" value="${thongTin.sdt}"
                                            aria-describedby="helpId" placeholder="Số điện thoại?" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" class="form-control ip" name="sdt" id="" value="${thongTin.hoTen}"
                                            aria-describedby="helpId" placeholder="Họ tên?" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" class="form-control ip" name="sdt" id="" value="${thongTin.email}"
                                            aria-describedby="helpId" placeholder="Email?" required>
                                    </div>
                                    <div class=" mt-1">
                                        <label>Vai trò:</label>
                                        &nbsp; &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios1" ${thongTin.vaiTro.maVaiTro == 2 ? 'checked' : ''}>
                                            <small> Nhân viên</small>
                                        </label>
                                        &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" ${thongTin.vaiTro.maVaiTro == 3 ? 'checked' : ''}
                                             name="gridRadios">
                                            <small>Quản lý</small>
                                        </label>
                                        &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" ${thongTin.vaiTro.maVaiTro == 1 ? 'checked' : ''} 
                                            name="gridRadios">
                                            <small>Người dùng</small>
                                        </label>
                                    </div>
                                    <br>
                                    <div class=" mt-1">
                                        <label>Giới tính:</label>
                                        &nbsp; &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" ${thongTin.gioiTinh?'Checked':'' } type="radio" name="gioiTinh" disabled="disabled">
                                            <small> Nam</small>
                                        </label>
                                        &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" ${thongTin.gioiTinh?'':'Checked' } type="radio" name="gioiTinh" disabled="disabled">
                                            <small>Nữ</small>
                                        </label>
                                    </div>
                                    <br>
                                    <div class=" mt-1">
                                        <label>Trạng thái:</label>
                                        &nbsp; &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" ${thongTin.trangThai?'Checked':'' } type="radio" name="trangThai" checked>
                                            <small> Hoạt động</small>
                                        </label>
                                        &nbsp;
                                        <label class="form-check-label">
                                            <input class="form-check-input" ${thongTin.trangThai?'':'Checked' } type="radio" name="trangThai">
                                            <small>Không hoạt động</small>
                                        </label>
                                    </div>
                                    <div class="mt-5">
                                        <a data-bs-toggle="tooltip" data-bs-placement="top"
                                        title="Khóa tài khoản này" href="#" class="btn me-4" 
                                        style="background: rgba(234,229,224,1); width: 60px;">
                                        <i class="fa-solid fa-user-lock"></i> </a>
    
                                        <a data-bs-toggle="tooltip" data-bs-placement="top"
                                        title="Mở khóa tài khoản này" href="#" class="btn me-4" 
                                        style="background: rgba(234,229,224,1); width: 60px;">
                                        <i class="fa-solid fa-user-unlock"></i></a>
    
                                        <a data-bs-toggle="tooltip" data-bs-placement="top"
                                        title="Cập nhật vai trò" href="#" class="btn " 
                                        style="background: rgba(234,229,224,1); width: 60px;">
                                        <i class="fa-solid fa-user-pen"></i> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
                        tabindex="0">
                        <div class="table-responsive" style="overflow-y: hidden;overflow-y: scroll; height: 73vh;">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th style="width: 13%;">Hình ảnh</th>
                                        <th scope="col">Họ tên</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">SDT</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Lượt vi phạm</th>
                                        <th scope="col">Trạng thái</th>
                                        <th>Tác vụ</th>
                                    </tr>
                                </thead>
                                <tbody id="tableLoad">
                                    <c:forEach var="ds" items="${dsNguoiDung}">
                                    <tr>
                                        <td scope="row"><img class="img-thumbnail" style="border-radius: 16px;"
                                                src="${pageContext.request.contextPath}/images/${ds.anhDaiDien}" width="50%" alt="${ds.anhDaiDien}"></td>
                                        <td style="white-space: nowrap; 
                                        overflow: hidden;
                                        text-overflow: ellipsis;
                                        max-width: 150px;"><span data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="${ds.hoTen}">
                                                <small>${ds.hoTen}</small>
                                            </span></td>
                                        <td class="anNoiDung" style="max-width: 150px;"><small>${ds.gioiTinh?'Nam':'Nữ'}</small> </td>
                                        <td class="anNoiDung" style=" max-width: 250px;">
                                            <small>${ds.sdt }</small>
                                        </td>
                                        <td class="anNoiDung" style=" max-width: 250px;">
                                            <small>${ds.email }</small>
                                        </td>
                                        <td class="anNoiDung text-center" style=" max-width: 250px;">
                                            <small>${ds.luotViPham }</small>
                                        </td>
                                        <td class="anNoiDung" style=" max-width: 250px;">
                                            <small>${ds.trangThai?'Hoạt động':'Đã thôi việc'}</small>
                                        </td>
                                        <td>
                                            <a onclick="goViPham(${ds.sdt})" data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="Gỡ bỏ vi phạm" href="#" class="me-3">
                                                <i class="fa-solid fa-file-import"></i>
                                            </a>
                                            <a data-bs-toggle="tooltip" data-bs-placement="top"
                                                title="Chỉnh sửa" href="/chinhSua/${ds.sdt}">
                                                <i class="fa-solid fa-pen-to-square"></i>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/loadQuanLyNguoiDung.js"></script>
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