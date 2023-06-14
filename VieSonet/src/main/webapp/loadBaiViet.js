function loadBaiViet(maBaiViet) {
	$.ajax({
		url: "/baiviet/view/" + maBaiViet,
		type: "GET",
		success: function(data) {
			// Xử lý dữ liệu trả về từ server
			var baiViet = data.baiViet;
			var danhSachBinhLuan = data.danhSachBinhLuan;

			// Xóa các bình luận cũ trong modal (nếu có)

			$("#danhSachBinhLuan .modal-body .phai").empty();

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
