DROP TABLE IF EXISTS tbl_animal_bite_care;

CREATE TABLE `tbl_animal_bite_care` (
  `animal_biteID` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `med_history` varchar(100) NOT NULL,
  `animal_type` varchar(100) DEFAULT NULL,
  `date_bite` date DEFAULT NULL,
  `date_exposure` date NOT NULL,
  `type_bite` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `treatment` varchar(100) NOT NULL,
  `cat_exposure` varchar(100) NOT NULL,
  `care_provided` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`animal_biteID`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_animal_bite_care VALUES("0","0","","","","2024-04-10","2024-04-23","","","","","","","0");



DROP TABLE IF EXISTS tbl_animal_bite_vaccination;

CREATE TABLE `tbl_animal_bite_vaccination` (
  `animal_bite_vacID` int(11) NOT NULL AUTO_INCREMENT,
  `vaccination_name` varchar(100) NOT NULL,
  `vaccination_date` date NOT NULL,
  `dose_number` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`animal_bite_vacID`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `tbl_animal_bite_vaccination_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tbl_patients` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
  `lmp` date DEFAULT NULL,
  `edc` date DEFAULT NULL,
  `aog` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `P` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL,
  `bp1` int(11) DEFAULT NULL,
  `bp2` int(11) DEFAULT NULL,
  `pr` int(11) DEFAULT NULL,
  `rr` int(11) DEFAULT NULL,
  `T` decimal(5,2) DEFAULT NULL,
  `fhb` int(11) DEFAULT NULL,
  `loc` varchar(255) DEFAULT NULL,
  `presentation` varchar(255) DEFAULT NULL,
  `vaginal_discharge` varchar(255) DEFAULT NULL,
  `midwife` varchar(255) DEFAULT NULL,
  `physical_exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`birthInfoID`),
  KEY `patient_id` (`patient_id`),
  KEY `physical_exam_id` (`physical_exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_birth_info VALUES("1","0","2024-04-01","00:00:00","","0000-00-00","0000-00-00","0","0","0","0","0","0","0","0","0","0","0","0.00","0","","","","","0");
INSERT INTO tbl_birth_info VALUES("2","31","2024-04-09","24:54:23","","0000-00-00","0000-00-00","10","0","0","0","0","0","0","0","0","0","0","0.00","0","1","","","","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_checkup VALUES("32","2024-04-29 14:23:00","none","none","[\"Altered mental sensorium\",\"M yalgia\",\"\"]","Awake and alert","[\"Sunken eyeballs\",\"\"]","[\"\"]","[\"Murmur\",\"\"]","[\"on\",\"\"]","[\"\"]","[\"\"]","[\"Poor muscle tone\\/strength\",\"\"]","no","","test","31");
INSERT INTO tbl_checkup VALUES("33","2024-05-03 08:58:00","NONE","NONE","[\"Epistaxis\",\"\"]","Altered sensorium","[\"Essentially normal\",\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"NONE\"]","[\"Clubbing\",\"NONE\"]","[\"NONE\"]","no","","TEST","27");



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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_complaints VALUES("17","5","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Prenatal","1","","Pending","2024-04-17 16:12:29");
INSERT INTO tbl_complaints VALUES("18","22","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Vaccination and Immunization","1","","Pending","2024-04-17 16:16:00");
INSERT INTO tbl_complaints VALUES("19","25","High fever","1","110/120","1","1kg","1","20°C","1","Follow-up visit","Checkup","1","","Pending","2024-04-17 16:19:00");
INSERT INTO tbl_complaints VALUES("20","3","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Maternity","1","","Pending","2024-04-17 16:20:31");
INSERT INTO tbl_complaints VALUES("21","23","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Prenatal","1","","Pending","2024-04-17 16:21:35");
INSERT INTO tbl_complaints VALUES("22","26","1","1","1","1","1kg","1","1°C","1","New admission","Prenatal","1","","Pending","2024-04-17 16:23:38");
INSERT INTO tbl_complaints VALUES("23","27","1","1","110/120","11","1kg","11","35°C","1","New admission","Checkup","1","","Done","2024-04-18 07:15:06");
INSERT INTO tbl_complaints VALUES("24","28","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Animal bite and Care","1","","Pending","2024-04-18 07:18:17");
INSERT INTO tbl_complaints VALUES("25","29","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Vaccination and Immunization","1","","Pending","2024-04-18 07:36:49");
INSERT INTO tbl_complaints VALUES("26","30","1","1","1","1","1kg","1","1°C","1","Follow-up visit","Vaccination and Immunization","RIchard","","Pending","2024-04-18 07:38:29");
INSERT INTO tbl_complaints VALUES("27","31","dsa","dsa","110/120","3312","60kg","2","21°C","312","Follow-up visit","Checkup","RIchard","admit","Done","2024-04-29 08:59:43");
INSERT INTO tbl_complaints VALUES("28","34","LENONDSADSA","LENONDSADSA","110/120","0","12kg","0","35°C","123","New consultation/case","Prenatal","LENONDSADSA","","Pending","2024-05-03 12:11:27");



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

INSERT INTO tbl_doctor_schedule VALUES("2","9","Wednesday","10:00:00","14:00:00","1");
INSERT INTO tbl_doctor_schedule VALUES("3","9","Monday","09:00:00","13:00:00","0");



DROP TABLE IF EXISTS tbl_family;

CREATE TABLE `tbl_family` (
  `famID` int(11) NOT NULL AUTO_INCREMENT,
  `brgy` varchar(255) NOT NULL,
  `purok` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`famID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_family VALUES("11","Bayasong","pagkakaisa","sultan kudarat");
INSERT INTO tbl_family VALUES("12","Sisiman","menzi","sultan kudarat");
INSERT INTO tbl_family VALUES("16","Sisiman","Registration","Registration");
INSERT INTO tbl_family VALUES("17","Lut Proper","mastbate","SOUTH COTABATO");
INSERT INTO tbl_family VALUES("18","Sampao","soledad","sultan kudarat");
INSERT INTO tbl_family VALUES("19","Maindang","Purok","Purok");
INSERT INTO tbl_family VALUES("20","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("21","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("22","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("23","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("24","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("25","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("26","Sampao","Riverside","Sultan Kudarat");
INSERT INTO tbl_family VALUES("27","Sampao","Test","Sul");
INSERT INTO tbl_family VALUES("28","Sampao","Test","Sultan Kudarat");
INSERT INTO tbl_family VALUES("29","Blingkong","Adas","Davao");
INSERT INTO tbl_family VALUES("30","Bayasong","Joven Rey","Joven Rey");
INSERT INTO tbl_family VALUES("32","Punol","As","Davao");
INSERT INTO tbl_family VALUES("33","Punol","As","Davao");
INSERT INTO tbl_family VALUES("36","Blingkong","Joven Rey","Davao");
INSERT INTO tbl_family VALUES("37","Sampao","$_session[\'status\'] = \"patient Name Already Exists\";\n    $_session[\'status_code\'] = \"error\";","Select Province");
INSERT INTO tbl_family VALUES("38","Palavilla","Masagana","Sultan Kudarat");
INSERT INTO tbl_family VALUES("39","Punol","Denmark","Denmark");
INSERT INTO tbl_family VALUES("40","Tananzang","Sunshine","Sultan Kudarat");
INSERT INTO tbl_family VALUES("41","Lut Proper","Test","Sultan Kudarat");
INSERT INTO tbl_family VALUES("42","Sampao","Danna","Select Province");
INSERT INTO tbl_family VALUES("43","Tananzang","Hansel","South Cotabato");
INSERT INTO tbl_family VALUES("44","Blingkong","Lex","South Cotabato");
INSERT INTO tbl_family VALUES("45","Bayasong","1","Davao");
INSERT INTO tbl_family VALUES("46","Blingkong","Masagana","Sultan Kudarat");
INSERT INTO tbl_family VALUES("47","Bayasong","Fdsa","South Cotabato");
INSERT INTO tbl_family VALUES("48","Blingkong","Lenondsadsa","Davao");



DROP TABLE IF EXISTS tbl_immunization_records;

CREATE TABLE `tbl_immunization_records` (
  `immunID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `immunization_name` varchar(100) NOT NULL,
  `immunization_date` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`immunID`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_immunization_records VALUES("1","1","azratika","2024-04-09","test");



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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicine_details VALUES("17","5","ml","98");
INSERT INTO tbl_medicine_details VALUES("18","6","mg","50");
INSERT INTO tbl_medicine_details VALUES("19","8","ml","20");
INSERT INTO tbl_medicine_details VALUES("20","7","mg","20");
INSERT INTO tbl_medicine_details VALUES("21","9","tablet","99");
INSERT INTO tbl_medicine_details VALUES("22","12","ml","100");



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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_medicines VALUES("7","Paracetamol","Paracetamolparacetamol","Unilab","Antibiotics","2024-01-04","2027-08-04","Unilab","Unilab","2024-04-15 15:25:42");
INSERT INTO tbl_medicines VALUES("8","Amoxicillin","Amoxicillin","Amoxicillin","Anticoagulants","2024-09-04","2029-05-04","Amoxicillin","Amoxicillin","2024-04-15 15:29:35");
INSERT INTO tbl_medicines VALUES("9","Ativan","Ativan","Ativan","Bronchodilators","0000-00-00","2029-06-04","Ativan","Ativan","2024-04-15 15:36:43");
INSERT INTO tbl_medicines VALUES("10","Azithromycin","Azit","Azithromycin","Analgesics","2024-01-04","2029-05-04","Azithromycin","Azithromycin","2024-04-15 15:46:48");
INSERT INTO tbl_medicines VALUES("11","Bio-flu","Fd","Fdsaf","Analgesics","0000-00-00","2025-03-04","tes","test","2024-04-29 08:55:48");
INSERT INTO tbl_medicines VALUES("12","Boi-gesic","Boi-gesic","Boi-gesic","Antibiotics","2024-03-05","2029-02-05","boi-gesic","boi-gesic","2024-05-03 08:52:24");



DROP TABLE IF EXISTS tbl_membership_info;

CREATE TABLE `tbl_membership_info` (
  `membershipID` int(11) NOT NULL AUTO_INCREMENT,
  `phil_mem` varchar(50) NOT NULL,
  `philhealth_no` varchar(255) NOT NULL,
  `phil_membership` varchar(100) NOT NULL,
  `ps_mem` varchar(20) NOT NULL,
  PRIMARY KEY (`membershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_membership_info VALUES("10","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("11","Yes","123645879","Member","4PS");
INSERT INTO tbl_membership_info VALUES("15","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("16","Yes","1231231","Member","LGU");
INSERT INTO tbl_membership_info VALUES("17","No","","","Private");
INSERT INTO tbl_membership_info VALUES("18","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("19","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("20","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("21","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("22","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("23","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("24","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("25","Yes","0624698965","Dependent","Private");
INSERT INTO tbl_membership_info VALUES("26","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("27","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("28","No","","","NHTS");
INSERT INTO tbl_membership_info VALUES("29","No","","","4PS");
INSERT INTO tbl_membership_info VALUES("31","No","","","Private");
INSERT INTO tbl_membership_info VALUES("32","No","","","Private");
INSERT INTO tbl_membership_info VALUES("34","No","","","4PS");
INSERT INTO tbl_membership_info VALUES("35","No","","","4PS");
INSERT INTO tbl_membership_info VALUES("36","No","","","4PS");
INSERT INTO tbl_membership_info VALUES("37","No","","","4PS");
INSERT INTO tbl_membership_info VALUES("38","No","","","");
INSERT INTO tbl_membership_info VALUES("39","No","","","LGU");
INSERT INTO tbl_membership_info VALUES("40","Yes","0624698965","Member","4PS");
INSERT INTO tbl_membership_info VALUES("41","Yes","1231231","Member","4PS");
INSERT INTO tbl_membership_info VALUES("42","Yes","00000001","","Private");
INSERT INTO tbl_membership_info VALUES("43","No","","","[\"NHTS\",\"4PS\",\"LGU\",");
INSERT INTO tbl_membership_info VALUES("44","No","","","[\"NHTS\"]");
INSERT INTO tbl_membership_info VALUES("45","No","","","\"4PS\"");
INSERT INTO tbl_membership_info VALUES("46","No","","","[\"NHTS\"]");



DROP TABLE IF EXISTS tbl_patient_medication_history;

CREATE TABLE `tbl_patient_medication_history` (
  `patient_med_historyID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_visit_id` int(11) NOT NULL,
  `medicine_details_id` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  `mg_ml` varchar(10) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `advice` varchar(255) NOT NULL,
  PRIMARY KEY (`patient_med_historyID`),
  KEY `patient_visit_id` (`patient_visit_id`),
  KEY `medicine_details_id` (`medicine_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_medication_history VALUES("1","20","21","1","2x a day","mg","2 days","2 days");
INSERT INTO tbl_patient_medication_history VALUES("2","20","21","1","2x a day","mg","2 days","2 days");
INSERT INTO tbl_patient_medication_history VALUES("3","21","17","1","1","1","1","1");
INSERT INTO tbl_patient_medication_history VALUES("4","21","17","1","1","1","1","1");



DROP TABLE IF EXISTS tbl_patient_visits;

CREATE TABLE `tbl_patient_visits` (
  `patient_visitID` int(11) NOT NULL AUTO_INCREMENT,
  `visit_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `disease` varchar(30) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_visitID`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patient_visits VALUES("20","2024-04-19","2024-04-23","fever","24","5");
INSERT INTO tbl_patient_visits VALUES("21","2024-04-19","2024-04-24","fever","24","5");



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
  `date_of_birth` date NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_patients VALUES("3","16","15","","Registration","Registration","Registration","Registration","Registration","Registration","0000000003","2024-02-04","5","+63910325346","Other","Single","A+","Elementary","Registration","Filipino","2024-04-16 09:15:28","4");
INSERT INTO tbl_patients VALUES("4","17","16","","Jonah","d","masbate","","fdsa","robert","0000000004","2004-04-15","22","+63095311671","Female","Single","A-","No Formal Education","123","Asian","2024-04-16 10:39:48","4");
INSERT INTO tbl_patients VALUES("5","18","17","","Soledad","b","medterm","","Patient","Patient","0000000005","2014-04-09","34","+63910325346","Female","Single","AB","Elementary","Employement Status","Asian","2024-04-16 10:50:31","2");
INSERT INTO tbl_patients VALUES("22","36","34","00456","Joven Rey","","Flores","","Joven Rey","Joven Rey","0000000014","2024-02-04","5","+63096778195","Male","Single","A-","Elementary","Joven Rey","Filipino","2024-04-17 15:04:37","2");
INSERT INTO tbl_patients VALUES("23","37","35","458","Lorena","ALCANTARA","LACIA","","Joven Rey","pablito","0000000023","2024-02-04","5","+63910325346","Other","Separated","A-","High School","emp status","Asian","2024-04-17 15:15:53","4");
INSERT INTO tbl_patients VALUES("24","38","36","458","Piolo","b","alhibab","","alburas","alburas","0000000024","2010-04-01","25","+63910325346","Other","Married","A-","No Formal Education","alburas","Asian","2024-04-17 15:25:57","4");
INSERT INTO tbl_patients VALUES("25","39","37","458","Denmark","","labander","","denmark","denmark","0000000025","2024-04-03","0","+63910325346","Male","Married","A+","","denmark","Asian","2024-04-17 16:18:12","2");
INSERT INTO tbl_patients VALUES("26","40","38","459","Sunshine","s","cruz","","sunshine","sunshone","0000000026","1993-06-04","31","+63912321313","Female","Married","A-","College Graduate","emp status","Asian","2024-04-17 16:22:48","4");
INSERT INTO tbl_patients VALUES("27","41","39","461","James","t","laput","","test","test","0000000027","1990-04-10","33","+63912312313","Male","Single","A+","Elementary","test","Asian","2024-04-18 07:14:48","2");
INSERT INTO tbl_patients VALUES("28","42","40","464","Danna","b","bianca","","danna","danna","0000000028","2024-02-04","0","+63910325346","Other","Married","A-","No Formal Education","danna","Filipino","2024-04-18 07:17:25","2");
INSERT INTO tbl_patients VALUES("29","43","41","466","Hansel","f","Sugae","","hansela","hanselo","0000000029","1991-09-04","33","+63095311671","Male","Single","O-","College Level","test","Filipino","2024-04-18 07:25:02","2");
INSERT INTO tbl_patients VALUES("30","44","42","469","Lex","","sur","","lex","lex","0000000030","1993-04-06","30","+63095311671","Male","Married","B+","High School","lex","Filipino","2024-04-18 07:38:05","2");
INSERT INTO tbl_patients VALUES("31","45","43","469","Shelaa","1","1","1","eleonora","pablito","0000000031","2024-02-04","0","+63096778195","Other","Married","A-","Elementary","Employement Status","Filipino","2024-04-25 16:17:57","5");
INSERT INTO tbl_patients VALUES("32","46","44","11","Sandre","","bunot","","Patient","pablito","0000000032","0000-00-00","19","+63910325346","Male","Single","A-","Elementary","emp status","Asian","2024-04-29 09:17:07","5");
INSERT INTO tbl_patients VALUES("34","48","46","12","Lenondsadsa","","LENONDSADSA","","LENONDSADSA","LENONDSADSA","0000000033","2024-01-05","0","+63096778195","Other","Married","A-","High School","LENONDSADSA","Filipino","2024-05-03 12:11:10","8");



DROP TABLE IF EXISTS tbl_personnel;

CREATE TABLE `tbl_personnel` (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_personnel VALUES("1","admin","M.","admin","Koronadal City","admin@gmail.com","+639645563132");
INSERT INTO tbl_personnel VALUES("2","BHWbarangay","V.","Rey","+634_________","admin123@gmail.com","+632131231237");
INSERT INTO tbl_personnel VALUES("7","Rhu","R.","Rhu","Koronadal City , South Cotabato","RHU@gmail.com","+631232131321");
INSERT INTO tbl_personnel VALUES("8","Elleen","","Tunguia","+634744477477","elleen@gmail.com","Koronadal City , South Cotabato");
INSERT INTO tbl_personnel VALUES("9","doctor","","doctor","09653231547","doctor@gmail.com","koronadal city");
INSERT INTO tbl_personnel VALUES("10","1","131","11","1","1@gmail.com","+632989656323");



DROP TABLE IF EXISTS tbl_physical_exam;

CREATE TABLE `tbl_physical_exam` (
  `physical_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `birth_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS tbl_position;

CREATE TABLE `tbl_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `PositionName` varchar(100) NOT NULL,
  `Specialty` varchar(100) NOT NULL,
  `ProfessionalType` varchar(100) NOT NULL,
  `LicenseNo` varchar(255) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_position VALUES("1","1","","","","");
INSERT INTO tbl_position VALUES("2","2","","","","");
INSERT INTO tbl_position VALUES("7","7","","","","");
INSERT INTO tbl_position VALUES("8","8","","","","");
INSERT INTO tbl_position VALUES("9","9","Registereddoctor","Cardiology","doctor","RN123456");
INSERT INTO tbl_position VALUES("10","10","1","1","1","1");



DROP TABLE IF EXISTS tbl_prenatal;

CREATE TABLE `tbl_prenatal` (
  `prenatalID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `chief_complaint` varchar(30) NOT NULL,
  `attending_physician` varchar(30) NOT NULL,
  `lmp` varchar(30) NOT NULL,
  `edc_by_lmp` varchar(30) NOT NULL,
  `fhr` varchar(30) NOT NULL,
  `ga_by_utz` varchar(30) NOT NULL,
  `pregnancy_age` varchar(30) NOT NULL,
  `biparietal_diameter` varchar(30) NOT NULL,
  `biparietal_eq` varchar(30) NOT NULL,
  `head_circumference_eq` varchar(30) NOT NULL,
  `abdominal_circumference_eq` varchar(30) NOT NULL,
  `femoral_length` varchar(30) NOT NULL,
  `femoral_length_eq` varchar(30) NOT NULL,
  `crown_rump_length` varchar(30) NOT NULL,
  `crown_rump_length_eq` varchar(30) NOT NULL,
  `mean_gest_sac_diameter` varchar(30) NOT NULL,
  `average_fetal_weight` varchar(30) NOT NULL,
  `gestation` varchar(30) NOT NULL,
  `presentation_lie` varchar(30) NOT NULL,
  `amniotic_fluid` varchar(30) NOT NULL,
  `placenta_location` varchar(30) NOT NULL,
  `previa` varchar(30) NOT NULL,
  `placenta_grade` varchar(30) NOT NULL,
  `fetal_activity` varchar(30) NOT NULL,
  `comments` varchar(30) NOT NULL,
  `radiologist` varchar(30) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`prenatalID`),
  KEY `user_id` (`user_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_prenatal VALUES("1","2024-03-13","","","","","","","","","","","","","","","","","","","","","","","","","","","31","0");
INSERT INTO tbl_prenatal VALUES("2","2024-05-01","","","100","","","","","","","","","","","","","","","","","","","","","","","","31","0");



DROP TABLE IF EXISTS tbl_referrals;

CREATE TABLE `tbl_referrals` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `referral_date` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`referral_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `tbl_referrals_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tbl_patients` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_log VALUES("1","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:32:09","09-05-2024 09:53:48 AM","1");
INSERT INTO tbl_user_log VALUES("2","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:53:57","09-05-2024 09:55:20 AM","1");
INSERT INTO tbl_user_log VALUES("3","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 09:55:26","09-05-2024 12:37:15 PM","1");
INSERT INTO tbl_user_log VALUES("4","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 10:00:18","","1");
INSERT INTO tbl_user_log VALUES("5","7","RHU","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:09:59","","1");
INSERT INTO tbl_user_log VALUES("6","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-09 16:27:55","","1");



DROP TABLE IF EXISTS tbl_user_page;

CREATE TABLE `tbl_user_page` (
  `userpageID` int(11) NOT NULL AUTO_INCREMENT,
  `home_img` varchar(100) NOT NULL,
  `sidebar` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userpageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_page VALUES("1","mh1.JPG","BRGY. PALABILLA","2");
INSERT INTO tbl_user_page VALUES("2","pngtree-hospital-png-image_7189460.png","BRGY. LAMPARE","8");



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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_users VALUES("1","admin","Admin","$2y$10$FOcIODTGfrFVZh9Lxx6Vt.rqoHPyouOqNBpJQUkA0ndhM0nxaD162","Active","profile.jpg","1","1","0","2024-04-24 16:39:15");
INSERT INTO tbl_users VALUES("2","joven","BHW","$2y$10$JH9tQEc2.qy41dNmMyAGceLpdDlYTOeKZ.yfGjdWbbaIUDVTd8Rqa","Active","background.jpg","2","2","1","2024-04-24 17:04:41");
INSERT INTO tbl_users VALUES("7","RHU","RHU","$2y$10$ehLPhriWqs5z5eO4xyLi3.85Yah2IxqaF79IZ9k.eHaeb2teIFEaK","Active","1.png","7","7","0","2024-05-02 10:55:03");
INSERT INTO tbl_users VALUES("8","test","BHW","$2y$10$v9j9JivVaDTc8dD8cnSx/et9WOqwhJUzp20Y8GI2dMKArmKgsJMma","Active","66288c45c3395.jpg","8","8","2","2024-05-02 13:15:38");
INSERT INTO tbl_users VALUES("9","doctor","Doctor","$2y$10$AAE0a1Q0yE4/PugxNyXzk.FZ02/VSDWYr3UFv5sTOK7HHY9FaS67i","Active","doctor.jpg","9","9","0","2024-05-07 15:01:44");



