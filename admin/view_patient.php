<?php
include './config/connection.php';

include './common_service/common_functions.php';
date_default_timezone_set('Asia/Manila');




$message = '';

// $patientName = $middle_name = $last_name  = $suffix =  '';
// $address  = $m_name = $f_gname = $dateBirth = $phoneNumber = '';
// $gender = $Purok = $Province = $Nationality = $ed_att = $emp_stat = '';
// $Blood = $Age = $date_of_birth = $phoneNumber = $civil_status = '';
// $Sex = $m_name = $f_gname = '';



// $errors = [
//     'patient_name' => '',
//     'last_name' => '',
//     'address' => '',
//     'date_of_birth' => '',
//     'phone_number' => '',
//     'gender' => '',
//     'Purok' => '',
//     'Province' => '',
//     'Purok' => '',
//     'civil_status' => '',
//     'Nationality' => '',
//     'Blood' => '',
//     'Age' => '',
//     'Sex' => '',
//     'mother' => '',
//     'father' => '',
//     'philhealth' => ''

// ];

if (isset($_POST['submit_update'])) {
    // var_dump($_POST);




    // $user = $_SESSION['admin_id'];

    $editpatientID = trim($_POST['editpatientID']);
    $editfamID = trim($_POST['editfamID']);
    $editmemID = trim($_POST['editmemID']);


    $patientName = trim($_POST['patient_name']);
    $patientName = ucwords(strtolower($patientName));
    $middle_name = trim($_POST['middle_name']);
    $last_name = trim($_POST['last_name']);
    $suffix = trim($_POST['suffix']);
    // $family_no = trim($_POST['family_no']);
    $household_no = trim($_POST['household_no']);

    $address = trim($_POST['address']);
    $address = ucwords(strtolower($address));
    $cnic = trim($_POST['cnic']);
    $m_name = trim($_POST['m_name']);
    $f_gname = trim($_POST['f_gname']);
// $dateOfBirth = date('Y-m-d', strtotime($dateBirth));
    // $dateBirth = date("Y-m-d", strtotime($_POST['date_of_birth']));
    // $dateArr = explode("/", $dateBirth);
    // $dateBirth = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];
    
    $dateBirth = trim($_POST['date_of_birth']);
    

    if ($dateBirth) {
        $dateArr = explode("/", $dateBirth);
        if (count($dateArr) == 3) {
            $dateBirth = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];
        } else {
            $dateBirth = '';
        }
    }


    $Age = trim($_POST['Age']);

    $phoneNumber = trim($_POST['phone_number']);

    $gender = isset($_POST['gender']) ? $_POST['gender'] : '';


    $Purok = trim($_POST['Purok']);
    $Purok = ucwords(strtolower($Purok));

    $Province = trim($_POST['Province']);
    $Province = ucwords(strtolower($Province));

    $Nationality = trim($_POST['Nationality']);
    $ed_att = trim($_POST['ed_att']);
    $emp_stat = trim($_POST['emp_stat']);
    $status = trim($_POST['Status']);
    // $Weight = trim($_POST['Weight']);
    $Blood  = trim($_POST['Blood']);

    $philhealth  = trim($_POST['Philhealth']);
    // $Phil_member  = trim($_POST['Phil_member']);
    // $Phil_no  = trim($_POST['Phil_no']);
    $Phil_member = isset($_POST['Phil_member']) ? trim($_POST['Phil_member']) : '';
    $Phil_no = isset($_POST['Phil_no']) ? trim($_POST['Phil_no']) : '';
    // $MemCat = isset($_POST['MemCat']) ? $_POST['MemCat'] : '';
    $ps_mem = isset($_POST['ps_mem']) ? json_encode($_POST['ps_mem']) : '[]';


    $m_name = trim($_POST['m_name']);
    $f_gname = trim($_POST['f_gname']);

    try {
        $con->beginTransaction();

        // Update family details
        $updateFamilyQuery = "UPDATE tbl_family SET brgy = :address, purok = :Purok, province = :province WHERE famID = :familyId";
        $stmtFamily = $con->prepare($updateFamilyQuery);
        $stmtFamily->execute([
            ':address' => $address,
            ':Purok' => $Purok,
            ':province' => $Province,
            ':familyId' => $editfamID
        ]);

        // Update membership details
        $updateMembershipQuery = "UPDATE tbl_membership_info SET phil_mem = :Phil_member, philhealth_no = :Phil_no, phil_membership = :Phil_membership, ps_mem = :ps_mem WHERE membershipID = :membershipId";
        $stmtMembership = $con->prepare($updateMembershipQuery);
        $stmtMembership->execute([
            ':Phil_member' => $philhealth,
            ':Phil_no' => $Phil_no,
            ':Phil_membership' => $Phil_member,
            ':ps_mem' => $ps_mem,
            ':membershipId' => $editmemID
        ]);



   

        $updatePatientQuery = "UPDATE tbl_patients SET 
        family_address = :family_address,
        Membership_Info = :membership_info,
        household_no = :household_no,
        patient_name = :patientName,
        middle_name = :middle_name,
        last_name = :last_name,
        suffix = :suffix,
        father_guardian_name = :f_gname,
        mother_name = :m_name,
        cnic = :cnic,
        date_of_birth = :dateBirth,
        age = :Age,
        phone_number = :phoneNumber,
        gender = :gender,
        civil_status = :civil_status,
        blood_type = :Blood,
        ed_at = :ed_att,
        emp_stat = :emp_stat,
        Nationality = :Nationality
       
        WHERE patientID = :patientID";

    $stmtPatient = $con->prepare($updatePatientQuery);
    $stmtPatient->execute([
        ':family_address' => $editfamID,
        ':membership_info' => $editmemID,
        ':household_no' => $household_no,
        ':patientName' => $patientName,
        ':middle_name' => $middle_name,
        ':last_name' => $last_name,
        ':suffix' => $suffix,
        ':f_gname' => $f_gname,
        ':m_name' => $m_name,
        ':cnic' => $cnic,
        ':dateBirth' => $dateBirth,
        ':Age' => $Age,
        ':phoneNumber' => $phoneNumber,
        ':gender' => $gender,
        ':civil_status' => $status,
        ':Blood' => $Blood,
        ':ed_att' => $ed_att,
        ':emp_stat' => $emp_stat,
        ':Nationality' => $Nationality,
        // ':userID' => $user,
        ':patientID' => $editpatientID
    ]);


        $con->commit();

        $_SESSION['status'] = "Patient updated successfully.";
        $_SESSION['status_code'] = "success";
        header('Location: view_patient.php?id=' . $editpatientID);
        exit;
    } catch (PDOException $ex) {
        $con->rollback();
        echo $ex->getMessage();
        echo $ex->getTraceAsString();
        exit;
    }
}


















