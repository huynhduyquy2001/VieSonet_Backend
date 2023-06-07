function guiMa(){
	var email = document.getElementsByName("email")[0].value;
	$.ajax({
		url: "/quenmatkhau1" ,
		type: "POST",
		data: {mail: email},
		dataType: "json",
		success: function(data) {
			console.log(data)
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});	
}
