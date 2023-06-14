<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">

<header class="header animationTop3">
    <nav class="navbar navbar-expand-sm navbar-light" style="border: none; padding-top: 0; padding-bottom: 0;">
        <div class="container">
            <a class="navbar-brand nhan" href="/" style="color: #222; font-weight: bolder; font-family: 'robo';">
                <img src="images/chimLac.png" height="30px" alt=""> VIE_SONET
            </a>

            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/timKiem"><small
                                style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-family: sans-serif; letter-spacing: 0.1em; color: black;"><i
                                    class="fa-solid fa-magnifying-glass"></i></small></a></li> &nbsp;&nbsp;
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                            href="#" role="button" aria-haspopup="true" aria-expanded="false"><i
                                class="fa-regular fa-bell"></i> <span id="soLuongThongBao">(${thongBaoChuaXem})</span></a>
                        <div class="dropdown-menu" id="danhSachThongBao"
                            style="overflow: hidden; max-height: 60vh; overflow-y: scroll; left: -100px">
                            <c:forEach items="${thongBao}" var="item">
                                <a onclick="loadBinhLuan(${item.baiViet.maBaiViet})">
                                    <div class="user-profile" style="width: 250px; padding-left: 3%;">
                                        <img src="images/${item.nguoiDung.anhDaiDien}" alt="">
                                        <div>
                                            <p style="font-size: 13px">${item.noiDung}</p>
                                            <div style="justify-content: space-between; display: flex;">
                                                <small style="font-size: 11px">
                                                    <script type="text/javascript">
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
                                                </small>
                                                <small style="font-size: 12px">
                                                    <a style="cursor: pointer;"
                                                        onclick="xoaThongBao(${item.maThongBao})">x</a>
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdownId"
                            class="nav-link dropdown-toggle" href="/profile" id="dropdownId" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false"><small><img
                                    src="images/${taiKhoan.anhDaiDien}" width="30px"
                                    style="border-radius: 50%; border: 1px solid gray" alt=""></small></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownId"
                            style="padding-left: 3px; left: -100px; line-height: 35px">
                            <a class="dropdown-item" href="/profile"> <small>Xem trang cá nhân</small></a>
                            <a class="dropdown-item" href="/DanhSachBanBe"> <small>Danh sách bạn bè</small></a>
                            <a class="dropdown-item" href="/GoiYKB"> <small>Gợi ý kết bạn</small></a>
                            <c:if test="${sessionScope.vt == 2 || sessionScope.vt == 3}">
                                <!-- Nội dung chỉ hiển thị khi có vai trò 'admin' -->
                                <a class="dropdown-item" href="/quanly/quanLyBaiViet"> <small>Quản lý</small></a>
                            </c:if>
                            <a class="dropdown-item" href="/doimatkhau"> <small>Đổi mật khẩu</small></a>
                            <a class="dropdown-item" href="/dieukhoan"> <small>Điều khoản</small></a>
                            <a class="dropdown-item" href="/dangxuat"> <small>Đăng xuất</small></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
