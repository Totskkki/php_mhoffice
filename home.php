<?php
include './config/connection.php';

include 'common_service/common_functions.php';
include('config/checklogin.php');
check_login();


$userID = $_SESSION['user_id'];
$userType = $_SESSION['user_type'];

if ($userType == 'BHW') {
    try {
        $stmt = $con->prepare("SELECT home_img FROM tbl_user_page WHERE userID = :userID");
        $stmt->bindParam(':userID', $userID, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $homeImage = $result['home_img'] ?? 'default.jpg'; 
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        $homeImage = 'default.jpg'; 
    }
} else {
    $homeImage = 'default.jpg';  
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
									Barangay Health Center
								</h6>
							</div>
						</div>
						<!-- Row end -->
						<!-- Row start -->
						<div class="row">
							<div class="col-8">
								<div class="card mb-4">
									<div class="card-header">
										<h5 class="card-title"></h5>
									</div>
									<div class="card-body">
										<!-- Your code goes here -->

											

										<img src="logo/<?php echo htmlspecialchars($homeImage); ?>" style="height: 40%; width: 100%" alt="Home Image">

										
									</div>



								</div>
							</div>
							<?php
							$query = "SELECT `announceID`, `date`, `title`, `details` FROM `tbl_announcements` ORDER BY `date` ASC";
							$stmt = $con->prepare($query);
							$stmt->execute();
							$events = $stmt->fetchAll(PDO::FETCH_ASSOC);
							?>

							<div class="col-xxl-4 col-sm-6">
								<div class="card mb-4">
									<div class="card-header">
										<h5 class="card-title">Events</h5>
									</div>
									<div class="card-body">
										<?php if (!empty($events)) { ?>
											<div class="scroll300 os-host os-theme-dark os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
												<div class="os-resize-observer-host observed">
													<div class="os-resize-observer" style="left: 0px; right: auto;"></div>
												</div>
												<div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
													<div class="os-resize-observer"></div>
												</div>
												<div class="os-content-glue" style="margin: 0px; width: 301px; height: 299px;"></div>
												<div class="os-padding">
													<div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;">
														<div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
															<ul class="statistics m-0 p-0">
																<?php foreach ($events as $event) { ?>
																	<li>
																		<span class="stat-icon">
																			<i class="icon-calendar"></i>
																		</span>
																		<?php echo htmlspecialchars($event['title']); ?> - <?php echo date('F Y', strtotime($event['date'])); ?>
																	</li>
																<?php } ?>
															</ul>
														</div>
													</div>
												</div>
												<div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
													<div class="os-scrollbar-track os-scrollbar-track-off">
														<div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div>
													</div>
												</div>
												<div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
													<div class="os-scrollbar-track os-scrollbar-track-off">
														<div class="os-scrollbar-handle" style="height: 49.3421%; transform: translate(0px, 0px);"></div>
													</div>
												</div>
												<div class="os-scrollbar-corner"></div>
											</div>
										<?php } else { ?>
											<p>No announcements available.</p>
										<?php } ?>
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




</body>



</html>