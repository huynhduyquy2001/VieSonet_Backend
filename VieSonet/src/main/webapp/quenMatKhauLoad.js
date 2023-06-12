function guiMa() {
	var email = document.getElementById("email").value;

	if (!email) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập địa chỉ email";
		return;
	}
	
	$.ajax({
		url: "/quenmatkhau/guima",
		type: "GET",
		data: {
			mail: email
		},
		success: function(data) {
			var tb = data;
			var mess = document.getElementById("message");
			mess.innerHTML = "";
			mess.innerHTML += tb;
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}


function xemMatKhau() {
	var matMa = document.getElementById("matMa").value;
	var email = document.getElementById("email").value;
	if (!email) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập địa chỉ email";
		return;
	}
	if (!matMa) {
		var mess = document.getElementById("message");
		mess.innerHTML = "Vui lòng nhập mật mã đã gửi hoặc bấm vào nút gửi mã nếu chưa";
		return;
	}

	$.ajax({
		url: "/quenmatkhau/xemmatkhau",
		type: "GET",
		data: {
			ma: matMa,
			mail: email
		},
		success: function(data) {
			if (data == "Mật mã đúng") {
				window.location.href = "/DoiMatKhau";
			}else{
				var mess = document.getElementById("message")
				mess.innerHTML = data;
			}

		}
	});
}
