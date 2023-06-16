function chiTietBaiViet(maBaiViet) {
	$.ajax({
		url: "/quanly/chiTietBaiViet/" + maBaiViet,
		type: "GET",
		success: function(data) {
			let myDiv = document.getElementById("modalBody");
			myDiv.innerHTML = "";
			var baiViet = data;
			let dateString = baiViet[2];
			let date = new Date(dateString);

			let day = date.getUTCDate().toString().padStart(2, '0');
			let month = (date.getUTCMonth() + 1).toString().padStart(2, '0');
			let year = date.getUTCFullYear().toString();

			let outputDate = `${year}-${month}-${day}`;
			var tb = `<div class="write-post-container nenTrangChu img-thumbnail"
                        style="margin-bottom: 20px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
                        <div style=" display: flex; align-items: center; justify-content: space-between; ">
                            <div class="user-profile">
                               <a href="/nguoiDung/${baiViet[7]}" target="_blank">
                                <img src="/images/${baiViet[6]}" class="img-thumbnail" alt="">
                               </a> 
                                <div>
                                <a href="/nguoiDung/${baiViet[7]}" target="_blank">
                                    <p style="color: #A59565;"> ${baiViet[5]}</p>
                                    </a> 
                                    <small>` + outputDate + `</small>
                                </div>
                            </div>
                        </div>
                        <div style="margin-top: 10px;">
                           ${baiViet[0]}
                            <center>
                                <img src="/images/${baiViet[1]}" class="img-thumbnail" width="100%" alt=""
                                    style="margin-top: 10px;margin-bottom: 10px; border-radius: 6px;">
                            </center>
                            <div class="post-reaction">
                                <div class="activity-icons">
                                    <div><i class="fa-regular fa-thumbs-up"></i> &nbsp; ${baiViet[3]} </div>
                                    <div><i class="fa-regular fa-comment"></i>&nbsp; ${baiViet[4]}</div>
                                </div>
                            </div>
                        </div>
                    </div>`
			myDiv.innerHTML += tb
			$("#modal1").modal("show");
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

function danhDauViPham(maBaiViet) {
	$.ajax({
		url: "/quanly/danhDauBaiViet/" + maBaiViet,
		type: "GET",
		success: function(data) {
			let myDiv = document.getElementById("tableLoad");
			myDiv.innerHTML = "";
			let myDiv2 = document.getElementById("tableLoad2");
			myDiv2.innerHTML = "";
			var dsToCao = data.dsBiToCao;
			var dsViPham = data.dsViPham;
			var baiViet = data;

			dsToCao.forEach(function(item) {
				var table = "<tr>"
					+ "<td class='anNoiDung text-center'>" + item.maBaiViet + "</td>"
					+ "<td class='anNoiDung text-center' style=' max-width: 250px;'>"
					+ " <small>" + item.soLuong + "</small>"
					+ "</td>"
					+ "<td class='text-center'> <small>" + (item.soLuong > 3 ? 'Vi Phạm' : 'Xem xét') + "</small></td>"
					+ "<td class='text-center'>"
					+ "<a href='#' onclick='chiTietBaiViet(" + item.maBaiViet + ")' data-bs-placement='top'"
					+ "title='Xem chi tiết bài viết'"
					+ "style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ " class='btn btn-info btn-sm info-button me-1'>"
					+ "<i class='fa-light fa-eye'></i>"
					+ "</a>"
					+ "<a href='#' onclick='danhDauViPham(" + item.maBaiViet + ")' data-bs-placement='top' title='Đánh dấu vi phạm'"
					+ "style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ "class='btn btn-info btn-sm info-button'>"
					+ "<i class='fa-solid fa-flag-pennant'></i>"
					+ "</a>"
					+ "</td>"
					+ "</tr>";
				myDiv.innerHTML += table
			});

			dsViPham.forEach(function(item) {
				let dateString = item.ngayDang;
				let date = new Date(dateString);

				let day = date.getUTCDate().toString().padStart(2, '0');
				let month = (date.getUTCMonth() + 1).toString().padStart(2, '0');
				let year = date.getUTCFullYear().toString();

				let outputDate = `${year}-${month}-${day}`;
				var table2 = "<tr>"
					+ " <td class='anNoiDung' style='max-width: 150px;'><small>" + outputDate + "</small>"
					+ " </td>"
					+ " <td class='anNoiDung' style=' max-width: 250px;'>"
					+ "    <small>" + item.hoTen + "</small>"
					+ "</td>"
					+ "<td class='text-center'>"
					+ "   <a onclick='xemBaiViet(" + item.maBaiViet + ")' href='#' data-bs-placement='top' title='Xem chi tiết bài viết'"
					+ "      style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ " class='btn btn-info btn-sm info-button'>"
					+ " <i class='fa-light fa-eye'></i></a>"
					+ " <a data-bs-toggle='tooltip' data-bs-placement='top' title='Gỡ khỏi danh sách vi phạm' href='#'"
					+ "  onclick='xoaBaiVietViPham(" + item.maBaiViet + ")' style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ "  class='btn btn-info btn-sm info-button'>"
					+ "  <i class='fa-solid fa-file-import'></i>"
					+ "</a>"
					+ "</td>"
					+ "</tr>"
				myDiv2.innerHTML += table2;
			});
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});

}

function xemBaiViet(maBaiViet) {
	$.ajax({
		url: "/quanly/xemBaiViet/" + maBaiViet,
		type: "GET",
		success: function(data) {
			let myDiv = document.getElementById("modalBody");
			myDiv.innerHTML = "";

			var baiViet = data;
			let dateString = baiViet[2];
			let date = new Date(dateString);

			let day = date.getUTCDate().toString().padStart(2, '0');
			let month = (date.getUTCMonth() + 1).toString().padStart(2, '0');
			let year = date.getUTCFullYear().toString();

			let outputDate = `${year}-${month}-${day}`;
			var tb = `<div class="write-post-container nenTrangChu img-thumbnail"
                        style="margin-bottom: 20px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
                        <div style=" display: flex; align-items: center; justify-content: space-between; ">
                            <div class="user-profile">
                     			<a href="/nguoiDung/${baiViet[7]}" target="_blank">
                                <img src="/images/${baiViet[6]}" class="img-thumbnail" alt="">
                        		</a> 
                                <div>
                         			<a href="/nguoiDung/${baiViet[7]}" target="_blank">
                                    <p style="color: #A59565;"> ${baiViet[5]}</p>
                                    </a> 
                                    <small>${outputDate}</small>
                                </div>
                            </div>
                        </div>
                        <div style="margin-top: 10px;">
                            ${baiViet[0]}
                            <center>
                                <img src="/images/${baiViet[1]}" class="img-thumbnail" width="100%" alt=""
                                    style="margin-top: 10px;margin-bottom: 10px; border-radius: 6px;">
                            </center>
                            <div class="post-reaction">
                                <div class="activity-icons">
                                    <div><i class="fa-regular fa-thumbs-up"></i> &nbsp; ${baiViet[3]} </div>
                                    <div><i class="fa-regular fa-comment"></i>&nbsp; ${baiViet[4]}</div>
                                </div>
                            </div>
                        </div>
                    </div>`
			myDiv.innerHTML += tb
			$("#modal1").modal("show");
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

function xoaBaiVietViPham(maBaiViet) {
	$.ajax({
		url: "/quanly/xoaBaiVietViPham/" + maBaiViet,
		type: "GET",
		success: function(data) {
			let myDiv2 = document.getElementById("tableLoad2");
			myDiv2.innerHTML = "";

			data.forEach(function(item) {
				var table2 = "<tr>"
					+ " <td class='anNoiDung' style='max-width: 150px;'><small>" + item.ngayDang + "</small>"
					+ " </td>"
					+ " <td class='anNoiDung' style=' max-width: 250px;'>"
					+ "    <small>" + item.hoTen + "</small>"
					+ "</td>"
					+ "<td class='text-center'>"
					+ "   <a onclick='xemBaiViet(" + item.maBaiViet + ")' href='#' data-bs-placement='top' title='Xem chi tiết bài viết'"
					+ "      style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ " class='btn btn-info btn-sm info-button'>"
					+ " <i class='fa-light fa-eye'></i></a>"
					+ " <a data-bs-toggle='tooltip' data-bs-placement='top' title='Gỡ khỏi danh sách vi phạm' href='#'"
					+ "  onclick='xoaBaiVietViPham(" + item.maBaiViet + ")' style='background-color: rgba(234,229,224,1); color: #413026; border: 1px solid #5A4F48;'"
					+ "  class='btn btn-info btn-sm info-button'>"
					+ "  <i class='fa-solid fa-file-import'></i>"
					+ "</a>"
					+ "</td>"
					+ "</tr>"
				myDiv2.innerHTML += table2;
			});
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}