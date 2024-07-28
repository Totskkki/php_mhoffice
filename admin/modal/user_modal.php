<div class="modal fade" id="add_user" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="add_user">
                    Add User
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" enctype="multipart/form-data">

                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="fname" name="fname" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Middle Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="mname" name="mname" class="form-control" >
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="lname" name="lname" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Username</label>
                        <div class="col-sm-8">
                            <input type="text" id="uname" name="uname" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password" class="col-sm-3 col-form-label text-center">Password</label>
                        <div class="col-sm-8">
                            <input type="password" id="pass" name="pass" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Contact #</label>
                        <div class="col-sm-8">
                            <input type="text" id="contact" name="contact" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Email</label>
                        <div class="col-sm-8">
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Address</label>
                        <div class="col-sm-8">
                            <input type="text" id="Address" name="Address" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Role</label>
                        <div class="col-sm-5">

                            <select name="Role" id="Role" class="form-select" required>
                                <?php echo getrole(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Status</label>
                        <div class="col-sm-5">

                            <select name="status" id="status" class="form-select" required>
                                <?php echo getstatus(); ?>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="formFile" class="col-sm-3 col-form-label text-center">Profile Picture</label>
                        <div class="col-sm-8 ">
                            <input class="form-control" id="profile" name="profile" type="file">
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn " data-bs-dismiss="modal">
                    Close
                </button>
                <button type="submit" id="save_user" name="save_user" class="btn btn-info">
                    Save
                </button>

            </div>
        </div>
        <?php require 'controller/add_user.php'; ?>
        </form>
    </div>
</div>
<style>
    .profile-img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ddd;
        object-fit: cover;
    }
</style> <!-- =======================edit modal================ -->
<div class="modal fade" id="edit_user" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edit_user">
                    Edit User
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" enctype="multipart/form-data">
                    <!-- <input type="hidden" id="existing_image" name="existing_image" value=""> -->
                    <input type="hidden" name="existing_image" id="existing_image">

                    <div class="mb-3 text-center">
                        <label for="Profile" style="cursor: pointer;">
                            <img src="profile.jpg" id="profile_img" class="profile-img" alt="Click to change the picture">
                        </label>
                        <input class="form-control" id="Profile" name="Profile" type="file" style="display: none;" onchange="previewImage();">
                    </div>
                    <input type="hidden" id="user" name="user_id">

                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Middle Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="mid" name="mid" class="form-control">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="last_name" name="last_name" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Username</label>
                        <div class="col-sm-8">
                            <input type="text" id="u_name" name="u_name" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password" class="col-sm-3 col-form-label text-center">Password</label>
                        <div class="col-sm-8">
                            <input type="password" id="passw" name="passw" class="form-control">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Contact #</label>
                        <div class="col-sm-8">
                            <input type="text" id="contac" name="contac" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Email</label>
                        <div class="col-sm-8">
                            <input type="email" id="Email" name="Email" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Address</label>
                        <div class="col-sm-8">
                            <input type="text" id="address" name="address" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Role</label>
                        <div class="col-sm-5">

                            <select name="role" id="role" class="form-select" required>
                                <option selected id="role_val"></option>
                                <option value="BHW">BHW</option>
                                <option value="RHU">RHU</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Status</label>
                        <div class="col-sm-5">

                            <select name="Status" id="Status" class="form-select" required>
                                <option selected id="Status_val"></option>
                                <option value="active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn " data-bs-dismiss="modal">
                    Close
                </button>
                <button type="submit" id="update_user" name="update_user" class="btn btn-info">
                    Update
                </button>

            </div>
        </div>

        </form>
    </div>
</div>




<div class="modal fade" id="view_user" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="view_user">User Information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-3">
                    <img src="profile.jpg" id="view_profile_img" class="img-thumbnail rounded-circle p-0 border " alt="User Image" style="width: 200px;height:200px;">
                </div>
                <ul class="list-unstyled">
                    <li><strong>Name:</strong> <span id="view_name"></span></li>

                    <li><strong>Username:</strong> <span id="view_u_name"></span></li>
                    <li><strong>Contact #:</strong> <span id="view_contac"></span></li>
                    <li><strong>Email:</strong> <span id="view_Email"></span></li>
                    <li><strong>Address:</strong> <span id="view_address"></span></li>
                    <li><strong>Role:</strong> <span id="view_role"></span></li>
                    <li><strong>Status:</strong> <span id="view_status"></span></li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button " class="btn btn-primary btn-sm" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="POST" action="controller/delete_user.php">
                    <input type="hidden" id="deleteid" name="deleteid">

                    <h4>Are you sure you want to delete User?</h4>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-sm" data-bs-dismiss="modal">Close</button>

                        <button type="submit" class="btn btn-primary btn-sm">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>