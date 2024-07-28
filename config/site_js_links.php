<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>

<!-- 
<script src="dist/js/jquery_confirm/jquery-confirm.js"></script> -->

<!-- Custom JS files -->
<script src="assets/js/custom.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js"></script>

<script src="assets/js/jquery-confirm.min.js"></script>





<script src="assets/js/common_javascript_functions.js"></script>

<script src="plugins/sweetalert2/sweetalert2.min.js"></script>

<script src="assets/js/sweetalert.min.js"></script>


<script>
        // Create a Swal mixin for toast-style alerts
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            customClass: {
                popup: 'toast-popup-class',
                title: 'toast-title-class'
            }
        });

        $(document).ready(function() {
            <?php
            if (isset($_SESSION['status']) && $_SESSION['status'] != '') {
            ?>
                Toast.fire({
                    icon: '<?php echo $_SESSION['status_code']; ?>',
                    title: '<?php echo $_SESSION['status']; ?>'
                });
            <?php
                unset($_SESSION['status']);
                unset($_SESSION['status_code']);
            }
            ?>
        });
    </script>
