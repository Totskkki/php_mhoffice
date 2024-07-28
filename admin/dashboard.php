<?php
include 'config/connection.php';
error_reporting(0);
include 'common_service/common_functions.php';
include('config/checklogin.php');
check_login();



$date = date('Y-m-d');

$year =  date('Y');
$month =  date('m');

$queryToday = "SELECT count(*) as `today` 
  from `tbl_patient_visits` 
  where `visit_date` = '$date';";

$queryWeek = "SELECT count(*) as `week` 
  from `tbl_patient_visits` 
  where YEARWEEK(`visit_date`) = YEARWEEK('$date');";

$queryYear = "SELECT count(*) as `year` 
  from `tbl_patient_visits` 
  where YEAR(`visit_date`) = YEAR('$date');";

$queryMonth = "SELECT count(*) as `month` 
  from `tbl_patient_visits` 
  where YEAR(`visit_date`) = $year and 
  MONTH(`visit_date`) = $month;";


$todaysCount = 0;
$currentWeekCount = 0;
$currentMonthCount = 0;
$currentYearCount = 0;


try {

	$stmtToday = $con->prepare($queryToday);
	$stmtToday->execute();
	$r = $stmtToday->fetch(PDO::FETCH_ASSOC);
	$todaysCount = $r['today'];

	$stmtWeek = $con->prepare($queryWeek);
	$stmtWeek->execute();
	$r = $stmtWeek->fetch(PDO::FETCH_ASSOC);
	$currentWeekCount = $r['week'];

	$stmtYear = $con->prepare($queryYear);
	$stmtYear->execute();
	$r = $stmtYear->fetch(PDO::FETCH_ASSOC);
	$currentYearCount = $r['year'];

	$stmtMonth = $con->prepare($queryMonth);
	$stmtMonth->execute();
	$r = $stmtMonth->fetch(PDO::FETCH_ASSOC);
	$currentMonthCount = $r['month'];
} catch (PDOException $ex) {
	echo $ex->getMessage();
	echo $ex->getTraceAsString();
	exit;
}
?>


<!DOCTYPE html>
<html lang="en">


