<?php
include './config/connection.php';
error_reporting(E_ALL);
ini_set('display_errors', 1);

$message = '';
// if (isset($_POST['login'])) {
//   $userName = $_POST['user_name'];
//   $password = $_POST['password'];

//   // Fetch user data from database
//   $stmtLogin = $con->prepare("SELECT * FROM `tbl_users` WHERE `user_name` = ?");
//   $stmtLogin->execute([$userName]);
//   $result = $stmtLogin->fetch(PDO::FETCH_ASSOC);

//   // Check if user exists and password matches
//   if ($result && password_verify($password, $result['password'])) {
//       // Store user data in session
//       $_SESSION['user_id'] = $result['id'];
//       $_SESSION['first_name'] = $result['first_name'];
//       $_SESSION['last_name'] = $result['last_name'];
//       $_SESSION['user_name'] = $result['user_name'];
//       $_SESSION['profile_picture'] = $result['profile_picture'];
//       $_SESSION['login'] = true;
//       $_SESSION['status'] = "Login successful!";
//       $_SESSION['status_code'] = "success";

//       // Log user login
//       $user_id = $result['id'];
//       $username = $result['user_name'];
//       $user_ip = $_SERVER['REMOTE_ADDR'];
//       $status = 1;
//       $logQuery = "INSERT INTO `tbl_user_log` (`user_id`, `username`, `user_ip`, `status`) VALUES (?, ?, ?, ?)";
//       $stmtLog = $con->prepare($logQuery);
//       $stmtLog->execute([$user_id, $username, $user_ip, $status]);

//       // Redirect user to home page
//       header("location: home.php");
//       exit;
//   } else {
//       // Incorrect username or password
//       $message = 'Incorrect username or password.';
//       $username = $userName;
//       $user_ip = $_SERVER['REMOTE_ADDR'];
//       $status = 0;

//       // Log failed login attempt
//       $logQuery = "INSERT INTO `tbl_user_log` (`username`, `user_ip`, `status`) VALUES (?, ?, ?)";
//       $stmtLog = $con->prepare($logQuery);
//       $stmtLog->execute([$username, $user_ip, $status]);
//   }
// }
// if (isset($_POST['login'])) {
//   $userName = $_POST['user_name'];
//   $password = $_POST['password'];

//   // Fetch user data from database
//   // $stmtLogin = $con->prepare("SELECT * FROM `tbl_users` WHERE `user_name` = ?");
//   $stmtLogin = $con->prepare("SELECT user.*,personnel.*, position.* 
//                        FROM `tbl_users` as user, `tbl_personnel` as personel, `tbl_position` as position

//                     WHERE `user_name` = ?");


//   $stmtLogin->execute([$userName]);
//   $result = $stmtLogin->fetch(PDO::FETCH_ASSOC);

//   // Check if user exists and password matches
//   if ($result && password_verify($password, $result['password'])) {
//       // Check if user is active
//       if ($result['status'] == 'Active') {
//           // Store user data in session
//           $_SESSION['user_id'] = $result['userID'];
//           $_SESSION['first_name'] = $result['first_name'];
//           $_SESSION['last_name'] = $result['last_name'];
//           $_SESSION['user_name'] = $result['user_name'];
//           $_SESSION['profile_picture'] = $result['profile_picture'];
//           $_SESSION['login'] = true;
//           $_SESSION['status'] = "Login successful!";
//           $_SESSION['status_code'] = "success";

//           // Log user login
//           $user_id = $result['userID'];
//           $username = $result['user_name'];
//           $user_ip = $_SERVER['REMOTE_ADDR'];
//           $status = 1;
//           $logQuery = "INSERT INTO `tbl_user_log` (`logID`, `username`, `user_ip`, `status`) VALUES (?, ?, ?, ?)";
//           $stmtLog = $con->prepare($logQuery);
//           $stmtLog->execute([$user_id, $username, $user_ip, $status]);

//           // Redirect user to home page
//           header("location: home.php");
//           exit;
//       } else {
//           // User is inactive, show error message

