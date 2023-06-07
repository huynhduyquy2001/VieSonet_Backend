$(document).ready(function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success, error);
            } else {
                console.log('Geolocation is not supported by this browser.');
            }

            function success(position) {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=' + latitude + '&lon=' + longitude + '&appid=b004c66ae3a55c3f2a0557baeec426bd&units=metric';

                $.ajax({
                    url: weatherApiUrl,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $('#city').text(data.name);
                        $('#temperature').text(data.main.temp);
                        $('#description').text(data.weather[0].description);
                        $('#humidity').text(data.main.humidity);
                        $('#wind-speed').text(data.wind.speed);
                    },
                    error: function (xhr, status, error) {
                        console.log('Error:', error);
                    }
                });
            }

            function error() {
                console.log('Unable to retrieve your location.');
            }
        });