<head>
	<?php include './config/site_css_links.php'; ?>

	<?php include './config/data_tables_css.php'; ?>
	<title>Patients - Kalilintad Lutayan-Municipal Health Office</title>
	<style>
		.statistics .stat-icon {
			width: 36px;
			height: 36px;
			display: flex;
			align-items: center;
			justify-content: center;
			color: #fff;
			background: #0080ff;
			margin: 0 10px 0 0;
			-webkit-border-radius: 50px;
			-moz-border-radius: 50px;
			border-radius: 50px;
		}

		.badge {
			padding: 5px 10px;
			color: white;
			border-radius: 5px;
		}

		.badge-success {
			background-color: green;
		}

		.badge-danger {
			background-color: red;
		}
		.scroll300 {
    max-height: 300px; /* Adjust height as needed */
    overflow-y: auto; /* Enables vertical scrolling */
    overflow-x: hidden; /* Hides horizontal scrolling */
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

									</li>
								</ol>
								<!-- Breadcrumb end -->
								<h2 class="mb-2"></h2>
								<h6 class="mb-4 fw-light">
									Municipal Health Center
								</h6>
							</div>
						</div>
						<!-- Row end -->
						<div class="row">
							<div class="col-xxl-3 col-sm-6 col-12">
								<div class="card mb-4 border-0 bg-violet">
									<div class="card-body text-white">
										<div class="d-flex justify-content-center text-center">
											<div class="position-absolute top-0 start-0 p-3">
												<i class="icon-face fs-1 lh-1"></i>
											</div>
											<div class="py-3">
												<h1><?php echo $todaysCount; ?></h1>
												<h6>Today's Patients</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="card mb-4 border-0 bg-warning">
									<div class="card-body text-white">
										<div class="d-flex justify-content-center text-center">
											<div class="position-absolute top-0 start-0 p-3">
												<i class="icon-local_hospital fs-1 lh-1"></i>
											</div>
											<div class="py-3">
												<?php


												$query = "SELECT count(*)as med FROM tbl_medicines ";
												$stmt = $con->prepare($query);
												$stmt->execute();
												$count = $stmt->fetchColumn();

												?>
												<h1><?php echo $count; ?></h1>
												<h6>Medicines</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<?php
							$query = "SELECT user.*, personnel.*, position.*, doctor.* ,concat(first_name, ' ' ,middlename, ' ', lastname) as name
							FROM `tbl_users` AS user
							LEFT JOIN `tbl_personnel` AS personnel ON user.personnel_id = personnel.personnel_id
							LEFT JOIN `tbl_position` AS position ON user.position_id = position.position_id
							LEFT JOIN `tbl_doctor_schedule` AS doctor ON user.userID = doctor.userID
							WHERE user.UserTYpe = 'Doctor' AND doctor.day_of_week IS NOT NULL";

							$stmtUsers = $con->prepare($query);
							$stmtUsers->execute();
							$results = $stmtUsers->fetchAll(PDO::FETCH_ASSOC);
							?>

							<div class="col-xxl-4 col-sm-6">
								<div class="card mb-4">
									<div class="card-header">
										<h5 class="card-title">Doctor's Schedule</h5>
									</div>
									<div class="card-body">
										<?php if (!empty($results)) { ?>
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
																<?php foreach ($results as $row) { ?>
																	<li style="padding: 1px; border-bottom: 1px solid #ccc;">
																	<li>
																		<span class="stat-icon">
																			<i class="icon-calendar"></i>
																		</span>
																		Doctor's Name:&nbsp; <strong><?php echo htmlspecialchars($row['name']); ?></strong>
																	</li>
																	<li>
																		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
																		<strong>Day:&nbsp; </strong><?php echo htmlspecialchars($row['day_of_week']); ?>
																	</li>
																	<li>
																		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
																		<strong>Time:&nbsp;</strong><?php echo date('h:i A', strtotime(htmlspecialchars($row['start_time']))) . ' - ' . date('h:i A', strtotime(htmlspecialchars($row['end_time']))); ?>
																	</li>
																	<li>
																		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
																		<strong>Status: &nbsp;</strong>
																		<?php if ($row['is_available']) : ?>
																			<span class="badge badge-success">Available</span>
																		<?php else : ?>
																			<span class="badge badge-danger">Not Available</span>
																		<?php endif; ?>
																	</li>
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
											<p>No doctors' schedules available.</p>
										<?php } ?>
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
						<!-- Row start -->
						<div class="row">
							<div class="col-7">
								<div class="card mb-4">
									<div class="card-header">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title m-0">Statistic Reports</h5>
											<form class="form-inline">
												<div class="form-group mb-0">
													<label for="select_year">Select Year:</label>
													<select class="form-control form-control-sm" id="select_year">
														<?php for ($i = 2024; $i <= 2050; $i++) :
															$selected = ($i == $year) ? 'selected' : '';
															echo "<option value='$i' $selected>$i</option>";
														endfor; ?>
													</select>
												</div>
											</form>
										</div>
									</div>
									<div class="card-body">
										<div id="barGraph"></div>
									</div>
								</div>
							</div>
						
						
						<?php


							// Fetch audit log data
							$auditQuery = "SELECT al.*, concat(p.first_name) as name
							FROM tbl_audit_log al
							JOIN tbl_personnel p ON al.user_id = p.personnel_id
							ORDER BY al.timestamp DESC";

							$auditStmt = $con->prepare($auditQuery);
							$auditStmt->execute();
							$auditLogs = $auditStmt->fetchAll(PDO::FETCH_ASSOC);

							// Assuming you have a way to get the current year for the reports
							$year = date('Y'); // Adjust as needed
							?>
							<!-- Row start -->

							<div class="col-xxl-4 col-sm-6">
								<div class="card mb-4">
									<div class="card-header">
										<h5 class="card-title">Activity</h5>
									</div>
									<div class="card-body">
										<div class="scroll300">
											<div class="activity-feed">
												<?php foreach ($auditLogs as $log) : ?>
													<div class="feed-item">
														<span class="feed-date pb-1" data-bs-toggle="tooltip" data-bs-title="<?php echo htmlspecialchars($log['timestamp']); ?>">
															<?php
															$timestamp = new DateTime($log['timestamp']);
															echo $timestamp->format('F j, Y g:i A');
															?>
														</span>
														<div class="mb-1">
															<a href="#" class="text-primary">User <?php echo htmlspecialchars($log['name']); ?></a>
															- <?php echo htmlspecialchars($log['action']); ?>.
														</div>
														<div class="mb-1">
															Table: <a href="#" class="text-primary"><?php echo htmlspecialchars($log['table_name']); ?></a>
														</div>
														<div class="text-dark">
															Record ID: <?php echo htmlspecialchars($log['record_id']); ?>
														</div>
														<div class="mt-2">
															<strong>Old Value:</strong>
															<pre><?php echo htmlspecialchars($log['old_value']); ?></pre>
															<strong>New Value:</strong>
															<pre><?php echo htmlspecialchars($log['new_value']); ?></pre>
														</div>
													</div>
												<?php endforeach; ?>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Row end -->

						</div>


						<!-- Row end -->



						<!-- Row start for Audit Log -->






					</div>
					<!-- Container ends -->

				</div>
				<!-- App body ends -->



				<!-- App footer start -->
				<?php include './config/footer.php'; ?>

				<!-- App footer end -->
				<!-- Apex Charts -->
				<script src="assets/vendor/apex/apexcharts.min.js"></script>

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


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var chart;

			function fetchData(year) {
				fetch(`ajax/fetch_prenatal_birthing.php?year=${year}`)
					.then(response => response.json())
					.then(data => {
						var options = {
							chart: {
								height: 300,
								type: 'bar',
								toolbar: {
									show: false
								}
							},
							series: [{
								name: 'Birthing',
								data: data.birthing
							}, {
								name: 'Prenatal',
								data: data.prenatal
							}, {
								name: 'Animal bite',
								data: data.animalBites
							}, {
								name: 'Immunization & Vaccination',
								data: data.immunizations
							}],
							xaxis: {
								categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
							},
							yaxis: {
								labels: {
									show: true,
								},
							},
							plotOptions: {
								bar: {
									horizontal: false,
									columnWidth: '100%',
								},
							},
							dataLabels: {
								enabled: false
							},
							stroke: {
								show: true,
								width: 2,
								colors: ['transparent']
							},
							tooltip: {
								enabled: true
							}
						};


						if (chart) {
							chart.updateOptions(options);
						} else {
							chart = new ApexCharts(document.querySelector("#barGraph"), options);
							chart.render();
						}
					});
			}


			fetchData(new Date().getFullYear());


			document.getElementById('select_year').addEventListener('change', function() {
				var selectedYear = this.value;
				fetchData(selectedYear);
			});
		});
	</script>

</body>



</html>