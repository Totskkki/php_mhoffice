<?php

if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
	header('Location: index.php');
	exit;
}


$sql = "SELECT user.*, personnel.*, position.*,p.*, user.UserType AS UserType
        FROM `tbl_users` AS user
        INNER JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
        INNER JOIN `tbl_position` AS position ON position.personnel_id = position.position_id
        LEFT JOIN tbl_user_page AS p ON user.userID = p.userID
        WHERE user.`userID` = :user_id";

$stmt = $con->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['user_id'], PDO::PARAM_INT);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);



?>