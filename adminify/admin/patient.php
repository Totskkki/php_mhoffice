<?php
include './config/connection.php';

include './common_service/common_functions.php';




$message = '';




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
          <div class="card-header" style="border-bottom: 1px solid;">
            <h5 class="card-title">Patient information</h5>
          </div>

          <?php
          // Retrieve the last inserted family number
          $lastFamilyNumberQuery = "SELECT family_no FROM patients ORDER BY id DESC LIMIT 1";
          $lastFamilyNumberStatement = $con->prepare($lastFamilyNumberQuery);

          if ($lastFamilyNumberStatement->execute()) {
            $lastFamilyNumberResult = $lastFamilyNumberStatement->fetch(PDO::FETCH_ASSOC);

            if ($lastFamilyNumberResult !== false && isset($lastFamilyNumberResult['family_no'])) {
              $lastFamilyNumber = $lastFamilyNumberResult['family_no'];
            } else {
              // No family number found or the result is not as expected
              $lastFamilyNumber = '';
            }
          } else {
            // Error executing the query
            $errorInfo = $lastFamilyNumberStatement->errorInfo();
            echo "Error executing query: " . $errorInfo[2];
          }
          ?>
          <div class="card-body">
            <form method="post">



              <div class="row">
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
               


                <div class="col-lg-3 col-sm-4 col-5">
                  <div class="mb-3">
                    <label class="form-label" for="abc">ITR No:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" id="cnic" value="<?php echo $cnic ?>" name="cnic" readonly />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-5">
                  <div class="mb-3">
                    <label class="form-label" for="abc1">Family no:</label>
                    <input type="number" value="<?php echo $lastFamilyNumber; ?>" class="form-control form-control-sm rounded-0" min="0" id="family_no" name="family_no" required="required" />
                  </div>
                </div>

              </div>

         
              <hr style="width: 57%;" />

              <div class="row">
                <div class="col-lg-3 col-sm-4 col-5">
                  <div class="mb-3">
                    <label class="form-label" for="abc">First Name</label>
                    <input type="text" class="form-control form-control-sm rounded-0" id="patient_name" name="patient_name" />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-5">
                  <div class="mb-3">
                    <label class="form-label" for="abc1">Middle Name</label>
                    <input type="text" class="form-control form-control-sm rounded-0" id="middle_name" name="middle_name" required="required" />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc2">Last Name</label>
                    <input type="text" class="form-control form-control-sm rounded-0" id="last_name" name="last_name" />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc3">Suffix</label>
                    <input type="text" class="form-control form-control-sm rounded-0" id="suffix" name="suffix" />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label " for="abc6">Address</label>
                    <select class="form-select form-control-sm rounded-0" id="address" name="address" required="required">
                      <?php echo getbrgy(); ?>
                    </select>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc5">Purok</label>
                    <textarea class="form-control form-control-sm rounded-0" id="Purok" name="Purok" cols="30" rows="1"></textarea>


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
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Age</label>
                    <input type="number" min="0" max="999" class="form-control form-control-sm rounded-0" id="Age" name="Age" required="required" />
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-1">
                    <label class="form-label" for="abc6">Sex</label>
                    <div class="form-group">
                      <div class="form-check">

                        <?php echo getGender(); ?>

                      </div>

                    </div>
                  </div>

                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-1">
                    <label class="form-label" for="abc6">Contact number</label>
                    <input type="text" inputmode="text" class="form-control form-control-sm rounded-0" id="phone_number" name="phone_number" value="+639" required="required" />

                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-1">
                    <label class="form-label" for="abc6">Civis Status</label>
                    <select class="form-control form-control-sm rounded-0" id="Status" name="Status" required="required">
                      <?php
                      echo  getstat();
                      ?>
                    </select>

                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-1">
                    <label class="form-label" for="abc6">Blood Type</label>
                    <select class="form-control form-control-sm rounded-0" id="Blood" name="Blood">
                      <?php
                      echo  getblood();
                      ?>
                    </select>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Nationality Type</label>
                    <select class="form-control form-control-sm rounded-0" id="Nationality" name="Nationality">
                      <?php
                      echo  getnationality();
                      ?>
                    </select>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Educational Attainment</label>
                    <select class="form-control form-control-sm rounded-0" id="ed_att" name="ed_att">
                      <?php
                      echo  geteducation();
                      ?>
                    </select>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Employement Status</label>
                    <input type="text" inputmode="text" class="form-control form-control-sm rounded-0" id="emp_stat" name="emp_stat" required="required" />
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
                    <label class="form-label" for="abc6">Philhealth Member</label>
                    <select class="form-control form-control-sm rounded-0" id="Philhealth" name="Philhealth" required="required">
                      <?php
                      echo getphilhealth();
                      ?>

                    </select>

                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Membership</label>
                    <select class="form-control form-control-sm rounded-0" id="Phil_member" name="Phil_member">
                      <?php
                      echo getphilhealthmembership();
                      ?>

                    </select>

                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Philhealth No.</label>
                    <input type="text" class="form-control form-control-sm rounded-0 " id="Phil_no" name="Phil_no" />

                  </div>
                </div>
                <div class="col-lg-3 col-sm-4 col-12">
                  <div class="mb-3">
                    <label class="form-label" for="abc6">Membership Category</label>
                    <div class="form-group">
                      <div class="form-check">
                        <?php
                        echo getMemCat();
                        ?>
                      </div>
                    </div>

                  </div>
                </div>

              </div>
              <hr />
              <div class="row">
                <div class="mb-3">
                  <button type="submit" class="btn btn-primary btn-sm  float-end" id="save_Patient" name="save_Patient">Submit</button>
                </div>
              </div>
              <?php require 'controller/add_patient.php' ?>


            </form>




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





<script>
  $(document).ready(function() {
    $('#date_of_birth .datetimepicker').datetimepicker({
      format: 'L'
    });
  });
</script>

<?php
include './config/footer.php';

$message = '';
if (isset($_GET['message'])) {
  $message = $_GET['message'];
}
?>


<!-- <script>
    $(document).ready(function() {
        showMenuSelected("#mnu_patients", "#mi_patients");

        var message = '<?php echo $message; ?>';

        if (message !== '') {
            showCustomMessage(message);
        }

    });
</script> -->