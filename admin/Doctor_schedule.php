<?php
include './config/connection.php';

include './common_service/common_functions.php';





if (isset($_POST['dsID'])) {


    $id = $_POST['dsID'];
    $queryUsers = "SELECT user.*, personnel.*, position.*, doctor.*
    FROM `tbl_users` AS user
    LEFT JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
    LEFT JOIN `tbl_position` AS position ON user.position_id = position.position_id
    LEFT JOIN `tbl_doctor_schedule` AS doctor ON user.userID = doctor.userID
    WHERE doctor.doc_scheduleID = :id";
    $stmtds = $con->prepare($queryUsers);
    $stmtds->execute([':id' => $id]);
    $row = $stmtds->fetch(PDO::FETCH_ASSOC);

    echo json_encode($row);
    exit;
}


if (isset($_POST['add_schedule'])) {
    $doctor_id = $_POST['doctor'];
    $days_of_week_array = $_POST['days_of_week'] ?? []; // This is an array of days
    $start_time = $_POST['start_time'];
    $end_time = $_POST['end_time'];
    $status = $_POST['status'];


    if (empty($days_of_week_array)) {
        $_SESSION['status'] = "Days of the week cannot be empty.";
        $_SESSION['status_code'] = "error";
        header('location: Doctor_schedule.php');
        exit();
    }
    // Combine days into a comma-separated string
    $days_of_week = implode(',', $days_of_week_array);

    $duplicateCheckQuery = "SELECT COUNT(*) FROM tbl_doctor_schedule WHERE userID = ? AND day_of_week = ?";
    $duplicateCheckStmt = $con->prepare($duplicateCheckQuery);
    $duplicateCheckStmt->execute([$doctor_id, $days_of_week]);
    $duplicateCount = $duplicateCheckStmt->fetchColumn();

    if ($duplicateCount > 0) {
        $_SESSION['status'] = "Schedule for the selected days already exists for this doctor. Please choose different days.";
        $_SESSION['status_code'] = "warning";
        header('location: Doctor_schedule.php');
        exit();
    }


    $con->beginTransaction();
    try {
        $query = "INSERT INTO tbl_doctor_schedule (userID, day_of_week, start_time, end_time, is_available) VALUES (:doctor_id, :day_of_week, :start_time, :end_time, :is_available)";
        $stmt = $con->prepare($query);
        $stmt->execute([
            ':doctor_id' => $doctor_id,
            ':day_of_week' => $days_of_week,
            ':start_time' => $start_time,
            ':end_time' => $end_time,
            ':is_available' => $status,
        ]);

        $con->commit();
        $_SESSION['status'] = "Schedule added successfully.";
        $_SESSION['status_code'] = "success";
        header('location: Doctor_schedule.php');
        exit();
    } catch (Exception $e) {
        $con->rollBack();
        $_SESSION['status'] = "Something went wrong: " . $e->getMessage();
        $_SESSION['status_code'] = "danger";
        header('location: Doctor_schedule.php');
        exit();
    }
}

