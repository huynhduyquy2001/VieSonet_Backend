
function thongKe1() {
	var selectElement = document.getElementById("Nam");
	var Nam = selectElement.value;

	$.ajax({
		url: "/quanly/getThongKe",
		type: "POST",
		data: {
			Nam: Nam
		},
		dataType: "json",
		success: function(data) {
			var dsBaiViet = data.dsBaiVietViPham;
			var dsBaoCao = data.dsSoLuotBaoCao;
			var soBaiVietViPham = [];
			var soLuotBaoCao = [];
			for (var i = 0; i < dsBaiViet.length; i++) {
				soBaiVietViPham.push(dsBaiViet[i].soBaiVietViPham)
			}
			for (var i = 0; i < dsBaoCao.length; i++) {
				soLuotBaoCao.push(dsBaoCao[i].soLuotBaoCao)
			}
			//xóa biểu đồ có trước đó
			let bieuDo = document.getElementById("visitors-chart");
			bieuDo.innerHTML = "";
			//tạo biểu đồ mới
			bieuDo.innerHTML += "<canvas id='visitors-chart' ></canvas>"
			//Vẽ biểu đồ
			// Lấy thẻ canvas và lưu vào biến myChart
			var myChart = document.getElementById('visitors-chart').getContext('2d');

			// Tạo biểu đồ đường
			var ticksStyle = {
				fontColor: '#495057',
				fontStyle: 'bold'
			}

			var chart = new Chart(myChart, {
				data: {
					labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
					datasets: [{
					
						type: 'line',
						//thông số đường line 1
						data: soBaiVietViPham,
						backgroundColor: 'transparent',
						borderColor: '#3B998B',
						pointBorderColor: '#3B998B',
						pointBackgroundColor: '#3B998B',
						fill: false
						// pointHoverBackgroundColor: '#007bff',
						// pointHoverBorderColor    : '#007bff'
					},
					{
						type: 'line',
						//thông số đường line 2
						data: soLuotBaoCao,
						backgroundColor: 'transparent',
						borderColor: '#FF5733',
						pointBorderColor: '#FF5733',
						pointBackgroundColor: '#FF5733',
						fill: false
						// pointHoverBackgroundColor: '#ced4da',
						// pointHoverBorderColor    : '#ced4da'
					}]
				},
				options: {
					maintainAspectRatio: false,
					tooltips: {
						mode: 'index',
						intersect: true
					},
					hover: {
						mode: 'index',
						intersect: true
					},
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							// display: false,
							gridLines: {
								display: true,
								lineWidth: '4px',
								color: 'rgba(0, 0, 0, .2)',
								zeroLineColor: 'transparent'
							},
							ticks: $.extend({
								beginAtZero: true,
								max: 20,
    				            stepSize: 5
							}, ticksStyle)
						}],
						xAxes: [{
							display: true,
							gridLines: {
								display: false
							},
							ticks: ticksStyle
						}]
					}
				}
			});

		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

function thongKe2() {
	var selectElement = document.getElementById("chonNam");
	var Nam = selectElement.value;

	$.ajax({
		url: "/quanly/getThongKe2",
		type: "POST",
		data: {
			Nam: Nam
		},
		dataType: "json",
		success: function(data) {
			var dsDangKy = data;
			var slDangKy = [];
			for (var i = 0; i < dsDangKy.length; i++) {
				slDangKy.push(dsDangKy[i].soLuotDangKy)
			}
			let bieuDo = document.getElementById("bieuDo2");
			bieuDo.innerHTML = "";
			
			bieuDo.innerHTML += "<canvas id='myChart' height='150'></canvas>";
			//Vẽ biểu đồ
			var ctx = document.getElementById('myChart').getContext('2d');
			var chartData = {
				labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
				datasets: [
					{
						label: 'Số lượt đăng ký',
						backgroundColor: 'rgba(255,99,132,0.2)',
						borderColor: 'rgba(255,99,132,1)',
						borderWidth: 1,
						hoverBackgroundColor: 'rgba(255,99,132,0.4)',
						hoverBorderColor: 'rgba(255,99,132,1)',
						data: slDangKy
					}
				]
			};
			// tạo biểu đồ
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: chartData,
				options: {
					legend: {
						display: false, // ẩn nút click
					},
					scales: {
    				            yAxes: [{
    				            	ticks: {
    				                    beginAtZero: true,
    				                 	max: 20,
    				                    stepSize: 5
    				                  }
    				            }]
    				          }
				},
			});
		},
		error: function(xhr, status, error) {
			// Xử lý lỗi nếu có
			console.log(error);
		}
	});
}

function thongKe3() {
	var inputDate = document.getElementById("date");
	var Date = inputDate.value;

	$.ajax({
		url: "/quanly/getThongKe3",
		type: "POST",
		data: {
			Date: Date
		},
		dataType: "json",
		success: function(data) {
			let myDiv = document.getElementById("tableLoad");
			myDiv.innerHTML = "";
			data.forEach(function(item) {
				var table = " <tr>"
					+ "<td class='text-center'>"
					+ "<img alt='" + item.hinhAnh + "' class='table-avatar' src='/images/" + item.hinhAnh + "'"
					+ "width='65%' style='border-radius: 6px;'>"
					+ "</td>"
					+ "<td style='padding-top: 25px;'>"
					+ "" + item.maBaiViet
					+ "</td>"
					+ "<td style='padding-top: 25px;'>"
					+ "" + item.nguoiDang
					+ "</td>"
					+ "<td style='padding-top: 25px;'>"
					+ "" + item.moTa
					+ "</td>"
					+ "<td style='padding-top: 25px;' class='text-center'>"
					+ "" + item.luotThich
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