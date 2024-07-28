<?php
if (!(isset($_SESSION['user_id']))) {
  header("location:login.php");
  exit;
}
$userRole = isset($_SESSION['user_name']) ? $_SESSION['user_name'] : '';
$isAdmin = $userRole == 'admin';
?>

<?php $Page = substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'], "/") + 1); ?>

<style>
  .sidebar-menu .treeview-menu li.active>a {

    color: red;
    border-left: 1px solid #262a2d;
  }
</style>
<!-- Page wrapper start -->
<div class="page-wrapper">

  <!-- Main container start -->
  <div class="main-container">

    <!-- Sidebar wrapper start -->
    <nav id="sidebar" class="sidebar-wrapper ">




      <!-- App brand starts -->
      <div class="app-brand px-3 py-2 d-flex align-items-center">
        <a href="index.html">
          <img src="assets/images/logo.svg" class="logo" alt="Bootstrap Gallery" />
        </a>
      </div>
      <!-- App brand ends -->

      <!-- Sidebar menu starts -->
      <div class="sidebarMenuScroll">
        <ul class="sidebar-menu">
          <li class=" dashboard.php" id="mnu_dashboard">
            <a href="dashboard.php">
              <i class="icon-roofing"></i>
              <span class="menu-text">Dashboard</span>
            </a>
          </li>

          <li class="treeview">
            <a href="#">
              <i class="icon-business"></i>
              <span class="menu-text">Department</span>
            </a>
            <ul class="treeview-menu">
              <li>
                <a href="contacts.html">Birthing</a>
              </li>
              <li>
                <a href="faq.html">Animal bite</a>
              </li>
              <li>
                <a href="invoice-list.html">Vaccination & Immunization</a>
              </li>

            </ul>
          </li>



          <li class="treeview <?php if (strpos($_SERVER['REQUEST_URI'], 'new_prescription.php') !== false || strpos($_SERVER['REQUEST_URI'], 'patients.php') !== false) echo 'active'; ?>" id="mnu_patients">
            <a href="#!">
              <i class="icon-face"></i>
              <span class="menu-text <?php if ($Page === 'new_prescription.php') echo 'active'; ?>">Patients</span>
            </a>
            <ul class="treeview-menu" <?php if ($Page === 'patients.php') echo 'style="display:block;"'; ?>>
              <li <?php if ($Page === 'patients.php') echo 'class="active"'; ?>>
                <a href="patient.php">Add Patient</a>
              </li>
              <li <?php if ($Page === 'new_prescription.php') echo 'class="active"'; ?>>
                <a href="new_prescription.php">New Prescription</a>
              </li>
              <li <?php if ($Page === 'patient_history.php') echo 'class="active"'; ?>>
                <a href="patient_history.php">Patient History</a>
              </li>
            </ul>
          </li>



          <li class="treeview">
            <a href="#!">
              <i class="icon-healing"></i>
              <span class="menu-text">Medicine</span>
            </a>
            <ul class="treeview-menu">
              <li>
                <a href="contacts.html">Add Medicine</a>
              </li>
              <li>
                <a href="faq.html">Medicine details</a>
              </li>

            </ul>
          </li>
          <li class="treeview">
            <a href="#!">
              <i class="icon-edit"></i>
              <span class="menu-text">Reports</span>
            </a>
            <ul class="treeview-menu">
              <li>
                <a href="calendar.html">Reports</a>
              </li>
              <li>
                <a href="calendar-external-draggable.html">Medical Certificate</a>
              </li>
              <li>
                <a href="calendar-google.html">Refferal</a>
              </li>

            </ul>
          </li>

          <li id="mnu_doctor">

            <a href="med_personnel.php">
              <i class="icon-portrait"></i>
              <span class="menu-text">Medical Personnel</span>
            </a>
          </li>
          <li>
            <a href="placeholder.html">
              <i class="icon-users"></i>
              <span class="menu-text">Accounts</span>
            </a>
          </li>
          <li class="treeview">
            <a href="#!">
              <i class="icon-laptop_windows"></i>
              <span class="menu-text">Frontend</span>
            </a>
            <ul class="treeview-menu">
              <li>
                <a href="calendar.html">Daygrid View</a>
              </li>
              <li>
                <a href="calendar-external-draggable.html">External Draggable</a>
              </li>
              <li>
                <a href="calendar-google.html">Google Calendar</a>
              </li>
              <li>
                <a href="calendar-list-view.html">List View</a>
              </li>
              <li>
                <a href="calendar-selectable.html">Selectable</a>
              </li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#!">
              <i class="icon-settings"></i>
              <span class="menu-text">Settings</span>
            </a>
            <ul class="treeview-menu">
              <li>
                <a href="accordions.php">Accordions</a>
              </li>
              <li>
                <a href="alerts.html">Alerts</a>
              </li>
              <li>
                <a href="buttons.html">Buttons</a>
              </li>
              <li>
                <a href="badges.html">Badges</a>
              </li>
              <li>
                <a href="cards.html">Cards</a>
              </li>
              <li>
                <a href="custom-cards.html">Custom Cards</a>
              </li>
              <li>
                <a href="carousel.html">Carousel</a>
              </li>
              <li>
                <a href="icons.html">Icons</a>
              </li>

            </ul>
          </li>

        </ul>
      </div>
      <!-- Sidebar menu ends -->

    </nav>
    <!-- Sidebar wrapper end -->