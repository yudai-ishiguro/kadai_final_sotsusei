<?php
$API_KEY = ''; // API KEYをここに設定
$city = $_GET['city']; // JavaScriptから送信された都市名を取得

$url = "https://api.openweathermap.org/data/2.5/forecast?q={$city},jp&units=metric&APPID={$API_KEY}";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if ($response === false) {
    http_response_code(500);
    echo json_encode(['error' => 'Failed to fetch weather data']);
} else {
    header('Content-Type: application/json');
    echo $response;
}
?>