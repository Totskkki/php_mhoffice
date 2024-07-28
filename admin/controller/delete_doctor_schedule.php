<?php
include '../config/connection.php';

if (isset($_POST['deleteid'])) {
    $id = $_POST['deleteid'];

    try {
        $con->beginTransaction();
  

        // Delete from tbl_users
        $stmtdschedule = $con->prepare("DELETE FROM tbl_doctor_schedule WHERE doc_scheduleID  = ?");
        $stmtdschedule->execute([$id]);

        $con->commit();

        $_SESSION['status'] = "Doctor Schdedule successfully deleted.";
        $_SESSION['status_code'] = "success";
    } catch (Exception $e) {
        $con->rollBack();
        $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
        $_SESSION['status_code'] = "danger";
    }

    header('location: ../Doctor_schedule.php');
    exit();
} else {
    $_SESSION['status'] = "Invalid request.";
    $_SESSION['status_code'] = "error";
    header('location: ../Doctor_schedule.php');
    exit();
}  
?>