if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT 
                pat.*, fam.*, mem.*, com.*,
                fam.famID AS famID, 
                mem.membershipID AS membershipID,
                CONCAT(pat.`patient_name`, ' ', pat.`middle_name`, '. ', pat.`last_name`, ' ', pat.`suffix`) AS `name`,
                DATE_FORMAT(pat.`date_of_birth`, '%m/%d/%Y') AS `date_of_birth`
            FROM 
                `tbl_patients` AS pat
                LEFT JOIN 
                `tbl_family` AS fam ON pat.`family_address` = fam.`famID`
                LEFT JOIN 
                `tbl_membership_info` AS mem ON pat.`membership_info` = mem.`membershipID`
                LEFT JOIN 
                `tbl_complaints` AS com ON pat.`patientID` = com.`patient_id`
            WHERE 
                pat.`patientID` = :id";
    $stmt = $con->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $patientData = $stmt->fetch(PDO::FETCH_ASSOC);



    $brgy = $patientData['brgy'];
    $gender = $patientData['gender'];
    $civilstatus = $patientData['civil_status'];
    $blood = $patientData['blood_type'];
    $nationality = $patientData['Nationality'];
    $ed_at   = $patientData['ed_at'];
    $phil_membership   = $patientData['phil_membership'];
    $phil   = $patientData['phil_mem'];


    $phil_mem = json_decode($patientData['ps_mem'], true);
}
function displayPSMemCheckboxes($phil_mem)
{
    $membershipOptions = array("NHTS", "4PS", "LGU", "Private");
    $checkboxes = '';

    foreach ($membershipOptions as $option) {
        $checked = (in_array($option, $phil_mem)) ? 'checked' : '';
        $checkboxes .= '
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="ps_mem_' . $option . '" name="ps_mem[]" value="' . $option . '" ' . $checked . '>
                <label class="form-check-label" for="ps_mem_' . $option . '">' . $option . '</label>
            </div>
        ';
    }

    return $checkboxes;
}

