$(function () {
    $('#js-hamburger-menu, .navigation__link').on('click', function () {
        $('.navigation').slideToggle(500);
        $('.hamburger-menu').toggleClass('hamburger-menu--open');
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const modalMap = {
        'open1': 'discover',
        'open2': 'dream',
        'open3': 'design',
        'open4': 'destiny',
        'open5': 'disclaimer'
    };

    const mask = document.getElementById('mask');
    const body = document.body;

    function toggleModal(modalId, show) {
        const modal = document.getElementById(modalId);
        if (modal) {
            if (show) {
                modal.classList.remove('hidden');
                mask.classList.remove('hidden');
                body.classList.add('modal-open');
                disableBackgroundScroll();
            } else {
                modal.classList.add('hidden');
                mask.classList.add('hidden');
                body.classList.remove('modal-open');
                enableBackgroundScroll();
            }
        }
    }

    function enableBackgroundScroll() {
        const scrollY = body.style.top;
        body.style.position = '';
        body.style.top = '';
        body.style.width = '';
        window.scrollTo(0, parseInt(scrollY || '0') * -1);
        }

    Object.entries(modalMap).forEach(([openId, modalId]) => {
        const openButton = document.getElementById(openId);
        if (openButton) {
            openButton.addEventListener('click', (event) => {
                event.preventDefault();
                toggleModal(modalId, true);
            });
        }
    });

    function closeModal(modalId) {
        toggleModal(modalId, false);
    }

    document.querySelectorAll('.close').forEach(closeButton => {
        closeButton.addEventListener('click', () => {
            const modalId = closeButton.getAttribute('data-modal');
            closeModal(modalId);
        });
    });

    mask.addEventListener('click', () => {
        Object.values(modalMap).forEach(modalId => {
            closeModal(modalId);
        });
    });

    // タッチデバイスでのスクロール処理
    let touchStartY;

    document.addEventListener('touchstart', (e) => {
        touchStartY = e.touches[0].clientY;
    }, { passive: false });

    document.addEventListener('touchmove', (e) => {
        if (body.classList.contains('modal-open')) {
            const touchEndY = e.touches[0].clientY;
            const modal = document.querySelector('.modal:not(.hidden)');
            
            if (modal) {
                const modalContent = modal.querySelector('.modal-content');
                const isAtTop = modalContent.scrollTop === 0;
                const isAtBottom = modalContent.scrollHeight - modalContent.scrollTop === modalContent.clientHeight;

                if ((isAtTop && touchEndY > touchStartY) || (isAtBottom && touchEndY < touchStartY)) {
                    e.preventDefault();
                }
            } else {
                e.preventDefault();
            }
        }
    }, { passive: false });
});



// カレンダーの日付の制限
document.addEventListener('DOMContentLoaded', function() {
    const today = new Date();
    const formatDate = (date) => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    };

    const tomorrow = new Date(today);
    tomorrow.setDate(today.getDate() + 1);
    const tomorrowFormatted = formatDate(tomorrow);

    const maxDate = new Date(today);
    maxDate.setDate(today.getDate() + 5);
    const maxDateFormatted = formatDate(maxDate);

    const dateInput = document.getElementById('date');
    dateInput.setAttribute('min', tomorrowFormatted);
    dateInput.setAttribute('max', maxDateFormatted);
});

// 天気予報
$(function() {
    var city = 'Zamami';
    var url = 'get_weather.php';

    $.ajax({
        url: url,
        type: 'GET',
        data: { city: city },
        dataType: "json",
    })
    .done(function(data) {
        var insertHTML = "";
        var cityName = '<h2>' + data.city.name + '</h2>';
        $('#city-name').html(cityName);

        window.forecastData = data.list;

        var forecastDays = getDailyForecasts(data.list);
        for (var i = 0; i < forecastDays.length; i++) {
            insertHTML += buildHTML(forecastDays[i]);
        }
        $('#weather').html(insertHTML);
    })
    .fail(function() {
        $('#error-message').text("データの取得に失敗しました。");
    });
});

function getDailyForecasts(list) {
    var dailyForecasts = [];
    var targetHour = "00:00:00";

    for (var i = 0; i < list.length; i++) {
        var item = list[i];
        if (item.dt_txt.includes(targetHour)) {
            dailyForecasts.push(item);
        }
        if (dailyForecasts.length === 5) {
            break;
        }
    }
    console.dir(dailyForecasts);
    return dailyForecasts;
}

function buildHTML(data) {
    var Week = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
    var date = new Date (data.dt_txt);
    date.setHours(date.getHours() + 9);
    var month = date.getMonth() + 1;
    var day = month + "/" + date.getDate();
    var youbi = Week[date.getDay()];
    var icon = data.weather[0].icon;
    var windDirection = getWindDirection(data.wind.deg);
    var windSpeed = data.wind.speed;
    // var weatherDescription = getDescription(data.weather[0].description);

    var html = `
        <div class="weather-report">
            <div class="hako">
                <div class="weather-date">${day}</div>
                <div class="weather-date">${youbi}</div>
            </div>
            <img src="https://openweathermap.org/img/w/${icon}.png"  alt='Weather Image'  width='72' height='72'>
            <div class="hako2">
                <div class="weather-wind"> 風向: ${windDirection}</div>
                <div class="wind-speed">
                    <img src="./img/wind.PNG"  alt='Wind Image'  width='36' height='36'>
                    <p>${windSpeed} m/s</p>
                </div>
            </div>
        </div>
    `;
    return html;
}

function getWindDirection(degree) {
    var directions = ['北', '北北東', '北東', '東北東', '東', '東南東', '南東', '南南東', '南', '南南西', '南西', '西南西', '西', '西北西', '北西', '北北西', '北'];
    var index = Math.round(degree / 22.5) % 16;
    return directions[index];
}

function getSelectedDateWindDirection(selectedDate) {
    var windDirection = "";
    if (window.forecastData) {
        var selectedDateForecasts = window.forecastData.filter(item => item.dt_txt.includes(selectedDate));
        if (selectedDateForecasts.length > 0) {
            var firstForecast = selectedDateForecasts[0];
            windDirection = getWindDirection(firstForecast.wind.deg);
        } else {
            windDirection = "データがありません";
        }
    }
    return windDirection;
}

// Claude
function getSelectedDateWindSpeed(selectedDate) {
    var windSpeed = 0;
    if (window.forecastData) {
        var selectedDateForecasts = window.forecastData.filter(item => item.dt_txt.includes(selectedDate));
        if (selectedDateForecasts.length > 0) {
            var firstForecast = selectedDateForecasts[0];
            windSpeed = firstForecast.wind.speed;
        }
    }
    return windSpeed;
}

// フォームの送信時に処理を行う関数
function handleSubmit(event) {
    event.preventDefault(); // ページのリロードを防ぐ

    var selectedDate = document.getElementById('date').value;
    var windDirection = getSelectedDateWindDirection(selectedDate);
    var windSpeed = getSelectedDateWindSpeed(selectedDate); // Claude

    var formData = {
        point: document.querySelector('input[name="point"]:checked').value,
        date: selectedDate,
        'wind-direction': windDirection,
        'wind-speed': windSpeed // Claude
    };

    $.ajax({
        type: 'POST',
        url: 'process.php',
        data: formData,
        success: function(response) {
            $('.result').html(response);
            // $('.result .debug-info').hide(); // 追加

        // デバッグ情報をコンソールに表示
        $('.debug-info').each(function() {
            console.log($(this).text());
        });

        },
        error: function() {
            alert('データの送信に失敗しました。');
        }
    });
}

// フォームに送信イベントリスナーを追加
document.getElementById('forecast-form').addEventListener('submit', handleSubmit);

  