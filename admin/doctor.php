<?php
include './config/connection.php';

include './common_service/common_functions.php';




if (isset($_POST['userID'])) {
    $id = $_POST['userID'];
    $queryUsers = "SELECT user.*, personnel.*, position.*
                   FROM `tbl_users` AS user
                   LEFT JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
                   LEFT JOIN `tbl_position` AS position ON user.position_id = position.position_id
                   WHERE user.userID = :id";
    $stmtUsers = $con->prepare($queryUsers);
    $stmtUsers->execute([':id' => $id]);
    $row = $stmtUsers->fetch(PDO::FETCH_ASSOC);


    if ($row && !empty($row['profile_picture'])) {
        $row['profile_picture'] = '../user_images/' . $row['profile_picture'];
    } else {
        $row['profile_picture'] = '../user_images/doctor.jpg'; // Default picture if none exists
    }


    echo json_encode($row);
    exit;
}

if (isset($_POST['save_doctor'])) {

    // var_dump($_POST);

    $fname = trim($_POST['fname']);
    $mname = trim($_POST['mname']);
    $uname = trim($_POST['uname']);
    $lname = trim($_POST['lname']);

    $positionName = trim($_POST['Position']);
    $Specialty = trim($_POST['Specialty']);
    $ProfessionalType = trim($_POST['Professional']);
    $LicenseNo = trim($_POST['LicenseNo']);

    $Address = trim($_POST['Address']);
    $uname = ucwords(strtolower($uname));
    $pass = trim($_POST['pass']);
    $contact = trim($_POST['contact']);
    $email = trim($_POST['email']);
    $status = trim($_POST['status']);
    $finalimage = $_FILES['profile']['name'];
    if (!empty($finalimage)) {
        move_uploaded_file($_FILES['profile']['tmp_name'], '../user_images/' . $finalimage);
    }

    if ($fname != '' && $uname != '' && $pass != '' && $contact != '' && $email != '') {

        $stmtCheck = $con->prepare("
        SELECT COUNT(*) AS num 
        FROM tbl_users AS u
        JOIN tbl_personnel AS p ON u.personnel_id = p.personnel_id
        WHERE u.user_name = :uname OR p.email = :email or p.first_name = :fname or p.lastname = :lname
    ");
        $stmtCheck->execute(['uname' => $uname, 'email' => $email, 'fname' => $fname, 'lname' => $lname]);
        $result = $stmtCheck->fetch(PDO::FETCH_ASSOC);

        if ($result['num'] > 0) {
            $_SESSION['status'] = "Username or Email already used by another user.";
            $_SESSION['status_code'] = "error";
            header('Location:doctor.php');
            exit();
        }

        // Hash the password
        $bcrypt_password = password_hash($pass, PASSWORD_ARGON2ID);


        $con->beginTransaction();
        try {

            $stmtPersonnel = $con->prepare("INSERT INTO tbl_personnel (first_name, middlename, lastname,address, contact, email) VALUES (?,?, ?, ?, ?, ?)");
            $stmtPersonnel->execute([$fname, $mname, $lname, $contact, $Address, $email]);
            $personnelId = $con->lastInsertId();

            $stmtPosition = $con->prepare("INSERT INTO tbl_position (personnel_id,positionName,Specialty,ProfessionalType,LicenseNo) VALUES (?,?, ?,?, ?)");
            $stmtPosition->execute([$personnelId, $positionName, $Specialty, $ProfessionalType, $LicenseNo]);
            $positionId = $con->lastInsertId();

            // Insert into tbl_users
            $stmtUsers = $con->prepare("INSERT INTO tbl_users (user_name, password, status, profile_picture, personnel_id, position_id, UserType) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmtUsers->execute([$uname, $bcrypt_password, $status, $finalimage, $personnelId, $positionId, 'Doctor']);

            $con->commit();
            $_SESSION['status'] = "User successfully added.";
            $_SESSION['status_code'] = "success";
?>
            <script>
                window.location.href = 'doctor.php';
            </script>
<?php
            exit();
        } catch (Exception $e) {
            $con->rollBack();
            $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
            $_SESSION['status_code'] = "danger";
            header('Location:doctor.php');
            exit();
        }
    } else {
        $_SESSION['status'] = "Please fill all the required fields.";
        $_SESSION['status_code'] = "error";
        header('Location:doctor.php');
        exit();
    }
}


// if (isset($_POST['update_doctor'])) {
//     // Retrieve user data from the form
//     var_dump($_POST);

//     $user_id = trim($_POST['userid']);
//     $persid = trim($_POST['persid']);
//     $fname = trim($_POST['fname']);
//     $fname = ucwords(strtolower($fname));

//     $mname = trim($_POST['mname']);
//     $mname = ucwords(strtolower($mname));
//     $uname = trim($_POST['uname']);

//     $lname = trim($_POST['lname']);
//     $lname = ucwords(strtolower($lname));

//     $Address = trim($_POST['Address']);
//     $pass = trim($_POST['pass']);
//     $contact = trim($_POST['contact']);
//     $email = trim($_POST['email']);
//     $Position = trim($_POST['Position']);
//     $Specialty = trim($_POST['Specialty']);
//     $Professional = trim($_POST['Professional']);
//     $LicenseNo = trim($_POST['LicenseNo']);

//     $status = trim($_POST['status']);
//     $finalimage = $_FILES['Profile']['name'];
//     $passwordChanged = !empty($pass);




//     if ($fname != '' && $uname != '' && $contact != '' && $email != '' ) {



//         $con->beginTransaction();
//         try {

//             $stmtPersonnel = $con->prepare("
//                 UPDATE tbl_personnel SET first_name = ?, middlename = ?, lastname = ?, address = ?, contact = ?, email = ?
//                 WHERE personnel_id = (SELECT personnel_id FROM tbl_users WHERE userID = ?)
//             ");
//             $stmtPersonnel->execute([$fname, $mname, $lname, $Address, $contact, $email, $user_id]);

//             $stmtPosition = $con->prepare("
//             UPDATE tbl_position SET personnel_id=?, PositionName=?, Specialty=?, ProfessionalType=?, LicenseNo=?
//             WHERE position_id = (SELECT position_id FROM tbl_users WHERE userID = ?)
//         ");
//         $stmtPosition->execute([$persid, $Position, $Specialty, $Professional, $LicenseNo, $user_id]);


//             // Update user data
//             $updateUserQuery = "UPDATE tbl_users SET user_name = ?, status = ?, profile_picture = ?";
//             $params = [$uname, $status, $finalimage];


//             if ($passwordChanged) {
//                 $argon_password = password_hash($pass, PASSWORD_ARGON2ID);
//                 $updateUserQuery .= ", password = ?";
//                 $params[] = $argon_password;
//             }

//             $updateUserQuery .= " WHERE userID = ?";
//             $params[] = $user_id;

//             $stmtUsers = $con->prepare($updateUserQuery);
//             $stmtUsers->execute($params);

//             $con->commit();
//             $_SESSION['status'] = "User successfully updated.";
//             $_SESSION['status_code'] = "success";
//             header('location: doctor.php');
//             exit();
//         } catch (Exception $e) {
//             $con->rollBack();
//             $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
//             $_SESSION['status_code'] = "danger";
//             header('location: doctor.php');
//             exit();
//         }
//     } else {
//         $_SESSION['status'] = "Please fill all the required fields.";
//         $_SESSION['status_code'] = "error";
//         header('location: doctor.php');
//         exit();
//     }
// }

if (isset($_POST['update_doctor'])) {
    // Retrieve user data from the form
    $user_id = trim($_POST['userid']);
    $persid = trim($_POST['persid']);
    $fname = ucwords(strtolower(trim($_POST['fname'])));
    $mname = ucwords(strtolower(trim($_POST['mname'])));
    $uname = trim($_POST['uname']);
    $lname = ucwords(strtolower(trim($_POST['lname'])));
    $Address = trim($_POST['Address']);
    $pass = trim($_POST['pass']);
    $contact = trim($_POST['contact']);
    $email = trim($_POST['email']);
    $Position = trim($_POST['Position']);
    $Specialty = trim($_POST['Specialty']);
    $Professional = trim($_POST['Professional']);
    $LicenseNo = trim($_POST['LicenseNo']);
    $status = trim($_POST['status']);
    $passwordChanged = !empty($pass);

    if ($fname != '' && $uname != '' && $contact != '' && $email != '') {
        $con->beginTransaction();
        try {
            $stmtPersonnel = $con->prepare("
                UPDATE tbl_personnel SET first_name = ?, middlename = ?, lastname = ?, address = ?, contact = ?, email = ?
                WHERE personnel_id = (SELECT personnel_id FROM tbl_users WHERE userID = ?)
            ");
            $stmtPersonnel->execute([$fname, $mname, $lname, $Address, $contact, $email, $user_id]);

            $stmtPosition = $con->prepare("
                UPDATE tbl_position SET personnel_id=?, PositionName=?, Specialty=?, ProfessionalType=?, LicenseNo=?
                WHERE position_id = (SELECT position_id FROM tbl_users WHERE userID = ?)
            ");
            $stmtPosition->execute([$persid, $Position, $Specialty, $Professional, $LicenseNo, $user_id]);

            // Update user data
            $updateUserQuery = "UPDATE tbl_users SET user_name = ?, status = ?";
            $params = [$uname, $status];

            // Check if a new profile picture is uploaded
            if (!empty($_FILES['Profile']['name'])) {
                $finalimage = $_FILES['Profile']['name'];
                $updateUserQuery .= ", profile_picture = ?";
                $params[] = $finalimage;
            }

            if ($passwordChanged) {
                $bcrypt_password = password_hash($pass, PASSWORD_BCRYPT);
                $updateUserQuery .= ", password = ?";
                $params[] = $bcrypt_password;
            }

            $updateUserQuery .= " WHERE userID = ?";
            $params[] = $user_id;

            $stmtUsers = $con->prepare($updateUserQuery);
            $stmtUsers->execute($params);

            $con->commit();
            $_SESSION['status'] = "Doctor information successfully updated.";
            $_SESSION['status_code'] = "success";
            header('location: doctor.php');
            exit();
        } catch (Exception $e) {
            $con->rollBack();
            $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
            $_SESSION['status_code'] = "danger";
            header('location: doctor.php');
            exit();
        }
    } else {
        $_SESSION['status'] = "Please fill all the required fields.";
        $_SESSION['status_code'] = "error";
        header('location: doctor.php');
        exit();
    }
}



?>


<!DOCTYPE html>
<html lang="en">


<head>
    <?php include './config/site_css_links.php'; ?>

    <?php include './config/data_tables_css.php'; ?>
    <title>Patients - Kalilintad Lutayan-Municipal Health Office</title>


</head>

<body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

        <!-- Main container start -->
        <div class="main-container">

            <!-- Sidebar wrapper start -->
            <nav id="sidebar" class="sidebar-wrapper">

                <!-- App brand starts -->
                <div class="app-brand px-3 py-2 d-flex align-items-center">
                    <a href="index.html">
                        <img src="assets/images/logo.svg" class="logo" alt="Bootstrap Gallery" />
                    </a>
                </div>
                <!-- App brand ends -->

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

                        <!-- Row start -->
                        <div class="row">
                            <div class="col-12 col-xl-12">
                                <!-- Breadcrumb start -->
                                <ol class="breadcrumb mb-1">
                                    <li class="breadcrumb-item">
                                        <a href="dashboard.php">Home</a>

                                    </li>
                                    <li class=" breadcrumb-active">

                                    </li>
                                </ol>
                                <!-- Breadcrumb end -->
                                <h2 class="mb-2"></h2>
                                <h6 class="mb-4 fw-light">
                                    Doctor List

                                </h6>
                            </div>
                        </div>
                        <!-- Row end -->

                        <!-- Row start -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card mb-4">
                                    <div class="card-header">

                                        <div class="d-flex align-items-end justify-content-between">

                                            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#add_doctor">
                                                <i class="icon-file-plus"></i> Add
                                            </button>

                                        </div>
                                    </div>


                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="doctor_list" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Profile picture</th>
                                                        <th>Doctor Name</th>
                                                        <th>Address</th>
                                                        <th>Contact info</th>
                                                        <th>Email</th>
                                                        <th>Specialty</th>
                                                        <th>License No.</th>
                                                        <th>Status</th>
                                                        <th class="text-center">Action</th>

                                                    </tr>
                                                    <?php

                                                    $queryUsers = "SELECT user.*,personnel.*, position.*
                                                  FROM `tbl_users` AS user
                                                  LEFT JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
                                                  LEFT JOIN `tbl_position` AS position ON user.position_id = position.position_id
                                                  WHERE user.UserType IN ('Doctor')
                                                  ORDER BY user.user_name DESC";

                                                    $stmtUsers = $con->prepare($queryUsers);
                                                    $stmtUsers->execute();
                                                    ?>
                                                </thead>
                                                <tbody>

                                                    <?php
                                                    $serial = 0;
                                                    while ($row = $stmtUsers->fetch(PDO::FETCH_ASSOC)) {
                                                        $serial++;
                                                    ?>


                                                        </tr>
                                                        <td><?php echo $serial; ?></td>
                                                        <td><img src="<?php echo (!empty($row['profile_picture'])) ? '../user_images/' . $row['profile_picture'] : '../user_images/doctor.jpg'; ?>" width="30px" height="30px" class="img-thumbnail rounded-circle p-0 border user-img"></td>
                                                        <td><?php echo $row['first_name'] . ' ' . ucwords($row['middlename']) . ' ' . ucwords($row['lastname']); ?></td>
                                                        <td><?php echo $row['address']; ?></td>
                                                        <td><?php echo $row['contact']; ?></td>
                                                   

                                                        <td><?php echo $row['email']; ?></td>
                                                        <td><?php echo $row['Specialty']; ?></td>
                                                        <td><?php echo $row['LicenseNo']; ?></td>
                                                        <td>
                                                            <?php

                                                            if ($row['status'] == 'active') {
                                                                echo '<span class="badge bg-success">active</span>';
                                                            } else {
                                                                echo '<span class="badge bg-warning">inactive</span>';
                                                            }
                                                            ?>
                                                        </td>
                                                        <td class="text-center">
                                                            <button class="btn btn-outline-success btn-sm view" data-id="<?php echo $row['userID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="View">
                                                                <i class="icon-eye"></i>
                                                            </button>
                                                            <button class="btn btn-outline-info btn-sm edit" data-id="<?php echo $row['userID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Edit">
                                                                <i class="icon-edit"></i>
                                                            </button>
                                                            <button class="btn btn-outline-primary btn-sm delete" data-id="<?php echo $row['userID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Delete">
                                                                <i class="icon-trash"></i>
                                                            </button>


                                                        </td>
                                                    <?php
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
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



    <?php include './config/site_js_links.php'; ?>
    <?php include './config/data_tables_js.php'; ?>
    <?php include './modal/doctor_modal.php'; ?>

    <script src="plugins/inputmask/jquery.inputmask.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#doctor_list").DataTable({
                "responsive": true,
                "lengthChange": true,
                "autoWidth": false,
                "dom": '<"row"<"col-md-6 text-left"l><"col-md-6 text-right"f>>rt<"bottom"ip><"clear">',
                "lengthMenu": [5, 10, 20, 50, 100],
            });
        });
    </script>

    <script>
        $(document).ready(function() {


            $('#contact').inputmask('+639999999999');

        });
    </script>

    <script>
        function previewImage() {
            var file = document.getElementById("Profile").files;
            if (file.length > 0) {
                var fileReader = new FileReader();

                fileReader.onload = function(event) {
                    document.getElementById("doctorprofile").setAttribute("src", event.target.result);
                };

                fileReader.readAsDataURL(file[0]);
            }
        }
    </script>

    <!-- <script>
        $(function() {
            $('.edit').click(function(e) {
                e.preventDefault();
                $('#update_doctor').modal('show');
                var id = $(this).data('id');
                getRow(id);
            });

            

            $('.view').click(function(e) {
                e.preventDefault();
                $('#view_doctor').modal('show');
                var id = $(this).data('id');
                getRow(id);
            });
            $('.delete').click(function(e) {
                e.preventDefault();
                $('#delete').modal('show');
                var id = $(this).data('id');
                getRow(id);
            });
        });


        function getRow(id, mode) {
            $.ajax({
                type: 'POST',
                url: 'doctor.php',
                data: {
                    userID: id
                },
                dataType: 'json',
                success: function(response) {
                    console.log(response);


                    if (mode === 'edit') {

                    $('#userid').val(response.userID);
                    $('#editfname').val(response.first_name);
                    $('#editmname').val(response.middlename);
                    $('#editlname').val(response.lastname);
                    $('#edituname').val(response.user_name);
                    $('#persid').val(response.personnel_id);
                    $('#editcontact').val(response.contact);
                    $('#editAddress').val(response.address);
                    $('#editemail').val(response.email);
                    $('#editPosition').val(response.PositionName);
                    $('#editSpecialty').val(response.Specialty);
                    $('#editProfessional').val(response.ProfessionalType);
                    $('#editLicenseNo').val(response.LicenseNo);
                    $('#editstatus').val(response.status);


                    // const imagePath1 = '../user_images/' + response.profile_picture;
                    // $('#doctorprofile').attr('src', imagePath1);
                    const imagePath = response.profile_picture;
                    $('#doctorprofile').attr('src', imagePath);

                 } else if (mode === 'view') {
                    $('#view_name').text(response.first_name + ' ' + response.middlename + ' ' + response.lastname);
                    $('#view_contac').text(response.contact);
                    $('#view_Email').text(response.email);
                    $('#view_address').text(response.address);
                    $('#view_role').text(response.LicenseNo);
                    $('#view_status').text(response.status);

                    const imagePath = response.profile_picture;
                    $('#view_profile_img').attr('src', imagePath);
                }
            }
        });
        }
    </script> -->


    <script>
        $(function() {
            $('.edit').click(function(e) {
                e.preventDefault();
                $('#update_doctor').modal('show');
                var id = $(this).data('id');
                getRow(id, 'edit');
            });

            $('.view').click(function(e) {
                e.preventDefault();
                $('#view_doctor').modal('show');
                var id = $(this).data('id');
                getRow(id, 'view');
            });

            $('.delete').click(function(e) {
                e.preventDefault();
                $('#delete_doctor').modal('show');
                var id = $(this).data('id');
                $('#deleteid').val(id);
            });
        });

        function getRow(id, mode) {
            $.ajax({
                type: 'POST',
                url: 'doctor.php',
                data: {
                    userID: id
                },
                dataType: 'json',
                success: function(response) {
                    console.log(response);

                    if (mode === 'edit') {
                        $('#userid').val(response.userID);
                        $('#editfname').val(response.first_name);
                        $('#editmname').val(response.middlename);
                        $('#editlname').val(response.lastname);
                        $('#edituname').val(response.user_name);
                        $('#persid').val(response.personnel_id);
                        $('#editAddress').val(response.address);
                        $('#editcontact').val(response.contact);                     
                        $('#editemail').val(response.email);
                        $('#editPosition').val(response.PositionName);
                        $('#editSpecialty').val(response.Specialty);
                        $('#editProfessional').val(response.ProfessionalType);
                        $('#editLicenseNo').val(response.LicenseNo);
                        $('#editstatus').val(response.status);

                        const imagePath = response.profile_picture;
                        $('#doctorprofile').attr('src', imagePath);
                    } else if (mode === 'view') {
                        $('#view_name').text(response.first_name + ' ' + response.middlename + ' ' + response.lastname);
                        $('#view_contac').text(response.contact);
                        $('#view_Email').text(response.email);
                        $('#view_address').text(response.address);
                        $('#licenseno').text(response.LicenseNo);
                        $('#view_status').text(response.status);

                        const imagePath = response.profile_picture;
                        $('#view_profile_img').attr('src', imagePath);
                    }
                }
            });
        }
    </script>

</body>



</html>