?>


<!DOCTYPE html>
<html lang="en">


<head>
    <?php include './config/site_css_links.php'; ?>

    <?php include './config/data_tables_css.php'; ?>
    <title>Patients - Kalilintad Lutayan-Municipal Health Office</title>

    <!-- <style>
        .flex-container {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .flex-item {
            margin-bottom: 10px;
        }

        .double {
            display: flex;
            justify-content: space-between;
            width: 50%;
        }

        .double p {
            width: 50%;
            /* Each paragraph takes half the width of the container */
        }

        .full-width {
            width: 100%;
        }

        span {
            font-weight: bold;
        }

        .flex-item button {
            display: flex;
            flex-direction: column;
        }
    </style> -->
</head>

<body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

        <!-- Main container start -->
        <div class="main-container">



            <!-- Sidebar menu starts -->
            <?php include './config/sidebar.php'; ?>
            <!-- Sidebar menu ends -->

            </nav>
            <!-- Sidebar wrapper end -->

            <!-- App container starts -->
            <div class="app-container">

                <!-- App header starts -->
                <?php include './config/header.php'; ?>
                <!-- App header ends -->

                <!-- App body starts -->
                <div class="app-body">
                    <?php
                    if (isset($_SESSION['status']) && $_SESSION['status'] != '') {
                    ?>
                        <?php ?>

                    <?php


                    }

                    ?>
                    <!-- Container starts -->
                    <div class="container-fluid">


                        <div class="row">
                            <div class="col-xxl-12">
                                <h2></h2>
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title text-center"></h5>
                                    </div>

                                    <div class="card-body">

                                        <?php if (isset($patientData)) : ?>



                                            <div class="row flex-container">


                                                <div class="flex-item">
                                                    <h2><strong><?php echo htmlspecialchars(ucwords($patientData['name'])); ?></strong><span>
                                                            <button type="button" id="update_patient" class="btn btn-info float-end">Patient Profile</button>
                                                        </span> </h2>

                                                </div>

                                                <div class="flex-item double">
                                                    <p class="form-label">Age: <?php echo htmlspecialchars($patientData['age']); ?>

                                                    </p>
                                                    <p class="form-label">Sex: <?php echo htmlspecialchars($patientData['gender']); ?></p>
                                                </div>


                                                <div class="flex-item  double ">
                                                    <p class="form-label">BirthDate: <?php echo htmlspecialchars(date('F j, Y', strtotime($patientData['date_of_birth']))); ?></p>
                                                    <p class="form-label">Contact Number: <?php echo htmlspecialchars($patientData['phone_number']); ?></p>
                                                </div>

                                                <div class="flex-item double ">
                                                    <p class="form-label">Status: <?php echo htmlspecialchars(ucwords($patientData['civil_status'])); ?></p>
                                                    <p class="form-label">Blood Type: <?php echo htmlspecialchars(ucwords($patientData['blood_type'])); ?></p>
                                                </div>
                                                <div class="flex-item ">

                                                    <p class="form-label">Address: <?php echo htmlspecialchars('Purok ' . $patientData['purok'] . ', Brgy. ' . $patientData['brgy'] . ', ' . $patientData['province']); ?></p>
                                                </div>


                                            </div>



                                        <?php else : ?>
                                            <p>No patient details found.</p>
                                        <?php endif; ?>
                                        <hr />

                                        <div id="patient_record_history">
                                            <div class="row">
                                                <div class="card-header">
                                                    <h2><strong>Patient Health Records</strong> </h2>
                                                </div>
                                            </div>

                                            <!-- Row start -->

                                            <div class="row">
                                                <div class="col-xl-4 col-sm-6 col-12">
                                                    <div class="card mb-4 card-outline rounded-0 shadow">
                                                        <div class="card-header  rounded-1 shadow ">
                                                            <h5 class="card-title">Check-up</h5>

                                                        </div>
                                                        <div class="card-body">
                                                            <p>
                                                                With supporting text below as a natural lead-in to
                                                                additional content.
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Update</a>
                                                        </div>
                                                        <div class="card-footer">
                                                            <span class="badge border border-primary text-primary">2 Hours Ago</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-sm-6 col-12">
                                                    <div class="card mb-4 card-outline rounded-0 shadow">
                                                        <div class="card-header  rounded-1 shadow ">
                                                            <h5 class="card-title">Prenatal / Birthing</h5>

                                                        </div>
                                                        <div class="card-body">
                                                            <p>
                                                                With supporting text below as a natural lead-in to
                                                                additional content.
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Update</a>
                                                        </div>
                                                        <div class="card-footer">
                                                            <span class="badge border border-primary text-primary">2 Hours Ago</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-sm-6 col-12">
                                                    <div class="card mb-4 card-outline rounded-0 shadow">
                                                        <div class="card-header  rounded-1 shadow ">
                                                            <h5 class="card-title">Animal bite & care</h5>

                                                        </div>
                                                        <div class="card-body">
                                                            <p>
                                                                With supporting text below as a natural lead-in to
                                                                additional content.
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Update</a>
                                                        </div>
                                                        <div class="card-footer">
                                                            <span class="badge border border-primary text-primary">2 Hours Ago</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-sm-6 col-12">
                                                    <div class="card mb-4 card-outline rounded-0 shadow">
                                                        <div class="card-header  rounded-1 shadow ">
                                                            <h5 class="card-title">Vaccination & Immunization</h5>

                                                        </div>
                                                        <div class="card-body">
                                                            <p>
                                                                With supporting text below as a natural lead-in to
                                                                additional content.
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Update</a>
                                                        </div>
                                                        <div class="card-footer">
                                                            <span class="badge border border-primary text-primary">2 Hours Ago</span>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- Row end -->



                                        <form method="post" id="patientUpdateform" style="display:none;">

                                            <input type="hidden" id="editpatientID" name="editpatientID" value="<?php echo htmlspecialchars($patientData['patientID']); ?>">
                                            <input type="hidden" id="editfamID" name="editfamID" value="<?php echo htmlspecialchars($patientData['famID']); ?>">
                                            <input type="hidden" id="editmemID" name="editmemID" value="<?php echo htmlspecialchars($patientData['membershipID']); ?>">
                                            <div class="row">
                                                <div class="col-lg-2 col-sm-2 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc">ITR No:</label>
                                                        <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['cnic'])); ?>" id="cnic" name="cnic" readonly />
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-sm-2 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc1">Family no:</label>
                                                        <input type="number" class="form-control form-control-sm rounded-0" min="0" value="<?php echo htmlspecialchars(ucwords($patientData['household_no'])); ?>" id="household_no" name="household_no" readonly />



                                                    </div>

                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc">First Name: <span class="text-danger">*</span></label>

                                                            <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['patient_name'])); ?>" id="patient_name" name="patient_name" />

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc1">Middle Name</label>
                                                            <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['middle_name'])); ?>" id="middle_name" name="middle_name" />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc2">Last Name: <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['last_name'])); ?>" id=" last_name" name="last_name" />

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc3">Suffix</label>
                                                            <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['suffix'])); ?>" id="suffix" name="suffix" />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc5">Purok: <span class="text-danger">*</span></label>

                                                            <textarea class="form-control form-control-sm rounded-0" id="Purok" name="Purok" cols="30" rows="1"><?php echo htmlspecialchars(ucwords($patientData['purok'])); ?></textarea>


                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label " for="abc6">Address: <span class="text-danger">*</span></label>

                                                            <select class="form-control form-control-sm rounded-0" id="address" name="address" value="<?php echo htmlspecialchars(ucwords($patientData['brgy'])); ?>">
                                                                <?php echo getbrgy($brgy); ?>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 col-12">
                                                        <div class="mb-3">
                                                            <label class="form-label" for="abc5">Province: <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control form-control-sm rounded-0" id="Province" name="Province" value="<?php echo htmlspecialchars(ucwords($patientData['province'])); ?>" />


                                                        </div>

                                                    </div>
                                                </div>




                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc7">Date of Birth: <span class="text-danger">*</span></label>

                                                        <div class="input-group date" id="date_of_birth" data-target-input="nearest">
                                                            <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" value="<?php echo htmlspecialchars(ucwords($patientData['date_of_birth'])); ?>" data-target="#date_of_birth" name="date_of_birth" data-toggle="datetimepicker" autocomplete="off" />
                                                            <div class="input-group-append" data-target="#date_of_birth" data-toggle="datetimepicker">
                                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Age</label>
                                                        <input type="text" min="0" max="999" class="form-control form-control-sm rounded-0" id="Age" value="<?php echo htmlspecialchars(ucwords($patientData['age'])); ?>" name="Age" readonly />

                                                    </div>

                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="abc6">Sex: <span class="text-danger">*</span></label>
                                                        <div class="form-group">
                                                            <div class="form-check">

                                                                <?php echo getGender($gender); ?>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="abc6">Contact number: <span class="text-danger">*</span></label>
                                                        <input type="text" inputmode="text" class="form-control form-control-sm rounded-0" value="<?php echo htmlspecialchars(ucwords($patientData['phone_number'])); ?>" name="phone_number" value="+639" />

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="abc6">Civis Status: <span class="text-danger">*</span></label>
                                                        <select class="form-control form-control-sm rounded-0" id="Status" name="Status" value="<?php echo htmlspecialchars(ucwords($patientData['civil_status'])); ?>">
                                                            <?php
                                                            echo  getstat($civilstatus);
                                                            ?>
                                                        </select>

                                                    </div>

                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-1">
                                                        <label class="form-label" for="abc6">Blood Type: <span class="text-danger">*</span></label>
                                                        <select class="form-control form-control-sm rounded-0" id="Blood" name="Blood" value="<?php echo htmlspecialchars(ucwords($patientData['blood_type'])); ?>">
                                                            <?php
                                                            echo  getblood($blood);
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Mothers Name : <span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control form-control-sm rounded-0" id="m_name" name="m_name" value="<?php echo htmlspecialchars(ucwords($patientData['mother_name'])); ?>" />

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Fathers Name/Guardian: <span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control form-control-sm rounded-0" id="f_gname" name="f_gname" value="<?php echo htmlspecialchars(ucwords($patientData['father_guardian_name'])); ?>" />

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Nationality Type: <span class="text-danger">*</span></label>
                                                        <select class="form-control form-control-sm rounded-0" id="Nationality" name="Nationality" value="<?php echo htmlspecialchars(ucwords($patientData['Nationality'])); ?>">
                                                            <?php
                                                            echo  getnationality($nationality);
                                                            ?>
                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Educational Attainment</label>
                                                        <select class="form-control form-control-sm rounded-0" id="ed_att" name="ed_att" value="<?php echo htmlspecialchars(ucwords($patientData['ed_at'])); ?>">
                                                            <?php
                                                            echo  geteducation($ed_at);
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Employement Status</label>
                                                        <input type="text" inputmode="text" class="form-control form-control-sm rounded-0" id="emp_stat" name="emp_stat" value="<?php echo htmlspecialchars(ucwords($patientData['emp_stat'])); ?>" />
                                                    </div>
                                                </div>




                                            </div>
                                            <hr style="width: 75%;" />
                                            <div class="row">
                                                <u><i>
                                                        <h3>Other Information</h3>
                                                    </i></u>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Philhealth Member <span class="text-danger">*</span></label>
                                                        <select class="form-control form-control-sm rounded-0" id="Philhealth" name="Philhealth" value="<?php echo htmlspecialchars(ucwords($patientData['phil_mem'])); ?>">
                                                            <?php
                                                            echo getphilhealth($phil);
                                                            ?>

                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Membership: </label>
                                                        <select class="form-control form-control-sm rounded-0" id="Phil_member" name="Phil_member" value="<?php echo htmlspecialchars(ucwords($patientData['phil_membership'])); ?>">
                                                            <?php
                                                            echo getphilhealthmembership($phil_membership);
                                                            ?>

                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Philhealth No.</label>
                                                        <input type="text" class="form-control form-control-sm rounded-0 " id="Phil_no" name="Phil_no" value="<?php echo htmlspecialchars(ucwords($patientData['philhealth_no'])); ?>" />

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-4 col-12">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="abc6">Membership Category</label>
                                                        <div class="form-group">
                                                            <div class="form-check">
                                                                <?php echo displayPSMemCheckboxes($phil_mem); ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <hr />
                                            <div class="row">

                                                <div class="d-flex gap-2 justify-content-end mb-2">


                                                    <button type="submit" class="btn btn-primary  float-end" id="cancel_update">Cancel</button>
                                                    <button type="submit" class="btn btn-info  float-end" id="submit_update" name="submit_update">Submit</button>
                                                </div>


                                            </div>




                                        </form>
                                    </div>
                                </div>
                                <!-- Row end -->



                            </div>
                        </div>






                    </div>
                    <!-- Container ends -->

                </div>
                <!-- App body ends -->

                <!-- App footer start -->
                <?php include './config/footer.php'; ?>
                <!-- App footer end -->

            </div>
            <!-- App container ends -->

        </div>
        <!-- Main container end -->

    </div>
    <!-- Page wrapper end -->

    <!-- *************
			************ JavaScript Files *************
		************* -->
    <!-- Required jQuery first, then Bootstrap Bundle JS -->

    <?php include './config/site_js_links.php';

    $message = '';
    if (isset($_GET['message'])) {
        $message = $_GET['message'];
    }

    ?>


    </script>



    <script src="assets/moment/moment.min.js"></script>
    <script src="assets/daterangepicker/daterangepicker.js"></script>
    <script src="assets/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="plugins/inputmask/jquery.inputmask.min.js"></script>




    <!-- <script>
        $(document).ready(function() {
            function calculateAge(birthdate) {
                console.log("Birthdate:", birthdate);
          
                var parts = birthdate.split('/');
                var dob = new Date(parts[2], parts[1] - 1, parts[0]); 
                if (isNaN(dob)) {
                    console.error("Invalid date format:", birthdate);
                    return; 
                }
                console.log("Parsed Date:", dob);
                var today = new Date();
                var age = today.getFullYear() - dob.getFullYear();
                var monthDiff = today.getMonth() - dob.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                    age--;
                }
                console.log("Calculated Age:", age);
                return age;
            }

            $('#date_of_birth').on('change.datetimepicker', function(e) {
                var dob = $(this).find('input').val();
                $('#Age').val(calculateAge(dob));
            });
        });
    </script> -->
    <script>
        document.getElementById('update_patient').addEventListener('click', function() {
            document.getElementById('patient_record_history').style.display = 'none';
            document.getElementById('patientUpdateform').style.display = 'block';
        });
        document.getElementById('cancel_update').addEventListener('click', function() {
            document.getElementById('patient_record_history').style.display = 'block';
            document.getElementById('patientUpdateform').style.display = 'none';
        });
    </script>


    <!-- <script>
        $(document).ready(function() {
            function calculateAge(birthdate) {
                console.log("Birthdate:", birthdate);

                var parts = birthdate.split('/');
                var dob = new Date(parts[2], parts[1] - 1, parts[0]);
                if (isNaN(dob)) {
                    console.error("Invalid date format:", birthdate);
                    return;
                }
                console.log("Parsed Date:", dob);
                var today = new Date();
                var age = today.getFullYear() - dob.getFullYear();
                var monthDiff = today.getMonth() - dob.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                    age--;
                }
                console.log("Calculated Age:", age);
                return age;
            }

            $('#date_of_birth').on('change.datetimepicker', function(e) {
                var dob = $(this).find('input').val();
                $('#Age').val(calculateAge(dob));
            });
        });
    </script> -->

    
    <script>
        $(document).ready(function() {
            $('#phone_number').inputmask('+639999999999');
            $('#date_of_birth').datetimepicker({
                format: 'L',
                maxDate: new Date()
            });


            function calculateAge(birthdate) {
                var dob = moment(birthdate, 'L'); // Parse date with moment.js using the 'L' format
                if (!dob.isValid()) {
                    console.error("Invalid date format:", birthdate);
                    return;
                }

                var today = moment();
                var age = today.diff(dob, 'years'); // Calculate age using moment.js
                var months = today.diff(dob, 'months') % 12;

                if (age === 0 && months === 1) {
                    return months + " month";
                } else if (age === 1 && months === 0) {
                    return age + " year";
                } else if (age === 1 && months > 0) {
                    return age + " year and " + months + " months";
                } else if (age === 0) {
                    return months + " months";
                } else {
                    return age + " years";
                }
            }

            $('#date_of_birth').on('change.datetimepicker', function(e) {
                var dob = $(this).find('input').val();
                var age = calculateAge(dob);
                $('#Age').val(age);
            });

        });
        // var dob = new Date(parseInt(parts[2], 10), parseInt(parts[1], 10) - 1, parseInt(parts[0], 10));
        // if (isNaN(dob.getTime())) {
        //     console.error("Invalid date format:", birthdate);
        //     return;
        // }
        // var today = new Date();
        // var age = today.getFullYear() - dob.getFullYear();
        // var monthDiff = today.getMonth() - dob.getMonth();
        // if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
        //     age--;
        // }
    </script>
    <!-- <script>
      $(document).ready(function() {
        // Function to calculate age based on date of birth
        function calculateAge(birthdate) {
          var today = new Date();
          var dob = new Date(birthdate);
          var age = today.getFullYear() - dob.getFullYear();
          var monthDiff = today.getMonth() - dob.getMonth();
          if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
            age--;
          }
          return age;
        }

        // Listen for changes in the date of birth input field
        $('#date_of_birth').on('change.datetimepicker', function(e) {
          var dob = $(this).find('input').val();
          $('#Age').val(calculateAge(dob));
        });
      });
    </script> -->
    <script>
        $(document).ready(function() {
            $('#date_of_birth').datetimepicker({
                format: 'L'
            });
            $('#phone_number').inputmask('+639999999999');
        });
    </script>
    <!-- ==================start Membership trigger============================== -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Get references to the elements
            var philhealthSelect = document.getElementById("Philhealth");
            var membershipSelect = document.getElementById("Phil_member");
            var philNoInput = document.getElementById("Phil_no");


            philhealthSelect.addEventListener("change", function() {

                if (philhealthSelect.value === "No") {
                    membershipSelect.disabled = true;
                    philNoInput.disabled = true;
                    membershipSelect.value = "";
                    philNoInput.value = "";
                } else {
                    membershipSelect.disabled = false;
                    philNoInput.disabled = false;
                }
            });


            philhealthSelect.dispatchEvent(new Event("change"));
        });
    </script>
    <script>
        $(document).ready(function() {

            $("#patient_name").blur(function() {

                var message = '<?php echo $message; ?>';

                if (message !== '') {
                    showCustomMessage(message);
                }


                var patientName = $(this).val().trim();
                // var householdNo = $("#household_no").val().trim();
                $(this).val(patientName);

                if (patient_name !== '') {
                    $.ajax({
                        url: "ajax/check_patient.php",
                        type: 'GET',
                        data: {
                            'patient_name': patientName
                            // 'household_no': householdNo
                        },
                        cache: false,
                        async: true,
                        success: function(count, status, xhr) {
                            if (parseInt(count) > 0) {
                                showCustomMessage("This patient name has already been saved. Please choose another name");
                                $("#save_Patient").attr("disabled", "disabled");
                            } else {
                                $("#save_Patient").removeAttr("disabled");
                            }
                        },
                        error: function(jqXhr, textStatus, errorMessage) {
                            showCustomMessage(errorMessage);
                        }
                    });
                }

            });
        });
    </script>



</body>



</html>