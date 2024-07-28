<?php
include '../config/connection.php';

if (isset($_POST['patientid'])) {
    $patientID = $_POST['patientid'];
    
    // Check if a certificate has been generated in the last 2 days
    $query = "
        SELECT generated_at 
        FROM tbl_certificate_log 
        WHERE patient_id = :patientID 
        ORDER BY generated_at DESC 
        LIMIT 1
    ";
    $stmt = $con->prepare($query);
    $stmt->bindParam(':patientID', $patientID, PDO::PARAM_INT);
    $stmt->execute();
    $lastGenerated = $stmt->fetch(PDO::FETCH_ASSOC);

    $canGenerate = true;
    if ($lastGenerated) {
        $lastGeneratedDate = new DateTime($lastGenerated['generated_at']);
        $currentDate = new DateTime();
        $interval = $lastGeneratedDate->diff($currentDate);
        $canGenerate = $interval->days >= 7;
    }

    if ($canGenerate) {
        
        $insertQuery = "INSERT INTO tbl_certificate_log (patient_id, generated_at) VALUES (:patientID, NOW())";
        $insertStmt = $con->prepare($insertQuery);
        $insertStmt->bindParam(':patientID', $patientID, PDO::PARAM_INT);
        if ($insertStmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Certificate successfully generated."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Error generating certificate."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "A certificate for this patient has already been generated in the last 7 days."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Required data not submitted."]);
}
?>
