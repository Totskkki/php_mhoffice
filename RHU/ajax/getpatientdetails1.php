
<?php
include '../config/connection.php';
if (isset($_POST['patient_id'])) {
    $patientID = $_POST['patient_id'];

    $query = "SELECT 
    pv.*,  pmh.*, p.*, m.*,  md.*,u.*,per.*, 
    CONCAT(per.`first_name`, ' ', per.`middlename`, ' ', per.`lastname`) AS `doctors_name`
        FROM tbl_patient_visits AS pv
        LEFT JOIN tbl_patient_medication_history AS pmh ON pv.patient_visitID = pmh.patient_visit_id
        LEFT JOIN tbl_patients AS p ON pv.patient_id = p.patientID
        LEFT JOIN tbl_medicine_details AS md ON pmh.medicine_details_id = md.medicine_id
        LEFT JOIN tbl_medicines AS m ON md.medicine_id = m.medicineID

        LEFT JOIN tbl_users AS u on u.userID  = pv.doctor_id
        LEFT JOIN tbl_personnel AS per ON u.personnel_id = per.personnel_id 

  WHERE 
  pv.patient_id = :patientID 
  ORDER BY 
    pv.patient_visitID desc, pmh.patient_med_historyID desc";

    $stmt = $con->prepare($query);
    $stmt->bindParam(':patientID', $patientID, PDO::PARAM_INT);
    $stmt->execute();

    $patientDetails = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($patientDetails) {
        echo json_encode($patientDetails);
    } else {
        echo json_encode(array("error" => "No details found for the given patient ID."));
    }
}

?>