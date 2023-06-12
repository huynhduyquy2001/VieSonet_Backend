function them() {
	var maLoai = document.getElementById("maViPham").value;
	var chiTiet = document.getElementById("chiTiet").value;
	if (!maLoai) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Không được bỏ trống mã vi phạm";
		return;
	}

	$.ajax({
		url: "/quanly/quanlyvipham/them/" + maLoai,
		type: "GET",
		data: {
			maViPham: maLoai,
			chiTiet: chiTiet
		},

		success: function(data) {
			if (data == "Thêm thành công") {
				location.reload();
			} else {
				var mess = document.getElementById("message")
				mess.innerHTML = data;
			}
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}



function sua() {
	var maLoai = document.getElementById("maViPham").value;
	var chiTiet = document.getElementById("chiTiet").value;

	if (maLoai == "") {
		var mess = document.getElementById("message")
		mess.innerHTML = "Vui lòng chọn một điều khoản để sửa!"
		return;
	}
	if(chiTiet == ""){
		var mess = document.getElementById("message")
		mess.innerHTML = "Vui lòng không bỏ trống chi tiết khi sửa!"
		return;
	}

	var selectedRow = $('table tbody tr.selected');
	if (selectedRow.length > 0) {
		var originalMaLoai = selectedRow.find('td:first').text().trim();
		if (maLoai != originalMaLoai) {
			var mess = document.getElementById("message")
			mess.innerHTML = "Không được phép thay đổi mã vi phạm!"
			return;
		}

		var originalChiTiet = selectedRow.find('td:nth-child(2)').text().trim();
		if (chiTiet == originalChiTiet) {
			var mess = document.getElementById("message")
			mess.innerHTML = "Không có thay đổi nào được thực hiện!"
			return;
		}
	}

	$.ajax({
		url: "/quanly/quanlyvipham/sua/" + maLoai,
		type: "GET",
		data: {
			chiTiet: chiTiet
		},

		success: function(data) {
			if (data == "Sửa thành công") {
				location.reload();
			} else {
				var mess = document.getElementById("message")
				mess.innerHTML = data;
			}
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

$(document).ready(function() {
	$('table tbody tr').click(function() {
		$('table tbody tr').removeClass('selected');
		$(this).addClass('selected');

		var maLoai = $(this).find('td:first').text().trim();
		var chiTiet = $(this).find('td:nth-child(2)').text().trim();

		$('#maViPham').val(maLoai);
		$('#chiTiet').val(chiTiet);
	});
});


