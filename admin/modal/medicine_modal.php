<div class="modal fade" id="medicine" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="medicine">
                    Add Medicine
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" enctype="multipart/form-data" novalidate id="addMedicine">

                    <div class="mb-1 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Medicine Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="med_name" name="med_name" class="form-control" required>
                        </div>
                        <div class="invalid-feedback">
                           Please input Medicine name.
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Description</label>
                        <div class="col-sm-8">

                            <textarea class="form-control" name="description" id="description" cols="30" rows="3"></textarea>
                        </div>
                        <div class="invalid-feedback">
                           Please input atleast 2 words for description.
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Category</label>
                        <div class="col-sm-8">
                            <select id="Category" name="Category" class="form-select" id="select_box" style="width: 100%;">

                                <?php echo getdrugs(); ?>
                            </select>
                            <div class="invalid-feedback">
                           Please select category.
                        </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Supplier</label>
                        <div class="col-sm-8">
                            <input type="text" id="supplier" name="supplier" class="form-control" required>
                        </div>
                        <div class="invalid-feedback">
                           Please input supplier name.
                        </div>
                    </div>




                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Manufacturer</label>
                        <div class="col-sm-8">
                            <input type="text" id="manufacturer" name="manufacturer" class="form-control" required>
                        </div>
                        <div class="invalid-feedback">
                           Please input manufacturer name.
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Brand</label>
                        <div class="col-sm-8">
                            <input type="text" id="Brand" name="Brand" class="form-control" required>
                        </div>
                        <div class="invalid-feedback">
                           Please input Brand name.
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center ">Manufacturing Date</label>
                        <div class="col-sm-8">
                            <!-- <div class="input-group date" id="mandate" data-target-input="nearest" aria-autocomplete="off">
                                <input type="text" class="form-control  rounded-0  datepicker" name="mandate" />
                                <span class="input-group-text">
                                    <i class="icon-calendar"></i>
                                </span>

                            </div> -->
                            <div class="input-group date" id="man_date" data-target-input="nearest">
                                <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" data-target="#man_date" name="man_date" data-toggle="datetimepicker" autocomplete="off" />
                                <div class="input-group-append" data-target="#man_date" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>

                            </div>
                            <div class="invalid-feedback">
                           Please select  Manufacturing date.
                        </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Expiration Date</label>
                        <div class="col-sm-8">
                            <!-- <div class="input-group date" id="expdate" data-target-input="nearest" aria-autocomplete="off">
                                <input type="text" class="form-control  rounded-0  datepicker" name="expdate" />
                                <span class="input-group-text">
                                    <i class="icon-calendar"></i>
                                </span>

                            </div> -->
                            <div class="input-group date" id="exp_date" data-target-input="nearest">
                                <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" data-target="#exp_date" name="exp_date" data-toggle="datetimepicker" autocomplete="off" />
                                <div class="input-group-append" data-target="#exp_date" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>

                            </div>
                            <div class="invalid-feedback">
                           Please select  Expiration date.
                        </div>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn " data-bs-dismiss="modal">
                    Close
                </button>
                <button type="submit" id="save_meds" name="save_meds" class="btn btn-info">
                    Save
                </button>

            </div>
        </div>

        </form>
    </div>
</div>


<!-- ///////////////////////////////EDIT///////////////////////////// -->
<div class="modal fade" id="editModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModal">
                    Edit Medicine
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="controller/update_medicine.php">
                    <input type="hidden" id="med_id" name="medicineID">
                    <div class="mb-2 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Medicine Name</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Description</label>
                        <div class="col-sm-8">

                            <textarea class="form-control" name="des" id="des" cols="30" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Category</label>
                        <div class="col-sm-8">
                            <select id="Cat" name="Cat" class="form-select" id="select_box" style="width: 100%;">

                                <?php echo getdrugs(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Supplier</label>
                        <div class="col-sm-8">
                            <input type="text" id="supp" name="supp" class="form-control" required>
                        </div>
                    </div>





                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Manufacturer</label>
                        <div class="col-sm-8">
                            <input type="text" id="manuf" name="manuf" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Brand</label>
                        <div class="col-sm-8">
                            <input type="text" id="brand" name="brand" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center ">Manufacturing Date</label>
                        <div class="col-sm-8">
                            <!-- <div class="input-group date" id="mandate" data-target-input="nearest" aria-autocomplete="off">
                                <input type="text" class="form-control  rounded-0  datepicker" name="mandate" />
                                <span class="input-group-text">
                                    <i class="icon-calendar"></i>
                                </span>

                            </div> -->
                            <div class="input-group date" id="mandate" data-target-input="nearest">
                                <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" data-target="#mandate" name="mandate" data-toggle="datetimepicker" autocomplete="off" />
                                <div class="input-group-append" data-target="#mandate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="text" class="col-sm-3 col-form-label text-center">Expiration Date</label>
                        <div class="col-sm-8">
                            <!-- <div class="input-group date" id="expdate" data-target-input="nearest" aria-autocomplete="off">
                                <input type="text" class="form-control  rounded-0  datepicker" name="expdate" />
                                <span class="input-group-text">
                                    <i class="icon-calendar"></i>
                                </span>

                            </div> -->
                            <div class="input-group date" id="expdate" data-target-input="nearest">
                                <input type="text" class="form-control form-control-sm rounded-0 datetimepicker-input" data-target="#expdate" name="expdate" data-toggle="datetimepicker" autocomplete="off" />
                                <div class="input-group-append" data-target="#expdate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>

                            </div>
                        </div>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn " data-bs-dismiss="modal">
                    Close
                </button>
                <button type="submit" id="update_meds" name="update_meds" class="btn btn-info">
                    Update
                </button>

            </div>
        </div>

        </form>
    </div>
</div>

<!-- ////////////////////////////EDIT END ////////////////////////// -->