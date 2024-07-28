<?php
include '../../config/connection.php';
include '../../common_service/common_functions.php';




$message = '';

if (isset($_POST['save_Patient'])) {
  $patientName = trim($_POST['patient_name']);
  $middle_name = trim($_POST['middle_name']);
  $last_name = trim($_POST['last_name']);
  $suffix = trim($_POST['suffix']);
  $address = trim($_POST['address']);
  $cnic = trim($_POST['cnic']);

  $dateBirth = trim($_POST['date_of_birth']);
  $dateArr = explode("/", $dateBirth);
  $dateBirth = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];

  $phoneNumber = trim($_POST['phone_number']);

  $patientName = ucwords(strtolower($patientName));
  $address = ucwords(strtolower($address));

  $gender = $_POST['gender'];


  $Purok = trim($_POST['Purok']);
  $status = trim($_POST['Status']);
  $Weight = trim($_POST['Weight']);
  $Blood  = trim($_POST['Blood']);
  $philhealth  = trim($_POST['Philhealth']);
  $member  = trim($_POST['Member']);
  $Age = trim($_POST['Age']);
  if (
    $patientName != '' && $address != '' &&
    $cnic != '' && $dateBirth != '' && $phoneNumber != '' && $gender != ''
    && $Purok !== '' && $status !== '' && $Weight !== ''
    && $Blood !== '' && $philhealth !== '' && $member !== '' && $Age !== ''
  ) {
    // Check for duplicate patient name
    $duplicateQuery = "SELECT COUNT(*) as count FROM patients WHERE patient_name = :patientName";
    $duplicateStatement = $con->prepare($duplicateQuery);
    $duplicateStatement->bindParam(':patientName', $patientName, PDO::PARAM_STR);
    $duplicateStatement->execute();
    $duplicateResult = $duplicateStatement->fetch(PDO::FETCH_ASSOC);

    if ($duplicateResult['count'] > 0) {
      $message = 'Duplicate patient name found. Please choose a different name.';
    } else {
      // Proceed with the insertion
      $query = "INSERT INTO `patients`
            (`patient_name`, `middle_name`, `last_name`, `suffix`,`address`, `cnic`, `date_of_birth`, `phone_number`, `gender`
            ,`purok`, `status`, `weight`, `blood_type`, `phil_mem`,`ps_mem`,`age`)
            VALUES('$patientName','$middle_name','$last_name','$suffix', '$address', '$cnic', '$dateBirth', '$phoneNumber', '$gender'
            ,'$Purok','$status','$Weight','$Blood','$philhealth','$member','$Age');";

      try {
        $con->beginTransaction();
        $stmtPatient = $con->prepare($query);
        $stmtPatient->execute();
        $con->commit();
        $message = 'Patient added successfully.';
      } catch (PDOException $ex) {
        $con->rollback();
        echo $ex->getMessage();
        echo $ex->getTraceAsString();
        exit;
      }
    }
  }
  header("Location:congratulation.php?goto_page=../../patients.php&message=$message");
  exit;
}

try {
  $query = "SELECT `id`, CONCAT(`patient_name`,' ', `middle_name`,'. ' , `last_name`, ' ',`suffix`) AS `name`,
   CONCAT('Brgy. ',`address`,', Purok ',`purok`, ', Tantagan' ,', South Cotabato' ) as `add`,
  `cnic`, DATE_FORMAT(`date_of_birth`, '%b %d %Y') AS `date_of_birth`,`age`,
  `phone_number`, `gender` ,`status`,`weight`,`blood_type`,`phil_mem`,`ps_mem`
  FROM `patients` ORDER BY `name` ASC;";


  $stmtPatient1 = $con->prepare($query);
  $stmtPatient1->execute();
} catch (PDOException $ex) {
  echo $ex->getMessage();
  echo $ex->getTraceAsString();
  exit;
}

