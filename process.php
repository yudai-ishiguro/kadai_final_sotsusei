<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $point = $_POST['point'];
    $date = $_POST['date'];
    $wind_direction = $_POST['wind-direction'];
    $wind_speed = $_POST['wind-speed']; // Claude

    // データベース接続設定
    $host = 'localhost';// 'localhost'
    $dbname = 'deploy';// 'deploy'
    $username = 'root'; // ここにDBユーザー名を入力'root'
    $password = ''; // ここにDBパスワードを入力''

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // diving_areaのIDを取得
        $stmt = $pdo->prepare("SELECT id FROM diving_area WHERE area_name = ?");
        $stmt->execute([$point]);
        $diving_area_id = $stmt->fetchColumn();

        // wind_directionのIDを取得
        $stmt = $pdo->prepare("SELECT id FROM wind_direction WHERE direction = ?");
        $stmt->execute([$wind_direction]);
        $wind_direction_id = $stmt->fetchColumn();

        // 日付の処理
        $selectedDate = explode("-", $date);
        $yr = $selectedDate[0];
        $mn = $selectedDate[1];
        $dy = $selectedDate[2];

        // 潮汐データAPIリクエストの処理（サーバー側で）
        $tide_api_url = "https://api.tide736.net/get_tide.php?pc=47&hc=10&yr=$yr&mn=$mn&dy=$dy&rg=day";

        // curlでAPIリクエストを送信
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $tide_api_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true); // リダイレクトを追跡
        $tide_response = curl_exec($ch);
        curl_close($ch);

        if ($tide_response === false) {
        echo "<p class='error-message'>潮汐データの取得に失敗しました。</p>";
        } else {

        // JSONレスポンスを連想配列にデコード
        $tide_data = json_decode($tide_response, true);
        
        // データが存在するか確認
        if (isset($tide_data['tide']['chart'][$date]['edd']) && isset($tide_data['tide']['chart'][$date]['flood'])) {

        // 干潮時刻（edd time）と満潮時刻（flood time）を取得
        $edd_times = array_column($tide_data['tide']['chart'][$date]['edd'], 'time');
        $flood_times = array_column($tide_data['tide']['chart'][$date]['flood'], 'time');

        // 干潮時刻と満潮時刻をHTMLに表示
        echo "<div class='tide'>";
        echo "<h3>潮汐データ</h3>";
        echo "<div class='tide_hako'>";
        echo "<div class='edd'><p>干潮時刻: " . implode(", ", array_map('htmlspecialchars', $edd_times)) . "</p></div>";
        echo "<div class='flood'><p>満潮時刻: " . implode(", ", array_map('htmlspecialchars', $flood_times)) . "</p></div>";
        echo "</div>";
        echo "</div>";    
        }else {
            echo "<p class='error-message'>潮汐データの解析に失敗しました。</p>";
            }
        }

        // 風速に基づいて条件を判断(Claude)
        $condition = '';
        if ($wind_speed < 3) {
            $condition = 'Good';
        } elseif ($wind_speed < 7) {
            $condition = 'So-So';
        } else {
            $condition = 'Bad';
        }

        // 条件に基づいて画像を取得(Claude)
        $stmt = $pdo->prepare("SELECT image,judge FROM conditions WHERE judge = ?");
        $stmt->execute([$condition]);
        $condition_data = $stmt->fetch(PDO::FETCH_ASSOC);
        $condition_image = $condition_data['image'];
        $condition_judge = $condition_data['judge'];

        // diving_logの条件に合うデータを取得
        $stmt = $pdo->prepare("
            SELECT diving_point.point_name, diving_point.level, diving_point.depth, diving_point.image, diving_point.note
            FROM diving_log
            JOIN diving_point ON diving_log.diving_point_id = diving_point.id
            WHERE diving_point.diving_area_id = ? AND diving_log.wind_direction_id = ?
        ");
        $stmt->execute([$diving_area_id, $wind_direction_id]);

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($results) {
            echo "<h2><span class='marker'>条件に合うダイビングポイント</span></h2>";
            foreach ($results as $row) {
                echo "<div class='point_selected'>";
                echo "<div class='point_image'>";
                if ($row['image']) {
                    echo "<iframe src='" . htmlspecialchars($row['image']) . "'></iframe>";
                }
                echo "</div>";// point_image
                echo "<div class='point_info'>";
                echo "<div class='info_box1'>";
                echo "<h3><span class='marker'>ポイント名: </span></h3>";
                echo "<h3>" . htmlspecialchars($row['point_name']) . "</h3>";
                echo "<p>" . htmlspecialchars($row['note']) . "</p>";
                echo "</div>";// info_box1
                echo "<div class='info_box2'>";
                echo "<div class='info_box3'>";
                echo "<h4>レベル: " . htmlspecialchars($row['level']) . "</h4>";
                echo "<h4>水深: " . htmlspecialchars($row['depth']) . "</h4>";
                echo "<h4>海況予報: " . htmlspecialchars($condition_judge) . "</h4>";
                echo "</div>";// info_box3
                echo "<div class='info_box4'>";
                // echo "<img src='./img/good.PNG' alt='ピクトグラム' width='160' height='160'>";
                if ($condition_image) {
                echo "<img src='" . htmlspecialchars($condition_image) . "' alt='コンディション' width='160' height='160'>";
                } else {
                // フォールバック画像（条件に合う画像が見つからない場合）
                echo "<img src='./img/scuba.PNG' alt='ピクトグラム' width='160' height='160'>";
                }
                echo "</div>";// info_box4
                echo "</div>";// info_box2
                echo "</div>";// point_info
                echo "</div>";// point_selected
            }
        } else {
            echo "<p class='not_found'>条件に合うダイビングポイントは見つかりませんでした。</p>";
        }
    } catch (PDOException $e) {
        echo "データベース接続エラー: " . $e->getMessage();
    }
}
?>