if (isset($_POST['update_schedule'])) {
    $schedule_id = $_POST['schedule_id'];
    $doctor_id = $_POST['doctor'];
    $days_of_week_array = $_POST['days_of_week'] ?? []; // Check if days_of_week is set
    $start_time = $_POST['start_time'];
    $end_time = $_POST['end_time'];
    $status = $_POST['status'];

    // Validate that days_of_week is not empty
    if (empty($days_of_week_array)) {
        $_SESSION['status'] = "Days of the week cannot be empty.";
        $_SESSION['status_code'] = "error";
        header('location: Doctor_schedule.php');
        exit();
    }

    // Convert array to comma-separated string
    $days_of_week = implode(',', $days_of_week_array);

    $queryUpdate = "UPDATE `tbl_doctor_schedule` 
                    SET `userID` = :doctor_id, 
                        `day_of_week` = :days_of_week, 
                        `start_time` = :start_time, 
                        `end_time` = :end_time, 
                        `is_available` = :status 
                    WHERE `doc_scheduleID` = :schedule_id";

    $stmtUpdate = $con->prepare($queryUpdate);
    $stmtUpdate->execute([
        ':doctor_id' => $doctor_id,
        ':days_of_week' => $days_of_week,
        ':start_time' => $start_time,
        ':end_time' => $end_time,
        ':status' => $status,
        ':schedule_id' => $schedule_id
    ]);

    // Optionally, you can return a response or redirect the user
    $_SESSION['status'] = "Doctor schedule successfully updated.";
    $_SESSION['status_code'] = "success";
    header('location: Doctor_schedule.php');
    exit();
}
$doctors = getDoctor($con);
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
                                    Doctor Schedules

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

                                            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#add_schedule">
                                                <i class="icon-file-plus"></i> Add
                                            </button>

                                        </div>
                                    </div>

                                    <!-- <div class="modal fade" id="add_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="add_schedule">
                                                        Add Schedule
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">

                                                    <form method="POST" enctype="multipart/form-data">

                                                        <div class="mb-3 row">
                                                            <label for="text" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" class="form-select" required>

                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="text" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                          
                                                                <select id="scheduleSelect" multiple="multiple" data-placeholder="Search here" id="days_of_week" name="days_of_week[]"  style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="text" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time" name="start_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="text" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time" name="end_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="text" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" id="Status" class="form-select" required>
                                                                    <option selected id="Status_val"></option>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                            </div>
                                                        </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn " data-bs-dismiss="modal">
                                                        Close
                                                    </button>
                                                    <button type="submit" id="add_schedule" name="add_schedule" class="btn btn-primary">
                                                        Save
                                                    </button>

                                                </div>
                                            </div>

                                            </form>
                                        </div>
                                    </div> -->

                                    <!-- <div class="modal fade" id="add_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="add_schedule">Add Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="POST" enctype="multipart/form-data">
                                                        <div class="mb-3 row">
                                                            <label for="doctor" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" class="form-select" required>
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="scheduleSelect" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                Please select at least one day of the week.
                                                            </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" name="start_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" name="end_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="Status" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" class="form-select" required>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="add_schedule" name="add_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->


                                    <!-- <div class="modal fade" id="add_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="add_schedule">Add Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="add_schedule_form" method="POST" enctype="multipart/form-data">
                                                        <div class="mb-3 row">
                                                            <label for="doctor" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" class="form-select" required>
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="days_of_week_add" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" name="start_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" name="end_time" required>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="Status" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" class="form-select" required>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="add_schedule_btn" name="add_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- Edit Schedule Modal -->
                                    <!-- <div class="modal fade" id="edit_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Update Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="POST" id="update_schedule_form">
                                                        <input type="hidden" id="doc_scheduleID" name="doc_scheduleID">
                                                        <div class="mb-3 row">
                                                            <label for="doctor" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" id="doctor" class="form-select" required>
                                                                <?php echo $doctors; ?>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a Doctor.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">

                                                                <select id="days_of_week" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time" name="start_time" required>
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Please select a start time.
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time" name="end_time" required>
                                                            </div>
                                                            <div class="invalid-feedback">
                                                                Please select a end time.
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="Status" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" id="Status" class="form-select" required>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="update_schedule" name="update_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                        <input type="hidden" name="schedule_id" id="schedule_id">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->


                                    <!-- add start -->
                                    <!-- <div class="modal fade" id="add_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="add_schedule">Add Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="add_schedule_form" method="POST" enctype="multipart/form-data">
                                                        <div class="mb-3 row">
                                                            <label for="doctor" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" id="doctor_add" class="form-select" required>
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a Doctor.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week_add" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="days_of_week_add" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time_add" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time_add" name="start_time">
                                                                <div class="invalid-feedback">
                                                                    Please select a start time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time_add" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time_add" name="end_time">
                                                                <div class="invalid-feedback">
                                                                    Please select an end time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="status_add" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" id="status_add" class="form-select">
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a status.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="add_schedule_btn" name="add_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <div class="modal fade" id="add_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Add Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="add_schedule_form" method="POST" enctype="multipart/form-data" novalidate>
                                                        <div class="mb-3 row">
                                                            <label for="doctor_add" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" id="doctor_add" class="form-select" required>
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a Doctor.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week_add" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="days_of_week_add" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;" required>
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time_add" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time_add" name="start_time" required>
                                                                <div class="invalid-feedback">
                                                                    Please select a start time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time_add" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time_add" name="end_time" required>
                                                                <div class="invalid-feedback">
                                                                    Please select an end time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="status_add" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="status" id="status_add" class="form-select" required>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a status.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="add_schedule_btn" name="add_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- add start -->


                                    <!-- edit start -->
                                    <!-- <div class="modal fade" id="edit_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Update Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="update_schedule_form" method="POST">
                                                        <input type="hidden" id="doc_scheduleID" name="doc_scheduleID">
                                                        <div class="mb-3 row">
                                                            <label for="doctor" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" id="doctor" class="form-select">
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a Doctor.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week_update" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="days_of_week" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;">
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time_update" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time" name="start_time">
                                                                <div class="invalid-feedback">
                                                                    Please select a start time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time_update" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time" name="end_time">
                                                                <div class="invalid-feedback">
                                                                    Please select an end time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="status_update" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="Status" id="Status" class="form-select">
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a status.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="update_schedule_btn" name="update_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                        <input type="hidden" name="schedule_id" id="schedule_id">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <div class="modal fade" id="edit_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Update Schedule</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="update_schedule_form" method="POST" novalidate>
                                                        <input type="hidden" id="doc_scheduleID" name="doc_scheduleID">
                                                        <div class="mb-3 row">
                                                            <label for="doctor_update" class="col-sm-3 col-form-label text-center">Select Doctor</label>
                                                            <div class="col-sm-8">
                                                                <select name="doctor" id="doctor" class="form-select" required>
                                                                    <?php echo $doctors; ?>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a Doctor.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="days_of_week_update" class="col-sm-3 col-form-label text-center">Day of the Week</label>
                                                            <div class="col-sm-8">
                                                                <select id="days_of_week" multiple="multiple" data-placeholder="Search here" name="days_of_week[]" class="form-select" style="width: 100%;" required>
                                                                    <option value="Monday">Monday</option>
                                                                    <option value="Tuesday">Tuesday</option>
                                                                    <option value="Wednesday">Wednesday</option>
                                                                    <option value="Thursday">Thursday</option>
                                                                    <option value="Friday">Friday</option>
                                                                    <option value="Saturday">Saturday</option>
                                                                    <option value="Sunday">Sunday</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select at least one day of the week.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="start_time_update" class="col-sm-3 col-form-label text-center">Start Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="start_time" name="start_time" required>
                                                                <div class="invalid-feedback">
                                                                    Please select a start time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="end_time_update" class="col-sm-3 col-form-label text-center">End Time</label>
                                                            <div class="col-sm-8">
                                                                <input type="time" class="form-control" id="end_time" name="end_time" required>
                                                                <div class="invalid-feedback">
                                                                    Please select an end time.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="status_update" class="col-sm-3 col-form-label text-center">Status</label>
                                                            <div class="col-sm-8">
                                                                <select name="status" id="status" class="form-select" required>
                                                                    <option value="1">Available</option>
                                                                    <option value="0">Not Available</option>
                                                                </select>
                                                                <div class="invalid-feedback">
                                                                    Please select a status.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" id="update_schedule_btn" name="update_schedule" class="btn btn-primary">Save</button>
                                                        </div>
                                                        <input type="hidden" name="schedule_id" id="schedule_id">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- edit end -->

                                    <!-- delete start -->
                                    <div class="modal fade" id="delete_doctor_schedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="delete_doctor_schedule"></h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="POST" action="controller/delete_doctor_schedule.php">
                                                        <input type="hidden" id="deleteid" name="deleteid">

                                                        <h4>Are you sure you want to delete the doctor schedule?</h4>

                                                        <div class="modal-footer">

                                                            <button type="button" class="btn btn-sm" data-bs-dismiss="modal">Close</button>

                                                            <button type="submit" class="btn btn-primary btn-sm">Delete</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- delete end -->


                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="user_list" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Doctor Name</th>
                                                        <th>Date</th>
                                                        <th>Start Time</th>
                                                        <th>End Time</th>
                                                        <th>Status</th>
                                                        <th class="text-center">Action</th>

                                                    </tr>
                                                    <?php
                                                    $query = "SELECT ds.*, ds.doc_scheduleID as dsID,user.*,personnel.*, position.*
                                                     FROM tbl_doctor_schedule as ds
                                                    LEFT JOIN tbl_users as user ON ds.userID = user.userID  
                                                    LEFT JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
                                                        LEFT JOIN `tbl_position` AS position ON user.position_id = position.position_id
                                                        ORDER BY ds.doc_scheduleID DESC";

                                                    $stmt = $con->prepare($query);
                                                    $stmt->execute();
                                                    ?>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $serial = 0;
                                                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                                        $serial++;
                                                    ?>

                                                        <tr>
                                                            <td><?php echo $serial; ?></td>


                                                            <td><?php echo $row['first_name'] . ' ' . ucwords($row['middlename']) . ' ' . ucwords($row['lastname']); ?></td>
                                                            <td><?php echo $row['day_of_week']; ?></td>

                                                            <td><?php echo date('h:i A', strtotime($row['start_time'])); ?></td>
                                                            <td><?php echo date('h:i A', strtotime($row['end_time'])); ?></td>

                                                            <td>
                                                                <?php

                                                                if ($row['is_available'] == 1) {
                                                                    echo '<span class="badge bg-success">active</span>';
                                                                } else {
                                                                    echo '<span class="badge bg-warning">inactive</span>';
                                                                }
                                                                ?>

                                                            </td>
                                                            <td>

                                                                <button class="btn btn-outline-info btn-sm edit" data-id="<?php echo $row['dsID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Edit">
                                                                    <i class="icon-edit"></i>
                                                                </button>
                                                                <button class="btn btn-outline-danger btn-sm delete" data-id="<?php echo $row['dsID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Delete">
                                                                    <i class="icon-trash"></i>
                                                                </button>
                                                            </td>
                                                        </tr>

                                                    <?php  } ?>
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
    <script>
        $(document).ready(function() {
            $("#user_list").DataTable({
                "responsive": true,
                "lengthChange": true,
                "autoWidth": false,
                "dom": '<"row"<"col-md-6 text-left"l><"col-md-6 text-right"f>>rt<"bottom"ip><"clear">',
                "lengthMenu": [5, 10, 20, 50, 100],
            });
        });
    </script>

    <script>
        // document.addEventListener('DOMContentLoaded', function() {
        //     const updateForm = document.getElementById('update_schedule_form');
        //     const addForm = document.getElementById('add_schedule_form');
        //     const daysOfWeekUpdateSelect = document.getElementById('days_of_week');
        //     const daysOfWeekAddSelect = document.getElementById('days_of_week_add');

        //     function validateDaysOfWeek(selectElement) {
        //         if (!selectElement.selectedOptions.length) {
        //             selectElement.classList.add('is-invalid');
        //             return false;
        //         } else {
        //             selectElement.classList.remove('is-invalid');
        //             return true;
        //         }
        //     }

        //     updateForm.addEventListener('submit', function(event) {
        //         if (!validateDaysOfWeek(daysOfWeekUpdateSelect)) {
        //             event.preventDefault();
        //         }
        //     });

        //     addForm.addEventListener('submit', function(event) {
        //         if (!validateDaysOfWeek(daysOfWeekAddSelect)) {
        //             event.preventDefault();
        //         }
        //     });

        // document.addEventListener('DOMContentLoaded', function() {
        //     const addForm = document.getElementById('add_schedule_form');
        //     const updateForm = document.getElementById('update_schedule_form');

        //     function validateDaysOfWeek(selectElement) {
        //         if (selectElement.select2('data').length === 0) {
        //             selectElement.addClass('is-invalid');
        //             return false;
        //         } else {
        //             selectElement.removeClass('is-invalid');
        //             return true;
        //         }
        //     }

        //     function validateField(inputElement) {
        //         if (inputElement.value === '') {
        //             inputElement.classList.add('is-invalid');
        //             return false;
        //         } else {
        //             inputElement.classList.remove('is-invalid');
        //             return true;
        //         }
        //     }

        //     function handleFormSubmit(event, form) {
        //         const daysOfWeekSelect = $(form.querySelector('#days_of_week'));
        //         const doctorSelect = form.querySelector('#doctor');
        //         const startTimeInput = form.querySelector('#start_time');
        //         const endTimeInput = form.querySelector('#end_time');
        //         const statusSelect = form.querySelector('#Status');

        //         let isValid = true;

        //         if (!validateDaysOfWeek(daysOfWeekSelect)) {
        //             isValid = false;
        //         }
        //         if (!validateField(doctorSelect)) {
        //             isValid = false;
        //         }
        //         if (!validateField(startTimeInput)) {
        //             isValid = false;
        //         }
        //         if (!validateField(endTimeInput)) {
        //             isValid = false;
        //         }
        //         if (!validateField(statusSelect)) {
        //             isValid = false;
        //         }

        //         if (!isValid) {
        //             event.preventDefault();
        //         }
        //     }

        //     addForm.addEventListener('submit', function(event) {
        //         handleFormSubmit(event, addForm);
        //     });

        //     updateForm.addEventListener('submit', function(event) {
        //         handleFormSubmit(event, updateForm);
        //     });

        document.addEventListener('DOMContentLoaded', function() {
            var form = document.getElementById('add_schedule_form');
            var updateForm = document.getElementById('update_schedule_form');
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
            updateForm.addEventListener('submit', function(event) {
                if (!updateForm.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                updateForm.classList.add('was-validated');
            }, false);

            $('#days_of_week').select2({
                theme: 'bootstrap4',
                dropdownParent: $('#edit_schedule')
            });

            $('#days_of_week_add').select2({
                theme: 'bootstrap4',
                dropdownParent: $('#add_schedule')
            });
        });
    </script>
    <script>
        // $('.select2').select2()

        // //Initialize Select2 Elements
        // $('#scheduleSelect').select2({
        //     theme: 'bootstrap4',
        //     dropdownParent: $('#add_schedule')
        // })
        // $('#days_of_week').select2({
        //     theme: 'bootstrap4',
        //     dropdownParent: $('#edit_schedule')
        // })
    </script>


    <script>
        $(function() {
            $('.edit').click(function(e) {
                e.preventDefault();
                $('#edit_schedule').modal('show');
                var id = $(this).data('id');
                getRow(id);
            });
            $('.delete').click(function(e) {
                e.preventDefault();
                $('#delete_doctor_schedule').modal('show');
                var id = $(this).data('id');
                $('#deleteid').val(id);
            });

            function getRow(id) {
                $.ajax({
                    type: 'POST',
                    url: 'Doctor_schedule.php',
                    data: {
                        dsID: id
                    },
                    dataType: 'json',
                    success: function(response) {
                        console.log(response);
                        $('#schedule_id').val(response.doc_scheduleID);
                        $('#doctor').val(response.userID);
                        var days = response.day_of_week.split(',');
                        $('#days_of_week').val(days).trigger('change');
                        $('#start_time').val(response.start_time);
                        $('#end_time').val(response.end_time);
                        $('#status').val(response.is_available);
                    }
                });
            }
        });
    </script>




</html>