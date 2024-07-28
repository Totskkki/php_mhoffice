<?php
include '../config/connection.php';

include '../common_service/common_functions.php';
date_default_timezone_set('Asia/Manila');
// $message = '';
if (isset($_POST['patient_id'])) {
    $patientID = $_POST['patient_id'];
    $currentDate = date('Y-m-d'); 
    $userID = $_SESSION['user_id'];
  
    $query = "SELECT COUNT(*) FROM tbl_referrals_log WHERE patient_id = :patient_id AND userID =:user_id AND DATE(referral_date) = :current_date";
    $stmt = $con->prepare($query);
    $stmt->bindParam(':patient_id', $patientID, PDO::PARAM_INT);
    $stmt->bindParam(':user_id', $userID, PDO::PARAM_INT);
    $stmt->bindParam(':current_date', $currentDate, PDO::PARAM_STR);
    $stmt->execute();
    $existingReferrals = $stmt->fetchColumn();
  
    if ($existingReferrals > 0) {
        echo json_encode(["status" => "error", "message" => "A referral for this patient already exists today. Only one referral per day is allowed."]);
    } else {
        $insertQuery = "INSERT INTO tbl_referrals_log (patient_id, referral_date, userID) VALUES (:patient_id, CURRENT_TIMESTAMP, :user_id)";
        $insertStmt = $con->prepare($insertQuery);
        $insertStmt->bindParam(':patient_id', $patientID, PDO::PARAM_INT);
        $insertStmt->bindParam(':user_id', $userID, PDO::PARAM_INT);
    
        if ($insertStmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Referral successfully created."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Error creating referral."]);
        }
    }
} else {
    echo "Required data not submitted.";
}

?>
