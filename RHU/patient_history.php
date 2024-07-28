<?php
include './config/connection.php';

include './common_service/common_functions.php';




$patients = getPatients($con);
?>


<!DOCTYPE html>
<html lang="en">


<head>
  <?php include './config/site_css_links.php'; ?>

  <?php include './config/data_tables_css.php'; ?>
  <title>Patients - Kalilintad Lutayan-Municipal Health Office</title>
  <style>
    .input-group .form-control,
    .input-group .btn {
      height: 100%;
      display: flex;
      align-items: center;
    }
  </style>

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
                    / Patient History
                  </li>
                </ol>
                <!-- Breadcrumb end -->
                <h2 class="mb-2"></h2>
                <h6 class="mb-4 fw-light">

                </h6>
              </div>
            </div>
            <!-- Row end -->

            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                <div class="card mb-4">
                  <div class="card-header">
                    <h5 class="card-title">Patient History</h5>
                  </div>
                  <div class="card-body">




                    <!-- <div class="input-group w-50">
                     
                      <input type="text" class="form-control" id="patient">
                      <button class="btn btn-info" id="search" type="button">
                        <i class="icon-search"></i>
                      </button>
                    </div> -->
                    <div class="input-group w-50">
                      <input type="text" class="form-control" id="patient" style="height: 38px; line-height: 38px;">
                      <button class="btn btn-info" id="search" type="button" style="height: 38px; line-height: 38px;">
                        <i class="icon-search"></i>
                      </button>
                    </div>

                    <div class="clearfix">&nbsp;</div>
                    <div class="clearfix">&nbsp;</div>

                    <div class="row">
                      <div class="col-md-12 table-responsive">
                        <table id="patient_history" class="table table-striped table-bordered">
                          <colgroup>
                            <!-- <col width="10%">
                            <col width="15%">
                            <col width="15%">
                            <col width="20%">
                            <col width="10%"> -->
                            <!-- <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%"> -->
                          </colgroup>
                          <thead>
                            <tr class="bg-gradient-primary text-light">
                              <th class="p-1 text-center">#</th>
                              <th class="p-1 text-center">Visit Date</th>
                              <th class="p-1 text-center">Illness</th>
                              <th class="p-1 text-center">Next Visit Date</th>
                              <th class="p-1 text-center">Action</th>

                              <!-- <th class="p-1 text-center">QTY</th>
                              <th class="p-1 text-center">Dosage</th>

                              <th class="p-1 text-center">Duration</th>
                              <th class="p-1 text-center">Advice</th> -->
                            </tr>
                          </thead>

                          <tbody id="history_data">

                          </tbody>
                        </table>
                      </div>
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
  <?php include './modal/prescription_modal.php'; ?>

  <!-- <script src="assets/select2.js"></script> -->
  <!-- <script>
    // $(document).ready(function() {
    //   $('#patient').select2({
    //     placeholder: 'Search Patients'
    //   });

    // });
  </script> -->
  <!-- 
  <script>
    $(document).ready(function() {
      $("#all_patients").DataTable({
        "responsive": true,
        "lengthChange": true,
        "autoWidth": false,
        "dom": '<"row"<"col-md-6 text-left"l><"col-md-6 text-right"B>>rt<"bottom"ip><"clear">',
        "buttons": ["copy", "csv", "excel", "pdf", "print"],
        "lengthMenu": [5, 10, 20, 50, 100],
      });


      $('#datatable_buttons').append($('.dt-buttons'));

      $('#length_menu').append($('.dataTables_length'));
    });
  </script> -->
  <!-- <script>
    $(document).ready(function() {
      // Attach click event to dynamically loaded elements
      $(document).on('click', '.view-btn', function() {
       
      });

      $("#search").click(function() {
        var patientId = $("#patient").val();

        if (patientId !== '') {

          $.ajax({
            url: "ajax/get_patient_history.php",
            type: 'GET',
            data: {
              'patient_id': patientId
            },
            cache: false,
            async: false,
            success: function(data, status, xhr) {
              $("#history_data").html(data);
              // console.log(data);
              $('.view-btn').off().on('click', function() {
                const medicineName = $(this).data('name');


                // Open the modal
                $('#prescriptionModal').modal('show');
              });
            },
            error: function(jqXhr, textStatus, errorMessage) {
              showCustomMessage(errorMessage);
            }
          });

        }

      });


      $("#abc").click(function() {

      });


    });
  </script> -->

  <!-- <script>
    $(document).ready(function() {
   
    $(document).on('click', '.view-btn', function() {
     
        const medicineName = $(this).data('name');
    const dosage = $(this).data('dosage');
    const duration = $(this).data('duration');

    $('#prescriptionModalLabel').text('Prescription for ' + medicineName);


    $('#prescriptionContent').empty();

 
    const row = $('<tr>').append(
        $('<td>').text(medicineName),
        $('<td>').text(dosage),
        $('<td>').text(duration)
    );
    $('#prescriptionContent').append(row);


    $('#prescriptionModal').modal('show');;
     
    });

    $("#search").click(function() {
        var patientId = $("#patient").val();

        if (patientId !== '') {
            $.ajax({
                url: "ajax/get_patient_history.php",
                type: 'GET',
                data: {
                    'patient_id': patientId
                },
                cache: false,
                async: false,
                success: function(data, status, xhr) {
                    $("#history_data").html(data);
                    

                },
                error: function(jqXhr, textStatus, errorMessage) {
                    showCustomMessage(errorMessage);
                }
            });
        }
    });

    $("#abc").click(function() {});
});

  </script> -->

  <script>
    $(document).ready(function() {
      $(document).on('click', '.view-btn', function() {
        const medicineName = $(this).data('name');
        const patient = $(this).data('patient');
        console.log(medicineName);
        const schedule_dosage = $(this).data('schedule_dosage');
        const dosage = $(this).data('dosage');
        const duration = $(this).data('duration');
        const quantity = $(this).data('quantity');
        const time_frame = $(this).data('time_frame');

        $('#prescriptionModalLabel').text(patient +'| Prescription for '+ medicineName );
        $('#prescriptionContent').empty();

        const row = $('<tr>').append(
          $('<td>').text(dosage),
          $('<td>').text(schedule_dosage),
          $('<td>').text(quantity),
          $('<td>').text(duration),
          $('<td>').text(time_frame)
        );
        $('#prescriptionContent').append(row);

        $('#prescriptionModal').modal('show');
      });

      $("#search").click(function() {
        var searchQuery = $("#patient").val();

        if (searchQuery !== '') {
          $.ajax({
            url: "ajax/get_patient_history.php",
            type: 'GET',
            data: {
              'search_query': searchQuery
            },
            cache: false,
            async: false,
            success: function(data, status, xhr) {
              $("#history_data").html(data);
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