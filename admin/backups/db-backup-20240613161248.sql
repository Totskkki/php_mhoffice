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

INSERT INTO tbl_animal_bite_care VALUES("1","7","123","2024-05-30","[\"Fully Immunized\",\"Drug\",\"\"]","+","January","2023","Cat","2024-05-10","dsa","[\"Non-bite\",\"Spontaneous\"]","","Unknown","Died","dsa","yes","yes","yes","yes","yes","yes","2024-05-09","HTIG","I","dsa","7");
INSERT INTO tbl_animal_bite_care VALUES("2","7","20240530002","2024-05-30","[\"Fully Immunized\",\"Allergy\",\"\"]","-","January","2024","Cat","2024-05-23","dsa","[\"Non-bite\",\"Spontaneous\"]","","Unknown","Died","dsa","yes","yes","yes","yes","yes","yes","","HTIG","I","dsa","7");



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

INSERT INTO tbl_animal_bite_vaccination VALUES("2","17","2024-05-30","","5","qww","7");



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

INSERT INTO tbl_birth_info VALUES("1","7","2024-03-04","04:10:00","dsa","","","","1","1","","","","","1","1","1","12","11","11","fdsa","fdsa","dsaf","1","7");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_certificate_log VALUES("2","5","2024-05-30 07:46:39");
INSERT INTO tbl_certificate_log VALUES("3","7","2024-05-31 06:25:19");
INSERT INTO tbl_certificate_log VALUES("4","6","2024-06-01 08:05:08");



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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_checkup VALUES("32","2024-04-29 14:23:00","none","none","[\"Altered mental sensorium\",\"M yalgia\",\"\"]","Awake and alert","[\"Sunken eyeballs\",\"\"]","[\"\"]","[\"Murmur\",\"\"]","[\"on\",\"\"]","[\"\"]","[\"\"]","[\"Poor muscle tone\\/strength\",\"\"]","no","","test","31");
INSERT INTO tbl_checkup VALUES("33","2024-05-03 08:58:00","NONE","NONE","[\"Epistaxis\",\"\"]","Altered sensorium","[\"Essentially normal\",\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"Clubbing\",\"NONE\"]","[\"NONE\"]","no","","TEST","27");
INSERT INTO tbl_checkup VALUES("34","2024-05-09 16:47:00","","","[\"\"]","","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","no","","eq","25");
INSERT INTO tbl_checkup VALUES("35","2024-05-13 08:03:00","1","1","[\"\"]","","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","no","","111","31");
INSERT INTO tbl_checkup VALUES("36","2024-05-13 15:11:00","1","1","[\"Headache\",\"\"]","Awake and alert","[\"Essentially normal\",\"Icteric sclerae\",\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","no","","fas","32");
INSERT INTO tbl_checkup VALUES("37","2024-05-28 08:56:00","","","[\"\"]","","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","[\"\"]","yes","half arm","give medications","4");
INSERT INTO tbl_checkup VALUES("38","2024-05-31 06:27:00","none","headache","[\"Headache\",\"\"]","Awake and alert","[\"\"]","[\"Essentially normal\",\"\"]","[\"Essentially normal\",\"\"]","[\"Essentially normal\",\"\"]","[\"Essentially normal\",\"\"]","[\"\"]","[\"on\",\"\"]","no","","take medicines","8");



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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_complaints VALUES("2","4","cough","","110 / 120","20","35kg","20","35°C","142","New consultation/case","Checkup","maricar","for checkup","Done","2024-05-28 08:55:29");
INSERT INTO tbl_complaints VALUES("3","5","dsa","dsa","111 / 120","12","23kg","1","1°C","2cm","Follow-up visit","Checkup","sddas","da","Pending","2024-05-29 08:32:09");
INSERT INTO tbl_complaints VALUES("4","6","dsa","dsa","123 / 21_","123","213kg","321","32°C","321cm","New admission","Checkup","321","3213","Pending","2024-05-29 08:36:18");
INSERT INTO tbl_complaints VALUES("5","5","sdfa","fsa","111 / 111","11","11kg","11","11°C","11cm","Follow-up visit","Prenatal","fdsa","fdsa","Done","2024-05-29 11:14:55");
INSERT INTO tbl_complaints VALUES("10","5","dsa","dsa","123 / ___","2","321kg","32","321°C","321cm","Follow-up visit","Prenatal","fds","fdsa","Pending","2024-05-30 16:28:10");
INSERT INTO tbl_complaints VALUES("11","8","test","","110 / 120","10","85kg","20","40°C","163","New consultation/case","Checkup","guiaha","headache","Done","2024-05-31 06:27:23");
INSERT INTO tbl_complaints VALUES("12","10","head ache","head ache","110 / 120","12","80kg","12","35°C","163cm","New admission","Checkup","romeo marquez","111","Pending","2024-06-06 16:33:13");
INSERT INTO tbl_complaints VALUES("13","11","LUPIN","LUPIN","110 / 120","12","80kg","12","35°C","163","New consultation/case","Checkup","LUPIN","LUPIN","Pending","2024-06-06 16:35:39");
INSERT INTO tbl_complaints VALUES("14","12","","","110 / 120","12","80kg","12","35°C","163","New admission","Vaccination and Immunization","LUPIN","LUPIN","Pending","2024-06-06 16:37:49");



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
INSERT INTO tbl_doctor_schedule VALUES("3","9","Monday","09:00:00","13:00:00","0");



