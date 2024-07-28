<?php
include './config/connection.php';

include './common_service/common_functions.php';




$message = '';

// if (isset($_POST['save_Patient'])) {
//     $patientName = trim($_POST['patient_name']);
//     $middle_name = trim($_POST['middle_name']);
//     $last_name = trim($_POST['last_name']);
//     $suffix = trim($_POST['suffix']);
//     $address = trim($_POST['address']);
//     $cnic = trim($_POST['cnic']);

//     $dateBirth = trim($_POST['date_of_birth']);
//     // $dateArr = explode("/", $dateBirth);
//     // $dateBirth = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];

//     $phoneNumber = trim($_POST['phone_number']);

//     $patientName = ucwords(strtolower($patientName));
//     $address = ucwords(strtolower($address));

//     $gender = $_POST['gender'];


//     $Purok = trim($_POST['Purok']);
//     $status = trim($_POST['Status']);
//     $Weight = trim($_POST['Weight']);
//     $Blood  = trim($_POST['Blood']);
//     $philhealth  = trim($_POST['Philhealth']);
//     $member  = trim($_POST['Member']);
//     $Age = trim($_POST['Age']);
//     if (
//         $patientName != '' && $address != '' &&
//         $cnic != '' && $dateBirth != '' && $phoneNumber != '' && $gender != ''
//         && $Purok !== '' && $status !== '' && $Weight !== ''
//         && $Blood !== '' && $philhealth !== '' && $member !== '' && $Age !== ''
//     ) {
//         // Check for duplicate patient name
//         $duplicateQuery = "SELECT COUNT(*) as count FROM patients WHERE patient_name = :patientName";
//         $duplicateStatement = $con->prepare($duplicateQuery);
//         $duplicateStatement->bindParam(':patientName', $patientName, PDO::PARAM_STR);
//         $duplicateStatement->execute();
//         $duplicateResult = $duplicateStatement->fetch(PDO::FETCH_ASSOC);

//         if ($duplicateResult['count'] > 0) {
//             $message = 'Duplicate patient name found. Please choose a different name.';
//         } else {
//             // Proceed with the insertion
//             $query = "INSERT INTO `patients`
//             (`patient_name`, `middle_name`, `last_name`, `suffix`,`address`, `cnic`, `date_of_birth`, `phone_number`, `gender`
//             ,`purok`, `status`, `weight`, `blood_type`, `phil_mem`,`ps_mem`,`age`)
//             VALUES('$patientName','$middle_name','$last_name','$suffix', '$address', '$cnic', '$dateBirth', '$phoneNumber', '$gender'
//             ,'$Purok','$status','$Weight','$Blood','$philhealth','$member','$Age');";

//             try {
//                 $con->beginTransaction();
//                 $stmtPatient = $con->prepare($query);
//                 $stmtPatient->execute();
//                 $con->commit();
//                 $message = 'Patient added successfully.';
//             } catch (PDOException $ex) {
//                 $con->rollback();
//                 echo $ex->getMessage();
//                 echo $ex->getTraceAsString();
//                 exit;
//             }
//         }
//     }
//     header("Location:congratulation.php?goto_page=patients.php&message=$message");
//     exit;
// }

// try {
//     $query = "SELECT `id`, CONCAT(`patient_name`,' ', `middle_name`,'. ' , `last_name`, ' ',`suffix`) AS `name`,
//    CONCAT('Brgy. ',`address`,', Purok ',`purok`, ', Tantagan' ,', South Cotabato' ) as `add`,
//   `cnic`, DATE_FORMAT(`date_of_birth`, '%b %d %Y') AS `date_of_birth`,`age`,
//   `phone_number`, `gender` ,`status`,`weight`,`blood_type`,`phil_mem`,`ps_mem`
//   FROM `patients` ORDER BY `name` ASC;";


//     $stmtPatient1 = $con->prepare($query);
//     $stmtPatient1->execute();
// } catch (PDOException $ex) {
//     echo $ex->getMessage();
//     echo $ex->getTraceAsString();
//     exit;
// }



?>
<?php
include './config/header.php';
?>


