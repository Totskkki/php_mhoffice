<?php
include './config/connection.php';


include './config/checklogin.php';
check_login();
// echo 'connected';
$date = date('Y-m-d');

$year =  date('Y');
$month =  date('m');

$queryToday = "SELECT count(*) as `today` 
  from `patient_visits` 
  where `visit_date` = '$date';";

$queryWeek = "SELECT count(*) as `week` 
  from `patient_visits` 
  where YEARWEEK(`visit_date`) = YEARWEEK('$date');";

$queryYear = "SELECT count(*) as `year` 
  from `patient_visits` 
  where YEAR(`visit_date`) = YEAR('$date');";

$queryMonth = "SELECT count(*) as `month` 
  from `patient_visits` 
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
					<h2 class="mb-2">Dashboard</h2>
					<h6 class="mb-4 fw-light">

					</h6>
				</div>
			</div>
			<!-- Row end -->

			<!-- Row start -->
			<div class="row">
				<div class="col-xxl-3 col-sm-6 col-12">
					<div class="card mb-4 border-0 bg-violet">
						<div class="card-body text-white">
							<div class="d-flex align-items-center text-center">
								<div class="p-3">
									<i class="icon-face fs-1 lh-1"></i>
								</div>
								<div class="py-3">
									<h1><?php echo $todaysCount; ?></h1>
									<h6>Today's Patients</h6>
								</div>
								<span class="badge bg-violet-light position-absolute top-0 end-0 m-3"><i class="icon-trending-up"></i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xxl-3 col-sm-6 col-12">
					<div class="card mb-4 border-0 bg-purple">
						<div class="card-body text-white">
							<div class="d-flex align-items-center text-center">
								<div class="p-3">
									<i class="icon-shopping-bag fs-1 lh-1"></i>
								</div>
								<div class="py-3">
									<h1><?php echo $currentWeekCount; ?></h1>
									<h6>Current Week</h6>
								</div>
								<span class="badge bg-purple-light position-absolute top-0 end-0 m-3"><i class="icon-trending-up"></i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xxl-3 col-sm-6 col-12">
					<div class="card mb-4 border-0 bg-danger">
						<div class="card-body text-white">
							<div class="d-flex align-items-center text-center">
								<div class="p-3">
									<i class="icon-shopping-cart fs-1 lh-1"></i>
								</div>
								<div class="py-3">
									<h1><?php echo $currentMonthCount; ?></h1>
									<h6>Current Month</h6>
								</div>
								<span class="badge bg-danger-light position-absolute top-0 end-0 m-3"><i class="icon-trending-up"></i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xxl-3 col-sm-6 col-12">
					<div class="card mb-4 border-0 bg-warning">
						<div class="card-body text-white">
							<div class="d-flex align-items-center text-center">
								<div class="p-3">
									<i class="icon-twitch fs-1 lh-1"></i>
								</div>
								<div class="py-3">
									<h1><?php echo $currentYearCount; ?></h1>
									<h6>Next Visit</h6>
								</div>
								<span class="badge bg-warning-light position-absolute top-0 end-0 m-3"><i class="icon-trending-down"></i></span>
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


	<?php
	include './config/footer.php';

	$message = '';
	if (isset($_GET['message'])) {
		$message = $_GET['message'];
	}
	?>

	<script>

        
      showMenuSelected("#mnu_dashboard", "#mnu_dashboard");

      var message = '<?php echo $message; ?>';

      if (message !== '') {
        showCustomMessage(message);
      }
    </script>

	