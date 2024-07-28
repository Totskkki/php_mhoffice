<?php
include './config/connection.php';
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
                        <li class="/">
                            / Medical Personnel
                        </li>
                    </ol>
                    <!-- Breadcrumb end -->
                    <h2 class="mb-2">Medical Personnel</h2>
                    <h6 class="mb-4 fw-light">

                    </h6>
                </div>
            </div>
            <!-- Row end -->





        </div>
        <!-- Container ends -->

    </div>
    <!-- App body ends -->



  

    <?php
    include './config/footer.php';

    $message = '';
    if (isset($_GET['message'])) {
        $message = $_GET['message'];
    }
    ?>

    <script>

        
      showMenuSelected("#mnu_doctor", "#mnu_doctor");

      var message = '<?php echo $message; ?>';

      if (message !== '') {
        showCustomMessage(message);
      }
    </script>

    <script>
      function confirmDelete() {
        return confirm("Are you sure you want to delete this doctor?");
      }
    </script>
