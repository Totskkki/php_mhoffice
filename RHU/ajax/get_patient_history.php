<?php
include '../config/connection.php';

$searchQuery = '%' . $_GET['search_query'] . '%';

$query = "SELECT 
            pv.*,  pmh.*, pat.*, m.*,  md.*,u.*,
            CONCAT(pat.patient_name, ' ', pat.middle_name, ' ', pat.last_name, ' ', pat.suffix) AS patient
          FROM 
            tbl_patient_visits AS pv
          LEFT JOIN 
            tbl_patient_medication_history AS pmh ON pv.patient_visitID = pmh.patient_visit_id
          LEFT JOIN 
            tbl_patients AS pat ON pv.patient_id = pat.patientID
          LEFT JOIN 
            tbl_medicine_details AS md ON pmh.medicine_details_id = md.medicine_id
          LEFT JOIN 
            tbl_medicines AS m ON md.medicine_id = m.medicineID
        
            LEFT JOIN tbl_users AS u on u.userID  = pv.doctor_id
          WHERE 
            pat.patient_name LIKE :searchQuery
          ORDER BY 
            pv.patient_visitID desc, pmh.patient_med_historyID desc";

try {
    $stmt = $con->prepare($query);
    $stmt->bindParam(':searchQuery', $searchQuery, PDO::PARAM_STR);
    $stmt->execute();
    $data = '';
  $i = 0;
  while ($r = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $i++;
    $data = $data . '<tr>';

    $data = $data . '<td class="px-2 py-1 align-middle text-center">' . $i . '</td>';
    $data = $data . '<td class="px-2 py-1 align-middle text-center">' . date("M d, Y", strtotime($r['visit_date'])) . '</td>';
    $data = $data . '<td class="px-2 py-1 align-middle text-center">' . $r['disease'] . '</td>';
    $data = $data . '<td class="px-2 py-1 align-middle text-center">' . date("M d, Y", strtotime($r['next_visit_date'])) . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle">' . $r['medicine_name'] . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle text-right">' . $r['packing'] . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle text-right">' . $r['quantity'] . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle text-right">' . $r['dosage'] . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle text-right">' . $r['duration'] . '</td>';
    // $data = $data . '<td class="px-2 py-1 align-middle text-right">' . $r['advice'] . '</td>';
    $data .= '<td class="px-2 py-1 align-middle text-center"><button class="btn btn-info view-btn" data-toggle="modal" data-target="#prescriptionModal" data-name="
    ' . htmlspecialchars($r['medicine_name']) . '" data-patient="' . htmlspecialchars($r['patient']) . '" data-quantity="' . htmlspecialchars($r['quantity']) . '" data-schedule_dosage="' . htmlspecialchars($r['schedule_dosage']) . '" data-dosage="' . htmlspecialchars($r['dosage']) . '" data-duration="' . htmlspecialchars($r['duration']). '" data-time_frame="' . htmlspecialchars($r['time_frame'])  . '">View</button></td>';

    $data .= '</tr>';
    

 
  }
  if ($i === 0) {
    $data = '<tr><td colspan="9" class="px-2 py-1 align-middle text-center">No records found.</td></tr>';
}
} catch (PDOException $ex) {
  echo $ex->getTraceAsString();
  echo $ex->getMessage();
  exit;
}

echo $data;