//           $message = 'Your account is inactive. Please contact the administrator.';
//       }
//   } else {
//       // Incorrect username or password
//       $message = 'Incorrect username or password.';
//       $username = $userName;
//       $user_ip = $_SERVER['REMOTE_ADDR'];
//       $status = 0;

//       // Log failed login attempt
//       $logQuery = "INSERT INTO `tbl_user_log` (`username`, `user_ip`, `status`) VALUES (?, ?, ?)";
//       $stmtLog = $con->prepare($logQuery);
//       $stmtLog->execute([$username, $user_ip, $status]);
//   }
// }
if (isset($_POST['login'])) {
  $userName = $_POST['user_name'];
  $password = $_POST['password'];

  $stmtLogin = $con->prepare("SELECT user.*, personnel.*, position.*, user.UserType
                              FROM `tbl_users` AS user
                              INNER JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
                              INNER JOIN `tbl_position` AS position ON position.personnel_id = position.position_id
                           
                              WHERE user.`user_name` = ? ");

  $stmtLogin->execute([$userName]);
  $result = $stmtLogin->fetch(PDO::FETCH_ASSOC);

  if ($result && password_verify($password, $result['password'])) {
    // Check if user is active
    if ($result['status'] == 'active') {
      // Store user data in session
      $_SESSION['user_id'] = $result['userID'];
      $_SESSION['first_name'] = $result['first_name'];
      $_SESSION['last_name'] = $result['lastname'];
      $_SESSION['user_name'] = $result['user_name'];

      $_SESSION['profile_picture'] = $result['profile_picture'];
      $_SESSION['login'] = true;
      $_SESSION['status'] = "Login successful!";
      $_SESSION['status_code'] = "success";

      // Log user login
      $user_id = $result['userID'];
      $username = $result['user_name'];
      $user_ip = $_SERVER['REMOTE_ADDR'];
      $status = 1;
      $logQuery = "INSERT INTO `tbl_user_log` (`userID`, `username`, `user_ip`, `status`) VALUES (?, ?, ?, ?)";
      $stmtLog = $con->prepare($logQuery);
      $stmtLog->execute([$user_id, $username, $user_ip, $status]);

      // Check if user type is not already set in the session
      if (!isset($_SESSION['user_type'])) {
        $_SESSION['user_type'] = $result['UserType'];
      }

      // Redirect based on user type
      if ($_SESSION['user_type'] == 'RHU') {
        // Redirect to MHO dashboard
        header("location: RHU/dashboard-mho.php");
        exit;
      } elseif ($_SESSION['user_type'] == 'BHW') {
        // Redirect to BHW dashboard
        header("location: home.php");
        exit;
      } elseif ($_SESSION['user_type'] == 'Admin') {
        // Redirect to BHW dashboard
        header("location: admin/dashboard.php");
        exit;
      }
    } else {
      // User is inactive, show error message
      $message = 'Your account is inactive. Please contact the administrator.';
    }
  } else {
    // Incorrect username or password
    $message = 'Incorrect username or password.';
    $username = $userName;
    $user_ip = $_SERVER['REMOTE_ADDR'];
    $status = 0;

    // Log failed login attempt
    $logQuery = "INSERT INTO `tbl_user_log` (`username`, `user_ip`, `status`) VALUES (?, ?, ?)";
    $stmtLog = $con->prepare($logQuery);
    $stmtLog->execute([$username, $user_ip, $status]);
  }
}


if (isset($_SESSION['login']) && $_SESSION['login'] === true) {
  if ($_SESSION['user_type'] === 'RHU') {

    header("location: RHU/dashboard-mho.php");
    exit;
  } elseif ($_SESSION['user_type'] === 'BHW') {
    $disableInputs = true;
    header("location: home.php");
    exit;
  } elseif ($_SESSION['user_type'] === 'Admin') {

    header("location: admin/dashboard.php");
    exit;
  }
}

// Check if user exists and password matches
//   if ($result && password_verify($password, $result['password'])) {
//       // Check if user is active
//       if ($result['status'] == 'Active') {
//           // Store user data in session
//           $_SESSION['user_id'] = $result['userID'];
//           $_SESSION['first_name'] = $result['first_name'];
//           $_SESSION['last_name'] = $result['last_name'];
//           $_SESSION['user_name'] = $result['user_name'];
//           $_SESSION['profile_picture'] = $result['profile_picture'];
//           $_SESSION['login'] = true;
//           $_SESSION['status'] = "Login successful!";
//           $_SESSION['status_code'] = "success";


//           // Log user login


//           $user_id = $result['userID'];
//           $username = $result['user_name'];
//           $user_ip = $_SERVER['REMOTE_ADDR'];
//           $status = 1;
//           $logQuery = "INSERT INTO `tbl_user_log` (`userID`, `username`, `user_ip`, `status`) VALUES (?, ?, ?, ?)";
//           $stmtLog = $con->prepare($logQuery);
//           $stmtLog->execute([$user_id, $username, $user_ip, $status]);

//           if (!isset($_SESSION['user_type'])) {
//             $_SESSION['user_type'] = $result['UserType'];
//         }
//           if ($result['UserType'] == 'MHO') {
//             header("location: RHU/dashboard-mho.php");
//             exit;
//         } elseif ($result['UserType'] == 'BHW') {
//             header("location: home.php");
//             exit;
//         }

//       } else {
//           // User is inactive, show error message
//           $message = 'Your account is inactive. Please contact the administrator.';
//       }
//   } else {
//       // Incorrect username or password
//       $message = 'Incorrect username or password.';
//       $username = $userName;
//       $user_ip = $_SERVER['REMOTE_ADDR'];
//       $status = 0;

//       // Log failed login attempt
//       $logQuery = "INSERT INTO `tbl_user_log` (`username`, `user_ip`, `status`) VALUES (?, ?, ?)";
//       $stmtLog = $con->prepare($logQuery);
//       $stmtLog->execute([$username, $user_ip, $status]);
//   }
// }

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login</title>

  <!-- Icomoon Font Icons css -->
  <link rel="stylesheet" href="assets/fonts/icomoon/style.css" />

  <!-- Main CSS -->
  <link rel="stylesheet" href="assets/css/main.min.css" />

  <style>
    body {
      background-image: linear-gradient(to right, #004000, #ffffff);
    }

    .container {
      margin-top: 5rem;

    }
  </style>
</head>




<body>
  <!-- Container start -->
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-4 col-lg-5 col-sm-6 col-12">
        <form method="post" class="my-5">
          <div class="bg-white rounded-3 p-4">
            <div class="login-form">
              <!-- <a href="index.html" class="mb-4 d-flex">
									<img src="assets/images/logo-dark.svg" class="img-fluid login-logo" alt="AdminPro Admin Dashboard" />
								</a> -->

              <h2 class="my-3 text-center font-weight-bolder text-info text-gradient">WELCOME USER</h2>
              <p class="login-box-msg text-center">Please enter your login credentials</p>

              <div class="input-group mb-3">
                <input type="text" class="form-control form-control rounded-0 autofocus" Required="required" placeholder="Username" id="user_name" name="user_name">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fs-3 icon-user"></span>
                  </div>
                </div>
              </div>
              <div class="input-group mb-3">
                <input type="password" class="form-control form-control rounded-0" Required="required" placeholder="Password" id="password" name="password">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fs-3 icon-key"></span>
                  </div>
                </div>
              </div>
              <div class="d-flex align-items-center justify-content-between">
                <div class="form-check m-0">
                  <!-- <input class="form-check-input" type="checkbox" value="" id="rememberPassword" />
										<label class="form-check-label" for="rememberPassword">Remember</label> -->
                </div>
                <!-- <a href="#" class="text-info text-decoration-underline">Forget
                  password?</a> -->
              </div>
              <div class="row">


                <div class="d-grid py-3 mt-2">
                  <button type="submit" name="login" class="btn btn-lg " style="background-color: #808080;color:white">
                    LOGIN
                  </button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <p class="text-danger">
                    <?php
                    if ($message != '') {
                      echo $message;
                    }
                    ?>
                  </p>
                </div>
              </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Container end -->
</body>

</html>