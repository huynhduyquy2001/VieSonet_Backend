                            var currentTime = new Date();
                            var activityTime = new Date('${banBe.nguoiDung.thoiGianTruyCap}');
                            var timeDiff = currentTime.getTime() - activityTime.getTime();
                            var daysDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
                            var monthsDiff = Math.floor(daysDiff / 30);
                            var yearsDiff = Math.floor(monthsDiff / 12);

                            if (daysDiff < 1) {
                                document.write('1 ngày trước');
                            } else if (monthsDiff < 1) {
                                document.write(daysDiff + ' ngày trước');
                            } else if (yearsDiff < 1) {
                                document.write(monthsDiff + ' tháng trước');
                            } else {
                                document.write(yearsDiff + ' năm trước');
                            }