DROP TABLE IF EXISTS tbl_family;

CREATE TABLE `tbl_family` (
  `famID` int(11) NOT NULL AUTO_INCREMENT,
  `brgy` varchar(255) NOT NULL,
  `purok` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`famID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_family VALUES("7","Bayasong","Sisiman","South Cotabato");
INSERT INTO tbl_family VALUES("8","Tamnag","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("9","Tamnag","Test","Test");
INSERT INTO tbl_family VALUES("10","Blingkong","Fdsa","Sultan Kudarat");
INSERT INTO tbl_family VALUES("11","Blingkong","Blingkong","Sultan Kudarat");
INSERT INTO tbl_family VALUES("12","Mangudadatu","Masagana","South Cotabato");
INSERT INTO tbl_family VALUES("13","Bayasong","111","South Cotabato");
INSERT INTO tbl_family VALUES("14","Lut Proper","Lupin","Lupin");
INSERT INTO tbl_family VALUES("15","Mangudadatu","Janesh","South Cotabato");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_immunization_records VALUES("1","7","Hepatitis B Vaccine,Pentavalent Vaccine,Pneumococcal Conjugate Vaccine (pcv)","2024-05-30","2024-06-01","test","7");
INSERT INTO tbl_immunization_records VALUES("2","7","Inactivated Polio Vaccine (ipv),Pneumococcal Conjugate Vaccine (pcv)","2024-05-30","2024-05-30","23","7");
INSERT INTO tbl_immunization_records VALUES("3","7","Pentavalent Vaccine,Rabies Vaccine","2024-05-30","2024-06-07","dsa","7");
INSERT INTO tbl_immunization_records VALUES("4","7","Pneumococcal Conjugate Vaccine (pcv),Rabies Vaccine","2024-05-30","2024-06-13","sadsdsa","7");



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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicine_details VALUES("19","8","ml","-6");
INSERT INTO tbl_medicine_details VALUES("20","7","mg","56");
INSERT INTO tbl_medicine_details VALUES("21","9","tablet","83");
INSERT INTO tbl_medicine_details VALUES("22","12","ml","1");
INSERT INTO tbl_medicine_details VALUES("23","13","injectable","84");
INSERT INTO tbl_medicine_details VALUES("24","11","tablet","90");
INSERT INTO tbl_medicine_details VALUES("25","18","injectable","100");
INSERT INTO tbl_medicine_details VALUES("26","15","injectable","100");
INSERT INTO tbl_medicine_details VALUES("27","17","syrup","95");
INSERT INTO tbl_medicine_details VALUES("28","14","injectable","94");
INSERT INTO tbl_medicine_details VALUES("29","16","injectable","100");
INSERT INTO tbl_medicine_details VALUES("30","10","injectable","100");
INSERT INTO tbl_medicine_details VALUES("31","19","injectable","1");



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
  PRIMARY KEY (`medicineID`),
  CONSTRAINT `tbl_medicines_ibfk_1` FOREIGN KEY (`medicineID`) REFERENCES `tbl_medicine_details` (`medicine_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicines VALUES("7","Paracetamol","Paracetamolparacetamol","Unilab","Antibiotics","2024-01-04","2027-08-04","Unilab","Unilab","2024-04-15 15:25:42");
INSERT INTO tbl_medicines VALUES("8","Amoxicillin","Amoxicillin","Amoxicillin","Anticoagulants","2024-09-04","2029-05-04","Amoxicillin","Amoxicillin","2024-04-15 15:29:35");
INSERT INTO tbl_medicines VALUES("9","Ativan","Ativan","Ativan","Bronchodilators","2024-05-16","2029-06-04","Ativan","Ativan","2024-04-15 15:36:43");
INSERT INTO tbl_medicines VALUES("10","Azithromycin","Azit","Azithromycin","Analgesics","2024-01-04","2029-05-04","Azithromycin","Azithromycin","2024-04-15 15:46:48");
INSERT INTO tbl_medicines VALUES("11","Bio-flu","Fd","Fdsaf","Analgesics","0000-00-00","2025-03-04","tes","test","2024-04-29 08:55:48");
INSERT INTO tbl_medicines VALUES("12","Boi-gesic","Boi-gesic","Boi-gesic","Antibiotics","2024-03-05","2029-02-05","boi-gesic","boi-gesic","2024-05-03 08:52:24");
INSERT INTO tbl_medicines VALUES("13","Rabies Vaccine","An Active Immunizing Agent Used To Prevent Infection Caused By The Rabies Virus","Imovax Rabies","Vaccines","2024-05-01","2030-07-05","Merative, Micromedex®","Us Brand Name","2024-05-14 09:59:37");
INSERT INTO tbl_medicines VALUES("14","BGC Vaccine","Bcg Vaccine","Bcg Vaccine","Vaccines","2024-05-16","2024-05-16","Bcg Vaccine","Bcg Vaccine","2024-05-16 16:11:45");
INSERT INTO tbl_medicines VALUES("15","Hepatitis B Vaccine","Hepatitis B Vaccine","Hepatitis B Vaccine","Vaccines","2024-05-01","2027-05-12","Hepatitis B Vaccine","Hepatitis B Vaccine","2024-05-16 16:19:00");
INSERT INTO tbl_medicines VALUES("16","Pentavalent Vaccine","(dpt-hep B-hib)","Pentavalent Vaccine","Vaccines","2024-08-05","2030-09-05","Pentavalent Vaccine","Pentavalent Vaccine","2024-05-16 16:19:23");
INSERT INTO tbl_medicines VALUES("17","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","Vaccines","2024-01-05","2030-06-06","Oral Polio Vaccine (opv)","Oral Polio Vaccine (opv)","2024-05-16 16:19:41");
INSERT INTO tbl_medicines VALUES("18","Inactivated Polio Vaccine (ipv)","Inactivated Polio Vaccine (ipv)","Inactivated Polio Vaccine (ipv)","Vaccines","2024-05-01","2030-06-02","Inactivated Polio Vaccine (ipv)","Inactivated Polio Vaccine (ipv)","2024-05-16 16:19:52");
INSERT INTO tbl_medicines VALUES("19","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","Vaccines","2024-10-05","2031-05-15","Pneumococcal Conjugate Vaccine (pcv)","Pneumococcal Conjugate Vaccine (pcv)","2024-05-16 16:20:08");



DROP TABLE IF EXISTS tbl_membership_info;

CREATE TABLE `tbl_membership_info` (
  `membershipID` int(11) NOT NULL AUTO_INCREMENT,
  `phil_mem` varchar(50) NOT NULL,
  `philhealth_no` varchar(255) NOT NULL,
  `phil_membership` varchar(100) NOT NULL,
  `ps_mem` varchar(255) NOT NULL,
  PRIMARY KEY (`membershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_membership_info VALUES("5","Yes","09652135645","Dependent","[\"Private\"]");
INSERT INTO tbl_membership_info VALUES("6","No","","","[\"Private\"]");
INSERT INTO tbl_membership_info VALUES("7","No","","","[\"LGU\"]");
INSERT INTO tbl_membership_info VALUES("8","No","","","[]");
INSERT INTO tbl_membership_info VALUES("9","Yes","09665231","Dependent","[\"Private\"]");
INSERT INTO tbl_membership_info VALUES("10","Yes","123123213","None Member","[\"4PS\",\"LGU\"]");
INSERT INTO tbl_membership_info VALUES("11","No","","","[\"NHTS\",\"4PS\",\"LGU\"]");
INSERT INTO tbl_membership_info VALUES("12","No","","","[]");
INSERT INTO tbl_membership_info VALUES("13","No","","","[\"NHTS\",\"4PS\",\"LGU\"]");



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_medication_history VALUES("11","18","8","Oral(p/o)","10","as needed","","500mg","Every 3 hours","2 (Day)","test");
INSERT INTO tbl_patient_medication_history VALUES("12","19","8","Oral(p/o)","10","schedule dose","After Meal","500 mg","Every 4 hours","2 (Day)","test");
INSERT INTO tbl_patient_medication_history VALUES("13","20","8","Cream/Lotion/Ointment","20","as needed","","500 mg","Hourly","2 (Day)","test");
INSERT INTO tbl_patient_medication_history VALUES("14","29","9","Oral(p/o)","10","as needed","","500 mg","Hourly","2 (Day)","test");
INSERT INTO tbl_patient_medication_history VALUES("15","33","8","Oral(p/o)","5","as needed","Before Meal","500 mg","Hourly","1 (Day)","test");



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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_visits VALUES("18","2024-05-29","2024-05-31","cough","fdsa","5","9");
INSERT INTO tbl_patient_visits VALUES("19","2024-05-30","2024-06-05","fever","test","5","9");
INSERT INTO tbl_patient_visits VALUES("20","2024-05-30","2024-06-08","fdsa","fdsa","7","12");
INSERT INTO tbl_patient_visits VALUES("29","2024-05-31","2024-06-05","tuberculoses","test","7","9");
INSERT INTO tbl_patient_visits VALUES("33","2024-05-31","2024-06-15","tuberculoses","test","6","9");



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

INSERT INTO tbl_patients VALUES("4","7","5","1458977","Richard","","yap","","maricar","boy tapang","0000000001","2013-01-02","11 years","+63965323223","Male","Single","A+","Elementary","none","Filipino","2024-05-28 08:54:47","7");
INSERT INTO tbl_patients VALUES("5","8","6","1458978","Bunna","","tapagay","","test","test","0000000005","1989-01-05","35 years","+63965323212","Female","Single","A+","College Level","test","Filipino","2024-05-28 10:08:35","7");
INSERT INTO tbl_patients VALUES("6","9","7","1458979","Test","","Test","","Test","Test","0000000006","2009-12-29","13","+63123113213","Male","Single","B-","High School","Test","Asian","2024-05-29 08:36:00","1");
INSERT INTO tbl_patients VALUES("7","10","8","1458980","Bordoy","","bordoy","","bordoy","bordoy","0000000007","1999-01-31","25 years","+63963232324","Male","Married","A+","No Formal Education","bordoy","Filipino","2024-05-30 08:50:00","8");
INSERT INTO tbl_patients VALUES("8","11","9","1458981","Guiaha","","Rajabuayan","","Guiaha","Guiaha","0000000008","1989-05-30","33","+63965323214","Female","Married","A+","College Level","None","Filipino","2024-05-31 06:26:48","1");
INSERT INTO tbl_patients VALUES("9","12","10","1458982","John","","Smith","","Fdsasfa","Fdsa","0000000009","2016-02-03","8","+63123123213","Other","Single","A+","High School","Fdsadf","Asian","2024-06-01 09:48:29","1");
INSERT INTO tbl_patients VALUES("10","13","11","1458983","1111","v","11","","111","11","0000000010","1999-01-30","25 years","+63123213211","Other","Separated","A-","Elementary","1111","Asian","2024-06-06 16:32:38","8");
INSERT INTO tbl_patients VALUES("11","14","12","1458984","Lupin","LUPIN","LUPIN","","LUPIN","LUPIN","0000000011","2024-06-03","0 months","+63123213211","Other","Married","A-","Elementary","LUPIN","Filipino","2024-06-06 16:35:25","7");
INSERT INTO tbl_patients VALUES("12","15","13","1458985","Janesh","Janesh","Janesh","Janesh","Janesh","Janesh","0000000012","2024-06-06","0","+63123213211","Female","Separated","B+","College Graduate","Janesh","Filipino","2024-06-06 16:37:38","1");



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
INSERT INTO tbl_personnel VALUES("7","Rhu1","R.","Rhu1","Koronadal City , South Cotabato","RHU@gmail.com","+631232131321");
INSERT INTO tbl_personnel VALUES("8","Elleen","Elleen","Elleena","+634744477477","elleen@gmail.com","Koronadal City , South Cotabato");
INSERT INTO tbl_personnel VALUES("9","WILJUN ","","PANGARINTAO","09653231547","doctor@gmail.com","koronadal city");
INSERT INTO tbl_personnel VALUES("10","1","131","11","1","1@gmail.com","+632989656323");
INSERT INTO tbl_personnel VALUES("11","Rhu2",".","Rhu2","Lutayan","rhu2@gmail.com","+631233333333");
INSERT INTO tbl_personnel VALUES("12","Physician","p","Physician","koronadal city","Physician@gmail.com","+639232131312");
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

INSERT INTO tbl_prenatal VALUES("1","2024-05-29","  Sdfa ","12","1","1","1","1","1","1DSA","1","1","1","1","1","1","1","1","1","1","1","1","1","1","Single","Cephalic","Normal","Fundus","Marginal","3","heart","Test","Test","5","7");



DROP TABLE IF EXISTS tbl_referrals_log;

CREATE TABLE `tbl_referrals_log` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `referral_date` date NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_referrals_log VALUES("19","6","2024-05-30","2");
INSERT INTO tbl_referrals_log VALUES("20","7","2024-05-31","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_log VALUES("1","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:32:09","09-05-2024 09:53:48 AM","1");
INSERT INTO tbl_user_log VALUES("2","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:53:57","09-05-2024 09:55:20 AM","1");
INSERT INTO tbl_user_log VALUES("3","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:55:26","09-05-2024 12:37:15 PM","1");
INSERT INTO tbl_user_log VALUES("4","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 10:00:18","","1");
INSERT INTO tbl_user_log VALUES("5","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:09:59","","1");
INSERT INTO tbl_user_log VALUES("6","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:27:55","09-05-2024 04:49:46 PM","1");
INSERT INTO tbl_user_log VALUES("7","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:49:54","09-05-2024 04:52:13 PM","1");
INSERT INTO tbl_user_log VALUES("8","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:52:15","09-05-2024 04:53:17 PM","1");
INSERT INTO tbl_user_log VALUES("9","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:52:44","","1");
INSERT INTO tbl_user_log VALUES("10","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:53:22","09-05-2024 04:54:49 PM","1");
INSERT INTO tbl_user_log VALUES("11","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:53:36","","1");
INSERT INTO tbl_user_log VALUES("12","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-10 07:47:54","10-05-2024 11:17:37 AM","1");
INSERT INTO tbl_user_log VALUES("13","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-10 07:48:19","","1");
INSERT INTO tbl_user_log VALUES("14","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-10 07:51:09","10-05-2024 07:52:37 AM","1");
INSERT INTO tbl_user_log VALUES("15","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-10 11:17:44","","1");
INSERT INTO tbl_user_log VALUES("16","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-10 11:17:58","10-05-2024 11:27:27 AM","1");
INSERT INTO tbl_user_log VALUES("17","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-10 11:22:14","","1");
INSERT INTO tbl_user_log VALUES("18","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-10 16:40:20","","1");
INSERT INTO tbl_user_log VALUES("19","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-13 07:46:43","","1");
INSERT INTO tbl_user_log VALUES("20","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-13 10:59:27","","1");
INSERT INTO tbl_user_log VALUES("21","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-13 12:53:31","13-05-2024 04:42:13 PM","1");
INSERT INTO tbl_user_log VALUES("22","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-14 07:23:32","","1");
INSERT INTO tbl_user_log VALUES("23","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-14 09:57:34","","1");
INSERT INTO tbl_user_log VALUES("24","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-14 11:57:38","","1");
INSERT INTO tbl_user_log VALUES("25","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-16 07:10:17","","1");
INSERT INTO tbl_user_log VALUES("26","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-16 09:59:38","","1");
INSERT INTO tbl_user_log VALUES("27","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-16 10:43:29","16-05-2024 10:49:38 AM","1");
INSERT INTO tbl_user_log VALUES("28","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-16 10:49:41","","1");
INSERT INTO tbl_user_log VALUES("29","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-16 12:02:04","16-05-2024 05:07:51 PM","1");
INSERT INTO tbl_user_log VALUES("30","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-16 12:15:27","","1");
INSERT INTO tbl_user_log VALUES("31","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-16 16:55:46","","1");
INSERT INTO tbl_user_log VALUES("32","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-16 18:26:30","","1");
INSERT INTO tbl_user_log VALUES("33","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-17 18:07:54","","1");
INSERT INTO tbl_user_log VALUES("34","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-18 09:57:31","","1");
INSERT INTO tbl_user_log VALUES("35","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-18 19:36:52","","1");
INSERT INTO tbl_user_log VALUES("36","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-19 07:43:10","19-05-2024 07:43:27 AM","1");
INSERT INTO tbl_user_log VALUES("37","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-19 07:46:15","","1");
INSERT INTO tbl_user_log VALUES("38","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-19 10:19:41","19-05-2024 04:06:19 PM","1");
INSERT INTO tbl_user_log VALUES("39","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-22 05:58:16","22-05-2024 06:05:32 AM","1");
INSERT INTO tbl_user_log VALUES("40","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-23 20:16:17","","1");
INSERT INTO tbl_user_log VALUES("41","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-25 11:09:49","","1");
INSERT INTO tbl_user_log VALUES("42","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-25 11:23:10","","1");
INSERT INTO tbl_user_log VALUES("43","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-25 11:23:48","","1");
INSERT INTO tbl_user_log VALUES("44","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-26 20:18:01","","1");
INSERT INTO tbl_user_log VALUES("45","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-27 06:53:02","","1");
INSERT INTO tbl_user_log VALUES("46","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-28 07:12:28","","1");
INSERT INTO tbl_user_log VALUES("47","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-28 13:04:56","","1");
INSERT INTO tbl_user_log VALUES("48","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-28 16:16:24","","1");
INSERT INTO tbl_user_log VALUES("49","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 06:38:14","29-05-2024 06:45:18 AM","1");
INSERT INTO tbl_user_log VALUES("50","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 06:38:30","","1");
INSERT INTO tbl_user_log VALUES("51","11","rhu2","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 06:45:22","29-05-2024 08:03:18 AM","1");
INSERT INTO tbl_user_log VALUES("52","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 06:46:22","","1");
INSERT INTO tbl_user_log VALUES("53","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-29 06:49:24","29-05-2024 06:51:00 AM","1");
INSERT INTO tbl_user_log VALUES("54","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-29 06:51:04","","1");
INSERT INTO tbl_user_log VALUES("55","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 08:03:21","29-05-2024 08:19:04 AM","1");
INSERT INTO tbl_user_log VALUES("56","11","rhu2","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 08:19:11","29-05-2024 08:33:07 AM","1");
INSERT INTO tbl_user_log VALUES("57","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 08:33:13","29-05-2024 08:37:29 AM","1");
INSERT INTO tbl_user_log VALUES("58","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-29 08:36:33","29-05-2024 08:36:50 AM","1");
INSERT INTO tbl_user_log VALUES("59","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 09:50:59","","1");
INSERT INTO tbl_user_log VALUES("60","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 10:29:28","29-05-2024 01:20:03 PM","1");
INSERT INTO tbl_user_log VALUES("61","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 14:45:57","","1");
INSERT INTO tbl_user_log VALUES("62","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 15:02:10","29-05-2024 03:03:14 PM","1");
INSERT INTO tbl_user_log VALUES("63","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 15:03:19","","1");
INSERT INTO tbl_user_log VALUES("64","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-29 15:09:11","","1");
INSERT INTO tbl_user_log VALUES("65","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 06:22:36","30-05-2024 08:46:27 AM","1");
INSERT INTO tbl_user_log VALUES("66","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 08:46:30","30-05-2024 08:50:28 AM","1");
INSERT INTO tbl_user_log VALUES("67","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 08:50:31","30-05-2024 08:56:29 AM","1");
INSERT INTO tbl_user_log VALUES("68","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 08:56:33","30-05-2024 10:54:38 AM","1");
INSERT INTO tbl_user_log VALUES("69","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-30 11:58:44","30-05-2024 11:58:46 AM","1");
INSERT INTO tbl_user_log VALUES("70","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-30 11:58:55","","1");
INSERT INTO tbl_user_log VALUES("71","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 15:53:08","30-05-2024 03:53:29 PM","1");
INSERT INTO tbl_user_log VALUES("72","","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 15:53:32","","0");
INSERT INTO tbl_user_log VALUES("73","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 15:53:37","","1");
INSERT INTO tbl_user_log VALUES("74","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-30 16:03:20","30-05-2024 04:12:40 PM","1");
INSERT INTO tbl_user_log VALUES("75","","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-30 16:03:30","","0");
INSERT INTO tbl_user_log VALUES("76","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-30 16:03:34","","1");
INSERT INTO tbl_user_log VALUES("77","11","rhu2","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 16:12:43","30-05-2024 04:12:52 PM","1");
INSERT INTO tbl_user_log VALUES("78","2","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 16:12:55","30-05-2024 04:13:16 PM","1");
INSERT INTO tbl_user_log VALUES("79","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 16:13:18","30-05-2024 04:22:10 PM","1");
INSERT INTO tbl_user_log VALUES("80","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 16:22:16","30-05-2024 04:22:19 PM","1");
INSERT INTO tbl_user_log VALUES("81","2","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-05-30 16:22:27","","1");
INSERT INTO tbl_user_log VALUES("82","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-31 06:25:01","31-05-2024 06:29:08 AM","1");
INSERT INTO tbl_user_log VALUES("83","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-31 06:29:13","31-05-2024 08:33:38 AM","1");
INSERT INTO tbl_user_log VALUES("84","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-31 09:34:40","31-05-2024 09:34:54 AM","1");
INSERT INTO tbl_user_log VALUES("85","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-31 09:34:57","31-05-2024 09:51:38 AM","1");
INSERT INTO tbl_user_log VALUES("86","2","bhw1","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-31 15:56:18","31-05-2024 03:56:20 PM","1");
INSERT INTO tbl_user_log VALUES("87","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-31 15:56:26","","1");
INSERT INTO tbl_user_log VALUES("88","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-06-01 07:12:43","","1");
INSERT INTO tbl_user_log VALUES("89","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-06-01 07:13:56","","1");
INSERT INTO tbl_user_log VALUES("90","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-06-01 12:08:12","","1");
INSERT INTO tbl_user_log VALUES("91","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-06-03 13:59:12","03-06-2024 02:12:41 PM","1");
INSERT INTO tbl_user_log VALUES("92","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-06 15:24:34","","0");
INSERT INTO tbl_user_log VALUES("93","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-06 15:24:37","06-06-2024 04:31:44 PM","1");
INSERT INTO tbl_user_log VALUES("94","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-06 16:31:54","06-06-2024 04:33:25 PM","1");
INSERT INTO tbl_user_log VALUES("95","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-06-06 16:33:32","06-06-2024 04:59:22 PM","1");
INSERT INTO tbl_user_log VALUES("96","2","bhw1","127.0.0.1\0\0\0\0\0\0\0","2024-06-13 16:11:21","","1");
INSERT INTO tbl_user_log VALUES("97","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-06-13 16:11:35","","1");



DROP TABLE IF EXISTS tbl_user_page;

CREATE TABLE `tbl_user_page` (
  `userpageID` int(11) NOT NULL AUTO_INCREMENT,
  `home_img` varchar(100) NOT NULL,
  `sidebar` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userpageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_page VALUES("1","banner-image.jpg","BRGY. PALABILLA","2");
INSERT INTO tbl_user_page VALUES("2","box-img2.jpg","BRGY. LAMPARE","8");



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
  `userpageID` int(11) NOT NULL,
  `reg` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`userID`),
  KEY `personnel_id` (`personnel_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `tbl_personnel` (`personnel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_users_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `tbl_position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_users VALUES("1","admin","Admin","$2y$10$oknYFdjqrRI9BNrJoVfX1eTxCn6iKkWk/Y8XSGOIF6mApfnWXU5US","Active","1656551999avatar_.png","1","1","0","2024-04-24 16:39:15");
INSERT INTO tbl_users VALUES("2","bhw1","BHW","$2y$10$DLvLetPth2fc3BI4F6X0BOR2b1hZTJLipKFfGJWcM7Cp9kh6AeWdW","Active","download.jpg","2","2","1","2024-04-24 17:04:41");
INSERT INTO tbl_users VALUES("7","RHU","RHU","$2y$10$W38QEG7Malt/KtFNY.yR3em.pHG.JT3t.y08OTG82jGlRLckEIZAG","Active","1.png","7","7","0","2024-05-02 10:55:03");
INSERT INTO tbl_users VALUES("8","test","BHW","$2y$10$zK8GQ7gKm4NsoLDo/I9rJe8gKw1iOkC31hpqJL37oviPKJEIEG6ba","Active","christen-freeimg.jpg","8","8","2","2024-05-02 13:15:38");
INSERT INTO tbl_users VALUES("9","doctor","Doctor","$2y$10$AAE0a1Q0yE4/PugxNyXzk.FZ02/VSDWYr3UFv5sTOK7HHY9FaS67i","Active","doctor.jpg","9","9","0","2024-05-07 15:01:44");
INSERT INTO tbl_users VALUES("11","rhu2","RHU","$2y$10$51ZJAk4Ykbn1r5bv3oYJyOa7uFi9R0aSCoPbaHlsLIlvt.V5QnECa","Active","user.jpg","11","11","0","2024-05-29 06:45:10");
INSERT INTO tbl_users VALUES("12","Physician","Doctor","$2y$10$3LR4wbi/npqY6txYib/AGO1CWRQZnOfTX2BQT8H72Zn8980vPNddu","Active","","12","12","0","2024-05-29 11:38:12");
INSERT INTO tbl_users VALUES("13","Dsa","Doctor","$2y$10$xrv6qGDs.achociIOoBrVu7AZT9iBbsYuL0SkCXUaKoDXKD/pwVn.","Inactive","","13","13","0","2024-05-29 15:16:48");



