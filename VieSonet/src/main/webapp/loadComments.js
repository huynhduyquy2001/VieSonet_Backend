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
				var binhLuanHtml = "<div class='user-profile animate__animated animate__headShake' style='border: 1px solid #E1D4C4; box-sizing: border-box; padding: 4px; border-radius: 5px;background-color: white; margin-bottom:5px'>" +
					"<img src='images/" + binhLuan[1] + "' class='img-thumbnail' alt=''>" +
					"<div>" +
					"<div><p class='nhan' style='color: #A59565; font-size: 15px;'>" + binhLuan[0] + "</p></div>" +
					"<small style='font-size: 12px;'><i class='fa-regular fa-comment'></i> " + binhLuan[2] + "</small><br>" +
					"<small style='font-size: 10px;'>" + binhLuan[3] + "</small>" +
					"</div>" +
					"</div>";

				$("#danhSachBinhLuan .modal-body .trai").append(binhLuanHtml);
			});
			// Hiển thị thông tin bài viết lên modal
			var baiVietHtml = `
    <div class="write-post-container nenTrangChu img-thumbnail" style="margin-bottom: 20px; border-radius: 0; box-shadow: 0 0 0;">
        <div style="padding: 10px; border: 1px solid rgba(210, 199, 188, 1); margin: 0;">
            <div style="display: flex; align-items: center; justify-content: space-between;">
                <div class="user-profile">
                    <img src="images/${baiViet[6]}" class="img-thumbnail" alt="">
                    <div>
                        <label class="nhan">${baiViet[5]}</label><br>
                        <small style="font-size: 12px; color: #65676b">${baiViet[2]}</small>
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
                        <img src="images/${baiViet[1]}" width="100%" alt="" style="margin-top: 10px; margin-bottom: 10px; border-radius: 6px;">
                    </center>
                </div>
            </a>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div>
                        <i class="fa-regular fa-thumbs-up"></i> &nbsp; ${baiViet[3]}
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
				alert(response); // Hiển thị thông báo thành công
				// Xử lý dữ liệu trả về (nếu cần)
				// Ví dụ: cập nhật giao diện hoặc hiển thị thông báo trên trang
			},
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
	} else {
		element.classList.remove('gray-heart');
		element.classList.add('red-heart');
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

			// Cập nhật số lượt thích
			var likeCountElement = element.querySelector('.like-count');
			if (likeCountElement) {
				likeCountElement.textContent = response.luotThich;
			}
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









