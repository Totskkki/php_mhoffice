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

INSERT INTO tbl_birth_info VALUES("1","0","2024-04-01","","","","","","","","","","","","","","","","","","","","","","");
INSERT INTO tbl_birth_info VALUES("2","31","2024-04-09","24:54:23","","","","10","","","","","","","","","","","","","1","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_personnel VALUES("1","admin","M.","admin","Koronadal City","admin@gmail.com","+639645563132");
INSERT INTO tbl_personnel VALUES("2","BHWbarangay","V.","Rey","+634_________","admin123@gmail.com","+632131231237");
INSERT INTO tbl_personnel VALUES("7","Rhu","R.","Rhu","Koronadal City , South Cotabato","RHU@gmail.com","+631232131321");
INSERT INTO tbl_personnel VALUES("8","Elleen","","Tunguia","+634744477477","elleen@gmail.com","Koronadal City , South Cotabato");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_position VALUES("1","1","","","","");
INSERT INTO tbl_position VALUES("2","2","","","","");
INSERT INTO tbl_position VALUES("7","7","","","","");
INSERT INTO tbl_position VALUES("8","8","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_referrals VALUES("25","26","2024-05-03");
INSERT INTO tbl_referrals VALUES("26","27","2024-05-02");
INSERT INTO tbl_referrals VALUES("27","22","2024-05-01");
INSERT INTO tbl_referrals VALUES("28","29","2024-05-01");
INSERT INTO tbl_referrals VALUES("29","3","2024-05-01");
INSERT INTO tbl_referrals VALUES("31","5","2024-05-01");
INSERT INTO tbl_referrals VALUES("32","28","2024-05-02");
INSERT INTO tbl_referrals VALUES("33","25","2024-05-03");
INSERT INTO tbl_referrals VALUES("34","25","2024-05-02");
INSERT INTO tbl_referrals VALUES("35","5","2024-05-02");
INSERT INTO tbl_referrals VALUES("36","32","2024-05-02");
INSERT INTO tbl_referrals VALUES("37","31","2024-05-03");
INSERT INTO tbl_referrals VALUES("38","4","2024-05-06");
INSERT INTO tbl_referrals VALUES("39","30","2024-05-07");
INSERT INTO tbl_referrals VALUES("40","25","2024-05-07");



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
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_user_log VALUES("176","4","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 13:11:05","18-04-2024 01:22:43 PM","1");
INSERT INTO tbl_user_log VALUES("177","1","administrator","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 13:21:50","","1");
INSERT INTO tbl_user_log VALUES("178","1","administrator","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 13:21:52","18-04-2024 01:24:43 PM","1");
INSERT INTO tbl_user_log VALUES("179","2","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 13:24:55","18-04-2024 01:38:42 PM","1");
INSERT INTO tbl_user_log VALUES("180","2","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 13:38:49","18-04-2024 02:48:03 PM","1");
INSERT INTO tbl_user_log VALUES("181","3","mho","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 14:48:10","","1");
INSERT INTO tbl_user_log VALUES("182","1","administrator","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-18 15:16:19","18-04-2024 04:14:34 PM","1");
INSERT INTO tbl_user_log VALUES("183","3","mho","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 09:50:17","","1");
INSERT INTO tbl_user_log VALUES("184","","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:38:02","","0");
INSERT INTO tbl_user_log VALUES("185","1","administrator","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:38:07","","1");
INSERT INTO tbl_user_log VALUES("186","4","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:39:35","19-04-2024 10:41:50 AM","1");
INSERT INTO tbl_user_log VALUES("187","2","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:42:02","19-04-2024 10:43:13 AM","1");
INSERT INTO tbl_user_log VALUES("188","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:43:19","","0");
INSERT INTO tbl_user_log VALUES("189","","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:43:25","","0");
INSERT INTO tbl_user_log VALUES("190","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:44:07","","0");
INSERT INTO tbl_user_log VALUES("191","4","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:49:02","19-04-2024 10:49:27 AM","1");
INSERT INTO tbl_user_log VALUES("192","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:49:37","","0");
INSERT INTO tbl_user_log VALUES("193","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:50:45","","0");
INSERT INTO tbl_user_log VALUES("194","","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:53:38","","0");
INSERT INTO tbl_user_log VALUES("195","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:53:48","","0");
INSERT INTO tbl_user_log VALUES("196","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:55:26","19-04-2024 10:56:14 AM","1");
INSERT INTO tbl_user_log VALUES("197","4","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:56:25","19-04-2024 10:59:47 AM","1");
INSERT INTO tbl_user_log VALUES("198","4","elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 10:59:54","19-04-2024 10:59:57 AM","1");
INSERT INTO tbl_user_log VALUES("199","3","mho","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 11:00:07","19-04-2024 11:34:11 AM","1");
INSERT INTO tbl_user_log VALUES("200","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 11:34:15","19-04-2024 11:57:58 AM","1");
INSERT INTO tbl_user_log VALUES("201","3","mho","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-19 11:58:14","","1");
INSERT INTO tbl_user_log VALUES("202","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-20 12:31:07","20-04-2024 12:38:39 PM","1");
INSERT INTO tbl_user_log VALUES("203","","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 09:40:13","","0");
INSERT INTO tbl_user_log VALUES("204","","admin123","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 09:40:18","","0");
INSERT INTO tbl_user_log VALUES("205","","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 09:40:22","","0");
INSERT INTO tbl_user_log VALUES("206","1","administrator","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 09:40:27","","1");
INSERT INTO tbl_user_log VALUES("207","23","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 10:06:26","23-04-2024 10:07:20 AM","1");
INSERT INTO tbl_user_log VALUES("208","23","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 10:07:24","","1");
INSERT INTO tbl_user_log VALUES("209","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 10:10:17","","1");
INSERT INTO tbl_user_log VALUES("210","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 10:49:38","23-04-2024 02:12:40 PM","1");
INSERT INTO tbl_user_log VALUES("211","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 14:12:46","","1");
INSERT INTO tbl_user_log VALUES("212","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 15:21:36","23-04-2024 03:21:41 PM","1");
INSERT INTO tbl_user_log VALUES("213","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 15:21:51","23-04-2024 03:36:47 PM","1");
INSERT INTO tbl_user_log VALUES("214","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 15:28:54","","1");
INSERT INTO tbl_user_log VALUES("215","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 15:36:55","23-04-2024 03:51:57 PM","1");
INSERT INTO tbl_user_log VALUES("216","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 15:52:03","23-04-2024 04:04:20 PM","1");
INSERT INTO tbl_user_log VALUES("217","2","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 16:04:25","01-05-2024 11:23:31 AM","1");
INSERT INTO tbl_user_log VALUES("218","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 16:04:45","","1");
INSERT INTO tbl_user_log VALUES("219","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-23 16:14:24","","1");
INSERT INTO tbl_user_log VALUES("220","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 07:43:07","","1");
INSERT INTO tbl_user_log VALUES("221","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 07:52:11","24-04-2024 09:25:41 AM","1");
INSERT INTO tbl_user_log VALUES("222","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:25:42","24-04-2024 09:46:13 AM","1");
INSERT INTO tbl_user_log VALUES("223","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:42:48","","0");
INSERT INTO tbl_user_log VALUES("224","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:43:00","","0");
INSERT INTO tbl_user_log VALUES("225","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:43:51","","0");
INSERT INTO tbl_user_log VALUES("226","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:44:09","","0");
INSERT INTO tbl_user_log VALUES("227","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:45:04","24-04-2024 09:45:18 AM","1");
INSERT INTO tbl_user_log VALUES("228","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:45:21","24-04-2024 09:45:56 AM","1");
INSERT INTO tbl_user_log VALUES("229","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:46:04","","1");
INSERT INTO tbl_user_log VALUES("230","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:46:07","","1");
INSERT INTO tbl_user_log VALUES("231","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:46:21","","1");
INSERT INTO tbl_user_log VALUES("232","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:46:29","24-04-2024 09:47:00 AM","1");
INSERT INTO tbl_user_log VALUES("233","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:47:30","24-04-2024 09:48:48 AM","1");
INSERT INTO tbl_user_log VALUES("234","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:47:45","24-04-2024 10:00:25 AM","1");
INSERT INTO tbl_user_log VALUES("235","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:48:53","24-04-2024 09:51:22 AM","1");
INSERT INTO tbl_user_log VALUES("236","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:51:25","24-04-2024 09:56:18 AM","1");
INSERT INTO tbl_user_log VALUES("237","","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:56:23","","0");
INSERT INTO tbl_user_log VALUES("238","3","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 09:56:50","24-04-2024 10:11:07 AM","1");
INSERT INTO tbl_user_log VALUES("239","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 10:00:26","24-04-2024 10:03:53 AM","1");
INSERT INTO tbl_user_log VALUES("240","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 10:03:57","24-04-2024 01:24:09 PM","1");
INSERT INTO tbl_user_log VALUES("241","3","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 10:11:09","24-04-2024 10:11:17 AM","1");
INSERT INTO tbl_user_log VALUES("242","3","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 10:11:19","24-04-2024 10:11:38 AM","1");
INSERT INTO tbl_user_log VALUES("243","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:24:11","","0");
INSERT INTO tbl_user_log VALUES("244","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:24:15","24-04-2024 01:27:33 PM","1");
INSERT INTO tbl_user_log VALUES("245","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:27:43","","1");
INSERT INTO tbl_user_log VALUES("246","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:28:00","24-04-2024 01:28:03 PM","1");
INSERT INTO tbl_user_log VALUES("247","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:28:12","","0");
INSERT INTO tbl_user_log VALUES("248","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:28:21","","0");
INSERT INTO tbl_user_log VALUES("249","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:28:28","","1");
INSERT INTO tbl_user_log VALUES("250","4","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:28:44","24-04-2024 01:43:50 PM","1");
INSERT INTO tbl_user_log VALUES("251","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 13:43:53","","0");
INSERT INTO tbl_user_log VALUES("252","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 15:01:49","","0");
INSERT INTO tbl_user_log VALUES("253","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 15:01:58","24-04-2024 04:40:00 PM","1");
INSERT INTO tbl_user_log VALUES("254","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 16:40:01","24-04-2024 05:07:11 PM","1");
INSERT INTO tbl_user_log VALUES("255","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-24 17:04:57","","1");
INSERT INTO tbl_user_log VALUES("256","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 07:25:19","","0");
INSERT INTO tbl_user_log VALUES("257","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 07:25:46","","1");
INSERT INTO tbl_user_log VALUES("258","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 07:28:21","25-04-2024 01:26:18 PM","1");
INSERT INTO tbl_user_log VALUES("259","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 14:29:07","25-04-2024 02:31:10 PM","1");
INSERT INTO tbl_user_log VALUES("260","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 14:31:03","","1");
INSERT INTO tbl_user_log VALUES("261","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 14:31:18","25-04-2024 02:32:26 PM","1");
INSERT INTO tbl_user_log VALUES("262","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 14:32:38","","1");
INSERT INTO tbl_user_log VALUES("263","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 14:34:11","25-04-2024 03:12:19 PM","1");
INSERT INTO tbl_user_log VALUES("264","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 15:12:25","25-04-2024 05:05:16 PM","1");
INSERT INTO tbl_user_log VALUES("265","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-25 16:14:19","","1");
INSERT INTO tbl_user_log VALUES("266","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-26 07:15:21","","1");
INSERT INTO tbl_user_log VALUES("267","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-26 12:17:55","26-04-2024 01:49:51 PM","1");
INSERT INTO tbl_user_log VALUES("268","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-26 12:40:40","","1");
INSERT INTO tbl_user_log VALUES("269","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-26 17:06:39","","1");
INSERT INTO tbl_user_log VALUES("270","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-27 08:58:15","","1");
INSERT INTO tbl_user_log VALUES("271","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-27 09:16:34","27-04-2024 11:42:21 AM","1");
INSERT INTO tbl_user_log VALUES("272","","Irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-27 12:45:32","","0");
INSERT INTO tbl_user_log VALUES("273","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-27 12:45:36","","1");
INSERT INTO tbl_user_log VALUES("274","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-27 13:50:28","","1");
INSERT INTO tbl_user_log VALUES("275","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 06:51:47","29-04-2024 08:58:27 AM","1");
INSERT INTO tbl_user_log VALUES("276","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 08:50:12","","1");
INSERT INTO tbl_user_log VALUES("277","","Elleen","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 08:58:32","","0");
INSERT INTO tbl_user_log VALUES("278","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 08:58:44","29-04-2024 09:32:29 AM","1");
INSERT INTO tbl_user_log VALUES("279","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:36:42","","0");
INSERT INTO tbl_user_log VALUES("280","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:36:56","29-04-2024 09:40:16 AM","1");
INSERT INTO tbl_user_log VALUES("281","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:40:17","29-04-2024 09:40:25 AM","1");
INSERT INTO tbl_user_log VALUES("282","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:40:33","29-04-2024 09:40:47 AM","1");
INSERT INTO tbl_user_log VALUES("283","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:40:50","29-04-2024 09:42:26 AM","1");
INSERT INTO tbl_user_log VALUES("284","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:42:29","29-04-2024 09:42:31 AM","1");
INSERT INTO tbl_user_log VALUES("285","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:42:37","29-04-2024 09:43:31 AM","1");
INSERT INTO tbl_user_log VALUES("286","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 09:43:32","","1");
INSERT INTO tbl_user_log VALUES("287","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 11:07:32","29-04-2024 01:23:44 PM","1");
INSERT INTO tbl_user_log VALUES("288","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-29 13:23:48","","1");
INSERT INTO tbl_user_log VALUES("289","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-30 15:56:23","","1");
INSERT INTO tbl_user_log VALUES("290","","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-30 16:05:49","","0");
INSERT INTO tbl_user_log VALUES("291","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-30 16:05:53","01-05-2024 02:45:44 PM","1");
INSERT INTO tbl_user_log VALUES("292","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-04-30 16:26:18","","1");
INSERT INTO tbl_user_log VALUES("293","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 07:08:29","","1");
INSERT INTO tbl_user_log VALUES("294","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 11:23:36","","1");
INSERT INTO tbl_user_log VALUES("295","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 12:21:39","01-05-2024 12:21:45 PM","1");
INSERT INTO tbl_user_log VALUES("296","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 12:21:49","01-05-2024 12:22:03 PM","1");
INSERT INTO tbl_user_log VALUES("297","5","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 12:22:07","01-05-2024 12:26:29 PM","1");
INSERT INTO tbl_user_log VALUES("298","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 12:26:34","","1");
INSERT INTO tbl_user_log VALUES("299","1","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:45:49","","1");
INSERT INTO tbl_user_log VALUES("300","1","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:46:36","01-05-2024 02:46:41 PM","1");
INSERT INTO tbl_user_log VALUES("301","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:46:47","01-05-2024 02:47:50 PM","1");
INSERT INTO tbl_user_log VALUES("302","1","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:47:13","","1");
INSERT INTO tbl_user_log VALUES("303","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:47:56","01-05-2024 02:48:49 PM","1");
INSERT INTO tbl_user_log VALUES("304","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:48:20","","1");
INSERT INTO tbl_user_log VALUES("305","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-01 14:48:52","02-05-2024 10:40:32 AM","1");
INSERT INTO tbl_user_log VALUES("306","6","irlan","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 09:46:06","","1");
INSERT INTO tbl_user_log VALUES("307","1","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:40:36","","1");
INSERT INTO tbl_user_log VALUES("308","1","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:40:45","","1");
INSERT INTO tbl_user_log VALUES("309","6","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:43:14","02-05-2024 10:47:36 AM","1");
INSERT INTO tbl_user_log VALUES("310","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:47:39","02-05-2024 11:18:10 AM","1");
INSERT INTO tbl_user_log VALUES("311","2","Joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:50:19","02-05-2024 10:55:15 AM","1");
INSERT INTO tbl_user_log VALUES("312","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 10:55:22","02-05-2024 11:06:26 AM","1");
INSERT INTO tbl_user_log VALUES("313","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 11:06:35","02-05-2024 11:13:36 AM","1");
INSERT INTO tbl_user_log VALUES("314","","rhu","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 11:13:46","","0");
INSERT INTO tbl_user_log VALUES("315","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 11:13:54","02-05-2024 11:16:21 AM","1");
INSERT INTO tbl_user_log VALUES("316","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 11:16:25","02-05-2024 11:29:00 AM","1");
INSERT INTO tbl_user_log VALUES("317","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 11:29:12","02-05-2024 01:15:57 PM","1");
INSERT INTO tbl_user_log VALUES("318","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:15:14","","1");
INSERT INTO tbl_user_log VALUES("319","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:16:01","02-05-2024 01:27:13 PM","1");
INSERT INTO tbl_user_log VALUES("320","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:27:17","02-05-2024 01:27:49 PM","1");
INSERT INTO tbl_user_log VALUES("321","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:27:51","02-05-2024 01:29:03 PM","1");
INSERT INTO tbl_user_log VALUES("322","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:29:05","02-05-2024 01:29:09 PM","1");
INSERT INTO tbl_user_log VALUES("323","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:29:12","02-05-2024 01:34:22 PM","1");
INSERT INTO tbl_user_log VALUES("324","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:34:24","02-05-2024 01:35:26 PM","1");
INSERT INTO tbl_user_log VALUES("325","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:35:32","02-05-2024 01:36:42 PM","1");
INSERT INTO tbl_user_log VALUES("326","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:36:44","02-05-2024 01:40:27 PM","1");
INSERT INTO tbl_user_log VALUES("327","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:40:30","02-05-2024 01:45:44 PM","1");
INSERT INTO tbl_user_log VALUES("328","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:45:45","02-05-2024 01:50:36 PM","1");
INSERT INTO tbl_user_log VALUES("329","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:50:41","02-05-2024 01:57:29 PM","1");
INSERT INTO tbl_user_log VALUES("330","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:57:31","02-05-2024 01:58:01 PM","1");
INSERT INTO tbl_user_log VALUES("331","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:58:03","02-05-2024 01:58:06 PM","1");
INSERT INTO tbl_user_log VALUES("332","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 13:58:10","02-05-2024 02:07:42 PM","1");
INSERT INTO tbl_user_log VALUES("333","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 14:07:43","02-05-2024 02:13:27 PM","1");
INSERT INTO tbl_user_log VALUES("334","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-02 14:13:37","02-05-2024 03:42:55 PM","1");
INSERT INTO tbl_user_log VALUES("335","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:09:16","03-05-2024 08:49:47 AM","1");
INSERT INTO tbl_user_log VALUES("336","","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:51:41","","0");
INSERT INTO tbl_user_log VALUES("337","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:51:44","03-05-2024 08:55:11 AM","1");
INSERT INTO tbl_user_log VALUES("338","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:55:17","03-05-2024 08:56:26 AM","1");
INSERT INTO tbl_user_log VALUES("339","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:56:33","03-05-2024 08:56:43 AM","1");
INSERT INTO tbl_user_log VALUES("340","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 08:56:55","03-05-2024 09:00:56 AM","1");
INSERT INTO tbl_user_log VALUES("341","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 09:10:51","03-05-2024 09:41:45 AM","1");
INSERT INTO tbl_user_log VALUES("342","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 11:07:21","","1");
INSERT INTO tbl_user_log VALUES("343","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 11:07:32","03-05-2024 11:07:38 AM","1");
INSERT INTO tbl_user_log VALUES("344","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 11:07:45","","1");
INSERT INTO tbl_user_log VALUES("345","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-03 12:08:11","03-05-2024 12:12:13 PM","1");
INSERT INTO tbl_user_log VALUES("346","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:15:54","06-05-2024 02:18:38 PM","1");
INSERT INTO tbl_user_log VALUES("347","","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:30:24","","0");
INSERT INTO tbl_user_log VALUES("348","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:30:27","","1");
INSERT INTO tbl_user_log VALUES("349","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:31:30","06-05-2024 02:32:12 PM","1");
INSERT INTO tbl_user_log VALUES("350","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:41:29","","1");
INSERT INTO tbl_user_log VALUES("351","","test1","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:41:43","","0");
INSERT INTO tbl_user_log VALUES("352","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:42:01","06-05-2024 02:42:05 PM","1");
INSERT INTO tbl_user_log VALUES("353","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:42:10","","1");
INSERT INTO tbl_user_log VALUES("354","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 14:42:21","06-05-2024 03:19:57 PM","1");
INSERT INTO tbl_user_log VALUES("355","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 15:19:59","06-05-2024 03:27:18 PM","1");
INSERT INTO tbl_user_log VALUES("356","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 15:27:25","06-05-2024 04:13:34 PM","1");
INSERT INTO tbl_user_log VALUES("357","1","admin","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:06:29","","1");
INSERT INTO tbl_user_log VALUES("358","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:14:34","06-05-2024 04:15:53 PM","1");
INSERT INTO tbl_user_log VALUES("359","2","joven","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:15:57","06-05-2024 04:18:21 PM","1");
INSERT INTO tbl_user_log VALUES("360","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:18:29","06-05-2024 04:20:00 PM","1");
INSERT INTO tbl_user_log VALUES("361","8","test","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:20:01","06-05-2024 04:24:38 PM","1");
INSERT INTO tbl_user_log VALUES("362","7","RHU","::1\0\0\0\0\0\0\0\0\0\0\0\0\0","2024-05-06 16:24:47","","1");
INSERT INTO tbl_user_log VALUES("363","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 07:47:46","07-05-2024 08:15:44 AM","1");
INSERT INTO tbl_user_log VALUES("364","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 08:15:48","07-05-2024 08:45:32 AM","1");
INSERT INTO tbl_user_log VALUES("365","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 08:45:35","07-05-2024 08:53:29 AM","1");
INSERT INTO tbl_user_log VALUES("366","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 08:53:33","07-05-2024 08:54:33 AM","1");
INSERT INTO tbl_user_log VALUES("367","8","test","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 08:54:36","07-05-2024 08:54:54 AM","1");
INSERT INTO tbl_user_log VALUES("368","2","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 08:54:59","07-05-2024 08:56:48 AM","1");
INSERT INTO tbl_user_log VALUES("369","","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 09:02:40","","0");
INSERT INTO tbl_user_log VALUES("370","","joven","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 09:03:42","","0");
INSERT INTO tbl_user_log VALUES("371","1","admin","127.0.0.1\0\0\0\0\0\0\0","2024-05-07 11:08:03","","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_users VALUES("1","admin","Admin","$2y$10$FOcIODTGfrFVZh9Lxx6Vt.rqoHPyouOqNBpJQUkA0ndhM0nxaD162","Active","profile.jpg","1","1","0","2024-04-24 16:39:15");
INSERT INTO tbl_users VALUES("2","joven","BHW","$2y$10$JH9tQEc2.qy41dNmMyAGceLpdDlYTOeKZ.yfGjdWbbaIUDVTd8Rqa","Active","background.jpg","2","2","1","2024-04-24 17:04:41");
INSERT INTO tbl_users VALUES("7","RHU","RHU","$2y$10$ehLPhriWqs5z5eO4xyLi3.85Yah2IxqaF79IZ9k.eHaeb2teIFEaK","Active","1.png","7","7","0","2024-05-02 10:55:03");
INSERT INTO tbl_users VALUES("8","test","BHW","$2y$10$v9j9JivVaDTc8dD8cnSx/et9WOqwhJUzp20Y8GI2dMKArmKgsJMma","Active","66288c45c3395.jpg","8","8","2","2024-05-02 13:15:38");



