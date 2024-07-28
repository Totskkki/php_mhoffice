<?php
include './config/connection.php';
include './common_service/common_functions.php';


if (isset($_POST['medicineID'])) {
    $id = $_POST['medicineID'];

    $query = "SELECT * FROM tbl_medicines WHERE medicineID  = :id";
    $stmt = $con->prepare($query);
    $stmt->execute(array(':id' => $id));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode($row);

    exit;
}


if (isset($_POST['save_meds'])) {
    echo "Form submitted";

    $med_name =  trim($_POST['med_name']);
    $med_name =  ucwords(strtolower($med_name));

    $description =  trim($_POST['description']);
    $description =  ucwords(strtolower($description));

    $Category =  trim($_POST['Category']);
    $Category =  ucwords(strtolower($Category));

    $supplier =  trim($_POST['supplier']);
    $supplier =  ucwords(strtolower($supplier));
    $manufacturer =  trim($_POST['manufacturer']);
    $Brand =  trim($_POST['Brand']);

    // $man_date = trim($_POST['man_date']);
    // $dateArr = explode("/", $man_date);
    // $man_date = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];

    // $exp_date = trim($_POST['exp_date']);
    // $dateArr = explode("/", $exp_date);
    // $exp_date = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];

    $man_date = trim($_POST['man_date']);
    $dateArr = explode("/", $man_date);

    if (count($dateArr) == 3) {
        $man_date = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];
    } else {
        // Handle error for incorrect date format
        $man_date = null;
    }

    $exp_date = trim($_POST['exp_date']);
    $dateArr = explode("/", $exp_date);

    if (count($dateArr) == 3) {
        $exp_date = $dateArr[2] . '-' . $dateArr[0] . '-' . $dateArr[1];
    } else {
        // Handle error for incorrect date format
        $exp_date = null;
    }




    if ($med_name != '' && $man_date != '' && $exp_date != '' &&  $supplier != '' && $Brand != '' && $Category != '' && $description != '') {
        $query_check_duplicate = "SELECT COUNT(*) FROM tbl_medicines WHERE medicine_name = '$med_name'";
        $stmt_check_duplicate = $con->prepare($query_check_duplicate);
        $stmt_check_duplicate->execute();

        if ($stmt_check_duplicate->fetchColumn() > 0) {
            $_SESSION['status'] = "Medicine name already used.";
            $_SESSION['status_code'] = "error";
        } else {

            $data = [
                'medicine_name' => $med_name,
                'description' => $description,
                'supplier' => $supplier,
                'category' => $Category,
                'manuf_date' => $man_date,
                'ex_date' => $exp_date,
                'manufacturer' => $manufacturer,
                'brand' => $Brand
            ];

            $result = insert('tbl_medicines', $data, $con);

            if ($result) {
                $_SESSION['status'] = "Medicine successfully added.";
                $_SESSION['status_code'] = "success";
?>
                <script>
                    window.location.href = 'medicine.php';
                </script>
            <?php
                exit();
            } else {
                $_SESSION['status'] = "Something went wrong while adding medicine.";
                $_SESSION['status_code'] = "error";
            ?>
                <script>
                    window.location.href = 'medicine.php';
                </script>
<?php
                exit();
            }
        }
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
                    <a href="#">
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
                                        <a href="dashboard.php">Home </a>

                                    </li>
                                    <li class=" breadcrumb-active">
                                        / Medicine
                                    </li>
                                </ol>
                                <!-- Breadcrumb end -->
                                <h2 class="mb-2"></h2>
                                <h6 class="mb-4 fw-light">
                                    Medicine List
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

                                            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#medicine">
                                                <i class="icon-plus"></i> Add
                                            </button>

                                        </div>
                                    </div>


                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="medicine_list" class="table table-striped">
                                                <colgroup>
                                                    <col width="2%">
                                                    <col width="10%">
                                                    <col width="25%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Medicine Name</th>
                                                        <th>Description</th>
                                                        <th>Category</th>


                                                        <th class="text-center">Action</th>

                                                    </tr>
                                                </thead>
                                                <style>
                                                    p {
                                                        color: red;
                                                        ;
                                                    }

                                                    .medicine-info {
                                                        white-space: nowrap;
                                                    }

                                                    .medicine-info div {
                                                        margin-left: 20px;

                                                    }


                                                    .info-line {
                                                        display: flex;
                                                        align-items: center;
                                                    }

                                                    .info-label {
                                                        min-width: 100px;
                                                        color: red;

                                                    }

                                                    .info-value {
                                                        margin-left: 10px;
                                                        color: red;

                                                    }
                                                </style>
                                                <tbody>
                                                    <?php
                                                    $query = "SELECT *
                                                     FROM `tbl_medicines`                              
                                                     ORDER BY medicineID DESC";
                                                    $stmtmeds = $con->prepare($query);
                                                    $stmtmeds->execute();;


                                                    ?>
                                                    <?php
                                                    $count = 0;
                                                    while ($row = $stmtmeds->fetch(PDO::FETCH_ASSOC)) {
                                                        $count++;
                                                    ?>

                                                        <tr>
                                                            <td><?php echo $count; ?></td>
                                                            <td class="medicine-info">
                                                                <b><?php echo $row['medicine_name']; ?></b><br>
                                                                <div class="info-line">
                                                                    <span class="info-label">Manufacturer</span>
                                                                    <span class="info-label2">:</span>
                                                                    <span class="info-value"><?php echo $row['manufacturer']; ?></span>
                                                                </div>
                                                                <div class="info-line">
                                                                    <span class="info-label">Supplier:</span>
                                                                    <span class="info-label2">:</span>
                                                                    <span class="info-value"><?php echo $row['supplier']; ?></span>
                                                                </div>
                                                            </td>
                                                            <td><?php echo $row['description']; ?></td>
                                                            <td><?php echo $row['category']; ?></td>

                                                            <td class="text-center">

                                                                <button class="btn btn-outline-info btn-sm edit" data-id="<?php echo $row['medicineID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Edit">
                                                                    <i class="icon-edit"></i>
                                                                </button>

                                                                <form action="controller/delete_medicine.php" method="post" style="display: inline;" onsubmit="return confirmDelete();">

                                                                    <button name="delete_medicine" class="btn btn-outline-danger btn-sm " value="<?php echo $row['medicineID']; ?>" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary" data-bs-title="Delete">
                                                                        <i class="icon-trash"></i>
                                                                    </button>

                                                                </form>
                                                            </td>



                                                            <script>
                                                                function confirmDelete() {
                                                                    return confirm("Are you sure you want to delete this medicine?");
                                                                }
                                                            </script>



                                                        </tr>
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
    <?php include './modal/medicine_modal.php'; ?>



    <script src="assets/moment/moment.min.js"></script>
    <script src="assets/daterangepicker/daterangepicker.js"></script>
    <script src="assets/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
          document.addEventListener('DOMContentLoaded', function() {
            var forms = document.querySelectorAll('form[novalidate]');

            forms.forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                        form.classList.add('was-validated');
                    }
                }, false);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $('.datepicker').datepicker({
                format: 'mm/dd/yyyy',
                autoclose: true
            });
            $(document).ready(function() {
                $('#mandate,#expdate').datetimepicker({
                    format: 'L'
                });
                $('#man_date,#exp_date').datetimepicker({
                    format: 'L'
                });
                // $('#phone_number').inputmask('+639999999999');
            });
            $("#medicine_list").DataTable({
                "responsive": true,
                "lengthChange": true,
                "autoWidth": false,
                "dom": '<"row"<"col-md-6 text-left"l><"col-md-6 text-right"f>>rt<"bottom"ip><"clear">',
                "lengthMenu": [5, 10, 20, 50, 100],
            });
        });
    </script>
    <script>

    </script>
    <script>
        $(document).ready(function() {

            $("#medicine_list tbody").on('click', '.edit', function(e) {
                e.preventDefault();
                var id = $(this).data('id');
                getRow(id, 'edit');
                $('#editModal').modal('show');
            });
        });

        $(function() {
            $('.edit').click(function(e) {
                e.preventDefault();
                var id = $(this).data('id');
                getRow(id, 'edit');
                $('#editModal').modal('show');
            });
        });

        function getRow(id) {

            $.ajax({
                type: 'POST',
                url: 'medicine.php',
                data: {
                    medicineID: id
                },
                dataType: 'json',
                success: function(response) {

                    $('#med_id').val(response.medicineID);
                    $('#name').val(response.medicine_name);
                    $('#des').val(response.description);
                    $('#supp').val(response.supplier);
                    $('#brand').val(response.brand);
                    $('#manuf').val(response.manufacturer);

                    $.ajax({
                        type: 'POST',
                        url: 'ajax/getdrug.php',
                        dataType: 'html',
                        success: function(options) {

                            $('#Cat').html(options);
                            $('#Cat').val(response.category);

                        },
                        error: function(xhr, status, error) {
                            console.error('Error fetching category options:', error);
                        }
                    });

                    var manufDate = new Date(response.manuf_date);
                    var formattedManufDate = (manufDate.getMonth() + 1) + '/' + manufDate.getDate() + '/' + manufDate.getFullYear();
                    $('#mandate input').val(formattedManufDate);


                    var expDate = new Date(response.ex_date);
                    var formattedExpDate = (expDate.getMonth() + 1) + '/' + expDate.getDate() + '/' + expDate.getFullYear();
                    $('#expdate input').val(formattedExpDate);;

                }

            });

        }
    </script>



</body>



</html>