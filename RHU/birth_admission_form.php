<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Labor Admission Chart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group input[type="checkbox"] {
            width: auto;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
        }
        .form-row .form-group {
            flex: 1;
            margin-right: 10px;
        }
        .form-row .form-group:last-child {
            margin-right: 0;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Labor Admission Chart</h2>
    <form>
        <div class="form-group">
            <label for="philhealthNo">PhilHealth No.</label>
            <input type="text" id="philhealthNo" name="philhealthNo">
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="patientName">Patient's Name</label>
                <input type="text" id="patientName" name="patientName">
            </div>
            <div class="form-group">
                <label for="caseNo">Case No.</label>
                <input type="text" id="caseNo" name="caseNo">
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="lmp">LMP</label>
                <input type="date" id="lmp" name="lmp">
            </div>
            <div class="form-group">
                <label for="edc">EDC</label>
                <input type="date" id="edc" name="edc">
            </div>
            <div class="form-group">
                <label for="aog">AOG</label>
                <input type="text" id="aog" name="aog">
            </div>
            <div class="form-group">
                <label for="obScore">OB Score: G</label>
                <input type="text" id="obScore" name="obScore">
            </div>
            <div class="form-group">
                <label for="bloodType">Blood Type</label>
                <input type="text" id="bloodType" name="bloodType">
            </div>
        </div>
        <div class="form-group">
            <label for="chiefComplaint">Chief Complaint and Brief History</label>
            <textarea id="chiefComplaint" name="chiefComplaint" rows="4"></textarea>
        </div>

        <h3>Past Medical History</h3>
        <div class="form-group">
            <label>
                <input type="checkbox" name="pmh_heartDisease"> Heart Disease
            </label>
            <label>
                <input type="checkbox" name="pmh_pulmonaryTb"> Pulmonary TB
            </label>
            <label>
                <input type="checkbox" name="pmh_hivAids"> HIV/AIDS
            </label>
            <label>
                <input type="checkbox" name="pmh_syphilis"> Syphilis
            </label>
            <label>
                <input type="checkbox" name="pmh_gonorrhea"> Gonorrhea
            </label>
            <label>
                <input type="checkbox" name="pmh_otherSti"> Other STI
            </label>
            <label>
                <input type="checkbox" name="pmh_hypertension"> Hypertension
            </label>
            <label>
                <input type="checkbox" name="pmh_hepatitis"> Hepatitis
            </label>
            <label>
                <input type="checkbox" name="pmh_asthma"> Asthma
            </label>
            <label>
                <input type="checkbox" name="pmh_cancer"> Cancer
            </label>
            <label>
                <input type="checkbox" name="pmh_torchInfection"> Torch Infection
            </label>
            <label>
                <input type="checkbox" name="pmh_renalDisease"> Renal Disease
            </label>
            <label>
                <input type="checkbox" name="pmh_thyroidDo"> Thyroid D/O
            </label>
            <label>
                <input type="checkbox" name="pmh_seizureDo"> Seizure D/O
            </label>
            <label>
                <input type="checkbox" name="pmh_others"> OTHERS
            </label>
            <label>
                <input type="checkbox" name="pmh_allergies"> Allergies
            </label>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="pastOperations">Past Operations</label>
                <input type="text" id="pastOperations" name="pastOperations">
            </div>
            <div class="form-group">
                <label for="medication">Medication</label>
                <input type="text" id="medication" name="medication">
            </div>
            <div class="form-group">
                <label for="pastAdmission">Past Admission</label>
                <input type="text" id="pastAdmission" name="pastAdmission">
            </div>
        </div>

        <h3>Family History</h3>
        <div class="form-group">
            <label>
                <input type="checkbox" name="fh_heartDisease"> Heart Disease
            </label>
            <label>
                <input type="checkbox" name="fh_hypertension"> Hypertension
            </label>
            <label>
                <input type="checkbox" name="fh_diabetes"> Diabetes
            </label>
            <label>
                <input type="checkbox" name="fh_renalDisease"> Renal Disease
            </label>
            <label>
                <input type="checkbox" name="fh_asthma"> Asthma
            </label>
            <label>
                <input type="checkbox" name="fh_multifetalPregnancy"> Multifetal Pregnancy
            </label>
            <label>
                <input type="checkbox" name="fh_cancer"> Cancer
            </label>
            <label>
                <input type="checkbox" name="fh_others"> OTHERS
            </label>
        </div>

        <h3>P/S History</h3>
        <div class="form-row">
            <div class="form-group">
                <label for="educationalAttainment">Educational Attainment</label>
                <input type="text" id="educationalAttainment" name="educationalAttainment">
            </div>
            <div class="form-group">
                <label for="occupation">Occupation</label>
                <input type="text" id="occupation" name="occupation">
            </div>
        </div>
        <div class="form-group">
            <label for="civilStatus">Civil Status</label>
            <input type="text" id="civilStatus" name="civilStatus">
        </div>
        <div class="form-group">
            <label>
                <input type="checkbox" name="multipleSexPartners"> Multiple Sex Partners
            </label>
            <label>
                <input type="checkbox" name="alcoholIntake"> Alcohol Intake
            </label>
            <label>
                <input type="checkbox" name="smoking"> Smoking
            </label>
        </div>

        <h3>GYNE History</h3>
        <div class="form-group">
            <label for="menarche">Menarche</label>
            <input type="text" id="menarche" name="menarche">
        </div>
        <div class="form-group">
            <label for="regular">Regular?</label>
            <label>
                <input type="radio" name="regular" value="yes"> Yes
            </label>
            <label>
                <input type="radio" name="regular" value="no"> No
            </label>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="duration">Duration (Days)</label>
                <input type="text" id="duration" name="duration">
            </div>
            <div class="form-group">
                <label for="remarks">Remarks</label>
                <input type="text" id="remarks" name="remarks">
            </div>
        </div>
        <div class="form-group">
            <label for="flow">Flow</label>
            <label>
                <input type="radio" name="flow" value="scanty"> Scanty
            </label>
            <label>
                <input type="radio" name="flow" value="moderate"> Moderate
            </label>
            <label>
                <input type="radio" name="flow" value="profuse"> Profuse
            </label>
        </div>
        <div class="form-group">
            <label for="dysmenorrhea">Dysmenorrhea?</label>
            <label>
                <input type="radio" name="dysmenorrhea" value="yes"> Yes
            </label>
            <label>
                <input type="radio" name="dysmenorrhea" value="no"> No
            </label>
        </div>
        <div class="form-group">
            <label for="ageFirstSexualContact">Age of First Sexual Contact</label>
            <input type="text" id="ageFirstSexualContact" name="ageFirstSexualContact">
        </div>

        <h3>Present Pregnancy</h3>
        <div class="form-group">
            <label for="antepartalCare">Antepartal Care</label>
            <label>
                <input type="radio" name="antepartalCare" value="opd"> OPD
            </label>
            <label>
                <input type="radio" name="antepartalCare" value="healthCenter"> Health Center
            </label>
            <label>
                <input type="radio" name="antepartalCare" value="privateMd"> Private MD
            </label>
            <label>
                <input type="radio" name="antepartalCare" value="none"> None
            </label>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="startOfVisit">Start of Visit</label>
                <input type="date" id="startOfVisit" name="startOfVisit">
            </div>
            <div class="form-group">
                <label for="aog">AOG</label>
                <input type="text" id="aog" name="aog">
            </div>
            <div class="form-group">
                <label for="tt">TT</label>
                <input type="text" id="tt" name="tt">
            </div>
        </div>
        <div class="form-group">
            <label for="feSo4">FeSO4</label>
            <label>
                <input type="radio" name="feSo4" value="yes"> Yes
            </label>
            <label>
                <input type="radio" name="feSo4" value="no"> No
            </label>
        </div>
        <div class="form-group">
            <label for="ogct">50g OGCT</label>
            <input type="text" id="ogct" name="ogct">
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="illness">Illness</label>
                <input type="text" id="illness" name="illness">
            </div>
            <div class="form-group">
                <label for="totVisit">TOT Visit</label>
                <input type="text" id="totVisit" name="totVisit">
            </div>
            <div class="form-group">
                <label for="others">Others</label>
                <input type="text" id="others" name="others">
            </div>
        </div>

        <h3>Obstetrical History</h3>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>NO.</th>
                        <th>YEAR</th>
                        <th>PLACE OF CONFINEMENT</th>
                        <th>AOG</th>
                        <th>BW</th>
                        <th>MANNER OF DELIVERY</th>
                        <th>COMPLICATION / REMARKS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="ob_no_1"></td>
                        <td><input type="text" name="ob_year_1"></td>
                        <td><input type="text" name="ob_place_1"></td>
                        <td><input type="text" name="ob_aog_1"></td>
                        <td><input type="text" name="ob_bw_1"></td>
                        <td><input type="text" name="ob_delivery_1"></td>
                        <td><input type="text" name="ob_remarks_1"></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="ob_no_2"></td>
                        <td><input type="text" name="ob_year_2"></td>
                        <td><input type="text" name="ob_place_2"></td>
                        <td><input type="text" name="ob_aog_2"></td>
                        <td><input type="text" name="ob_bw_2"></td>
                        <td><input type="text" name="ob_delivery_2"></td>
                        <td><input type="text" name="ob_remarks_2"></td>
                    </tr>
                    <!-- Additional rows can be added similarly -->
                </tbody>
            </table>
        </div>

        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>
</div>

</body>
</html>
