<div class="modal fade" id="add_doctor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="add_user">
                    Add Doctor
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" enctype="multipart/form-data">

                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="fname" id="fname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Middle Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="mname" name="mname">
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="lname" name="lname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Username</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="uname" name="uname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="password" class="col-sm-4 col-form-label text-center">Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="pass" name="pass" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Contact #</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="contact" name="contact" value="+639" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Address</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="Address" name="Address" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                    </div>

                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center"> Position Name </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="Position" name="Position" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Specialty</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="Specialty" name="Specialty" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Professional Type</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="Professional" name="Professional" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">LicenseNo</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="LicenseNo" name="LicenseNo" required>
                        </div>
                    </div>


                    <div class="mb-2 row">
                        <label for="text" class="col-sm-4 col-form-label text-center">Status</label>
                        <div class="col-sm-5">

                            <select name="status" class="form-select" id="status" name="status" required>
                                <?php echo getstatus(); ?>
                            </select>
                        </div>
                    </div>

                    <div class="mb-2 row">
                        <label for="formFile" class="col-sm-4 col-form-label text-center">Profile Picture</label>
                        <div class="col-sm-8 ">
                            <input class="form-control" type="file" id="profile" name="profile">
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn " data-bs-dismiss="modal">
                    Close
                </button>
                <button type="submit" id="save_doctor" name="save_doctor" class="btn btn-info">
                    Save
                </button>
                </form>
            </div>
        </div>


    </div>
</div>

<style>
    .doctorprofile {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ddd;
        object-fit: cover;
    }
</style>
<!-- <div class="modal fade" id="update_doctor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="add_user">Add Doctor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data">
                    <div class="mb-3 text-center">
                        <label for="Profile" style="cursor: pointer;">
                            <img src="profile.jpg" id="doctorprofile" class="doctorprofile" alt="Click to change the picture">
                        </label>
                        <input class="form-control" id="Profile" name="Profile" type="file" style="display: none;" onchange="previewImage();">
                    </div>
                    <input type="hidden" class="form-control" name="userid" id="userid">
                    <input type="hidden" class="form-control" name="persid" id="persid">
                    <div class="mb-2 row">
                        <label for="editfname" class="col-sm-4 col-form-label text-center">Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="fname" id="editfname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editmname" class="col-sm-4 col-form-label text-center">Middle Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editmname" name="mname">
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editlname" class="col-sm-4 col-form-label text-center">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editlname" name="lname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="edituname" class="col-sm-4 col-form-label text-center">Username</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edituname" name="uname" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editpass" class="col-sm-4 col-form-label text-center">Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="editpass" name="pass">
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editcontact" class="col-sm-4 col-form-label text-center">Contact #</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editcontact" name="contact" value="+639" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editAddress" class="col-sm-4 col-form-label text-center">Address</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editAddress" name="Address" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editemail" class="col-sm-4 col-form-label text-center">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="editemail" name="email" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editPosition" class="col-sm-4 col-form-label text-center">Position Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editPosition" name="Position" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editSpecialty" class="col-sm-4 col-form-label text-center">Specialty</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editSpecialty" name="Specialty" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editProfessional" class="col-sm-4 col-form-label text-center">Professional Type</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editProfessional" name="Professional" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editLicenseNo" class="col-sm-4 col-form-label text-center">License No</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editLicenseNo" name="LicenseNo" required>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="editstatus" class="col-sm-4 col-form-label text-center">Status</label>
                        <div class="col-sm-5">
                            <select name="status" class="form-select" id="editstatus" required>
                                <?php echo getstatus(); ?>
                            </select>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
                <button type="submit" id="update_doctor" name="update_doctor" class="btn btn-info">Update</button>
                </form>
            </div>
        </div>
    </div>
</div> -->

<div class="modal fade" id="update_doctor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Doctor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="userid" id="userid">
                    <input type="hidden" name="persid" id="persid">

                    <div class="mb-3 text-center">
                        <label for="Profile" style="cursor: pointer;">
                            <img src="profile.jpg" id="doctorprofile" class="doctorprofile" alt="Click to change the picture">
                        </label>
                        <input class="form-control" id="Profile" name="Profile" type="file" style="display: none;" onchange="previewImage();">
                    </div>

                    <div class="mb-3 row">
                        <label for="editfname" class="col-sm-4 col-form-label text-center">First Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="fname" id="editfname" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editmname" class="col-sm-4 col-form-label text-center">Middle Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editmname" name="mname">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editlname" class="col-sm-4 col-form-label text-center">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editlname" name="lname" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="edituname" class="col-sm-4 col-form-label text-center">Username</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edituname" name="uname" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editpass" class="col-sm-4 col-form-label text-center">Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="editpass" name="pass">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editcontact" class="col-sm-4 col-form-label text-center">Contact #</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editcontact" name="contact" value="+639" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAddress" class="col-sm-4 col-form-label text-center">Address</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editAddress" name="Address" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editemail" class="col-sm-4 col-form-label text-center">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="editemail" name="email" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editPosition" class="col-sm-4 col-form-label text-center">Position Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editPosition" name="Position" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editSpecialty" class="col-sm-4 col-form-label text-center">Specialty</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editSpecialty" name="Specialty" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editProfessional" class="col-sm-4 col-form-label text-center">Professional Type</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editProfessional" name="Professional" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editLicenseNo" class="col-sm-4 col-form-label text-center">License No</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editLicenseNo" name="LicenseNo" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editstatus" class="col-sm-4 col-form-label text-center">Status</label>
                        <div class="col-sm-5">
                            <select name="status" class="form-select" id="editstatus" required>
                                <?php echo getstatus(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
                    <button type="submit" id="update_doctor" name="update_doctor" class="btn btn-info">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>




<div class="modal fade" id="view_doctor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="view_user">Doctor Information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-3">
                    <img src="profile.jpg" id="view_profile_img" class="img-thumbnail rounded-circle p-0 border " alt="User Image" style="width: 200px;height:200px;">
                </div>
                <ul class="list-unstyled">
                    <li><strong>Name:</strong> <span id="view_name"></span></li>     
                    <li><strong>Contact #:</strong> <span id="view_contac"></span></li>
                    <li><strong>Email:</strong> <span id="view_Email"></span></li>
                    <li><strong>Address:</strong> <span id="view_address"></span></li>
                    <li><strong>License no.:</strong> <span id="licenseno"></span></li>
                    <li><strong>Status:</strong> <span id="view_status"></span></li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button " class="btn btn-primary btn-sm" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>



<div class="modal fade" id="delete_doctor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST" action="controller/delete_doctor.php">
                    <input type="hidden" id="deleteid" name="deleteid">

                    <h4>Are you sure you want to delete this doctor?</h4>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-sm" data-bs-dismiss="modal">Close</button>

                        <button type="submit" class="btn btn-primary btn-sm">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>