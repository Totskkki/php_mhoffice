<?php
include '../config/connection.php';

if (isset($_POST['deleteid'])) {
    $id = $_POST['deleteid'];

    try {
        $con->beginTransaction();

        // Delete from tbl_position
        $stmtPosition = $con->prepare("DELETE FROM tbl_position WHERE position_id = (SELECT position_id FROM tbl_users WHERE userID = ?)");
        $stmtPosition->execute([$id]);

        // Delete from tbl_personnel
        $stmtPersonnel = $con->prepare("DELETE FROM tbl_personnel WHERE personnel_id = (SELECT personnel_id FROM tbl_users WHERE userID = ?)");
        $stmtPersonnel->execute([$id]);

        // Delete from tbl_users
        $stmtUsers = $con->prepare("DELETE FROM tbl_users WHERE userID = ?");
        $stmtUsers->execute([$id]);

        $con->commit();

        $_SESSION['status'] = "Doctor successfully deleted.";
        $_SESSION['status_code'] = "success";
    } catch (Exception $e) {
        $con->rollBack();
        $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
        $_SESSION['status_code'] = "danger";
    }

    header('location: ../doctor.php');
    exit();
} else {
    $_SESSION['status'] = "Invalid request.";
    $_SESSION['status_code'] = "error";
    header('location: ../doctor.php');
    exit();
}  
?>