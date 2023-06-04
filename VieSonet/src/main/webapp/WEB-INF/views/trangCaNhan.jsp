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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/f737751420.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <title>Trang cá nhân</title>
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
    <div class="row" style="margin-top: 10px; position: relative;">
        <div class="video-overlay">
        </div>
        <img src="images/nen.jpg" alt="" class="img-thumbnail"
            style="max-height: 300px ; width: 100%; object-fit: cover; overflow: hidden; z-index: -10; ">
        <div class="col-md-5 " style=" position: absolute; transform: translateY(-50%); top: 50%; left: 20px;">
            <div class="row">
                <div class="col-4">
                    <img data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="images/avt.jpg" width="100%"
                        style="border-radius: 50%;" class="img-thumbnail" alt="">
                </div>
                <div class="col-8" style="color: white;">
                    <h3>Duy Quý</h3>
                    <small>
                        <ul style="line-height: 30px;">
                            <li><b><i class="fa-light fa-mountain-sun"></i> Quê quán:</b> Đồng Tháp</li>
                            <li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b> Độc thân</li>
                            <li><b><i class="fa-regular fa-envelope"></i> Email</b>:quyhdpc04119@fpt.edu.vn</li>
                            <li><b><i class="fa-regular fa-registered"></i> Ngày tham gia:</b> 20-11-1995</li>
                            <li><b><i class="fa-light fa-user-group"></i> Danh sách bạn bè:</b> 304</li>
                        </ul>
                    </small>
                </div>
            </div>
            <button data-bs-toggle="modal" data-bs-target="#modalId"
                style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;"><small
                    style=" white-space: nowrap;
                        overflow: hidden; text-overflow: ellipsis;">
                    Đổi TT cá nhân</small></button>
            <button data-bs-toggle="modal" href="#exampleModalToggle1"
                style="border: 1px solid white; border-radius: 6px; margin-bottom: 5px; background-color: transparent; color: white;"><small
                    style=" white-space: nowrap;
                        overflow: hidden; text-overflow: ellipsis;">
                    Đổi ảnh đại diện</small></button>
            <button
                style="border: 1px solid white; border-radius: 6px; background-color: transparent; color: white;"><small
                    style=" white-space: nowrap;
                        overflow: hidden; text-overflow: ellipsis;">Đổi ảnh bìa</small></button>
        </div>
    </div>
    <!-- Modal đổi ảnh đại diện-->
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
                        <label class="input-group-text" for="inputGroupFile011"><img src="images/photo.png" style="width: 20px;
                     margin-right: 13px;">Photo/Video</label>
                        <input type="file" class="form-control" id="inputGroupFile011">
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


    <!-- Modal Body -->
    <!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
    <div class="modal fade" id="modalId" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
        aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="background-color: white;">
                <div class="modal-body">
                    <ul style="line-height: 30px;">
                        <li><b><i class="fa-regular fa-pen-to-square"></i> Tên tài khoản:</b> <input
                                class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray; width: 50%; "
                                type="text" placeholder="Họ tên?">
                        </li>
                        <li><b><i class="fa-light fa-mountain-sun"></i> Quê quán:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Quê quán?">
                        </li>
                        <li><i class="fa-regular fa-heart"></i> <b>Mối quan hệ:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Mối quan hệ?">
                        </li>
                        <li><b><i class="fa-regular fa-envelope"></i> Email:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Email?">
                        </li>
                        <li><b><i class="fa-regular fa-registered"></i> Ngày tham gia:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Ngày tham gia?">
                        </li>
                        <li><b><i class="fa-light fa-user-group"></i> Danh sách bạn bè:</b>
                            <input class="form-control input-hbh"
                                style="border-radius: 0; border: none; border-bottom: 1px solid gray;" type="text"
                                placeholder="Danh sách bạn bè?">
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn01">Save</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Optional: Place to the bottom of scripts -->
    <script>
        const myModal = new bootstrap.Modal(document.getElementById('modalId'), options)

    </script>
    <div class="container">
        <div class="row" >
            <div class="col-md-4" style="position: relative;" >
                <div class="menuTrai" id="menuTrai">
                    <div style=" border-radius: 6px; box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
                        <b>Bài đăng</b>
                        <div class="write-post-container nenTrangChu img-thumbnail"
                            style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
                            <div class="user-profile">
                                <img src="images/avt.jpg" alt="">
                                <div>
                                    <label>Huỳnh Duy Quý</label>
                                    <br>
                                    <small>
                                        Công khai <i class="fas fa-caret-down"></i>
                                    </small>
                                </div>
                            </div>
    
                            <div class="post-upload-textarea">
                                <textarea data-bs-toggle="modal" href="#exampleModalToggle" name=""
                                    placeholder="Bạn muốn đăng gì?" id="" cols="30" rows="1"></textarea>
                                <div class="add-post-links">
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modalId">
                                        <a href="#"><i class="fa-regular fa-image"></i> Photo/Video</a>
                                    </button>
                                </div>
    
    
                            </div>
    
                        </div>
                        <hr>
                        <div style="display: flex; justify-content: space-between;">
                            Lời mời kết bạn(12) &nbsp; <small><small style="color: #F27323;">Xem tất cả>></small></small>
                        </div>
                        <div>
                            <div class="user-profile">
                                <img src="images/avt.jpg" class="img-thumbnail" alt="">
                                <div>
                                    <label> Trần Văn Minh Híu</label>
                                    <small style="display: flex;">
                                        <a class="dropdown-item" href="#"
                                            style="background-color: rgba(234,229,224,0.8);border-color: rgba(90,79,72,1);">
                                            <center>Đồng ý</center>
                                        </a>
                                        <a class="dropdown-item" href="#" style="background-color: #A89386; color: white;">
                                            <center>Xóa</center>
                                        </a>
                                    </small>
                                </div>
                            </div>
                            <div>
                                <div class="btn-group">
                                    <div class="dropdown-menu" aria-labelledby="triggerId" style="padding: 0;">
                                        <a class="dropdown-item" href="#"
                                            style="background-color: rgba(234,229,224,0.8);border-color: rgba(90,79,72,1);">
                                            <center>Đồng ý</center>
                                        </a>
                                        <a class="dropdown-item" href="#" style="background-color: #A89386; color: white;">
                                            <center>Xóa</center>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-4">
                <div style=" box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
                    <center>
                        <div>
                            <a href=""><i class="fa-regular fa-pen-to-square"></i></a>
                            <br>
                            Mơ khách đường xa, khách đường xa, <br>
                            Áo em trắng quá nhìn không ra... <br>
                            Ở đây sương khói mờ nhân ảnh, <br>
                            Ai biết tình ai có đậm đà? <br>
                        </div>
                    </center>
                    <div class="baiDang"
                        style=" border-radius: 6px; box-sizing: border-box; margin: 1%; padding: 3%; margin-top: 10px;">
                        Bài đăng:
                        <div class="write-post-container nenTrangChu img-thumbnail"
                            style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
                            <div class="user-profile">
                                <img src="images/avt.jpg" alt="">
                                <div>
                                    <label>Huỳnh Duy Quý</label>
                                    <br>
                                    <small>
                                        Công khai <i class="fas fa-caret-down"></i>
                                    </small>
                                </div>
                            </div>

                            <div class="post-upload-textarea">
                                <textarea data-bs-toggle="modal" href="#exampleModalToggle" name=""
                                    placeholder="Bạn muốn đăng gì?" id="" cols="30" rows="1"></textarea>
                                <div class="add-post-links">
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modalId">
                                        <a href="#"><i class="fa-regular fa-image"></i> Photo/Video</a>
                                    </button>
                                </div>


                            </div>

                        </div>


                        
                        </div>
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
                                        <img src="images/${BaiViet.nguoiDung.anhDaiDien}" class="img-thumbnail" alt="">
                                        <div>
                                            <label class="nhan">${BaiViet.nguoiDung.hoTen}</label> <br> 
                                            <small>${BaiViet.ngayDang}</small> <br>
                                        </div>
                                    </div>
                                    <span class="tooltip2-text">
                                        <a href="">
                                            <img src="images/${BaiViet.nguoiDung.anhDaiDien}" class="img-thumbnail" alt="">
                                            <div>
                                                <label for="">Trần Văn Minh Híu</label> <br>
                                                <center>
                                                    <small>
                                                        <small>
                                                            <ul style="line-height: 20px; text-align: left;">
                                                                <li><b><i class="fa-light fa-mountain-sun"></i> Quê
                                                                        quán:</b>
                                                                    Đồng Tháp</li>
                                                                <li><i class="fa-regular fa-heart"></i> <b>Mối quan
                                                                        hệ:</b>
                                                                    Độc
                                                                    thân:${BaiViet.nguoiDung.moiQuanHe}</li>
                                                                <li><b><i class="fa-light fa-user-group"></i> Danh sách
                                                                        bạn
                                                                        bè:</b> 304</li>
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
                                        <div class="dropdown-menu" aria-labelledby="triggerId">
                                            <a class="dropdown-item" href="#">Báo cáo vi phạm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 10px;">
                                ${BaiViet.moTa}
                                <center>
                                    <img class="lazy" data-src="images/caMap.jpg" width="100%" alt=""
                                        style="margin-top: 10px;margin-bottom: 10px; border-radius: 6px;">
                                </center>
                                <div class="post-reaction">
                                    <div class="activity-icons">
                                        <div><i class="fa-regular fa-thumbs-up"></i> &nbsp; ${BaiViet.luotThich}</div>
                                        <div><i class="fa-regular fa-comment"></i>&nbsp; ${BaiViet.luotBinhLuan}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="background-color: rgba(246,245,244,1);">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel"><b style="margin-left: 170px;">Đăng bài
                            viết</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="user-profile">
                        <img src="images/avt.jpg" alt="">
                        <div>
                            <p> Alex Carry</p>
                            <small>
                                <div>
                                    <select style="border: none; background-color: transparent;">
                                        <option selected>Công khai</option>
                                        <option value="">Bạn bè</option>
                                        <option value="">Chỉ mình tôi</option>
                                    </select>
                                </div>
                            </small>
                        </div>
                    </div> <br>
                    <textarea name="" placeholder="Bạn muốn đăng gì?" id="" cols="30" rows="3" style="    width: 100%;
                 border: 0px;
                 outline: none;
                 border-bottom: 1px solid #ccc;
                 background: transparent;
                 resize: none;"></textarea><br>
                    <center>
                        <img id="img" src="" width="45%"
                            style="border-radius: 10px; border: 1px solid rgb(184, 182, 182)">
                    </center>
                </div>
                <div class="modal-footer">
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupFile01">
                            <i class="fa-regular fa-image"></i>Photo/Video</label>
                        <input type="file" class="form-control" id="inputGroupFile01">
                    </div>

                    <button style="width: 500px;background-color: #5A4F48; border: none;" class="btn btn-primary"
                        data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Đăng
                        bài</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    &nbsp;&nbsp;
                    <a class="navbar-brand" href="#"
                        style="color: #F27323;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-weight: bolder;">VIE_SONET</a>
                    <div class="row">
                        <div class="col-4 post-upload-textarea">
                            <div style=" display: flex; align-items: center; justify-content: space-between;">
                                <div class="user-profile">
                                    <img src="images/avt.jpg" class="img-thumbnail" alt="">
                                    <div>
                                        <p style="color: #5A4F48;"> Trần Văn Minh Híu</p>
                                        <small>August 13 1999, 09.18 pm</small>
                                    </div>
                                </div>
                                <div>
                                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                </div>
                            </div><br>
                            <textarea name="" id="" cols="30" readonly
                                placeholder="">Thấy tui có đẹp trai chưa nè?</textarea>
                            <div class="post-reaction" style="margin-bottom: 5px;">
                                <div class="activity-icons">
                                    <div><img src="images/like-blue.png" alt="">120</div>
                                    <div><img src="images/comments.png" alt="">52</div>
                                    <div><img src="images/share.png" alt="">35</div>
                                </div>
                            </div>
                            <div style="overflow-y: hidden;overflow-y: scroll; height: 54vh; padding-right: 5px;">
                                <div class="user-profile">
                                    <img src="images/avt.jpg" style="width: 35px;">
                                    <div style="margin-top: 40px;  width: 400px; height: 80px; border-radius: 10px;">
                                        &nbsp; <b style="color: #5A4F48;">Lý Hiếu</b>
                                        <textarea name="" id="" cols="50" rows="2" placeholder="" readonly
                                            style="padding-left: 10px;color: #626262;">Mới cắt tóc à. Sao không rủ t đi?</textarea>
                                    </div>
                                </div>
                                <div class="user-profile">
                                    <img src="images/avt.jpg" style="width: 35px;">
                                    <div style="margin-top: 40px; width: 400px; height: 80px; border-radius: 10px;">
                                        &nbsp; <b>Lê Trung</b>
                                        <textarea name="" id="" cols="50" rows="2" placeholder="Mới đi cắt tóc à"
                                            readonly style="padding-left: 10px;">T đẹp hơn m đây này</textarea>
                                    </div>
                                </div>
                                <div class="user-profile">
                                    <img src="images/avt.jpg" style="width: 35px;">
                                    <div style="margin-top: 40px;  width: 400px; height: 80px; border-radius: 10px;">
                                        &nbsp; <b>Minh Quý</b>
                                        <textarea name="" id="" cols="50" rows="2" placeholder=""
                                            style="padding-left: 10px;">A trai chụp ảnh photoshop quá đi:))</textarea>
                                    </div>
                                </div>
                                <div class="user-profile">
                                    <img src="images/avt.jpg" style="width: 35px;">
                                    <div style="margin-top: 40px; width: 400px; height: 80px; border-radius: 10px;">
                                        &nbsp; <b>Lê Trung Hiếu</b>
                                        <textarea name="" id="" cols="50" rows="2" placeholder="Mới đi cắt tóc à"
                                            style="padding-left: 10px;">Xin info cái máy ảnh</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-8 text-center" style="position: relative;">
                            <img src="images/caMap.jpg" class="img-thumbnail nenTrang"
                                style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);"
                                width="55%" alt="">
                        </div>
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
</body>

</html>