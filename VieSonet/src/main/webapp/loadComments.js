 function loadBinhLuan(maBaiViet) {
	$.ajax({
		url: "/binhluan/" + maBaiViet,
		type: "GET",
		success: function(data) {
			// Xử lý dữ liệu trả về từ server
			var baiViet = data.baiViet;
			var danhSachBinhLuan = data.danhSachBinhLuan;

			// Xóa các bình luận cũ trong modal (nếu có)
			$("#danhSachBinhLuan .modal-body .trai").empty();
			$("#danhSachBinhLuan .modal-body .phai").empty();

			// Hiển thị phần nhập bình luận
			var binhLuanFormHtml = "<form id='binhLuanForm'>" +
				"<div style='display: flex; flex-direction: column;'>" +
				"<input type='text' id='binhLuan' class='ip form-control' style='width: 80%;' placeholder='Nhận xét của bạn' name='binhLuanCuaToi' required>" +
				"<button class='btn01' type='submit' style='background: #3B998B; color: white;' onclick='themBinhLuan(" + baiViet[8] + ")'>Bình luận</button>" +
				"</div>" +
				"</form>";
		
	                    
			$("#danhSachBinhLuan .modal-body .trai").append(binhLuanFormHtml);
			// Hiển thị danh sách bình luận lên modal
			danhSachBinhLuan.forEach(function(binhLuan) {
				
				var currentTime1 = new Date();
		
 				var activityTime1 = new Date(binhLuan[3]);
	                    var timeDiff1 = currentTime1.getTime() - activityTime1.getTime();
	                    var seconds1 = Math.floor((timeDiff1 / 1000) % 60);
	                    var minuteDiff1 = Math.floor(timeDiff1 / (1000 * 60));
	                    var hourDiff1 = Math.floor(timeDiff1 / (1000 * 3600));
	                    var daysDiff1 = Math.floor(timeDiff1 / (1000 * 3600 * 24));
	                    var monthsDiff1 = Math.floor(daysDiff1 / 30);
	                    var yearsDiff1 = Math.floor(monthsDiff1 / 12);

	                    var timeString1 = "";
	                    if (daysDiff1 === 0) {
	                        if (minuteDiff1 === 0) {
	                            timeString1 = seconds1 + " giây trước";
	                        } else if (hourDiff1 === 0 && minuteDiff1 < 60) {
	                            timeString1 = minuteDiff1 + " phút trước";
	                        } else if (minuteDiff1 > 60) {
	                            timeString1 = hourDiff1 + " giờ trước";
	                        }
	                    } else if (daysDiff1 < 1) {
	                        timeString1 = "1 ngày trước";
	                    } else if (monthsDiff1 < 1) {
	                        timeString1 = daysDiff1 + " ngày trước";
	                    } else if (yearsDiff1 < 1) {
	                        timeString1 = monthsDiff1 + " tháng trước";
	                    }
	                    
				var binhLuanHtml = "<div class='user-profile animate__animated animate__headShake' style='border: 1px solid #E1D4C4; box-sizing: border-box; padding: 4px; border-radius: 5px;background-color: white; margin-bottom:5px'>" +
					"<img src='/images/" + binhLuan[1] + "' class='img-thumbnail' alt=''>" +
					"<div>" +
					"<div><p class='nhan' style='color: #A59565; font-size: 15px;'>" + binhLuan[0] + "</p></div>" +
					"<small style='font-size: 12px;'><i class='fa-regular fa-comment'></i> " + binhLuan[2] + "</small><br>" +
					"<small style='font-size: 10px;'>" + timeString1 + "</small>" +
					"</div>" +
					"</div>";
				$("#danhSachBinhLuan .modal-body .trai").append(binhLuanHtml);
			});
			// Hiển thị thông tin bài viết lên modal
			var currentTime = new Date();
			 
	                    var activityTime = new Date(baiViet[2]);
	                    var timeDiff = currentTime.getTime() - activityTime.getTime();
	                    var seconds = Math.floor((timeDiff / 1000) % 60);
	                    var minuteDiff = Math.floor(timeDiff / (1000 * 60));
	                    var hourDiff = Math.floor(timeDiff / (1000 * 3600));
	                    var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
	                    var monthsDiff = Math.floor(daysDiff / 30);
	                    var yearsDiff = Math.floor(monthsDiff / 12);

	                    var timeString = "";
	                    if (daysDiff === 0) {
	                        if (minuteDiff === 0) {
	                            timeString = seconds + " giây trước";
	                        } else if (hourDiff === 0 && minuteDiff < 60) {
	                            timeString = minuteDiff + " phút trước";
	                        } else if (minuteDiff > 60) {
	                            timeString = hourDiff + " giờ trước";
	                        }
	                    } else if (daysDiff < 1) {
	                        timeString = "1 ngày trước";
	                    } else if (monthsDiff < 1) {
	                        timeString = daysDiff + " ngày trước";
	                    } else if (yearsDiff < 1) {
	                        timeString = monthsDiff + " tháng trước";
	                    }
			
			var baiVietHtml = `
    <div class="write-post-container nenTrangChu img-thumbnail" style="margin-bottom: 20px; border-radius: 0; box-shadow: 0 0 0;">
        <div style="padding: 10px; border: 1px solid rgba(210, 199, 188, 1); margin: 0;">
            <div style="display: flex; align-items: center; justify-content: space-between;">
                <div class="user-profile">
                    <img src="/images/${baiViet[6]}" class="img-thumbnail" alt="">
                    <div>
                        <label class="nhan">${baiViet[5]}</label><br>
                        <small style="font-size: 12px; color: #65676b">${timeString}</small>
                    </div>
                </div>
                <div>
                    <div class="btn-group">
                        <span class="btn dropdown-toggle" type="button" id="triggerId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>
                        <div class="dropdown-menu" aria-labelledby="triggerId">
                            <a class="dropdown-item" href="#">Báo cáo vi phạm</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="">
                <div style="margin-top: 10px; color: #847577">
                    ${baiViet[0]}
                    <center>
                        <img src="/images/${baiViet[1]}" width="100%" alt="" style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;">
                    </center>
                </div>
            </a>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div>
                        <i class="fa-duotone fa-heart"></i> &nbsp; ${baiViet[3]}
                    </div>
                    <div>
                        <i class="fa-regular fa-comment"></i>&nbsp; ${baiViet[4]}
                    </div>
                </div>
            </div>
        </div>
    </div>
`;
			$("#danhSachBinhLuan .modal-body .phai").append(baiVietHtml);

			// Mở modal
			if (!$("#danhSachBinhLuan").is(":visible")) {
				// Mở modal chỉ khi nó chưa được hiển thị
				$("#danhSachBinhLuan").modal("show");
			}
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

$(document).ready(function() {
	$("#postForm").submit(function(event) {
		event.preventDefault();

		var formData = new FormData($(this)[0]);

		$.ajax({
			type: "POST",
			url: $(this).attr("action"),
			data: formData,
			contentType: false,
			processData: false,
			success: function(response) {
				if (response !== "") {
					alert(response); // Hiển thị thông báo thành công
					// Xử lý dữ liệu trả về (nếu cần)
					// Ví dụ: cập nhật giao diện hoặc hiển thị thông báo trên trang
				}
			},
			error: function(e) {
				alert("Đã xảy ra lỗi: " + e.responseText);
			}
			,
			error: function(e) {
				alert("Đã xảy ra lỗi: " + e.responseText);
			}
		});
	});
});

function thichBaiViet(maBaiViet, element) {
	var isLiked = element.classList.contains('red-heart');
	if (isLiked) {
		element.classList.remove('red-heart');
		element.classList.add('gray-heart');
		// Giảm số lượt thích
		var likeCountElement = element.querySelector('.like-count');
		if (likeCountElement) {
			var likeCount = parseInt(likeCountElement.textContent);
			likeCountElement.textContent = likeCount - 1;
		}
	} else {
		element.classList.remove('gray-heart');
		element.classList.add('red-heart');
		// Tăng số lượt thích
		var likeCountElement = element.querySelector('.like-count');
		if (likeCountElement) {
			var likeCount = parseInt(likeCountElement.textContent);
			likeCountElement.textContent = likeCount + 1;
		}
	}

	// Tạo một đối tượng XMLHttpRequest
	var xhr = new XMLHttpRequest();

	// Xác định phương thức và URL của yêu cầu
	xhr.open('GET', '/index/thich/' + maBaiViet, true);

	// Định nghĩa hàm xử lý khi nhận được phản hồi từ server
	xhr.onload = function() {
		if (xhr.status === 200) {
			console.log(xhr.responseText); // Log kết quả từ server
			var response = JSON.parse(xhr.responseText); // Chuyển đổi phản hồi thành đối tượng JSON

			// Cập nhật trạng thái nút thích


		} else {
			console.error('Lỗi ' + xhr.status + ': ' + xhr.statusText);
			// Xử lý lỗi (nếu có)
		}
	};

	// Gửi yêu cầu
	xhr.send();
}


function themBinhLuan(maBaiViet) {
	$("#binhLuanForm").submit(function(event) {
		event.preventDefault();
	});

	var binhLuan = $("#binhLuan").val();
	$.ajax({
		url: "/index/thembinhluan/" + maBaiViet,
		type: "POST",
		data: { binhLuanCuaToi: binhLuan },
		success: function(response) {
			
			loadBinhLuan(maBaiViet);
		},
		error: function(xhr, status, error) {
			console.error("Lỗi khi thêm bình luận: ", error);
		}
	});
}
function toCao(maBaiViet) {
	$("#modalBaoCao .modal-footer").empty();
	var closeModal = document.createElement("button");
	closeModal.type = "button";
	closeModal.className = "btn btn-secondary";
	closeModal.innerHTML = "Đóng";
	closeModal.setAttribute("data-bs-dismiss", "modal");

	var baoCaoModal = document.createElement("button");
	baoCaoModal.type = "button";
	baoCaoModal.className = "btn btn-primary";
	baoCaoModal.innerHTML = "Báo cáo";
	baoCaoModal.addEventListener("click", function() {
		baoCaoViPham(maBaiViet);
		$("#modalBaoCao").modal("hide");
	});

	var modalFooter = document.querySelector("#modalBaoCao .modal-footer");
	modalFooter.appendChild(closeModal);
	modalFooter.appendChild(baoCaoModal);
}

function baoCaoViPham(maBaiViet) {
	var loaiViPham = $("#viPham").val(); // Lấy giá trị của select box

	$.ajax({
		url: "/index/baocaovipham/" + maBaiViet,
		type: "POST",
		data: { loaiViPham: loaiViPham }, // Truyền giá trị của select box
		success: function(response) {
			// Xử lý logic sau khi gọi thành công
			console.log(response); // In response ra console để kiểm tra
		},
		error: function(xhr, status, error) {
			console.log(error); // In error ra console để debug
			// Xử lý logic khi gọi gặp lỗi
		}
	});
}


function xoaThongBao(maThongBao){
	$.ajax({
    url: "/xoathongbao/" + maThongBao, // Replace maThongBao with the actual notification ID
    method: "GET",
    success: function (data) {
       $("#danhSachThongBao").empty();
       $("#soLuongThongBao").empty();
var soLuongThongBao= $("#soLuongThongBao").val();
var dataLength = data.length;
$("#soLuongThongBao").append('('+dataLength+')');
    data.forEach(function (item) {
		alert(item[0]);
        var itemHtml = `<a onclick="loadBinhLuan(${item[1]})">
            <div class="user-profile" style="width: 250px; padding-left: 3%;">
                <img src="images/${item[3]}" alt="">
                <div>
                    <p style="font-size: 13px">${item[4]}</p>
                    <div style="justify-content: space-between; display: flex;">
                        <small style="font-size: 11px">
                            <script type="text/javascript">
                                var currentTime = new Date();
                                var activityTime = new Date('${item[5]}');
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
                                    document.write('<fmt:formatDate value="${item[5]}" pattern="dd-MM-yyyy HH:mm" />');
                                }
                            </script>
                        </small>
                        <small style="font-size: 12px"><a style="cursor: pointer;" onclick="xoaThongBao(${item[0]})">x</a></small>
                    </div>
                </div>
            </div>
        </a>`;
        // Thêm itemHtml vào #danhSachThongBao
        $("#danhSachThongBao").append(itemHtml);
    });
    
    },
    error: function (xhr, status, error) {
        console.log(error); // Handle the error response here
    }
});
}













