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
    <link rel="stylesheet" href="style.css">
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


    <header class="header animate__animated animate__fadeInUp">
        <nav class="navbar navbar-expand-sm navbar-light" style="border: none;padding-top: 0; padding-bottom: 0;">
            <div class="container">
                <a class="navbar-brand nhan" href="#" style="color: #222; font-weight: bolder; font-family: 'robo';">
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
    <div class="container" style="margin-top: 50px;">
        <div class="row" style="margin: 0; padding: 0;">
            <div class="dropdown menuDropdown">
                <button class="btn  dropdown-toggle" type="button" id="triggerId" data-bs-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <b class="nhan">Quản lí</b>
                </button>
                <div class="dropdown-menu" aria-labelledby="triggerId">
                    <a class="dropdown-item" href="#"><a href="#" class="nav-link" style=" border-radius: 0;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                viewBox="0 0 16 16">
                                <path
                                    d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" />
                            </svg> &nbsp;&nbsp;
                            <small><label class="">Quản lý nhân viên</label></small>
                        </a></a>
                    <a href="#" class="nav-link" style=" border-radius: 0;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-person-fill" viewBox="0 0 16 16">
                            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
                        </svg> &nbsp;&nbsp;
                        <small><label>Quản lý người dùng</label></small>
                    </a>
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
                    <a href="#" class="nav-link" style="border-radius: 0;">
                        <i class="fa-solid fa-chart-column"></i> &nbsp;&nbsp;
                        <small><label for="">Thống kê</label></small>
                    </a>

                </div>
            </div>
            <div class="col-md-3 img-thumbnail nenTrangChu menuQuanLi animate__animated animate__backInLeft" style="border-radius: 0; padding: 8px;">
                <div
                    style="min-height: 80vh; position: relative; padding: 7px; padding-top: 50px; border: 1px solid rgba(210,199,188,1);">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li style="margin-bottom: 20px;" class="ql-link">
                            <a href="#" class="nav-link" style=" border-radius: 0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    viewBox="0 0 16 16">
                                    <path
                                        d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" />
                                </svg> &nbsp;&nbsp;
                                <small><label>Quản lý nhân viên</label></small>
                            </a>
                        </li>
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
                                <div class="position-relative mb-4">
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
                                <div class="position-relative mb-4">
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
                                <input type="date" class="form-control">
                                <button type="button" class="btn btn-info">Lọc</button>
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
                                                <th style="width: 20%;">
                                                    Mô tả
                                                </th>
                                                <th class="text-center" style="width: 15%">#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center">
                                                    <img alt="Avatar" class="table-avatar" src="images/avt.jpg"
                                                        width="65%" style="border-radius: 6px;">
                                                </td>
                                                <td style="padding-top: 25px;">
                                                    1101N
                                                </td>
                                                <td style="padding-top: 25px;">
                                                    Nam
                                                </td>
                                                <td style="padding-top: 25px; ">
                                                    nhanvien123@gmail.com
                                                </td>
                                                <td class="text-center"
                                                    style="padding-top: 25px;">
                                                    <div class="dropdown">
                                                        <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                          <i style="width: 30px; height: 20px;" class="fas fa-ellipsis-v"></i>
                                                        </a>
                                                      
                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                            <li><a class="dropdown-item btn btn-danger" href="#"><i class="fa-light fa-memo-circle-info"></i> Chi tiết</a></li>
                                                        </ul>
                                                      </div>
                                                </td>
                                            </tr>
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
                                        // thông số max của chart
                                        suggestedMax: 30
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
                            label: 'Số lượt đăng ký',
                            backgroundColor: 'rgba(255,99,132,0.2)',
                            borderColor: 'rgba(255,99,132,1)',
                            borderWidth: 1,
                            hoverBackgroundColor: 'rgba(255,99,132,0.4)',
                            hoverBorderColor: 'rgba(255,99,132,1)',
                            data: data3
                        }
                    ]
                };
            var chartOptions = {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }]
                    }
                };
         // tạo biểu đồ
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: chartOptions
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