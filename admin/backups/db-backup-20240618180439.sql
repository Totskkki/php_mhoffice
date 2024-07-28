DROP TABLE IF EXISTS tbl_animal_bite_care;

CREATE TABLE `tbl_animal_bite_care` (
  `animal_biteID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `med_history` text DEFAULT NULL,
  `bleeding` varchar(20) NOT NULL,
  `cpi_month` varchar(20) DEFAULT NULL,
  `cpi_year` int(11) DEFAULT NULL,
  `animal_type` varchar(255) DEFAULT NULL,
  `date_bite` date DEFAULT NULL,
  `Place` varchar(255) DEFAULT NULL,
  `Type_bite` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `pet_vaccinated` varchar(255) DEFAULT NULL,
  `animal_status` varchar(255) DEFAULT NULL,
  `site_exposure` varchar(255) DEFAULT NULL,
  `wound` varchar(20) DEFAULT NULL,
  `washed` varchar(20) DEFAULT NULL,
  `soap` varchar(20) DEFAULT NULL,
  `Tandok` varchar(20) DEFAULT NULL,
  `Applied` varchar(20) DEFAULT NULL,
  `Tetanus` varchar(20) DEFAULT NULL,
  `vac_date` date DEFAULT NULL,
  `vaccine` varchar(255) DEFAULT NULL,
  `category_exposure` varchar(255) DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`animal_biteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_animal_bite_vaccination;

CREATE TABLE `tbl_animal_bite_vaccination` (
  `animal_bite_vacID` int(11) NOT NULL AUTO_INCREMENT,
  `vaccination_name` varchar(100) NOT NULL,
  `vaccination_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `dose_number` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`animal_bite_vacID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_appointments;

CREATE TABLE `tbl_appointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_birth_info;

CREATE TABLE `tbl_birth_info` (
  `birthInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `lmp` varchar(20) DEFAULT NULL,
  `edc` varchar(20) DEFAULT NULL,
  `aog` varchar(20) DEFAULT NULL,
  `G` varchar(20) DEFAULT NULL,
  `P` varchar(20) DEFAULT NULL,
  `1` varchar(20) DEFAULT NULL,
  `2` varchar(20) DEFAULT NULL,
  `3` varchar(20) DEFAULT NULL,
  `4` varchar(20) DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `pr` varchar(20) DEFAULT NULL,
  `rr` varchar(20) DEFAULT NULL,
  `T` varchar(20) DEFAULT NULL,
  `fhb` varchar(20) DEFAULT NULL,
  `loc` varchar(255) DEFAULT NULL,
  `presentation` varchar(100) DEFAULT NULL,
  `vaginal_discharge` varchar(100) DEFAULT NULL,
  `midwife` varchar(255) DEFAULT NULL,
  `physical_exam_id` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`birthInfoID`),
  KEY `patient_id` (`patient_id`),
  KEY `physical_exam_id` (`physical_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_birthing_details;

CREATE TABLE `tbl_birthing_details` (
  `birthID` int(11) NOT NULL AUTO_INCREMENT,
  `admission` datetime NOT NULL,
  `discharge` datetime NOT NULL,
  `admitting_diagnosis` varchar(255) NOT NULL,
  `final_diagnosis` varchar(255) NOT NULL,
  `procedure_done` varchar(100) NOT NULL,
  `disposition` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `midwife` varchar(50) NOT NULL,
  PRIMARY KEY (`birthID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_certificate_log;

CREATE TABLE `tbl_certificate_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `generated_at` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_certificate_log VALUES("7","10","2024-06-18 16:36:42");
INSERT INTO tbl_certificate_log VALUES("8","12","2024-06-18 18:02:07");



DROP TABLE IF EXISTS tbl_checkup;

CREATE TABLE `tbl_checkup` (
  `checkupID` int(11) NOT NULL AUTO_INCREMENT,
  `admitted` datetime NOT NULL,
  `history` varchar(50) NOT NULL,
  `per_pas_med` varchar(255) NOT NULL,
  `pertinent_signs` varchar(255) NOT NULL,
  `gen_survey` varchar(255) NOT NULL,
  `heent` varchar(255) NOT NULL,
  `chest` varchar(255) NOT NULL,
  `CSV` varchar(255) NOT NULL,
  `abdomen` varchar(255) NOT NULL,
  `GU` varchar(255) NOT NULL,
  `skin_extremeties` varchar(255) NOT NULL,
  `neuro_exam` varchar(255) NOT NULL,
  `disability` varchar(50) NOT NULL,
  `disability_type` varchar(50) NOT NULL,
  `doctor_order` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`checkupID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_checkup VALUES("40","2024-06-18 17:44:00","none","none","[\"Headache\",\"\"]","","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","no","","must give medication asap","12");



DROP TABLE IF EXISTS tbl_complaints;

CREATE TABLE `tbl_complaints` (
  `complaintID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `Chief_Complaint` varchar(255) NOT NULL,
  `Remarks` varchar(255) NOT NULL,
  `bp` varchar(20) NOT NULL,
  `hr` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `rr` varchar(20) NOT NULL,
  `temp` varchar(20) NOT NULL,
  `Height` varchar(20) NOT NULL,
  `Nature_Visit` varchar(100) NOT NULL,
  `consultation_purpose` varchar(100) NOT NULL,
  `refferred` varchar(100) NOT NULL,
  `reason_ref` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`complaintID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_complaints VALUES("16","12","severe headache","severe headache that started 2 days ago","110 / 70_","90","55kg","16","38°C","165cm","New admission","Checkup","ellen","manganakayssevere headache","Done","2024-06-18 17:37:33");
INSERT INTO tbl_complaints VALUES("17","12","head ache","severe headache that started 2 days ago","120 / 80_","20","55kg","16","38°C","165cm","Follow-up visit","Checkup","guihara","head ache","Pending","2024-06-18 17:46:55");



DROP TABLE IF EXISTS tbl_doctor_schedule;

CREATE TABLE `tbl_doctor_schedule` (
  `doc_scheduleID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `day_of_week` varchar(15) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`doc_scheduleID`),
  KEY `doctor_id` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_doctor_schedule VALUES("2","9","May 11, 2024","10:00:00","14:00:00","1");
INSERT INTO tbl_doctor_schedule VALUES("3","9","May 12, 2024","09:00:00","13:00:00","0");



DROP TABLE IF EXISTS tbl_family;

CREATE TABLE `tbl_family` (
  `famID` int(11) NOT NULL AUTO_INCREMENT,
  `brgy` varchar(255) NOT NULL,
  `purok` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`famID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_family VALUES("15","Palavilla","Pagkakaisa","Lutayan Sultan Kudarat");



DROP TABLE IF EXISTS tbl_immunization_records;

CREATE TABLE `tbl_immunization_records` (
  `immunID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `vaccine` varchar(255) NOT NULL,
  `immunization_date` date DEFAULT NULL,
  `immunization_next_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`immunID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_immunization_types;

CREATE TABLE `tbl_immunization_types` (
  `immun_typeID` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `age_group` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`immun_typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_medicine_details;

CREATE TABLE `tbl_medicine_details` (
  `med_detailsID` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_id` int(11) NOT NULL,
  `packing` varchar(60) NOT NULL,
  `qt` varchar(255) NOT NULL,
  PRIMARY KEY (`med_detailsID`),
  KEY `medicine_id` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicine_details VALUES("19","8","ml","163");
INSERT INTO tbl_medicine_details VALUES("20","7","mg","56");
INSERT INTO tbl_medicine_details VALUES("21","9","tablet","58");
INSERT INTO tbl_medicine_details VALUES("22","12","ml","81");
INSERT INTO tbl_medicine_details VALUES("23","13","injectable","84");
INSERT INTO tbl_medicine_details VALUES("24","11","tablet","70");
INSERT INTO tbl_medicine_details VALUES("25","18","injectable","100");
INSERT INTO tbl_medicine_details VALUES("26","15","injectable","100");
INSERT INTO tbl_medicine_details VALUES("27","17","syrup","95");
INSERT INTO tbl_medicine_details VALUES("28","14","injectable","94");
INSERT INTO tbl_medicine_details VALUES("29","16","injectable","100");
INSERT INTO tbl_medicine_details VALUES("30","10","injectable","100");
INSERT INTO tbl_medicine_details VALUES("31","19","injectable","101");
INSERT INTO tbl_medicine_details VALUES("32","25","ML","89");
INSERT INTO tbl_medicine_details VALUES("33","27","tablet","100");
INSERT INTO tbl_medicine_details VALUES("34","28","mg","100");



DROP TABLE IF EXISTS tbl_medicines;

CREATE TABLE `tbl_medicines` (
  `medicineID` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `manuf_date` date NOT NULL,
  `ex_date` date DEFAULT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`medicineID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicines VALUES("7","Paracetamol","Paracetamolparacetamol","Unilab","Antibiotics","2024-01-04","2027-08-04","Unilab","Unilab","2024-04-15 15:25:42");
INSERT INTO tbl_medicines VALUES("8","Amoxicillin","Amoxicillin","Amoxicillin","Anticoagulants","2024-09-04","2029-05-04","Amoxicillin","Amoxicillin","2024-04-15 15:29:35");
INSERT INTO tbl_medicines VALUES("9","Ativan","Ativan","Ativan","Bronchodilators","2024-05-16","2029-06-04","Ativan","Ativan","2024-04-15 15:36:43");
INSERT INTO tbl_medicines VALUES("10","Azithromycin","Azit","Azithromycin","Analgesics","2024-01-04","2029-05-04","Azithromycin","Azithromycin","2024-04-15 15:46:48");
INSERT INTO tbl_medicines VALUES("11","Bio-flu","Fd","Fdsaf","Analgesics","0000-00-00","2025-03-04","tes","test","2024-04-29 08:55:48");
INSERT INTO tbl_medicines VALUES("12","Boi-gesic","Boi-gesic","Boi-gesic","Antibiotics","2024-03-05","2029-02-05","boi-gesic","boi-gesic","2024-05-03 08:52:24");
INSERT INTO tbl_medicines VALUES("13","Rabies Vaccine","An Active Immunizing Agent Used To Prevent Infection Caused By The Rabies Virus","Imovax Rabies","Vaccines","2024-05-01","2030-07-05","Merative, Micromedex®","Us Brand Name","2024-05-14 09:59:37");
INSERT INTO tbl_medicines VALUES("14","BGC Vaccine","Bcg Vaccine","Bcg Vaccine","Vaccines","2024-05-16","2024-05-16","Bcg Vaccine","Bcg Vaccine","2024-05-16 16:11:45");
INSERT INTO tbl_medicines VALUES("15","Hepatitis B Vaccine","Hepatitis B Vaccine","Hepatitis B Vaccine","Vaccines","2024-05-01","2027-05-12","Hepatitis B Vaccine","Hepatitis B Vaccine","2024-05-16 16:19:00");
INSERT INTO tbl_medicines VALUES("16","Pentavalent Vaccine","(dpt-hep B-hib)","Pentavalent Vaccine","Vaccines","2024-08-05","0000-00-00","Pentavalent Vaccine","Pentavalent Vaccine","2024-05-16 16:19:23");
INSERT INTO tbl_medicines VALUES("17","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","Vaccines","2024-09-05","2030-02-08","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","2024-05-16 16:19:41");
INSERT INTO tbl_medicines VALUES("18","Inactivated Polio Vaccine (ipv)","Inactivated Polio Vaccine (ipv)","Inactivated Polio Vaccine (ipv)","Vaccines","2024-05-01","2024-05-22","Inactivated Polio Vaccine (IPV)","Inactivated Polio Vaccine (IPV)","2024-05-16 16:19:52");
INSERT INTO tbl_medicines VALUES("19","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","Vaccines","2024-10-05","2031-05-15","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","2024-05-16 16:20:08");
INSERT INTO tbl_medicines VALUES("25","Cefdinir","Cefdinir","Cefdinir","Antibiotics","2024-12-06","2030-01-06","Cefdinir","Cefdinir","2024-06-18 12:28:55");
INSERT INTO tbl_medicines VALUES("27","Loratidine","For Allergic Reaction","Med Phar","Antihistamines","2023-01-04","2029-01-06","UNILAB","Claritin","2024-06-18 16:45:41");
INSERT INTO tbl_medicines VALUES("28","Lorapiden","For Allergic Reaction","Med Phar","Antihistamines","2024-01-06","2025-01-06","Med phar","Claritin","2024-06-18 17:56:10");



DROP TABLE IF EXISTS tbl_membership_info;

CREATE TABLE `tbl_membership_info` (
  `membershipID` int(11) NOT NULL AUTO_INCREMENT,
  `phil_mem` varchar(50) NOT NULL,
  `philhealth_no` varchar(255) NOT NULL,
  `phil_membership` varchar(100) NOT NULL,
  `ps_mem` varchar(255) NOT NULL,
  PRIMARY KEY (`membershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_membership_info VALUES("13","No","","","[\"NHTS\"]");



DROP TABLE IF EXISTS tbl_patient_medication_history;

CREATE TABLE `tbl_patient_medication_history` (
  `patient_med_historyID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_visit_id` int(11) NOT NULL,
  `medicine_details_id` int(11) NOT NULL,
  `con_type` varchar(30) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  `schedule_dosage` varchar(100) NOT NULL,
  `mg_ml` varchar(20) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `time_frame` varchar(100) NOT NULL,
  `advice` text NOT NULL,
  PRIMARY KEY (`patient_med_historyID`),
  KEY `patient_visit_id` (`patient_visit_id`),
  KEY `medicine_details_id` (`medicine_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_medication_history VALUES("27","46","25","Oral(p/o)","1","schedule dose","After Meal","125 mg","Twice a day","7 (Day)","with or without food");
INSERT INTO tbl_patient_medication_history VALUES("28","47","25","Oral(p/o)","10","schedule dose","Before Meal","120 mg","Twice a day","7 (Day)","take w/o food");
INSERT INTO tbl_patient_medication_history VALUES("29","47","12","Oral(p/o)","10","as needed","","500 mg","Every 4 hours","3 (Day)","take w/o food");



DROP TABLE IF EXISTS tbl_patient_visits;

CREATE TABLE `tbl_patient_visits` (
  `patient_visitID` int(11) NOT NULL AUTO_INCREMENT,
  `visit_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `disease` varchar(255) NOT NULL,
  `recom` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_visitID`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_visits VALUES("46","2024-06-18","2024-06-27","UTI","7 days rest","10","9");
INSERT INTO tbl_patient_visits VALUES("47","2024-06-18","2024-06-25","headache","give plenty of fluids and rest","12","9");



DROP TABLE IF EXISTS tbl_patients;

CREATE TABLE `tbl_patients` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `family_address` int(11) NOT NULL,
  `Membership_Info` int(11) NOT NULL,
  `household_no` varchar(255) NOT NULL,
  `patient_name` varchar(60) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `father_guardian_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `cnic` varchar(17) NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `age` varchar(20) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `ed_at` varchar(100) NOT NULL,
  `emp_stat` varchar(100) NOT NULL,
  `Nationality` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`patientID`),
  KEY `Membership_Info` (`Membership_Info`),
  KEY `family_no` (`family_address`),
  CONSTRAINT `tbl_patients_ibfk_1` FOREIGN KEY (`family_address`) REFERENCES `tbl_family` (`famID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_patients_ibfk_2` FOREIGN KEY (`Membership_Info`) REFERENCES `tbl_membership_info` (`membershipID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patients VALUES("12","15","13","9107055","Emma","usop","datuwata","","janesh","jonathan","0000000001","1999-01-07","25 years","+63965623232","Female","Single","A+","College Level","none","Filipino","2024-06-18 17:36:09","2");



DROP TABLE IF EXISTS tbl_personnel;

CREATE TABLE `tbl_personnel` (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_personnel VALUES("1","admin","M.","admin","Koronadal City","admin@gmail.com","+639645563132");
INSERT INTO tbl_personnel VALUES("2","Bhwbarangay","","Bhw1","+634134646546","admin123@gmail.com","+632131231237");
INSERT INTO tbl_personnel VALUES("7","Rhu","R.","Rhu","Koronadal City , South Cotabato","RHU@gmail.com","+631232131321");
INSERT INTO tbl_personnel VALUES("8","Elleen","","Tunguia","+634744477477","elleen@gmail.com","Koronadal City , South Cotabato");
INSERT INTO tbl_personnel VALUES("9","WILJUN ","","PANGARINTAO","09653231547","doctor@gmail.com","koronadal city");
INSERT INTO tbl_personnel VALUES("10","1","131","11","1","1@gmail.com","+632989656323");
INSERT INTO tbl_personnel VALUES("11","Rhu2",".","Rhu2","+639665321232","rhu2@gmail.com","+631233333333");
INSERT INTO tbl_personnel VALUES("12","Physician","P","Physician","koronadal city","Physician@gmail.com","+639232131312");
INSERT INTO tbl_personnel VALUES("13","dsa","dsa","dsa","dsa","das@gmail.com","+63912313123_");



DROP TABLE IF EXISTS tbl_physical_exam;

CREATE TABLE `tbl_physical_exam` (
  `physical_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `head_neck` varchar(255) DEFAULT NULL,
  `chest` varchar(255) DEFAULT NULL,
  `heart` varchar(255) DEFAULT NULL,
  `abdomen` varchar(255) DEFAULT NULL,
  `extremities` varchar(255) DEFAULT NULL,
  `vulva` varchar(255) DEFAULT NULL,
  `vagina` varchar(255) DEFAULT NULL,
  `cervix` varchar(255) DEFAULT NULL,
  `uterus` varchar(255) DEFAULT NULL,
  `bow` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`physical_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_physical_exam VALUES("1","1","1","1","1","1","1","1","1","1","fsdafsad");



DROP TABLE IF EXISTS tbl_position;

CREATE TABLE `tbl_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `PositionName` varchar(100) NOT NULL,
  `Specialty` varchar(100) NOT NULL,
  `ProfessionalType` varchar(100) NOT NULL,
  `LicenseNo` varchar(255) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_position VALUES("1","1","","","","");
INSERT INTO tbl_position VALUES("2","2","","","","");
INSERT INTO tbl_position VALUES("7","7","","","","");
INSERT INTO tbl_position VALUES("8","8","","","","");
INSERT INTO tbl_position VALUES("9","9","Registereddoctor","Cardiology","MD, FPSMS","106268");
INSERT INTO tbl_position VALUES("10","10","1","1","1","1");
INSERT INTO tbl_position VALUES("11","11","","","","");
INSERT INTO tbl_position VALUES("12","12","Physician","Physician","Physician","09523215");
INSERT INTO tbl_position VALUES("13","13","dsa","dsa","dsa","dsa");



DROP TABLE IF EXISTS tbl_prenatal;

CREATE TABLE `tbl_prenatal` (
  `prenatalID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `chief_complaint` varchar(100) NOT NULL,
  `attending_physician` int(11) NOT NULL,
  `lmp` varchar(20) NOT NULL,
  `ga_by_lmp` varchar(20) NOT NULL,
  `edc_by_lmp` varchar(20) NOT NULL,
  `fhr` varchar(20) NOT NULL,
  `ga_by_sonar` varchar(20) NOT NULL,
  `edc_by_utz` varchar(20) NOT NULL,
  `pregnancy_age` varchar(20) NOT NULL,
  `biparietal_diameter` varchar(20) NOT NULL,
  `biparietal_eq` varchar(20) NOT NULL,
  `head_circumference` varchar(20) NOT NULL,
  `head_circumference_eq` varchar(20) NOT NULL,
  `abdominal_circumference` varchar(20) NOT NULL,
  `abdominal_circumference_eq` varchar(20) NOT NULL,
  `femoral_length` varchar(20) NOT NULL,
  `femoral_length_eq` varchar(20) NOT NULL,
  `crown_rump_length` varchar(20) NOT NULL,
  `crown_rump_length_eq` varchar(20) NOT NULL,
  `mean_gest_sac_diameter` varchar(20) NOT NULL,
  `mean_gest_sac_diameter_eq` varchar(20) NOT NULL,
  `average_fetal_weight` varchar(20) NOT NULL,
  `gestation` varchar(20) DEFAULT NULL,
  `presentation_lie` varchar(20) DEFAULT NULL,
  `amniotic_fluid` varchar(20) DEFAULT NULL,
  `placenta_location` varchar(20) DEFAULT NULL,
  `previa` varchar(20) DEFAULT NULL,
  `placenta_grade` varchar(20) DEFAULT NULL,
  `fetal_activity` varchar(20) DEFAULT NULL,
  `comments` varchar(100) NOT NULL,
  `radiologist` varchar(30) NOT NULL,
  `patient_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`prenatalID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_referrals_log;

CREATE TABLE `tbl_referrals_log` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `referral_date` date NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_referrals_log VALUES("21","10","2024-06-18","8");
INSERT INTO tbl_referrals_log VALUES("22","11","2024-06-18","2");
INSERT INTO tbl_referrals_log VALUES("23","10","2024-06-18","7");
INSERT INTO tbl_referrals_log VALUES("24","12","2024-06-18","2");
INSERT INTO tbl_referrals_log VALUES("25","12","2024-06-18","7");



DROP TABLE IF EXISTS tbl_user_log;

CREATE TABLE `tbl_user_log` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_ip` binary(16) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `tbl_user_log_ibfk_1` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_log VALUES("1","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:08:19","18-06-2024 11:32:25 AM","1");
INSERT INTO tbl_user_log VALUES("2","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:16:33","18-06-2024 11:16:36 AM","1");
INSERT INTO tbl_user_log VALUES("3","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:16:41","18-06-2024 11:33:08 AM","1");
INSERT INTO tbl_user_log VALUES("4","","bhw","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:29:15","","0");
INSERT INTO tbl_user_log VALUES("5","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:29:27","18-06-2024 11:30:13 AM","1");
INSERT INTO tbl_user_log VALUES("6","","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:30:19","","0");
INSERT INTO tbl_user_log VALUES("7","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:30:29","18-06-2024 11:30:39 AM","1");
INSERT INTO tbl_user_log VALUES("8","8","Elleen","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:31:26","18-06-2024 11:32:07 AM","1");
INSERT INTO tbl_user_log VALUES("9","8","Elleen","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:32:10","18-06-2024 11:33:21 AM","1");
INSERT INTO tbl_user_log VALUES("10","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:32:30","18-06-2024 11:32:45 AM","1");
INSERT INTO tbl_user_log VALUES("11","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:32:48","","1");
INSERT INTO tbl_user_log VALUES("12","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:33:11","18-06-2024 11:33:16 AM","1");
INSERT INTO tbl_user_log VALUES("13","8","Elleen","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:33:31","18-06-2024 11:33:58 AM","1");
INSERT INTO tbl_user_log VALUES("14","8","Elleen","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 11:34:01","","1");
INSERT INTO tbl_user_log VALUES("15","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 11:43:26","","1");
INSERT INTO tbl_user_log VALUES("16","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 12:09:42","","1");
INSERT INTO tbl_user_log VALUES("17","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 12:15:33","18-06-2024 02:27:58 PM","1");
INSERT INTO tbl_user_log VALUES("18","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 12:20:16","18-06-2024 01:08:51 PM","1");
INSERT INTO tbl_user_log VALUES("19","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 13:09:09","","0");
INSERT INTO tbl_user_log VALUES("20","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 13:09:48","","0");
INSERT INTO tbl_user_log VALUES("21","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 14:28:06","18-06-2024 03:46:47 PM","1");
INSERT INTO tbl_user_log VALUES("22","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 14:28:20","","0");
INSERT INTO tbl_user_log VALUES("23","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 14:28:24","","0");
INSERT INTO tbl_user_log VALUES("24","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 14:28:28","","0");
INSERT INTO tbl_user_log VALUES("25","8","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 14:28:35","18-06-2024 03:02:15 PM","1");
INSERT INTO tbl_user_log VALUES("26","2","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 14:29:41","18-06-2024 02:31:34 PM","1");
INSERT INTO tbl_user_log VALUES("27","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 14:31:40","18-06-2024 04:03:32 PM","1");
INSERT INTO tbl_user_log VALUES("28","","gjd","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 15:46:52","","0");
INSERT INTO tbl_user_log VALUES("29","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 15:48:19","18-06-2024 04:02:33 PM","1");
INSERT INTO tbl_user_log VALUES("30","8","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:03:38","18-06-2024 04:03:54 PM","1");
INSERT INTO tbl_user_log VALUES("31","2","bhw1","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:04:00","18-06-2024 04:04:02 PM","1");
INSERT INTO tbl_user_log VALUES("32","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:04:12","18-06-2024 04:11:50 PM","1");
INSERT INTO tbl_user_log VALUES("33","","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:14:01","","0");
INSERT INTO tbl_user_log VALUES("34","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:14:30","18-06-2024 05:16:21 PM","1");
INSERT INTO tbl_user_log VALUES("35","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 16:15:30","18-06-2024 05:16:15 PM","1");
INSERT INTO tbl_user_log VALUES("36","2","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 16:17:12","18-06-2024 04:49:39 PM","1");
INSERT INTO tbl_user_log VALUES("37","","dsa","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 17:30:42","","0");
INSERT INTO tbl_user_log VALUES("38","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 17:31:03","","1");
INSERT INTO tbl_user_log VALUES("39","2","bhw1","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-18 17:33:17","","1");
INSERT INTO tbl_user_log VALUES("40","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-06-18 17:33:30","","1");



DROP TABLE IF EXISTS tbl_user_page;

CREATE TABLE `tbl_user_page` (
  `userpageID` int(11) NOT NULL AUTO_INCREMENT,
  `home_img` varchar(100) NOT NULL,
  `sidebar` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userpageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_page VALUES("1","photo1718591656 (2).jpeg","BRGY. PALABILLA","2");
INSERT INTO tbl_user_page VALUES("2","photo1718591656 (3).jpeg","BRGY. LAMPARE","8");



DROP TABLE IF EXISTS tbl_users;

CREATE TABLE `tbl_users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `UserType` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `profile_picture` varchar(40) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `userpageID` int(11) DEFAULT NULL,
  `reg` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`userID`),
  KEY `personnel_id` (`personnel_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `tbl_personnel` (`personnel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_users_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `tbl_position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_users VALUES("1","admin","Admin","$2y$10$eAyfJgeD71/fmBcatnrsWe1d2WA80awcely/Av9IZMwMB3v4C2OZa","active","photo1718592515 (7).jpeg","1","1","0","2024-04-24 16:39:15");
INSERT INTO tbl_users VALUES("2","bhw1","BHW","$2y$10$dUN5dPzPOrdn07MpwrO3p.us5l2ZrDdXKVRjq6AkmnhFIufa8mcma","active","photo1718592536 (4).jpeg","2","2","1","2024-04-24 17:04:41");
INSERT INTO tbl_users VALUES("7","RHU","RHU","$2y$10$yXSDUDgLAlPCbHsRb5UMq.YC3i9zK1EhZqMiDHe1CTUiFB5ZKESOS","active","1.png","7","7","0","2024-05-02 10:55:03");
INSERT INTO tbl_users VALUES("8","Elleen","BHW","$2y$10$wjnQqSmfKZF1OQ9VzHIWvO0bl.DfKDBmwOAH2yaEp9n4rV5i4yCda","active","photo1718592536 (3).jpeg","8","8","2","2024-05-02 13:15:38");
INSERT INTO tbl_users VALUES("9","doctor","Doctor","$2y$10$AAE0a1Q0yE4/PugxNyXzk.FZ02/VSDWYr3UFv5sTOK7HHY9FaS67i","active","doctor.jpg","9","9","0","2024-05-07 15:01:44");
INSERT INTO tbl_users VALUES("11","rhu2","RHU","$2y$10$51ZJAk4Ykbn1r5bv3oYJyOa7uFi9R0aSCoPbaHlsLIlvt.V5QnECa","active","photo1718592515 (7).jpeg","11","11","0","2024-05-29 06:45:10");
INSERT INTO tbl_users VALUES("12","Physician","Doctor","$2y$10$3LR4wbi/npqY6txYib/AGO1CWRQZnOfTX2BQT8H72Zn8980vPNddu","Active","photo1718592515 (5).jpeg","12","12","0","2024-05-29 11:38:12");
INSERT INTO tbl_users VALUES("13","Dsa","Doctor","$2y$10$xrv6qGDs.achociIOoBrVu7AZT9iBbsYuL0SkCXUaKoDXKD/pwVn.","Inactive","","13","13","0","2024-05-29 15:16:48");



