<?php

// if (isset($_SESSION['login']) && $_SESSION['login'] === true && $_SESSION['user_type'] === 'BHW') {
//         // Redirect to BHW dashboard
//         header("location: ../home.php");
//         exit;
//     }

if ($_SESSION['user_type'] === 'Admin') {
        header("location: ../admin/dashboard.php");
        exit;
      } else if ($_SESSION['user_type'] === 'BHW') {
      
        header("location: ../home.php");
        exit;
      }
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
	header('Location: ../index.php');
	exit;
}



$sql = "SELECT user.*, personnel.*, position.*, user.UserType AS UserType 
        FROM `tbl_users` AS user
        INNER JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
        INNER JOIN `tbl_position` AS position ON position.personnel_id = position.position_id
        WHERE user.`userID` = :user_id";

$stmt = $con->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['user_id'], PDO::PARAM_INT);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);


?>