<!-- App body starts -->
<div class="app-body">

    <!-- Container starts -->
    <div class="container-fluid">

        <!-- Row start -->
        <div class="row">
            <div class="col-12 col-xl-12">
                <!-- Breadcrumb start -->
                <ol class="breadcrumb mb-1">
                    <li class="breadcrumb-item">
                        <a href="dashboard.php">Home</a>

                    </li>
                    <li class=" breadcrumb-active">
                        / Patient
                    </li>
                </ol>
                <!-- Breadcrumb end -->
                <h2 class="mb-2">Add Patient</h2>
                <h6 class="mb-4 fw-light">
                    Mga impormasyon ng pasyente
                </h6>
            </div>
        </div>
        <!-- Row end -->
        <!-- Row start -->
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="card-title">Patient information</h5>
                    </div>
                    <div class="card-body">
                        <div class="card-body">

                            <form method="post">
                                <!-- Row start -->
                                <div class="row">
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc">First Name</label>
                                            <input type="text" class="form-control" id="patient_name" name="patient_name" placeholder="Enter firstname" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc1">Middle Name</label>
                                            <input type="text" class="form-control" id="middle_name" name="middle_name" required="required" placeholder="Enter Middle Name" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc2">Last Name</label>
                                            <input type="text" class="form-control" id="last_name" name="last_name" required="required" placeholder="Enter Last Name" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc3">Suffix</label>
                                            <input type="text" class="form-control" id="suffix" name="suffix" placeholder="Jr. Sr." />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Barangay</label>
                                            <select class="form-select" id="address" name="address" required="required">
                                                <?php echo getbrgy(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc5">Purok</label>
                                            <input type="text" class="form-control" id="Purok" name="Purok" required="required" placeholder="Enter Purok" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">

                                        <?php
                                        $query = "SELECT id FROM patients ORDER BY id DESC LIMIT 1";
                                        $stmt = $con->query($query);

                                        $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                        $lastId = $row['id'];

                                        // Generate the CNIC
                                        if (empty($lastId)) {
                                            $cnic = "0000000001";
                                        } else {
                                            $cnic = str_pad($lastId + 1, 10, '0', STR_PAD_LEFT);
                                        }
                                        ?>
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">CNIC</label>
                                            <input type="text" class="form-control " id="cnic" value="<?php echo $cnic ?>" name="cnic" readonly />
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc7">Date of Birth</label>

                                            <div class="input-group date" id="date_of_birth" data-target-input="nearest">
                                                <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" data-target="#date_of_birth" name="date_of_birth" data-toggle="datetimepicker" autocomplete="off" />
                                                <div class="input-group-append" data-target="#date_of_birth" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Age</label>
                                            <input type="number" class="form-control" id="Age" name="Age" required="required" placeholder="age" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Gender</label>
                                            <select class="form-select" id="gender" name="gender" required="required">
                                                <?php echo getGender(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Contact number</label>
                                            <input type="number" class="form-control" id="phone_number" name="phone_number" required="required" placeholder="09xxxxxxxxx" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Status</label>
                                            <select class="form-select" id="Status" name="Status" required="required">
                                                <?php
                                                echo  getstat();
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Weight</label>
                                            <input type="number" class="form-control" id="Weight" name="Weight" placeholder="weight" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Blood Type</label>
                                            <select class="form-control " id="Blood" name="Blood">
                                                <?php
                                                echo  getblood();
                                                ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">Philhealth member</label>
                                            <select class="form-control " id="Philhealth" name="Philhealth" required="required">
                                                <?php
                                                echo getphilhealth();
                                                ?>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label" for="abc6">4P's member</label>
                                            <select class="form-control " id="Member" name="Member" required="required">
                                                <?php
                                                echo get4ps();
                                                ?>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="d-flex gap-2 justify-content-end">

                                            <button type="submit" class="btn btn-primary" id="save_Patient" name="save_Patient">
                                                Submit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Row end -->
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Row end -->








    </div>
    <!-- Container ends -->

</div>
<!-- App body ends -->
<!-- Moment JS -->
<!-- Correct path to moment.js -->





<!-- <script>
    $(document).ready(function() {
        $('#date_of_birth .datetimepicker').datetimepicker({
            format: 'L'
        });
    });
</script> -->

<?php
include './config/footer.php';

$message = '';
if (isset($_GET['message'])) {
    $message = $_GET['message'];
}
?>











</body>



</html>