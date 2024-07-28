<?php
include './config/connection.php';

include './common_service/common_functions.php';
date_default_timezone_set('Asia/Manila');


if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT 
    pat.*,fam.*,mem.*,com.*,
    CONCAT(pat.`patient_name`, ' ', pat.`middle_name`, '. ', pat.`last_name`, ' ', pat.`suffix`) AS `name`,
    DATE_FORMAT(pat.`date_of_birth`, '%m/%d/%Y') AS `date_of_birth`
FROM 
    `tbl_patients` AS pat
    left JOIN 
    `tbl_family` AS fam ON pat.`family_address` = fam.`famID`
left JOIN 
    `tbl_membership_info` AS mem ON pat.`membership_info` = mem.`membershipID`
    left  JOIN `tbl_complaints` as com ON pat.`patientID` = com.`patient_id`
WHERE 
    pat.`patientID` = :id";
    $stmt = $con->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $patientData = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch patient details

}
// if (isset($_GET['id'])) {
//     $complaintID = $_GET['id'];
//     // Prepare a statement to select the patient and complaint data
//     $query = "SELECT com.*, pat.*, fam.*,
//               CONCAT(pat.`patient_name`, ' ', pat.`middle_name`, ' ', pat.`last_name`, ' ', pat.`suffix`) AS `name`
//               FROM tbl_complaints AS com 
//               JOIN tbl_patients AS pat ON com.patient_id = pat.patientID
//               JOIN 
//               tbl_family AS fam ON pat.family_address = fam.famID
//               WHERE com.complaintID = :patientID";

//     $stmt = $con->prepare($query);
//     $stmt->bindParam(':patientID', $complaintID, PDO::PARAM_INT);
//     $stmt->execute();


//     $patientData = $stmt->fetch(PDO::FETCH_ASSOC);
// }


?>


<!DOCTYPE html>
<html lang="en">


<head>
    <?php include './config/site_css_links.php'; ?>

    <?php include './config/data_tables_css.php'; ?>
    <title>Patients - Kalilintad Lutayan-Municipal Health Office</title>

    <style>
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
    </style>
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
                                                    <button type="button" id="" name="" class="btn btn-info float-end">Patient Profile</button>
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

                                        <div class="row">
                                            <div class="card-header">
                                                <h2><strong>Patient Complaint</strong> </h2>
                                            </div>
                                        </div>
                                        <div class="row flex-container">




                                            <div class="flex-item">
                                                <p class="form-label">Chief Complaint: <?php echo htmlspecialchars($patientData['Chief_Complaint']); ?></p>
                                            </div>

                                            <div class="flex-item">
                                                <p class="form-label">Remarks: <?php echo htmlspecialchars($patientData['Remarks']); ?></p>
                                            </div>

                                            <div class="flex-item">
                                                <p class="form-label">Nature of Visit: <?php echo htmlspecialchars($patientData['Nature_Visit']); ?></p>
                                            </div>

                                            <div class="flex-item">
                                                <p class="form-label">Type of consultation purpose of visit: <?php echo htmlspecialchars($patientData['consultation_purpose']); ?></p>
                                            </div>

                                           
                                            <div class="flex-item ">
                                                <p class="form-label">Reason for referral: <?php echo htmlspecialchars(ucwords($patientData['reason_ref'])); ?></p>
                                            </div>
                                            <div class="flex-item ">
                                                <p class="form-label">Refferred by: <?php echo htmlspecialchars(ucwords($patientData['refferred'])); ?></p>
                                            </div>


                                        </div>


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