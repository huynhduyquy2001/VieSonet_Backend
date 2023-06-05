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
			var binhLuanFormHtml = "<b>Bình luận:</b>" +
				"<form action=''>" +
				"<div style='display: flex; flex-direction: column;'>" +
				"<input type='text' class='ip form-control' style='width: 80%;' placeholder='Nhận xét của bạn'>" +
				"<button class='btn01' style='background: #3B998B; color: white;'>Bình luận</button>" +
				"</div>" +
				"</form>";

			$("#danhSachBinhLuan .modal-body .trai").append(binhLuanFormHtml);



			// Hiển thị danh sách bình luận lên modal
			danhSachBinhLuan.forEach(function(binhLuan) {
				var binhLuanHtml = "<div class='user-profile' style='border: 1px solid #E1D4C4; box-sizing: border-box; padding: 4px; border-radius: 5px;background-color: white; margin-bottom:5px'>" +
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
    <div class="write-post-container nenTrangChu img-thumbnail animate__animated animate__backInLeft" style="margin-bottom: 20px; border-radius: 0; box-shadow: 0 0 0;">
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
			$("#danhSachBinhLuan").modal("show");
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}
