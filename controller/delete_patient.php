<?php
include '../config/connection.php';
include '../common_service/common_functions.php';

if (isset($_POST['delete_patient'])) {
    $patient = $_POST['delete_patient'];

    try {
        $query = "DELETE FROM patients WHERE id=:hidden_id";
        $statement = $con->prepare($query);
        $data = [':hidden_id' => $patient];
        $query_execute = $statement->execute($data);

        if ($query_execute) {
            // Redirect with a success message
            redirect('../patient_list.php','Patient deleted successfully!');
            // header("Location: ../congratulation.php?goto_page=../patient_list.php&message=Patient deleted successfully!");
            exit;
        }
    } catch (PDOException $ex) {
        // Log the error to a file or database for further investigation
        error_log("Error deleting patient: " . $ex->getMessage());
        
        // Optionally, redirect to an error page
        header("Location: error.php");
        exit;
    }
}

// If execution reaches here, there was an issue
header("Location: error.php");
exit;
?>
