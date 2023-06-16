function goViPham(sdt) {
	
	$.ajax({
		url: "/quanly/goViPham/" + sdt,
		type: "GET",
		success: function(data) {
			alert(sdt)
			let myDiv = document.getElementById("tableLoad");
			myDiv.innerHTML = "";
			var dsNguoiDung = JSON.parse(data);
			console.log("OKOKOK")
			dsNguoiDung.forEach(function(item) {
				var button
					if (item.luotViPham == 0) {
						button = "";
					} else {
						button =  "<a onclick='goViPham('" + item.sdt + "')' data-bs-toggle='tooltip' data-bs-placement='top'"
							+ " title='Gỡ bỏ vi phạm' href='#'' class='me-3'>"
							+ "<i class='fa-solid fa-file-import'></i>"
							+ "</a>"
					}
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
					+ "<small>" + (item.trangThai ? "Hoạt động" : "Không hoạt động") + "</small>"
					+ "</td>"
					+ "<td>"
					+ button
					+ "<a data-bs-toggle='tooltip' data-bs-placement='top'"
					+ " title='Chỉnh sửa' href='/quanly/chinhSua/" + item.sdt + "'>"
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

function timKiem() {
	const timKiem = document.getElementById("timKiem");
	const kt = timKiem.value.trim();
	const regex = /^(0\d{9}|0\d{11})$/;
	
	if (regex.test(kt) == true) {
		// Thực hiện cuộc gọi AJAX để tìm kiếm số điện thoại
		$.ajax({
			url: "/quanly/timKiemDanhSachSDT/" + kt,
			type: "GET",
			success: function(data) {
				let myDiv = document.getElementById("tableLoad");
				myDiv.innerHTML = "";
				var button
				if (data.luotViPham == 0) {
					button = "";
				} else {
					button = + "<a onclick='goViPham(" + data.sdt + ")' data-bs-toggle='tooltip' data-bs-placement='top'"
						+ " title='Gỡ bỏ vi phạm' href='#'' class='me-3'>"
						+ "<i class='fa-solid fa-file-import'></i>"
						+ "</a>"
				}
				var table = "<tr>" +
					"<td scope='row'><img class='img-thumbnail' style='border-radius: 16px;'"
					+ "src='/images/" + data.anhDaiDien + "' width='50%' alt='" + data.anhDaiDien + "'></td>"
					+ "<td style='white-space: nowrap; "
					+ "overflow: hidden;"
					+ "text-overflow: ellipsis;"
					+ "max-width: 150px;'><span data-bs-toggle='tooltip' data-bs-placement='top'"
					+ "title='" + data.hoTen + "'>"
					+ "<small>" + data.hoTen + "</small>"
					+ "</span></td>"
					+ "<td class='anNoiDung' style='max-width: 150px;'><small>" + (data.gioiTinh ? "Nam" : "Nữ") + "</small> </td>"
					+ "<td class='anNoiDung' style='max-width: 250px;'>"
					+ " <small>" + data.sdt + "</small>"
					+ "</td>"
					+ "<td class='anNoiDung' style='max-width: 250px;'>"
					+ "<small>" + data.email + "</small>"
					+ "</td>"
					+ "<td class='anNoiDung text-center' style='max-width: 250px;'>"
					+ "<small>" + data.luotViPham + "</small>"
					+ "</td>"
					+ "<td class='anNoiDung' style='max-width: 250px;'>"
					+ "<small>" + (data.trangThai ? "Hoạt động" : "Không hoạt động") + "</small>"
					+ "</td>"
					+ "<td>"
					+ button
					+ "<a data-bs-toggle='tooltip' data-bs-placement='top'"
					+ " title='Chỉnh sửa' href='/chinhSua/" + data.sdt + "'>"
					+ " <i class='fa-solid fa-pen-to-square'></i>"
					+ "</a>"
					+ "</td>"
					+ "</tr>";

				myDiv.innerHTML += table;
			},
			error: function(xhr, status, error) {
				// Xử lý lỗi nếu có
				console.log(error);
			}
		});
	} else {
		// Thực hiện cuộc gọi AJAX để tìm kiếm từ khóa
		if(kt.length === 0){
			$.ajax({
			url: "/quanly/timKiemAll",
			type: "POST",
			success: function(data) {
				console.log(data)
				let myDiv = document.getElementById("tableLoad");
				myDiv.innerHTML = "";
				data.forEach(function(item) {
					var button
					if (item.luotViPham == 0) {
						button = "";
					} else {
						button = + "<a onclick='goViPham(" + data.sdt + ")' data-bs-toggle='tooltip' data-bs-placement='top'"
							+ " title='Gỡ bỏ vi phạm' href='#'' class='me-3'>"
							+ "<i class='fa-solid fa-file-import'></i>"
							+ "</a>"
					}
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
						+ "<small>" + (item.trangThai ? "Hoạt động" : "Không hoạt động") + "</small>"
						+ "</td>"
						+ "<td>"
						+ button
						+ "<a data-bs-toggle='tooltip' data-bs-placement='top'"
						+ " title='Chỉnh sửa' href='/chinhSua/" + item.sdt + "'>"
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
		}else{
			$.ajax({
			url: "/quanly/timKiemDanhSachTen/" + kt,
			type: "POST",
			success: function(data) {
				console.log(data)
				let myDiv = document.getElementById("tableLoad");
				myDiv.innerHTML = "";
				data.forEach(function(item) {
					var button
					if (item.luotViPham == 0) {
						button = "";
					} else {
						button = + "<a onclick='goViPham(" + data.sdt + ")' data-bs-toggle='tooltip' data-bs-placement='top'"
							+ " title='Gỡ bỏ vi phạm' href='#'' class='me-3'>"
							+ "<i class='fa-solid fa-file-import'></i>"
							+ "</a>"
					}
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
						+ "<small>" + (item.trangThai ? "Hoạt động" : "Không hoạt động") + "</small>"
						+ "</td>"
						+ "<td>"
						+ button
						+ "<a data-bs-toggle='tooltip' data-bs-placement='top'"
						+ " title='Chỉnh sửa' href='/chinhSua/" + item.sdt + "'>"
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
		
	}
}