function goViPham(sdt) {
	$.ajax({
		url: "/goViPham/" + sdt,
		type: "GET",
		success: function(data) {
			let myDiv = document.getElementById("tableLoad");
			myDiv.innerHTML = "";
			var dsNguoiDung = JSON.parse(data);
			dsNguoiDung.forEach(function(item) {
				var table = "<tr>" +
					"<td scope='row'><img class='img-thumbnail' style='border-radius: 16px;'"
					+ "src='/images/" + item.anhDaiDien + "' width='50%' alt='" + item.anhDaiDien + "'></td>"
					+ "<td style='white-space: nowrap; "
					+ "overflow: hidden;"
					+ "text-overflow: ellipsis;"
					+ "max-width: 150px;'><span data-bs-toggle='tooltip' data-bs-placement='top'"
					+ "title='" + item.hoTen + "'>"
					+ "<small>" + item.hoTen + "</small>"
					+ "</span></td>"
					+ "<td class='anNoiDung' style='max-width: 150px;'><small>" + (item.gioiTinh ? "Nam" : "Nữ") + "</small> </td>"
						+ "<td class='anNoiDung' style='max-width: 250px;'>"
						+ " <small>" + item.sdt + "</small>"
						+ "</td>"
						+ "<td class='anNoiDung' style='max-width: 250px;'>"
						+ "<small>" + item.email + "</small>"
						+ "</td>"
						+ "<td class='anNoiDung text-center' style='max-width: 250px;'>"
						+ "<small>" + item.luotViPham + "</small>"
						+ "</td>"
						+ "<td class='anNoiDung' style='max-width: 250px;'>"
						+ "<small>" + (item.trangThai ? "Hoạt động" : "Đã thôi việc") + "</small>"
						+ "</td>"
						+ "<td>"
						+ "<a onclick='goViPham(" + item.sdt + ")' data-bs-toggle='tooltip' data-bs-placement='top'"
						+ " title='Gỡ bỏ vi phạm' href='#'' class='me-3'>"
						+ "<i class='fa-solid fa-file-import'></i>"
						+ "</a>"
						+ "<a data-bs-toggle='tooltip' data-bs-placement='top'"
						+ " title='Chỉnh sửa' href='/chinhSua/"+item.sdt+"'>"
						+ " <i class='fa-solid fa-pen-to-square'></i>"
						+ "</a>"
						+ "</td>"
				+ "</tr>";
				
				myDiv.innerHTML += table;
			});
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}