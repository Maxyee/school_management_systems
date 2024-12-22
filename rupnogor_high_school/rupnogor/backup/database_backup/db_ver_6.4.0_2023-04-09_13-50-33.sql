#
# TABLE STRUCTURE FOR: alumni_events
#

DROP TABLE IF EXISTS `alumni_events`;

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section` varchar(255) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `event_notification_message` text NOT NULL,
  `show_onwebsite` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `alumni_events_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alumni_events_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: alumni_students
#

DROP TABLE IF EXISTS `alumni_students`;

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `current_email` varchar(255) NOT NULL,
  `current_phone` varchar(255) NOT NULL,
  `occupation` text NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `alumni_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: attendence_type
#

DROP TABLE IF EXISTS `attendence_type`;

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2016-06-23 14:11:37', '0000-00-00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2018-05-29 04:19:48', '0000-00-00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2016-06-23 14:12:28', '0000-00-00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2016-10-11 07:35:40', '0000-00-00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Holiday', 'H', 'yes', '2016-10-11 07:35:01', '0000-00-00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2016-06-23 14:12:28', '0000-00-00');


#
# TABLE STRUCTURE FOR: book_issues
#

DROP TABLE IF EXISTS `book_issues`;

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `duereturn_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `book_issues_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_issues_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `libarary_members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: books
#

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: captcha
#

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (1, 'userlogin', 0, '2021-01-19 03:10:29');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (2, 'login', 0, '2021-01-19 03:10:31');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (3, 'admission', 0, '2021-01-18 23:48:11');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (4, 'complain', 0, '2021-01-18 23:48:13');
INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES (5, 'contact_us', 0, '2021-01-18 23:48:15');


#
# TABLE STRUCTURE FOR: categories
#

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`, `created_at`, `updated_at`) VALUES (1, 'Sample Transfer Certificate', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2019__', '.................................<br>admin', '.................................<br>principal', '.................................<br>admin', '1678712038-1757669266640f1ce6ace5d!transfer.png', 2, 1, 360, 400, 480, 810, 1, 230, '2023-03-13 08:53:58', '0000-00-00');


#
# TABLE STRUCTURE FOR: chat_connections
#

DROP TABLE IF EXISTS `chat_connections`;

CREATE TABLE `chat_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_one` (`chat_user_one`),
  KEY `chat_user_two` (`chat_user_two`),
  CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: chat_messages
#

DROP TABLE IF EXISTS `chat_messages`;

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(1) DEFAULT 0,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_id` (`chat_user_id`),
  KEY `chat_connection_id` (`chat_connection_id`),
  CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: chat_users
#

DROP TABLE IF EXISTS `chat_users`;

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_student_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `student_id` (`student_id`),
  KEY `create_staff_id` (`create_staff_id`),
  KEY `create_student_id` (`create_student_id`),
  CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_3` FOREIGN KEY (`create_staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_4` FOREIGN KEY (`create_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: class_section_times
#

DROP TABLE IF EXISTS `class_section_times`;

CREATE TABLE `class_section_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_section_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  CONSTRAINT `class_section_times_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: class_sections
#

DROP TABLE IF EXISTS `class_sections`;

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `class_sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_sections_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'no', '2023-03-13 11:39:29', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 3, 'no', '2023-03-13 11:39:35', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (3, 3, 1, 'no', '2023-03-13 11:39:39', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (4, 4, 2, 'no', '2023-03-13 11:39:44', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (5, 4, 3, 'no', '2023-03-13 11:39:44', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (6, 5, 2, 'no', '2023-03-13 11:39:49', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (7, 6, 1, 'no', '2023-03-13 11:39:54', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (8, 7, 1, 'no', '2023-03-13 11:39:59', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (9, 8, 1, 'no', '2023-03-13 11:40:05', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (10, 9, 3, 'no', '2023-03-13 11:40:15', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (11, 10, 2, 'no', '2023-03-13 11:40:35', NULL);
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (12, 10, 3, 'no', '2023-03-13 11:40:35', NULL);


#
# TABLE STRUCTURE FOR: class_teacher
#

DROP TABLE IF EXISTS `class_teacher`;

CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `session_id` (`session_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `class_teacher_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teacher_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teacher_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teacher_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (1, 19, 1, 1, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (2, 19, 1, 1, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (3, 19, 1, 1, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (4, 19, 2, 3, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (5, 19, 2, 3, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (6, 19, 2, 3, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (7, 19, 3, 1, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (8, 19, 3, 1, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (9, 19, 3, 1, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (10, 19, 3, 1, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (11, 19, 3, 1, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (12, 19, 3, 1, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (13, 19, 4, 2, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (14, 19, 4, 2, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (15, 19, 4, 2, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (16, 19, 4, 2, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (17, 19, 4, 2, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (18, 19, 4, 2, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (19, 19, 4, 3, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (20, 19, 4, 3, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (21, 19, 4, 3, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (22, 19, 4, 3, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (23, 19, 4, 3, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (24, 19, 4, 3, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (25, 19, 5, 2, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (26, 19, 5, 2, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (27, 19, 5, 2, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (28, 19, 5, 2, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (29, 19, 5, 2, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (30, 19, 5, 2, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (31, 19, 6, 1, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (32, 19, 6, 1, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (33, 19, 6, 1, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (34, 19, 6, 1, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (35, 19, 6, 1, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (36, 19, 6, 1, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (37, 19, 7, 1, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (38, 19, 7, 1, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (39, 19, 7, 1, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (40, 19, 7, 1, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (41, 19, 7, 1, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (42, 19, 7, 1, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (43, 19, 8, 1, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (44, 19, 8, 1, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (45, 19, 8, 1, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (46, 19, 8, 1, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (47, 19, 8, 1, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (48, 19, 8, 1, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (49, 19, 9, 3, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (50, 19, 9, 3, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (51, 19, 9, 3, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (52, 19, 9, 3, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (53, 19, 9, 3, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (54, 19, 9, 3, 9);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (55, 19, 10, 3, 2);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (56, 19, 10, 3, 3);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (57, 19, 10, 3, 4);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (58, 19, 10, 3, 5);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (59, 19, 10, 3, 6);
INSERT INTO `class_teacher` (`id`, `session_id`, `class_id`, `section_id`, `staff_id`) VALUES (60, 19, 10, 3, 9);


#
# TABLE STRUCTURE FOR: classes
#

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (1, '1', 'no', '2023-03-13 11:39:29', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, '2', 'no', '2023-03-13 11:39:35', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (3, '3', 'no', '2023-03-13 11:39:39', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (4, '4', 'no', '2023-03-13 11:39:44', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (5, '5', 'no', '2023-03-13 11:39:49', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (6, '6', 'no', '2023-03-13 11:39:54', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (7, '7', 'no', '2023-03-13 11:39:59', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (8, '8', 'no', '2023-03-13 11:40:05', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (9, '9', 'no', '2023-03-13 11:40:15', NULL);
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (10, '10', 'no', '2023-03-13 11:40:35', NULL);


#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: conference_sections
#

DROP TABLE IF EXISTS `conference_sections`;

CREATE TABLE `conference_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) DEFAULT NULL,
  `cls_section_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conference_sections_ibfk_1` (`conference_id`),
  KEY `conference_sections_ibfk_2` (`cls_section_id`),
  CONSTRAINT `conference_sections_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conference_sections_ibfk_2` FOREIGN KEY (`cls_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: conference_staff
#

DROP TABLE IF EXISTS `conference_staff`;

CREATE TABLE `conference_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conference_staff_ibfk_1` (`conference_id`),
  KEY `conference_staff_ibfk_2` (`staff_id`),
  CONSTRAINT `conference_staff_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conference_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: conferences
#

DROP TABLE IF EXISTS `conferences`;

CREATE TABLE `conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(20) NOT NULL DEFAULT 'class',
  `staff_id` int(11) DEFAULT NULL,
  `created_id` int(10) NOT NULL,
  `title` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `class_id` int(10) DEFAULT NULL,
  `section_id` int(10) DEFAULT NULL,
  `session_id` int(10) NOT NULL,
  `host_video` int(1) NOT NULL DEFAULT 1,
  `client_video` int(1) NOT NULL DEFAULT 1,
  `description` varchar(50) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `return_response` text DEFAULT NULL,
  `api_type` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conferences_ibfk_1` (`staff_id`),
  KEY `conferences_ibfk_2` (`created_id`),
  CONSTRAINT `conferences_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_ibfk_2` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: conferences_history
#

DROP TABLE IF EXISTS `conferences_history`;

CREATE TABLE `conferences_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `total_hit` int(10) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conferences_history_ibfk_1` (`conference_id`),
  KEY `conferences_history_ibfk_2` (`staff_id`),
  KEY `conferences_history_ibfk_3` (`student_id`),
  CONSTRAINT `conferences_history_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `conferences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_history_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conferences_history_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: content_types
#

DROP TABLE IF EXISTS `content_types`;

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `class_id` (`class_id`),
  KEY `cls_sec_id` (`cls_sec_id`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_ibfk_3` FOREIGN KEY (`cls_sec_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: currencies
#

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `base_price` varchar(10) NOT NULL DEFAULT '1',
  `is_active` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (1, 'AED', 'AED', 'AEDf', '1', 0, '2022-12-30 01:19:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (2, 'AFN', 'AFN', '؋', '1', 0, '2022-12-30 01:19:19');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (3, 'ALL', 'ALL', 'ALL', '1', 0, '2022-12-30 01:19:22');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (4, 'AMD', 'AMD', 'AMD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (5, 'ANG', 'ANG', 'ANG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (6, 'AOA', 'AOA', 'AOA', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (7, 'ARS', 'ARS', 'ARS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (8, 'AUD', 'AUD', 'AUD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (9, 'AWG', 'AWG', 'AWG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (10, 'AZN', 'AZN', 'AZN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (11, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (12, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (13, 'BDT', 'BDT', 'BDT', '1', 1, '2023-03-13 03:20:20');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (14, 'BGN', 'BGN', 'BGN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (15, 'BHD', 'BHD', 'BHD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (16, 'BIF', 'BIF', 'BIF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (17, 'BMD', 'BMD', 'BMD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (18, 'BND', 'BND', 'BND', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (19, 'BOB', 'BOB', 'BOB', '1', 0, '2022-12-30 01:19:29');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (20, 'BOV', 'BOV', 'BOV', '1', 0, '2022-12-30 01:19:38');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (21, 'BRL', 'BRL', 'BRL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (22, 'BSD', 'BSD', 'BSD', '1', 0, '2022-12-30 01:19:40');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (23, 'BTN', 'BTN', 'BTN', '1', 0, '2022-12-30 01:19:42');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (24, 'BWP', 'BWP', 'BWP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (25, 'BYN', 'BYN', 'BYN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (26, 'BYR', 'BYR', 'BYR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (27, 'BZD', 'BZD', 'BZD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (28, 'CAD', 'CAD', 'CAD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (29, 'CDF', 'CDF', 'CDF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (30, 'CHE', 'CHE', 'CHE', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (31, 'CHF', 'CHF', 'CHF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (32, 'CHW', 'CHW', 'CHW', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (33, 'CLF', 'CLF', 'CLF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (34, 'CLP', 'CLP', 'CLP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (35, 'CNY', 'CNY', 'CNY', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (36, 'COP', 'COP', 'COP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (37, 'COU', 'COU', 'COU', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (38, 'CRC', 'CRC', 'CRC', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (39, 'CUC', 'CUC', 'CUC', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (40, 'CUP', 'CUP', 'CUP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (41, 'CVE', 'CVE', 'CVE', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (42, 'CZK', 'CZK', 'CZK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (43, 'DJF', 'DJF', 'DJF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (44, 'DKK', 'DKK', 'DKK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (45, 'DOP', 'DOP', 'DOP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (46, 'DZD', 'DZD', 'DZD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (47, 'EGP', 'EGP', 'EGP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (48, 'ERN', 'ERN', 'ERN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (49, 'ETB', 'ETB', 'ETB', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (50, 'EUR', 'EUR', '€', '1', 0, '2022-12-30 01:20:25');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (51, 'FJD', 'FJD', 'FJD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (52, 'FKP', 'FKP', 'FKP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (53, 'GBP', 'GBP', '£', '1', 0, '2022-12-30 01:20:29');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (54, 'GEL', 'GEL', 'GEL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (55, 'GHS', 'GHS', 'GHS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (56, 'GIP', 'GIP', 'GIP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (57, 'GMD', 'GMD', 'GMD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (58, 'GNF', 'GNF', 'GNF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (59, 'GTQ', 'GTQ', 'GTQ', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (60, 'GYD', 'GYD', 'GYD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (61, 'HKD', 'HKD', 'HKD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (62, 'HNL', 'HNL', 'HNL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (63, 'HRK', 'HRK', 'HRK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (64, 'HTG', 'HTG', 'HTG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (65, 'HUF', 'HUF', 'HUF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (66, 'IDR', 'IDR', 'IDR', '1', 0, '2022-12-30 01:20:34');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (67, 'ILS', 'ILS', 'ILS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (68, 'INR', 'INR', '₹', '1', 0, '2022-12-30 01:20:37');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (69, 'IQD', 'IQD', 'IQD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (70, 'IRR', 'IRR', 'IRR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (71, 'ISK', 'ISK', 'ISK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (72, 'JMD', 'JMD', 'JMD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (73, 'JOD', 'JOD', 'JOD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (74, 'JPY', 'JPY', 'JPY', '1', 0, '2022-12-30 01:19:56');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (75, 'KES', 'KES', 'KES', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (76, 'KGS', 'KGS', 'KGS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (77, 'KHR', 'KHR', 'KHR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (78, 'KMF', 'KMF', 'KMF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (79, 'KPW', 'KPW', 'KPW', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (80, 'KRW', 'KRW', 'KRW', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (81, 'KWD', 'KWD', 'KWD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (82, 'KYD', 'KYD', 'KYD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (83, 'KZT', 'KZT', 'KZT', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (84, 'LAK', 'LAK', 'LAK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (85, 'LBP', 'LBP', 'LBP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (86, 'LKR', 'LKR', 'LKR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (87, 'LRD', 'LRD', 'LRD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (88, 'LSL', 'LSL', 'LSL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (89, 'LYD', 'LYD', 'LYD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (90, 'MAD', 'MAD', 'MAD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (91, 'MDL', 'MDL', 'MDL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (92, 'MGA', 'MGA', 'MGA', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (93, 'MKD', 'MKD', 'MKD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (94, 'MMK', 'MMK', 'MMK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (95, 'MNT', 'MNT', 'MNT', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (96, 'MOP', 'MOP', 'MOP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (97, 'MRO', 'MRO', 'MRO', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (98, 'MUR', 'MUR', 'MUR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (99, 'MVR', 'MVR', 'MVR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (100, 'MWK', 'MWK', 'MWK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (101, 'MXN', 'MXN', 'MXN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (102, 'MXV', 'MXV', 'MXV', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (103, 'MYR', 'MYR', 'MYR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (104, 'MZN', 'MZN', 'MZN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (105, 'NAD', 'NAD', 'NAD', '1', 0, '2022-07-30 05:32:37');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (106, 'NGN', 'NGN', 'NGN', '1', 0, '2022-12-30 01:20:42');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (107, 'NIO', 'NIO', 'NIO', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (108, 'NOK', 'NOK', 'NOK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (109, 'NPR', 'NPR', 'NPR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (110, 'NZD', 'NZD', 'NZD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (111, 'OMR', 'OMR', 'OMR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (112, 'PAB', 'PAB', 'PAB', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (113, 'PEN', 'PEN', 'PEN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (114, 'PGK', 'PGK', 'PGK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (115, 'PHP', 'PHP', 'PHP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (116, 'PKR', 'PKR', 'PKR', '1', 0, '2022-12-30 01:20:19');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (117, 'PLN', 'PLN', 'PLN', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (118, 'PYG', 'PYG', 'PYG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (119, 'QAR', 'QAR', 'QAR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (120, 'RON', 'RON', 'RON', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (121, 'RSD', 'RSD', 'RSD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (122, 'RUB', 'RUB', 'RUB', '1', 0, '2022-12-30 01:20:16');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (123, 'RWF', 'RWF', 'RWF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (124, 'SAR', 'SAR', 'SAR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (125, 'SBD', 'SBD', 'SBD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (126, 'SCR', 'SCR', 'SCR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (127, 'SDG', 'SDG', 'SDG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (128, 'SEK', 'SEK', 'SEK', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (129, 'SGD', 'SGD', 'SGD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (130, 'SHP', 'SHP', 'SHP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (131, 'SLL', 'SLL', 'SLL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (132, 'SOS', 'SOS', 'SOS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (133, 'SRD', 'SRD', 'SRD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (134, 'SSP', 'SSP', 'SSP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (135, 'STD', 'STD', 'STD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (136, 'SVC', 'SVC', 'SVC', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (137, 'SYP', 'SYP', 'SYP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (138, 'SZL', 'SZL', 'SZL', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (139, 'THB', 'THB', 'THB', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (140, 'TJS', 'TJS', 'TJS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (141, 'TMT', 'TMT', 'TMT', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (142, 'TND', 'TND', 'TND', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (143, 'TOP', 'TOP', 'TOP', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (144, 'TRY', 'TRY', 'TRY', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (145, 'TTD', 'TTD', 'TTD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (146, 'TWD', 'TWD', 'TWD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (147, 'TZS', 'TZS', 'TZS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (148, 'UAH', 'UAH', 'UAH', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (149, 'UGX', 'UGX', 'UGX', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (150, 'USD', 'USD', '$', '1', 0, '2023-03-13 03:20:59');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (151, 'USN', 'USN', 'USN', '1', 0, '2022-12-30 01:20:03');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (152, 'UYI', 'UYI', 'UYI', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (153, 'UYU', 'UYU', 'UYU', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (154, 'UZS', 'UZS', 'UZS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (155, 'VEF', 'VEF', 'VEF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (156, 'VND', 'VND', 'VND', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (157, 'VUV', 'VUV', 'VUV', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (158, 'WST', 'WST', 'WST', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (159, 'XAF', 'XAF', 'XAF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (160, 'XAG', 'XAG', 'XAG', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (161, 'XAU', 'XAU', 'XAU', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (162, 'XBA', 'XBA', 'XBA', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (163, 'XBB', 'XBB', 'XBB', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (164, 'XBC', 'XBC', 'XBC', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (165, 'XBD', 'XBD', 'XBD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (166, 'XCD', 'XCD', 'XCD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (167, 'XDR', 'XDR', 'XDR', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (168, 'XOF', 'XOF', 'XOF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (169, 'XPD', 'XPD', 'XPD', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (170, 'XPF', 'XPF', 'XPF', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (171, 'XPT', 'XPT', 'XPT', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (172, 'XSU', 'XSU', 'XSU', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (173, 'XTS', 'XTS', 'XTS', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (174, 'XUA', 'XUA', 'XUA', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (175, 'XXX', 'XXX', 'XXX', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (176, 'YER', 'YER', 'YER', '1', 0, '2022-07-22 06:55:15');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (177, 'ZAR', 'ZAR', 'ZAR', '1', 0, '2022-12-30 01:20:07');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (178, 'ZMW', 'ZMW', 'ZMW', '1', 0, '2022-07-30 03:34:00');
INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES (179, 'ZWL', 'ZWL', 'ZWL', '1', 0, '2022-07-22 06:55:15');


#
# TABLE STRUCTURE FOR: custom_field_values
#

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `idx_belong_table_id` (`belong_table_id`),
  KEY `idx_field_value` (`field_value`),
  CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` text DEFAULT NULL,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_belong_to` (`belong_to`),
  KEY `idx_type` (`type`),
  KEY `idx_visible_on_table` (`visible_on_table`),
  KEY `idx_weight` (`weight`),
  FULLTEXT KEY `idx_field_values` (`field_values`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: daily_assignment
#

DROP TABLE IF EXISTS `daily_assignment`;

CREATE TABLE `daily_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `evaluated_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `evaluation_date` date DEFAULT NULL,
  `remark` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `evaluated_by` (`evaluated_by`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  CONSTRAINT `daily_assignment_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_assignment_ibfk_2` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_assignment_ibfk_3` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (1, 'Lab', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (2, 'Acounts', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (3, 'Class', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (4, 'Office', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (5, 'Field', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (6, 'Outdoor', 'yes');


#
# TABLE STRUCTURE FOR: disable_reason
#

DROP TABLE IF EXISTS `disable_reason`;

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: email_attachments
#

DROP TABLE IF EXISTS `email_attachments`;

CREATE TABLE `email_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attachment_name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `email_attachments_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `api_secret` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `api_key`, `api_secret`, `region`, `is_active`, `created_at`) VALUES (1, 'sendmail', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'yes', '2020-02-28 08:46:03');


#
# TABLE STRUCTURE FOR: email_template
#

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: email_template_attachment
#

DROP TABLE IF EXISTS `email_template_attachment`;

CREATE TABLE `email_template_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_template_id` int(11) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `attachment_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: enquiry
#

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `assigned` (`assigned`),
  KEY `enquiry_ibfk_4` (`class_id`),
  CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiry_ibfk_3` FOREIGN KEY (`assigned`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiry_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: enquiry_type
#

DROP TABLE IF EXISTS `enquiry_type`;

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_group_class_batch_exam_students
#

DROP TABLE IF EXISTS `exam_group_class_batch_exam_students`;

CREATE TABLE `exam_group_class_batch_exam_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `roll_no` int(6) DEFAULT NULL,
  `teacher_remark` text DEFAULT NULL,
  `rank` int(20) NOT NULL DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exam_id` (`exam_group_class_batch_exam_id`),
  KEY `student_id` (`student_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, NULL, NULL, 0, 0, '2023-03-17 10:51:35', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 2, 2, NULL, NULL, 0, 0, '2023-03-17 10:51:35', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES (3, 1, 3, 3, NULL, NULL, 0, 0, '2023-03-17 10:51:35', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES (4, 1, 4, 4, NULL, NULL, 0, 0, '2023-03-17 10:51:35', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES (5, 1, 5, 5, NULL, NULL, 0, 0, '2023-03-17 10:51:35', NULL);


#
# TABLE STRUCTURE FOR: exam_group_class_batch_exam_subjects
#

DROP TABLE IF EXISTS `exam_group_class_batch_exam_subjects`;

CREATE TABLE `exam_group_class_batch_exam_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `subject_id` int(10) NOT NULL,
  `date_from` date NOT NULL,
  `time_from` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `max_marks` float(10,2) DEFAULT NULL,
  `min_marks` float(10,2) DEFAULT NULL,
  `credit_hours` float(10,2) DEFAULT 0.00,
  `date_to` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exam_subjects` (`id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, '2023-03-17', '09:00:00', '60', '101', '100.00', '33.00', '1.00', NULL, 0, '2023-03-17 10:54:18', NULL);
INSERT INTO `exam_group_class_batch_exam_subjects` (`id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 2, '2023-03-17', '10:00:00', '60', '101', '100.00', '33.00', '1.00', NULL, 0, '2023-03-17 10:54:18', NULL);
INSERT INTO `exam_group_class_batch_exam_subjects` (`id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (3, 1, 4, '2023-03-17', '11:00:00', '60', '101', '100.00', '33.00', '1.00', NULL, 0, '2023-03-17 10:54:18', NULL);


#
# TABLE STRUCTURE FOR: exam_group_class_batch_exams
#

DROP TABLE IF EXISTS `exam_group_class_batch_exams`;

CREATE TABLE `exam_group_class_batch_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` varchar(250) DEFAULT NULL,
  `passing_percentage` float(10,2) DEFAULT NULL,
  `session_id` int(10) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `use_exam_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_publish` int(1) DEFAULT 0,
  `is_rank_generated` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `exam_group_class_batch_exams_ibfk_2` (`session_id`),
  CONSTRAINT `exam_group_class_batch_exams_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exams_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exams` (`id`, `exam`, `passing_percentage`, `session_id`, `date_from`, `date_to`, `exam_group_id`, `use_exam_roll_no`, `is_publish`, `is_rank_generated`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, '1st Tutorial', NULL, 19, NULL, NULL, 1, 1, 0, 0, '', 1, '2023-03-17 10:51:21', NULL);


#
# TABLE STRUCTURE FOR: exam_group_exam_connections
#

DROP TABLE IF EXISTS `exam_group_exam_connections`;

CREATE TABLE `exam_group_exam_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `exam_weightage` float(10,2) DEFAULT 0.00,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  CONSTRAINT `exam_group_exam_connections_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_connections_ibfk_2` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_group_exam_results
#

DROP TABLE IF EXISTS `exam_group_exam_results`;

CREATE TABLE `exam_group_exam_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exam_student_id` int(11) NOT NULL,
  `exam_group_class_batch_exam_subject_id` int(11) DEFAULT NULL,
  `exam_group_student_id` int(11) DEFAULT NULL,
  `attendence` varchar(10) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exam_subject_id` (`exam_group_class_batch_exam_subject_id`),
  KEY `exam_group_student_id` (`exam_group_student_id`),
  KEY `exam_group_class_batch_exam_student_id` (`exam_group_class_batch_exam_student_id`),
  CONSTRAINT `exam_group_exam_results_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_subject_id`) REFERENCES `exam_group_class_batch_exam_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_results_ibfk_2` FOREIGN KEY (`exam_group_student_id`) REFERENCES `exam_group_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_results_ibfk_3` FOREIGN KEY (`exam_group_class_batch_exam_student_id`) REFERENCES `exam_group_class_batch_exam_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, 'present', '33.00', 'Good', 0, '2023-03-17 10:55:45', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 1, NULL, 'present', '85.00', 'Well', 0, '2023-03-17 10:55:45', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (3, 3, 1, NULL, 'present', '95.00', 'Very Good', 0, '2023-03-17 10:55:45', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (4, 4, 1, NULL, 'present', '100.00', 'V.V.Good', 0, '2023-03-17 10:55:45', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (5, 5, 1, NULL, 'present', '35.00', 'Bad', 0, '2023-03-17 10:55:45', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (6, 1, 2, NULL, 'absent', NULL, '', 0, '2023-03-17 10:56:44', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (7, 2, 2, NULL, 'present', '100.00', 'Very Good', 0, '2023-03-17 10:56:44', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (8, 3, 2, NULL, 'present', '95.00', 'Good', 0, '2023-03-17 10:56:44', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (9, 4, 2, NULL, 'present', '98.00', 'Very Good', 0, '2023-03-17 10:56:44', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (10, 5, 2, NULL, 'present', '20.00', 'Fail', 0, '2023-03-17 10:56:44', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (11, 1, 3, NULL, 'present', '100.00', 'Pass', 0, '2023-03-17 10:57:42', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (12, 2, 3, NULL, 'present', '100.00', 'Pass', 0, '2023-03-17 10:57:42', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (13, 3, 3, NULL, 'present', '100.00', 'Pass', 0, '2023-03-17 10:57:42', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (14, 4, 3, NULL, 'absent', NULL, 'Fail', 0, '2023-03-17 10:57:42', NULL);
INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `exam_group_student_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (15, 5, 3, NULL, 'present', '95.00', 'Pass', 0, '2023-03-17 10:57:42', NULL);


#
# TABLE STRUCTURE FOR: exam_group_students
#

DROP TABLE IF EXISTS `exam_group_students`;

CREATE TABLE `exam_group_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(10) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `student_id` (`student_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `exam_group_students_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_groups
#

DROP TABLE IF EXISTS `exam_groups`;

CREATE TABLE `exam_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_groups` (`id`, `name`, `exam_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, '1st Tutorial', 'basic_system', '', 0, '2023-03-17 10:49:47', NULL);


#
# TABLE STRUCTURE FOR: exam_schedules
#

DROP TABLE IF EXISTS `exam_schedules`;

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_subject_id` (`teacher_subject_id`),
  KEY `session_id` (`session_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `exam_schedules_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_schedules_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exams
#

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sesion_id` (`sesion_id`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`sesion_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (1, 'Stationery Purchase', '', 'yes', 'no', '2023-03-13 13:50:04', NULL);
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (2, 'Electricity Bill', '', 'yes', 'no', '2023-03-13 13:50:30', NULL);
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (3, 'Telephone Bill', '', 'yes', 'no', '2023-03-13 13:50:39', NULL);
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (4, 'Miscellaneous', '', 'yes', 'no', '2023-03-13 13:50:56', NULL);
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (5, 'Flower', '', 'yes', 'no', '2023-03-13 13:51:14', NULL);


#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_head_id` (`exp_head_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`exp_head_id`) REFERENCES `expense_head` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `expenses` (`id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (1, 2, 'Covid-19 Sanitization', '3444', '2023-03-13', '4566.00', NULL, '', 'yes', 'no', '2023-03-13 13:52:07', NULL);
INSERT INTO `expenses` (`id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (2, 4, 'Lotus', '444', '2023-03-13', '666.00', NULL, '', 'yes', 'no', '2023-03-13 13:52:29', NULL);
INSERT INTO `expenses` (`id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (3, 1, 'Monthly Bill', '444', '2023-03-13', '8994.00', NULL, '', 'yes', 'no', '2023-03-13 13:54:37', NULL);
INSERT INTO `expenses` (`id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (4, 3, 'Monthy', '7665', '2023-03-13', '78990.00', NULL, '', 'yes', 'no', '2023-03-13 13:55:12', NULL);


#
# TABLE STRUCTURE FOR: fee_groups
#

DROP TABLE IF EXISTS `fee_groups`;

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (1, 'ID', 0, '', 'no', '2023-03-13 13:58:48');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (2, 'Admission', 0, '', 'no', '2023-03-13 13:58:56');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (3, 'Tution', 0, '', 'no', '2023-03-13 13:59:34');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (4, 'Vechicle', 0, '', 'no', '2023-03-13 13:59:40');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (5, 'Exam', 0, '', 'no', '2023-03-13 13:59:55');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (6, 'Admit Card', 0, '', 'no', '2023-03-13 14:00:05');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (7, 'Others', 0, '', 'no', '2023-03-13 14:00:14');


#
# TABLE STRUCTURE FOR: fee_groups_feetype
#

DROP TABLE IF EXISTS `fee_groups_feetype`;

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fine_type` varchar(50) NOT NULL DEFAULT 'none',
  `due_date` date DEFAULT NULL,
  `fine_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `fine_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fee_session_group_id` (`fee_session_group_id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `feetype_id` (`feetype_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fee_groups_feetype_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_2` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_3` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (1, 1, 1, 1, 19, '300.00', 'fix', '2023-03-11', '0.00', '45.00', 'no', '2023-03-13 14:00:57');
INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (2, 2, 3, 3, 19, '600.00', 'fix', '2023-03-15', '0.00', '34.00', 'no', '2023-03-13 14:01:24');
INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (3, 3, 2, 2, 19, '4565.00', 'none', '2023-03-21', '0.00', '0.00', 'no', '2023-03-13 14:01:46');
INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (4, 4, 5, 4, 19, '456.00', 'none', '2023-03-13', '0.00', '0.00', 'no', '2023-03-13 14:02:01');
INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (5, 5, 6, 6, 19, '345.00', 'none', '2023-03-20', '0.00', '0.00', 'no', '2023-03-13 14:02:42');


#
# TABLE STRUCTURE FOR: fee_receipt_no
#

DROP TABLE IF EXISTS `fee_receipt_no`;

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: fee_session_groups
#

DROP TABLE IF EXISTS `fee_session_groups`;

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fee_session_groups_ibfk_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_session_groups_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (1, 1, 19, 'no', '2023-03-13 14:00:57');
INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (2, 3, 19, 'no', '2023-03-13 14:01:24');
INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (3, 2, 19, 'no', '2023-03-13 14:01:46');
INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (4, 5, 19, 'no', '2023-03-13 14:02:01');
INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (5, 6, 19, 'no', '2023-03-13 14:02:42');


#
# TABLE STRUCTURE FOR: feemasters
#

DROP TABLE IF EXISTS `feemasters`;

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `feetype_id` (`feetype_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `feemasters_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `feemasters_ibfk_2` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `feemasters_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: fees_discounts
#

DROP TABLE IF EXISTS `fees_discounts`;

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `percentage` float(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: fees_reminder
#

DROP TABLE IF EXISTS `fees_reminder`;

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminder_type` varchar(10) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'before', 2, 0, '2020-02-28 08:38:32', NULL);
INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'before', 5, 0, '2020-02-28 08:38:36', NULL);
INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'after', 2, 0, '2020-02-28 08:38:40', NULL);
INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'after', 5, 0, '2020-02-28 08:38:44', NULL);


#
# TABLE STRUCTURE FOR: feetype
#

DROP TABLE IF EXISTS `feetype`;

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (1, 0, NULL, 'ID card Fee', '1', 'no', '', '2023-03-13 13:56:44', NULL);
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (2, 0, NULL, 'Admission Fee', '2', 'no', '', '2023-03-13 13:57:07', NULL);
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (3, 0, NULL, 'Tution Fees', '3', 'no', '', '2023-03-13 13:57:24', NULL);
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (4, 0, NULL, 'Exam Fee', '4', 'no', '', '2023-03-13 13:57:39', NULL);
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (5, 0, NULL, 'Vechle Fee', '5', 'no', '', '2023-03-13 13:57:58', NULL);
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (6, 0, NULL, 'Admit card Fee', '6', 'no', '', '2023-03-13 13:58:15', NULL);


#
# TABLE STRUCTURE FOR: filetypes
#

DROP TABLE IF EXISTS `filetypes`;

CREATE TABLE `filetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `filetypes` (`id`, `file_extension`, `file_mime`, `file_size`, `image_extension`, `image_mime`, `image_size`, `created_at`) VALUES (1, 'pdf, zip, jpg, jpeg, png, txt, 7z, gif, csv, docx, mp3, mp4, accdb, odt, ods, ppt, pptx, xlsx, wmv, jfif, apk, ppt, bmp, jpe, mdb, rar, xls, svg', 'application/pdf, image/zip, image/jpg, image/png, image/jpeg, text/plain, application/x-zip-compressed, application/zip, image/gif, text/csv, application/vnd.openxmlformats-officedocument.wordprocessingml.document, audio/mpeg, application/msaccess, application/vnd.oasis.opendocument.text, application/vnd.oasis.opendocument.spreadsheet, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, video/x-ms-wmv, video/mp4, image/jpeg, application/vnd.android.package-archive, application/x-msdownload, application/vnd.ms-powerpoint, image/bmp, image/jpeg, application/msaccess, application/vnd.ms-excel, image/svg+xml', 100048576, 'jfif, png, jpe, jpeg, jpg, bmp, gif, svg', 'image/jpeg, image/png, image/jpeg, image/jpeg, image/bmp, image/gif, image/x-ms-bmp, image/svg+xml', 10048576, '2021-01-30 08:03:03');


#
# TABLE STRUCTURE FOR: follow_up
#

DROP TABLE IF EXISTS `follow_up`;

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `enquiry_id` (`enquiry_id`),
  KEY `followup_by` (`followup_by`),
  CONSTRAINT `follow_up_ibfk_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follow_up_ibfk_2` FOREIGN KEY (`followup_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (46, 'scholarship-icon.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697176-468481062640ee2d8153e9!scholarship-icon.png', '1678697176-468481062640ee2d8153e9!thumb_scholarship-icon.png', '2023-03-13 14:46:16', 'image/png', '5295', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (47, '1648197262_20220325_123442.jpg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697346-2066407429640ee382a6ec2!1648197262_20220325_123442.jpg', '1678697346-2066407429640ee382a6ec2!thumb_1648197262_20220325_123442.jpg', '2023-03-13 14:49:06', 'image/jpeg', '2402358', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (48, '1648284758_20220326_110009.jpg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697370-1690731587640ee39a3d723!1648284758_20220326_110009.jpg', '1678697370-1690731587640ee39a3d723!thumb_1648284758_20220326_110009.jpg', '2023-03-13 14:49:30', 'image/jpeg', '2846466', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (49, '1648284823_20220326_110238.jpg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697397-1584256757640ee3b5a1ebb!1648284823_20220326_110238.jpg', '1678697397-1584256757640ee3b5a1ebb!thumb_1648284823_20220326_110238.jpg', '2023-03-13 14:49:57', 'image/jpeg', '3303401', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (50, 'book-icon.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697500-1309366546640ee41cb8895!book-icon.png', '1678697500-1309366546640ee41cb8895!thumb_book-icon.png', '2023-03-13 14:51:40', 'image/png', '4961', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (51, 'teacher-icon.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697557-116488702640ee45526040!teacher-icon.png', '1678697557-116488702640ee45526040!thumb_teacher-icon.png', '2023-03-13 14:52:37', 'image/png', '3992', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (52, '1654155484_IMG_2998.jpeg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697727-517601950640ee4ff9bef8!1654155484_IMG_2998.jpeg', '1678697727-517601950640ee4ff9bef8!thumb_1654155484_IMG_2998.jpeg', '2023-03-13 14:55:27', 'image/jpeg', '1907135', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (53, 'science.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697825-852845828640ee5611ec94!science.png', '1678697825-852845828640ee5611ec94!thumb_science.png', '2023-03-13 14:57:05', 'image/png', '436880', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (54, 'computer.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678697888-560127750640ee5a05c31d!computer.png', '1678697888-560127750640ee5a05c31d!thumb_computer.png', '2023-03-13 14:58:08', 'image/png', '631795', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (55, 'desktop-wallpaper-natural-scenery-of-bangladesh-scenery-drawing.jpg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698059-412166297640ee64b0c2c9!desktop-wallpaper-natural-scenery-of-bangladesh-scenery-drawing.jpg', '1678698059-412166297640ee64b0c2c9!thumb_desktop-wallpaper-natural-scenery-of-bangladesh-scenery-drawing.jpg', '2023-03-13 15:00:59', 'image/jpeg', '99746', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (56, 'lia.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698268-1508809210640ee71ce15e5!lia.png', '1678698268-1508809210640ee71ce15e5!thumb_lia.png', '2023-03-13 15:04:28', 'image/png', '659927', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (57, 'ac.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698408-101828323640ee7a81a95a!ac.png', '1678698408-101828323640ee7a81a95a!thumb_ac.png', '2023-03-13 15:06:48', 'image/png', '611915', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (58, 'award.svg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698770-1318292849640ee9120388d!award.svg', '', '2023-03-13 15:12:50', 'image/svg+xml', '3779', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (59, 'building-o.svg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698780-857215631640ee91c28a32!building-o.svg', '', '2023-03-13 15:13:00', 'image/svg+xml', '5104', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (60, 'cap.svg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698788-1533167939640ee924a0944!cap.svg', '', '2023-03-13 15:13:08', 'image/svg+xml', '1683', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (61, 'people.svg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678698813-510998108640ee93dc9076!people.svg', '', '2023-03-13 15:13:33', 'image/svg+xml', '2761', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (62, 'art.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699058-1223460948640eea3277e1f!art.png', '1678699058-1223460948640eea3277e1f!thumb_art.png', '2023-03-13 15:17:38', 'image/png', '249133', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (63, 'head.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699068-626639321640eea3cf101e!head.png', '1678699068-626639321640eea3cf101e!thumb_head.png', '2023-03-13 15:17:49', 'image/png', '183036', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (64, 'md-nayeem.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699081-1923280563640eea49158a0!md-nayeem.png', '1678699081-1923280563640eea49158a0!thumb_md-nayeem.png', '2023-03-13 15:18:01', 'image/png', '174877', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (65, 'md-kalam.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699216-1091871022640eead073def!md-kalam.png', '1678699216-1091871022640eead073def!thumb_md-kalam.png', '2023-03-13 15:20:16', 'image/png', '418189', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (66, 'md-shamim.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699228-1780110277640eeadcbfe7d!md-shamim.png', '1678699228-1780110277640eeadcbfe7d!thumb_md-shamim.png', '2023-03-13 15:20:28', 'image/png', '518891', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (67, 'par.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699242-1178213694640eeaea9f73d!par.png', '1678699242-1178213694640eeaea9f73d!thumb_par.png', '2023-03-13 15:20:42', 'image/png', '701004', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (68, 'sadia.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699254-595089953640eeaf6f1caa!sadia.png', '1678699254-595089953640eeaf6f1caa!thumb_sadia.png', '2023-03-13 15:20:55', 'image/png', '609758', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (69, '5.jpg', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699485-1075442213640eebdde1d1a!5.jpg', '1678699485-1075442213640eebdde1d1a!thumb_5.jpg', '2023-03-13 15:24:45', 'image/jpeg', '50213', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (70, 'md-shamim.png', 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '1678699586-275173517640eec4202b83!md-shamim.png', '1678699586-275173517640eec4202b83!thumb_md-shamim.png', '2023-03-13 15:26:26', 'image/png', '518891', '', '');


#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` text DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `front_cms_menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `front_cms_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (1, 1, 'হোম পেইজ', 1, 0, NULL, NULL, NULL, 'হম-পইজ', 1, 0, NULL, 'no', '2023-03-13 03:22:07');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 1, 'আমাদের সাথে যোগাযোগ করুন', 4, 0, NULL, NULL, NULL, 'আমদর-সথ-যগযগ-করন', 5, 0, NULL, 'no', '2023-03-13 03:24:48');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (3, 1, 'অভিযোগ', 2, 0, NULL, NULL, NULL, 'অভযগ', 4, 0, NULL, 'no', '2023-03-13 03:24:51');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (4, 1, 'অনলাইন এডমিশন', 0, 0, '1', NULL, '/online_admission', 'অনলইন-এডমশন', 2, 0, NULL, 'no', '2023-03-13 03:24:50');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (5, 1, 'নোটিশ', 6, 0, NULL, NULL, NULL, 'নটশ', 3, 0, NULL, 'no', '2023-03-13 03:24:51');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (6, 2, 'ট্রামস অ্যান্ড কন্ডিশন', 0, 0, NULL, NULL, NULL, 'টরমস-অযনড-কনডশন', NULL, 0, NULL, 'no', '2023-03-13 03:26:14');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (7, 2, 'প্রাইভেসি অ্যান্ড পলিসি', 0, 0, NULL, NULL, NULL, 'পরইভস-অযনড-পলস', NULL, 0, NULL, 'no', '2023-03-13 03:26:31');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (8, 2, 'নোটিশ', 6, 0, NULL, NULL, NULL, 'নটশ-1', NULL, 0, NULL, 'no', '2023-03-13 03:26:50');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (9, 2, 'আমাদের সাথে যোগাযোগ করুন', 4, 0, NULL, NULL, NULL, 'আমদর-সথ-যগযগ-করন-1', NULL, 0, NULL, 'no', '2023-03-13 03:27:22');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `open_new_tab` int(10) NOT NULL DEFAULT 0,
  `ext_url` text NOT NULL,
  `ext_url_link` text NOT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 10:54:49');
INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 10:54:55');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_page_contents` (`id`, `page_id`, `content_type`, `created_at`) VALUES (1, 6, 'news', '2023-03-13 03:24:15');


#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` int(10) DEFAULT 0,
  `sidebar` int(10) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<section class=\"services\">\r\n<div class=\"service-inner\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-4 col-sm-4 service-box\">\r\n<div class=\"service-box-content\">\r\n<h3><a href=\"#\">বৃত্তির সুবিধা</a></h3>\r\n\r\n<p>আমাদের রয়েছে বিশেষ কিছু স্টুডেন্টদের জন্য বৃত্তির সুবিধা।</p>\r\n\r\n<div class=\"service-box-icon\"><img src=\"/uploads/gallery/media/1678697176-468481062640ee2d8153e9!scholarship-icon.png\" /></div>\r\n</div>\r\n</div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4 service-box\">\r\n<div class=\"service-box-content\">\r\n<h3><a href=\"#\">বই ও লাইব্রেরী</a></h3>\r\n\r\n<p>আমাদের রয়েছে হরেকরকম বইয়ের বিশাল সমাহার ও লাইব্রেরী</p>\r\n\r\n<div class=\"service-box-icon\"><img src=\"/uploads/gallery/media/1678697500-1309366546640ee41cb8895!book-icon.png\" /></div>\r\n</div>\r\n</div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4 service-box\">\r\n<div class=\"service-box-content\">\r\n<h3><a href=\"#\">অভিজ্ঞ শিক্ষক</a></h3>\r\n\r\n<p>আমাদের রয়েছে ২৫০ জন অভিজ্ঞ শিক্ষক মণ্ডলীদের অভিজ্ঞ দল</p>\r\n\r\n<div class=\"service-box-icon\"><img src=\"/uploads/gallery/media/1678697557-116488702640ee45526040!teacher-icon.png\" /></div>\r\n</div>\r\n</div>\r\n<!--./col-md-4--></div>\r\n</div>\r\n</div>\r\n</section>\r\n<!--./container-->\r\n\r\n<section class=\"bg-gray fullwidth spaceb40 spacet40\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-8 col-sm-12 col-md-offset-2 text-center\">\r\n<h2 class=\"head-title\">আমাদের সম্পর্কে</h2>\r\n\r\n<div class=\"divider\">&nbsp;</div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"about_img\"><img class=\"img-responsive img-rounded\" src=\"/uploads/gallery/media/1678697727-517601950640ee4ff9bef8!1654155484_IMG_2998.jpeg\" /></div>\r\n</div>\r\n<!--./col-md-6-->\r\n\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"about-right\">\r\n<h3>রূপনগর আবাসিক হাই স্কুল</h3>\r\n\r\n<p class=\"pt10 pb10\">রূপনগর আবাসিক হাই স্কুল হল একটি স্বনামধন্য শিক্ষা প্রতিষ্ঠান।আমাদের রয়েছে ২৫০ এর চেয়ে বেশি অভিজ্ঞ শিক্ষকমণ্ডলী।এছারা রয়েছে আধুনিক ক্লাশরুম।</p>\r\n</div>\r\n\r\n<div class=\"panel-group accrodion2\" id=\"accordion\">\r\n<div class=\"panel panel-default\">\r\n<div class=\"panel-heading\">\r\n<h4 class=\"panel-title\"><a class=\"accordion-toggle\" data-parent=\"#accordion\" data-toggle=\"collapse\" href=\"#collapseOne\">আপনাদের কি ডিজাটাল মাল্টি-মিডিয়া ক্লাসরুম আছে? </a></h4>\r\n</div>\r\n\r\n<div class=\"panel-collapse collapse in\" id=\"collapseOne\">\r\n<div class=\"panel-body\">আমাদের প্রতিষ্ঠানে মোট ১৩০টি ক্লাস রুম রয়েছে,আমাদের প্রত্যেকটি ক্লাশ রুম আধুনিক ভাবে বানানো।আমাদের প্রত্যেকটি ক্লাশ রুমে রয়েছে ডিজিটাল মাল্টি মিডিয়া সিস্টেম।</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"panel panel-default\">\r\n<div class=\"panel-heading\">\r\n<h4 class=\"panel-title\"><a class=\"accordion-toggle\" data-parent=\"#accordion\" data-toggle=\"collapse\" href=\"#collapseTwo\">আপনাদের স্কুলে কি লাইব্রেরী আছে? </a></h4>\r\n</div>\r\n\r\n<div class=\"panel-collapse collapse\" id=\"collapseTwo\">\r\n<div class=\"panel-body\">আমাদের স্কুলে মোট ৪টি আধুনিক লাইব্রেরী রয়েছে।</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"panel panel-default\">\r\n<div class=\"panel-heading\">\r\n<h4 class=\"panel-title\"><a class=\"accordion-toggle\" data-parent=\"#accordion\" data-toggle=\"collapse\" href=\"#collapseThree\">আপনাদের স্কুলে কি কম্পিউটার ল্যাব আছে? </a></h4>\r\n</div>\r\n\r\n<div class=\"panel-collapse collapse\" id=\"collapseThree\">\r\n<div class=\"panel-body\">আমাদের স্কুলে আধুনিক কম্পিউটার সহ মোট ৮টি কম্পিউটার ল্যাব রয়েছে।</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--./col-md-6--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<section class=\"spaceb40 spacet40\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-8 col-sm-12 col-md-offset-2 text-center pb30\">\r\n<h2 class=\"head-title\">আমাদের কিছু কোর্স</h2>\r\n\r\n<p>আমাদের স্কুলের কিছু সেরা কোর্স সমূহ নিচে দেওয়া হল</p>\r\n\r\n<div class=\"divider\">&nbsp;</div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"owl-carousel courses-carousel\">\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"courses-box\">\r\n<div class=\"courses-box-img\"><img src=\"/uploads/gallery/media/1678698059-412166297640ee64b0c2c9!desktop-wallpaper-natural-scenery-of-bangladesh-scenery-drawing.jpg\" /></div>\r\n<!--./courses-box-img-->\r\n\r\n<div class=\"course-inner\"><a class=\"course-subject\" href=\"#\">আর্ট</a>\r\n\r\n<h4>ড্রয়িং কোর্স</h4>\r\n\r\n<p>আমাদের স্কুলের সেরা ড্রয়িং কোর্সটি আপনি গ্রহণ করুন।</p>\r\n<a class=\"btn-read\" href=\"#\">এখনি আবেদন করুন</a></div>\r\n</div>\r\n<!--./courses-box--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"courses-box\">\r\n<div class=\"courses-box-img\"><img src=\"/uploads/gallery/media/1678697825-852845828640ee5611ec94!science.png\" /></div>\r\n<!--./courses-box-img-->\r\n\r\n<div class=\"course-inner\"><a class=\"course-subject\" href=\"#\">বিজ্ঞান</a>\r\n\r\n<h4>সাইন্স এক্সপ্রেরিমেন্ট</h4>\r\n\r\n<p>আমাদের স্কুলের বিজ্ঞান কোর্সটি আপনি গ্রহণ করুন।</p>\r\n<a class=\"btn-read\" href=\"#\">এখনি আবেদন করুন</a></div>\r\n</div>\r\n<!--./courses-box--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"courses-box\">\r\n<div class=\"courses-box-img\"><img src=\"/uploads/gallery/media/1678697888-560127750640ee5a05c31d!computer.png\" /></div>\r\n<!--./courses-box-img-->\r\n\r\n<div class=\"course-inner\"><a class=\"course-subject\" href=\"#\">কম্পিউটার</a>\r\n\r\n<h4>কম্পিউটার প্রশিক্ষণ</h4>\r\n\r\n<p>আমাদের স্কুলের সেরা কম্পিউটার কোর্সটি গ্রহণ করুন।</p>\r\n<a class=\"btn-read\" href=\"#\">এখনি আবেদন করুন</a></div>\r\n</div>\r\n<!--./courses-box--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"courses-box\">\r\n<div class=\"courses-box-img\"><img src=\"/uploads/gallery/media/1678698268-1508809210640ee71ce15e5!lia.png\" /></div>\r\n<!--./courses-box-img-->\r\n\r\n<div class=\"course-inner\"><a class=\"course-subject\" href=\"#\">লাইব্রেরী</a>\r\n\r\n<h4>লাইব্রেরিয়ান</h4>\r\n\r\n<p>আমাদের স্কুলের সেরা লাইব্রেরিয়ান কোর্সটি গ্রহণ করুন।</p>\r\n<a class=\"btn-read\" href=\"#\">এখনি আবেদন করুন</a></div>\r\n</div>\r\n<!--./courses-box--></div>\r\n<!--./col-md-12--></div>\r\n</div>\r\n<!--./courses-carousel--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<section class=\"countdown_bg fullwidth counter\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"counter-content\">\r\n<h2 class=\"counter-title mt0\">আমাদের অর্জন</h2>\r\n\r\n<div class=\"counter-text\">\r\n<p>নিচে আমাদের কিছু অর্জন দেওয়া হল।দীর্ঘ ১০ বছরের আমাদের সকল প্রাপ্তি নিচে দেওয়া আছে, দয়া করে দেখে নিন।</p>\r\n</div>\r\n\r\n<div class=\"counter-img\">\r\n<div class=\"about_img\"><img class=\"img-responsive img-rounded\" src=\"/uploads/gallery/media/1678698408-101828323640ee7a81a95a!ac.png\" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--./col-md-6-->\r\n\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"row\">\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"counter-main\"><img class=\"svg\" src=\"/uploads/gallery/media/1678698788-1533167939640ee924a0944!cap.svg\" />\r\n<h3 class=\"counter-value\" data-count=\"10000\">10000</h3>\r\n<span>পাশকৃত স্টুডেন্ট</span></div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"counter-main\"><img class=\"svg\" src=\"/uploads/gallery/media/1678698770-1318292849640ee9120388d!award.svg\" />\r\n<h3 class=\"counter-value\" data-count=\"125\">125</h3>\r\n<span>অভিজ্ঞ শিক্ষকগন</span></div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"counter-main\"><img class=\"svg\" src=\"/uploads/gallery/media/1678698780-857215631640ee91c28a32!building-o.svg\" />\r\n<h3 class=\"counter-value\" data-count=\"25\">25</h3>\r\n<span>স্টুডেন্ট ক্যাম্পাস</span></div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-lg-6 col-sm-6\">\r\n<div class=\"counter-main\"><img class=\"svg\" src=\"/uploads/gallery/media/1678698813-510998108640ee93dc9076!people.svg\" />\r\n<h3 class=\"counter-value\" data-count=\"586200\">586200</h3>\r\n<span>স্টুডেন্ট</span></div>\r\n</div>\r\n<!--./col-md-6--></div>\r\n<!--./row--></div>\r\n<!--./col-md-6--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<section class=\"spaceb40 spacet40\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-8 col-sm-12 col-md-offset-2 text-center\">\r\n<h2 class=\"head-title\">আমাদের শিক্ষকগন</h2>\r\n\r\n<p>আমাদের সকল অভিজ্ঞ শিক্ষকগনদের তালিকা নিচে দেওয়া হল</p>\r\n\r\n<div class=\"divider\">&nbsp;</div>\r\n</div>\r\n<!--./col-md-8-->\r\n\r\n<div class=\"teamstaff\">\r\n<div class=\"row\">\r\n<div class=\"owl-carousel staff-carousel\">\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"staffteam\">\r\n<div class=\"staffteamimg\"><img alt=\"\" src=\"/uploads/gallery/media/1678699068-626639321640eea3cf101e!head.png\" />\r\n<ul class=\"social-links\">\r\n	<li>Facebook</li>\r\n	<li>Twitter</li>\r\n	<li>Linkedin</li>\r\n	<li>Google Plus</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"staff-content\">\r\n<h3>মোঃ শামিম খান</h3>\r\n<span class=\"post\">প্রিন্সিপাল</span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"staffteam\">\r\n<div class=\"staffteamimg\"><img src=\"/uploads/gallery/media/1678699485-1075442213640eebdde1d1a!5.jpg\" />\r\n<ul class=\"social-links\">\r\n	<li>Facebook</li>\r\n	<li>Twitter</li>\r\n	<li>Linkedin</li>\r\n	<li>Google Plus</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"staff-content\">\r\n<h3>জাহানারা বেগম</h3>\r\n<span class=\"post\">এসিস্টেন্ট টিচার</span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"staffteam\">\r\n<div class=\"staffteamimg\"><img src=\"/uploads/gallery/media/1678699081-1923280563640eea49158a0!md-nayeem.png\" />\r\n<ul class=\"social-links\">\r\n	<li>Facebook</li>\r\n	<li>Twitter</li>\r\n	<li>Linkedin</li>\r\n	<li>Google Plus</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"staff-content\">\r\n<h3 class=\"title\">মোঃ নাইম হোসেন</h3>\r\n<span class=\"post\">সিনিয়র ক্লাস টিচার</span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"staffteam\">\r\n<div class=\"staffteamimg\"><img src=\"/uploads/gallery/media/1678699058-1223460948640eea3277e1f!art.png\" />\r\n<ul class=\"social-links\">\r\n	<li>Facebook</li>\r\n	<li>Twitter</li>\r\n	<li>Linkedin</li>\r\n	<li>Google Plus</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"staff-content\">\r\n<h3 class=\"title\">শাহিদা আক্তার</h3>\r\n<span class=\"post\">গণিত শিক্ষক</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!--./staff--></div>\r\n<!--./teamstaff--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<section class=\"spaceb40 spacet40 testimonial_bg fullwidth text-white\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-8 col-sm-12 col-md-offset-2 text-center\">\r\n<h2 class=\"text-white\">প্রশংসা</h2>\r\n\r\n<p>রূপনগর আবাসিক হাই স্কুল সম্পর্কে অভিভাবকগন কি বলে, আসুন আমরা তা দেখেনি!</p>\r\n\r\n<div class=\"divider\">&nbsp;</div>\r\n</div>\r\n<!--./col-md-8-->\r\n\r\n<div class=\"owl-carousel testimonial-carousel\">\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"testimonial\">\r\n<div class=\"testimonialimg\"><img src=\"/uploads/gallery/media/thumb/1678699228-1780110277640eeadcbfe7d!thumb_md-shamim.png\" /></div>\r\n\r\n<div class=\"testi_description\">\r\n<h4>মোঃ জাহিদুর রহমান</h4>\r\n\r\n<h5>ম্যানেজার</h5>\r\n\r\n<p>আমরা আমাদের সন্তানের ভবিষ্যৎ নিয়ে এখন আর চিন্তিত নয়, কারন এই স্কুলে আমাদের সন্তানকে ভর্তি করানোর পর থেকে আমরা চিন্তা মুক্ত।</p>\r\n</div>\r\n<!--./testi_description--></div>\r\n<!--./testimonial--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"testimonial\">\r\n<div class=\"testimonialimg\"><img src=\"/uploads/gallery/media/1678699216-1091871022640eead073def!md-kalam.png\" /></div>\r\n\r\n<div class=\"testi_description\">\r\n<h4>মোঃ কালাম আলি</h4>\r\n\r\n<h5>কৃষক</h5>\r\n\r\n<p>আমরা খুব আনন্দিত যে আমাদের সন্তান এই স্কুলে পড়ে।ধন্যবাদ রুপনগর আবাসিক স্কুলকে।</p>\r\n</div>\r\n<!--./testi_description--></div>\r\n<!--./testimonial--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"testimonial\">\r\n<div class=\"testimonialimg\"><img src=\"/uploads/gallery/media/1678699254-595089953640eeaf6f1caa!sadia.png\" /></div>\r\n\r\n<div class=\"testi_description\">\r\n<h4>সাদিয়া আক্তার</h4>\r\n\r\n<h5>স্টুডেন্ট</h5>\r\n\r\n<p>আমি খুবই গর্বিত এই স্কুলে লেখা পড়া করার জন্য।আমি এই স্কুল থেকে এসএসসি কমপ্লিট করেছি।</p>\r\n</div>\r\n<!--./testi_description--></div>\r\n<!--./testimonial--></div>\r\n<!--./col-md-12-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"testimonial\">\r\n<div class=\"testimonialimg\"><img src=\"/uploads/gallery/media/1678699242-1178213694640eeaea9f73d!par.png\" /></div>\r\n\r\n<div class=\"testi_description\">\r\n<h4>জমিলা বেগম</h4>\r\n\r\n<h5>গৃহিণী</h5>\r\n\r\n<p>আমি আমার নাতি নাতনির শিক্ষা নেওয়ার বিষয়টি নিয়ে এখন আর চিন্তিত নই, ধন্যবাদ রূপনগর আবাসিক হাই স্কুলকে।</p>\r\n</div>\r\n<!--./testi_description--></div>\r\n<!--./testimonial--></div>\r\n<!--./col-md-12--></div>\r\n<!--./testimonial-carousel--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>', '0000-00-00', 1, NULL, 'no', '2023-03-13 05:25:13');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>[form-builder:complain]</p>', '0000-00-00', 1, NULL, 'no', '2019-11-13 05:16:36');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (3, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 10:46:04');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (4, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<section class=\"contact\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<h2 class=\"col-md-12 col-sm-12\">Send In Your Query</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/pin.svg\" />\r\n<h3>Our Location</h3>\r\n\r\n<p>350 Fifth Avenue, 34th floor New York NY 10118-3299 USA</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/phone.svg\" />\r\n<h3>CALL US</h3>\r\n\r\n<p>E-mail : info@abcschool.com</p>\r\n\r\n<p>Mobile : +91-9009987654</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/clock.svg\" />\r\n<h3>Working Hours</h3>\r\n\r\n<p>Mon-Fri : 9 am to 5 pm</p>\r\n\r\n<p>Sat : 9 am to 3 pm</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"mapWrapper fullwidth\"><iframe frameborder=\"0\" height=\"500\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://maps.google.com/maps?f=q&source=s_q&hl=EN&q=time+square&aq=&sll=40.716558,-73.931122&sspn=0.40438,1.056747&ie=UTF8&rq=1&ev=p&split=1&radius=33.22&hq=time+square&hnear=&ll=37.061753,-95.677185&spn=0.438347,0.769043&z=9&output=embed\" width=\"100%\"></iframe></div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2019-05-04 11:46:41');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (6, 'manual', 0, 'Notice', 'page/notice', 'page', 'notice', '', '', '', '', 'Notice', NULL, 0, NULL, 'no', '2023-03-13 03:24:15');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (1, 1, 7, '2023-03-13 02:09:47');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (2, 1, 5, '2023-03-13 02:10:25');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (3, 1, 6, '2023-03-13 02:11:05');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (6, 1, 48, '2023-03-13 04:50:31');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (7, 1, 47, '2023-03-13 04:50:36');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (8, 1, 49, '2023-03-18 09:36:26');


#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `feature_image` text NOT NULL,
  `publish_date` date DEFAULT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_programs` (`id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (1, 'banner', NULL, NULL, 'Banner Images', NULL, NULL, NULL, NULL, NULL, 'no', '2023-03-13 02:09:47', '', '', '', '', NULL, '0', 0);


#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_sidebar` int(1) DEFAULT 0,
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` text NOT NULL,
  `whatsapp_url` varchar(255) NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `cookie_consent` varchar(255) NOT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `cookie_consent`, `fav_icon`, `created_at`) VALUES (1, 'default', NULL, 1, NULL, './uploads/school_content/logo/1678689719-2115230064640ec5b7e072f!new.png', '', '', '[]', 'https://www.whatsapp.com', 'https://www.facebook.com', 'https://twitter.com/', 'https://www.youtube.com', 'https://plus.google.com', 'https://www.instagram.com', '', 'https://www.linkedin.com', '', '© রুপনগর আবাসিক হাই স্কুল  ২০২৩ সকল কিছুর স্বত্বাধিকার', '', './uploads/school_content/logo/1678689719-73727948640ec5b7e294f!icon.png', '2023-03-13 02:43:14');


#
# TABLE STRUCTURE FOR: gateway_ins
#

DROP TABLE IF EXISTS `gateway_ins`;

CREATE TABLE `gateway_ins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `online_admission_id` int(11) DEFAULT NULL,
  `gateway_name` varchar(50) NOT NULL,
  `module_type` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `parameter_details` mediumtext NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `online_admission_id` (`online_admission_id`),
  CONSTRAINT `gateway_ins_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gateway_ins_response
#

DROP TABLE IF EXISTS `gateway_ins_response`;

CREATE TABLE `gateway_ins_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_ins_id` int(11) DEFAULT NULL,
  `posted_data` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `gateway_ins_id` (`gateway_ins_id`),
  CONSTRAINT `gateway_ins_response_ibfk_1` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_duration` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `call_type` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gmeet
#

DROP TABLE IF EXISTS `gmeet`;

CREATE TABLE `gmeet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(20) NOT NULL DEFAULT 'class',
  `staff_id` int(11) DEFAULT NULL,
  `created_id` int(10) NOT NULL,
  `title` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'manual',
  `api_data` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `url` text NOT NULL,
  `session_id` int(10) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `created_id` (`created_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `gmeet_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_ibfk_2` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gmeet_history
#

DROP TABLE IF EXISTS `gmeet_history`;

CREATE TABLE `gmeet_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gmeet_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `total_hit` int(10) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `gmeet_id` (`gmeet_id`),
  KEY `staff_id` (`staff_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `gmeet_history_ibfk_1` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_history_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_history_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gmeet_sections
#

DROP TABLE IF EXISTS `gmeet_sections`;

CREATE TABLE `gmeet_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gmeet_id` int(11) NOT NULL,
  `cls_section_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cls_section_id` (`cls_section_id`),
  KEY `gmeet_id` (`gmeet_id`),
  CONSTRAINT `gmeet_sections_ibfk_1` FOREIGN KEY (`cls_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_sections_ibfk_2` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gmeet_settings
#

DROP TABLE IF EXISTS `gmeet_settings`;

CREATE TABLE `gmeet_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(200) DEFAULT NULL,
  `api_secret` varchar(200) DEFAULT NULL,
  `use_api` int(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: gmeet_staff
#

DROP TABLE IF EXISTS `gmeet_staff`;

CREATE TABLE `gmeet_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gmeet_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `gmeet_id` (`gmeet_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `gmeet_staff_ibfk_1` FOREIGN KEY (`gmeet_id`) REFERENCES `gmeet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gmeet_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: grades
#

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_type` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: homework
#

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(10) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `marks` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_date` date NOT NULL,
  `evaluation_date` date DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `session_id` (`session_id`),
  KEY `staff_id` (`staff_id`),
  KEY `subject_id` (`subject_id`),
  KEY `evaluated_by` (`evaluated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_6` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_7` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: homework_evaluation
#

DROP TABLE IF EXISTS `homework_evaluation`;

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `homework_id` (`homework_id`),
  KEY `student_id` (`student_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `homework_evaluation_ibfk_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_evaluation_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `homework_evaluation_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: hostel
#

DROP TABLE IF EXISTS `hostel`;

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: hostel_rooms
#

DROP TABLE IF EXISTS `hostel_rooms`;

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `hostel_id` (`hostel_id`),
  KEY `room_type_id` (`room_type_id`),
  CONSTRAINT `hostel_rooms_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hostel_rooms_ibfk_2` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: id_card
#

DROP TABLE IF EXISTS `id_card`;

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_barcode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `enable_vertical_card`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `enable_student_barcode`, `status`) VALUES (1, 'Sample Student Identity Card Horizontal', 'Roupnagar High School', 'Munshi Bari,Beside Noyar Hat High School  Phone: 01775457008 Email: info@elitedesign.com.bd', '1678712629-2018657443640f1f358d30c!1.png', '1678712603-2098730297640f1f1b89061!1.png', '1678712603-816777109640f1f1b894b8!sign.png', 0, '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1);
INSERT INTO `id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `enable_vertical_card`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `enable_student_barcode`, `status`) VALUES (2, 'Sample Student Identity Card Vertical', 'Roupnagor High School', 'Munshi Bari, Beside Nayar Hat High School  Phone: 01775457008 Email: info@elitedesign.com.bd', '1678712744-1717035281640f1fa859db5!1.png', '1678712744-301435126640f1fa85a022!1.png', '1678712744-607931189640f1fa85a188!sign.png', 1, '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1);


#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `documents` varchar(255) DEFAULT NULL,
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_head_id` (`income_head_id`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`income_head_id`) REFERENCES `income_head` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) DEFAULT NULL,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `quantity` int(100) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_category_id` (`item_category_id`),
  KEY `item_store_id` (`item_store_id`),
  KEY `item_supplier_id` (`item_supplier_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`item_store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`item_supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` int(11) NOT NULL,
  `issue_by` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  KEY `issue_to` (`issue_to`),
  KEY `issue_by` (`issue_by`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_3` FOREIGN KEY (`issue_to`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_4` FOREIGN KEY (`issue_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_rtl` int(1) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Azerbaijan', 'az', 'az', 0, 'no', 'no', '2019-11-20 06:23:12', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Albanian', 'sq', 'al', 0, 'no', 'no', '2019-11-20 06:42:42', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Amharic', 'am', 'am', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'English', 'en', 'us', 0, 'no', 'no', '2019-11-20 06:38:50', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Arabic', 'ar', 'sa', 0, 'no', 'no', '2019-11-20 06:47:28', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'Afrikaans', 'af', 'af', 0, 'no', 'no', '2023-03-13 01:52:50', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'Basque', 'eu', 'es', 0, 'no', 'no', '2019-11-20 06:54:10', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'Bengali', 'bn', 'bd', 0, 'no', 'no', '2023-03-13 14:21:34', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'Bosnian', 'bs', 'bs', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'Welsh', 'cy', 'cy', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'Hungarian', 'hu', 'hu', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'Vietnamese', 'vi', 'vi', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'Haitian', 'ht', 'ht', 0, 'no', 'no', '2021-01-23 02:09:32', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'Galician', 'gl', 'gl', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'Dutch', 'nl', 'nl', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'Greek', 'el', 'gr', 0, 'no', 'no', '2019-11-20 07:12:08', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (22, 'Georgian', 'ka', 'ge', 0, 'no', 'no', '2019-11-20 07:11:40', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (23, 'Gujarati', 'gu', 'in', 0, 'no', 'no', '2019-11-20 06:39:16', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (24, 'Danish', 'da', 'dk', 0, 'no', 'no', '2019-11-20 07:03:25', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (25, 'Hebrew', 'he', 'il', 0, 'no', 'no', '2019-11-20 07:13:50', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (26, 'Yiddish', 'yi', 'il', 0, 'no', 'no', '2019-11-20 07:25:33', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (27, 'Indonesian', 'id', 'id', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (28, 'Irish', 'ga', 'ga', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (29, 'Italian', 'it', 'it', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (30, 'Icelandic', 'is', 'is', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (31, 'Spanish', 'es', 'es', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (33, 'Kannada', 'kn', 'kn', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (34, 'Catalan', 'ca', 'ca', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (36, 'Chinese', 'zh', 'cn', 0, 'no', 'no', '2019-11-20 07:01:48', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (37, 'Korean', 'ko', 'kr', 0, 'no', 'no', '2019-11-20 07:19:09', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (38, 'Xhosa', 'xh', 'ls', 0, 'no', 'no', '2019-11-20 07:24:39', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (39, 'Latin', 'la', 'it', 0, 'no', 'no', '2021-01-23 02:09:32', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (40, 'Latvian', 'lv', 'lv', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (41, 'Lithuanian', 'lt', 'lt', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (43, 'Malagasy', 'mg', 'mg', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (44, 'Malay', 'ms', 'ms', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (45, 'Malayalam', 'ml', 'ml', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (46, 'Maltese', 'mt', 'mt', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (47, 'Macedonian', 'mk', 'mk', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (48, 'Maori', 'mi', 'nz', 0, 'no', 'no', '2019-11-20 07:20:27', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (49, 'Marathi', 'mr', 'in', 0, 'no', 'no', '2019-11-20 06:39:51', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (51, 'Mongolian', 'mn', 'mn', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (52, 'German', 'de', 'de', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (53, 'Nepali', 'ne', 'ne', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (54, 'Norwegian', 'no', 'no', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (55, 'Punjabi', 'pa', 'in', 0, 'no', 'no', '2019-11-20 06:40:16', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (57, 'Persian', 'fa', 'ir', 0, 'no', 'no', '2019-11-20 07:21:17', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (59, 'Portuguese', 'pt', 'pt', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (60, 'Romanian', 'ro', 'ro', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (61, 'Russian', 'ru', 'ru', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (62, 'Cebuano', 'ceb', 'ph', 0, 'no', 'no', '2019-11-20 06:59:12', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (64, 'Sinhala', 'si', 'lk ', 0, 'no', 'no', '2021-01-23 02:09:32', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (65, 'Slovakian', 'sk', 'sk', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (66, 'Slovenian', 'sl', 'sl', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (67, 'Swahili', 'sw', 'ke', 0, 'no', 'no', '2019-11-20 07:21:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (68, 'Sundanese', 'su', 'sd', 0, 'no', 'no', '2019-12-03 06:06:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (70, 'Thai', 'th', 'th', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (71, 'Tagalog', 'tl', 'tl', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (72, 'Tamil', 'ta', 'in', 0, 'no', 'no', '2019-11-20 06:40:53', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (74, 'Telugu', 'te', 'in', 0, 'no', 'no', '2019-11-20 06:41:15', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (75, 'Turkish', 'tr', 'tr', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (77, 'Uzbek', 'uz', 'uz', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (79, 'Urdu', 'ur', 'pk', 0, 'no', 'no', '2019-11-20 07:23:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (80, 'Finnish', 'fi', 'fi', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (81, 'French', 'fr', 'fr', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (82, 'Hindi', 'hi', 'in', 0, 'no', 'no', '2019-11-20 06:36:34', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (84, 'Czech', 'cs', 'cz', 0, 'no', 'no', '2019-11-20 07:02:36', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (85, 'Swedish', 'sv', 'sv', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (86, 'Scottish', 'gd', 'gd', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (87, 'Estonian', 'et', 'et', 0, 'no', 'no', '2019-11-20 06:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (88, 'Esperanto', 'eo', 'br', 0, 'no', 'no', '2019-11-20 23:49:18', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (89, 'Javanese', 'jv', 'id', 0, 'no', 'no', '2019-11-20 07:18:29', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (90, 'Japanese', 'ja', 'jp', 0, 'no', 'no', '2019-11-20 07:14:39', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (91, 'Polish', 'pl', 'pl', 0, 'no', 'no', '2020-06-14 23:25:27', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (92, 'Kurdish', 'ku', 'iq', 0, 'no', 'no', '2020-12-20 19:15:31', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (93, 'Lao', 'lo', 'la', 0, 'no', 'no', '2020-12-20 19:15:36', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (94, 'Croatia', 'hr', 'hr', 0, 'no', 'no', '2022-06-07 07:48:21', '0000-00-00');


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (1, 'Pregnent Leave', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (2, 'Sick Leave', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (3, 'maraige Leave', 'yes');


#
# TABLE STRUCTURE FOR: lesson
#

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `subject_group_class_sections_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `subject_group_class_sections_id` (`subject_group_class_sections_id`),
  CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`subject_group_class_sections_id`) REFERENCES `subject_group_class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: lesson_plan_forum
#

DROP TABLE IF EXISTS `lesson_plan_forum`;

CREATE TABLE `lesson_plan_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_syllabus_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'staff,student',
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_syllabus_id` (`subject_syllabus_id`),
  KEY `student_id` (`student_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `lesson_plan_forum_ibfk_1` FOREIGN KEY (`subject_syllabus_id`) REFERENCES `subject_syllabus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_plan_forum_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_plan_forum_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: libarary_members
#

DROP TABLE IF EXISTS `libarary_members`;

CREATE TABLE `libarary_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: logs
#

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `record_id` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (1, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 05:36:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 05:45:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (3, 'New Record inserted On event id 1', '1', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 06:09:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (4, 'Record updated On Front CMS Setting id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 06:13:11', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (5, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 06:16:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (6, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 06:22:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (7, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 06:30:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (8, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 12:32:46', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (9, 'Record updated On Front CMS Setting id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 12:41:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (10, 'Record updated On Front CMS Setting id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 12:43:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (11, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (12, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:18:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (13, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:18:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (14, 'Record updated On Menu id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:22:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (15, 'Record updated On Menu id 4', '4', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:22:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (16, 'Record updated On Menu id 3', '3', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:23:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (17, 'Record updated On Menu id 2', '2', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:23:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (18, 'Record updated On Menu id 2', '2', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:23:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (19, 'New Record inserted On Page List id 6', '6', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:24:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (20, 'New Record inserted On Menu id 5', '5', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:24:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (21, 'New Record inserted On Menu id 6', '6', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:26:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (22, 'New Record inserted On Menu id 7', '7', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:26:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (23, 'New Record inserted On Menu id 8', '8', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:26:50', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (24, 'New Record inserted On Menu id 9', '9', 1, 'Insert', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:27:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (25, 'Record updated On Menu id 9', '9', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 13:27:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (26, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:39:42', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (27, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:47:38', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (28, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:48:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (29, 'Record deleted On banner delete id 1', '1', 1, 'Delete', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:50:18', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (30, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:53:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (31, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:54:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (32, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 14:56:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (33, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:04:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (34, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:06:13', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (35, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:08:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (36, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:16:42', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (37, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:23:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (38, 'Record updated On  Page List id 1', '1', 1, 'Update', '103.25.249.225', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 15:25:13', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (39, 'Record updated On staff id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 18:40:00', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (40, 'Record updated On staff id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 18:40:00', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (41, 'New Record inserted On payment settings id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 18:42:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (42, 'Record updated On  certificates id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 18:53:58', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (43, 'Record updated On  id card id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:03:23', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (44, 'Record updated On  id card id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:03:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (45, 'Record updated On  id card id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:05:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (46, 'Record updated On  id card id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:07:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (47, 'Record updated On  id card id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:08:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (48, 'Record updated On  id card id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 19:09:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (49, 'Record updated On staff id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:22:58', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (50, 'Record updated On staff id 3', '3', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:28:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (51, 'Record updated On staff id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:33:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (52, 'Record updated On staff id 5', '5', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:38:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (53, 'Record updated On staff id 6', '6', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:41:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (54, 'Record updated On staff id 7', '7', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:49:24', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (55, 'Record updated On staff id 8', '8', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:52:50', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (56, 'Record updated On staff id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 20:57:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (57, 'Record updated On staff id 10', '10', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:00:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (58, 'New Record inserted On  staff designation id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:06:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (59, 'New Record inserted On  staff designation id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:06:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (60, 'New Record inserted On  staff designation id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:07:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (61, 'New Record inserted On  staff designation id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:07:24', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (62, 'New Record inserted On  staff designation id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:08:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (63, 'New Record inserted On  staff designation id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:08:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (64, 'New Record inserted On  staff designation id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:09:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (65, 'New Record inserted On  staff designation id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:10:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (66, 'New Record inserted On  staff designation id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:12:18', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (67, 'Record updated On staff id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:14:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (68, 'Record updated On staff id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:14:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (69, 'Record updated On staff id 3', '3', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:15:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (70, 'Record updated On staff id 3', '3', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:15:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (71, 'Record updated On staff id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:18:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (72, 'Record updated On staff id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:18:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (73, 'Record updated On staff id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:27:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (74, 'Record updated On staff id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:27:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (75, 'New Record inserted On department id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:28:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (76, 'New Record inserted On department id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:28:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (77, 'New Record inserted On department id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:28:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (78, 'New Record inserted On department id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:29:04', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (79, 'New Record inserted On department id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:29:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (80, 'New Record inserted On department id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:29:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (81, 'Record updated On staff id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:30:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (82, 'Record updated On staff id 2', '2', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:30:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (83, 'Record updated On staff id 3', '3', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (84, 'Record updated On staff id 3', '3', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (85, 'Record updated On staff id 5', '5', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:32:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (86, 'Record updated On staff id 5', '5', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:32:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (87, 'Record updated On staff id 6', '6', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:32:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (88, 'Record updated On staff id 6', '6', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:32:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (89, 'Record updated On staff id 7', '7', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:33:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (90, 'Record updated On staff id 7', '7', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:33:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (91, 'Record updated On staff id 8', '8', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:34:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (92, 'Record updated On staff id 8', '8', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:34:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (93, 'Record updated On staff id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:35:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (94, 'Record updated On staff id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:35:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (95, 'Record updated On staff id 10', '10', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:36:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (96, 'Record updated On staff id 10', '10', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:36:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (97, 'Record updated On staff id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:36:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (98, 'Record updated On staff id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:36:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (99, 'New Record inserted On sections id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:38:58', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (100, 'New Record inserted On sections id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (101, 'New Record inserted On sections id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:11', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (102, 'New Record inserted On subject groups id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (103, 'New Record inserted On subject groups id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (104, 'New Record inserted On subject groups id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:39', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (105, 'New Record inserted On subject groups id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (106, 'New Record inserted On subject groups id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (107, 'New Record inserted On subject groups id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (108, 'New Record inserted On subject groups id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:39:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (109, 'New Record inserted On subject groups id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:40:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (110, 'New Record inserted On subject groups id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:40:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (111, 'New Record inserted On subject groups id 10', '10', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:40:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (112, 'New Record inserted On subjects id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:41:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (113, 'New Record inserted On subjects id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:41:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (114, 'New Record inserted On subjects id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:42:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (115, 'New Record inserted On subjects id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:42:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (116, 'New Record inserted On subjects id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:42:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (117, 'New Record inserted On subjects id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:43:18', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (118, 'New Record inserted On subjects id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:43:53', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (119, 'New Record inserted On subjects id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:44:12', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (120, 'New Record inserted On subjects id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:44:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (121, 'New Record inserted On subjects id 10', '10', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:44:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (122, 'New Record inserted On subjects id 11', '11', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:44:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (123, 'New Record inserted On subjects id 12', '12', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:45:11', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (124, 'New Record inserted On subject groups id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:46:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (125, 'New Record inserted On subject groups id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:46:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (126, 'New Record inserted On subject groups id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:47:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (127, 'New Record inserted On subject groups id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:48:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (128, 'New Record inserted On subject groups id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:48:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (129, 'New Record inserted On subject groups id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:49:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (130, 'New Record inserted On subject groups id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:53:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (131, 'New Record inserted On subject groups id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:53:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (132, 'New Record inserted On subject groups id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:54:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (133, 'New Record inserted On subject groups id 10', '10', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:55:42', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (134, 'New Record inserted On class teacher id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:20', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (135, 'New Record inserted On class teacher id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:20', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (136, 'New Record inserted On class teacher id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:20', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (137, 'New Record inserted On class teacher id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (138, 'New Record inserted On class teacher id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (139, 'New Record inserted On class teacher id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (140, 'New Record inserted On class teacher id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (141, 'New Record inserted On class teacher id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (142, 'New Record inserted On class teacher id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (143, 'New Record inserted On class teacher id 10', '10', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (144, 'New Record inserted On class teacher id 11', '11', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (145, 'New Record inserted On class teacher id 12', '12', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:43', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (146, 'New Record inserted On class teacher id 13', '13', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (147, 'New Record inserted On class teacher id 14', '14', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (148, 'New Record inserted On class teacher id 15', '15', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (149, 'New Record inserted On class teacher id 16', '16', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (150, 'New Record inserted On class teacher id 17', '17', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (151, 'New Record inserted On class teacher id 18', '18', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 21:59:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (152, 'New Record inserted On class teacher id 19', '19', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (153, 'New Record inserted On class teacher id 20', '20', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (154, 'New Record inserted On class teacher id 21', '21', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (155, 'New Record inserted On class teacher id 22', '22', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (156, 'New Record inserted On class teacher id 23', '23', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (157, 'New Record inserted On class teacher id 24', '24', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (158, 'New Record inserted On class teacher id 25', '25', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (159, 'New Record inserted On class teacher id 26', '26', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (160, 'New Record inserted On class teacher id 27', '27', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (161, 'New Record inserted On class teacher id 28', '28', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (162, 'New Record inserted On class teacher id 29', '29', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (163, 'New Record inserted On class teacher id 30', '30', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (164, 'New Record inserted On class teacher id 31', '31', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (165, 'New Record inserted On class teacher id 32', '32', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (166, 'New Record inserted On class teacher id 33', '33', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (167, 'New Record inserted On class teacher id 34', '34', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (168, 'New Record inserted On class teacher id 35', '35', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (169, 'New Record inserted On class teacher id 36', '36', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:00:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (170, 'New Record inserted On class teacher id 37', '37', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (171, 'New Record inserted On class teacher id 38', '38', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (172, 'New Record inserted On class teacher id 39', '39', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (173, 'New Record inserted On class teacher id 40', '40', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (174, 'New Record inserted On class teacher id 41', '41', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (175, 'New Record inserted On class teacher id 42', '42', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (176, 'New Record inserted On class teacher id 43', '43', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (177, 'New Record inserted On class teacher id 44', '44', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (178, 'New Record inserted On class teacher id 45', '45', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (179, 'New Record inserted On class teacher id 46', '46', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (180, 'New Record inserted On class teacher id 47', '47', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (181, 'New Record inserted On class teacher id 48', '48', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (182, 'New Record inserted On class teacher id 49', '49', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (183, 'New Record inserted On class teacher id 50', '50', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (184, 'New Record inserted On class teacher id 51', '51', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (185, 'New Record inserted On class teacher id 52', '52', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (186, 'New Record inserted On class teacher id 53', '53', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (187, 'New Record inserted On class teacher id 54', '54', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:01:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (188, 'New Record inserted On class teacher id 55', '55', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (189, 'New Record inserted On class teacher id 56', '56', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (190, 'New Record inserted On class teacher id 57', '57', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (191, 'New Record inserted On class teacher id 58', '58', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (192, 'New Record inserted On class teacher id 59', '59', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (193, 'New Record inserted On class teacher id 60', '60', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:02:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (194, 'New Record inserted On  subject timetable id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (195, 'New Record inserted On  subject timetable id 0', '0', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (196, 'New Record inserted On  subject timetable id -1', '-1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (197, 'New Record inserted On  subject timetable id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (198, 'New Record inserted On  subject timetable id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (199, 'New Record inserted On  subject timetable id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (200, 'New Record inserted On  subject timetable id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (201, 'New Record inserted On  subject timetable id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (202, 'New Record inserted On  subject timetable id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:10:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (203, 'New Record inserted On  subject timetable id 10', '10', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:12:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (204, 'New Record inserted On  subject timetable id 9', '9', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:12:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (205, 'New Record inserted On  subject timetable id 8', '8', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:12:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (206, 'New Record inserted On  subject timetable id 13', '13', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:18:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (207, 'New Record inserted On  subject timetable id 12', '12', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:18:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (208, 'New Record inserted On  subject timetable id 11', '11', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:18:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (209, 'New Record inserted On  subject timetable id 16', '16', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (210, 'New Record inserted On  subject timetable id 15', '15', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (211, 'New Record inserted On  subject timetable id 14', '14', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (212, 'New Record inserted On  subject timetable id 19', '19', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (213, 'New Record inserted On  subject timetable id 18', '18', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (214, 'New Record inserted On  subject timetable id 17', '17', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (215, 'New Record inserted On  subject timetable id 22', '22', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (216, 'New Record inserted On  subject timetable id 21', '21', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (217, 'New Record inserted On  subject timetable id 20', '20', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:19:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (218, 'New Record inserted On  subject timetable id 25', '25', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (219, 'New Record inserted On  subject timetable id 24', '24', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (220, 'New Record inserted On  subject timetable id 23', '23', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (221, 'New Record inserted On  subject timetable id 28', '28', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (222, 'New Record inserted On  subject timetable id 27', '27', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (223, 'New Record inserted On  subject timetable id 26', '26', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:21:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (224, 'New Record inserted On  subject timetable id 31', '31', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (225, 'New Record inserted On  subject timetable id 30', '30', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (226, 'New Record inserted On  subject timetable id 29', '29', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (227, 'New Record inserted On  subject timetable id 34', '34', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (228, 'New Record inserted On  subject timetable id 33', '33', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (229, 'New Record inserted On  subject timetable id 32', '32', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:24:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (230, 'New Record inserted On  subject timetable id 37', '37', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:25:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (231, 'New Record inserted On  subject timetable id 36', '36', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:25:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (232, 'New Record inserted On  subject timetable id 35', '35', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:25:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (233, 'New Record inserted On  subject timetable id 40', '40', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (234, 'New Record inserted On  subject timetable id 39', '39', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (235, 'New Record inserted On  subject timetable id 38', '38', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (236, 'New Record inserted On  subject timetable id 43', '43', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (237, 'New Record inserted On  subject timetable id 42', '42', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (238, 'New Record inserted On  subject timetable id 41', '41', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (239, 'New Record inserted On  subject timetable id 46', '46', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:27:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (240, 'New Record inserted On  subject timetable id 45', '45', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:27:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (241, 'New Record inserted On  subject timetable id 44', '44', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:27:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (242, 'New Record inserted On  subject timetable id 49', '49', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:28:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (243, 'New Record inserted On  subject timetable id 48', '48', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:28:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (244, 'New Record inserted On  subject timetable id 47', '47', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:28:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (245, 'New Record inserted On  subject timetable id 52', '52', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (246, 'New Record inserted On  subject timetable id 51', '51', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (247, 'New Record inserted On  subject timetable id 50', '50', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (248, 'New Record inserted On  subject timetable id 49', '49', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (249, 'New Record inserted On  subject timetable id 48', '48', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (250, 'New Record inserted On  subject timetable id 47', '47', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:30:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (251, 'New Record inserted On  subject timetable id 58', '58', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (252, 'New Record inserted On  subject timetable id 57', '57', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (253, 'New Record inserted On  subject timetable id 56', '56', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (254, 'New Record inserted On  subject timetable id 55', '55', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (255, 'New Record inserted On  subject timetable id 54', '54', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (256, 'New Record inserted On  subject timetable id 53', '53', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:32:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (257, 'New Record inserted On  subject timetable id 64', '64', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (258, 'New Record inserted On  subject timetable id 63', '63', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (259, 'New Record inserted On  subject timetable id 62', '62', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (260, 'New Record inserted On  subject timetable id 61', '61', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (261, 'New Record inserted On  subject timetable id 60', '60', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (262, 'New Record inserted On  subject timetable id 59', '59', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:33:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (263, 'New Record inserted On  subject timetable id 70', '70', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (264, 'New Record inserted On  subject timetable id 69', '69', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (265, 'New Record inserted On  subject timetable id 68', '68', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (266, 'New Record inserted On  subject timetable id 67', '67', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (267, 'New Record inserted On  subject timetable id 66', '66', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (268, 'New Record inserted On  subject timetable id 65', '65', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:35:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (269, 'New Record inserted On  subject timetable id 76', '76', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (270, 'New Record inserted On  subject timetable id 75', '75', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (271, 'New Record inserted On  subject timetable id 74', '74', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (272, 'New Record inserted On  subject timetable id 73', '73', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (273, 'New Record inserted On  subject timetable id 72', '72', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (274, 'New Record inserted On  subject timetable id 71', '71', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (275, 'New Record inserted On  subject timetable id 82', '82', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (276, 'New Record inserted On  subject timetable id 81', '81', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (277, 'New Record inserted On  subject timetable id 80', '80', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (278, 'New Record inserted On  subject timetable id 79', '79', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (279, 'New Record inserted On  subject timetable id 78', '78', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (280, 'New Record inserted On  subject timetable id 77', '77', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:36:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (281, 'New Record inserted On  subject timetable id 88', '88', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (282, 'New Record inserted On  subject timetable id 87', '87', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (283, 'New Record inserted On  subject timetable id 86', '86', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (284, 'New Record inserted On  subject timetable id 85', '85', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (285, 'New Record inserted On  subject timetable id 92', '92', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (286, 'New Record inserted On  subject timetable id 91', '91', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (287, 'New Record inserted On  subject timetable id 90', '90', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (288, 'New Record inserted On  subject timetable id 89', '89', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:37:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (289, 'New Record inserted On  subject timetable id 96', '96', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (290, 'New Record inserted On  subject timetable id 95', '95', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (291, 'New Record inserted On  subject timetable id 94', '94', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (292, 'New Record inserted On  subject timetable id 93', '93', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (293, 'New Record inserted On  subject timetable id 100', '100', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:38', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (294, 'New Record inserted On  subject timetable id 99', '99', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:38', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (295, 'New Record inserted On  subject timetable id 98', '98', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:38', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (296, 'New Record inserted On  subject timetable id 97', '97', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:42:38', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (297, 'New Record inserted On  subject timetable id 104', '104', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (298, 'New Record inserted On  subject timetable id 103', '103', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (299, 'New Record inserted On  subject timetable id 102', '102', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (300, 'New Record inserted On  subject timetable id 101', '101', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (301, 'New Record inserted On  subject timetable id 108', '108', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (302, 'New Record inserted On  subject timetable id 107', '107', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (303, 'New Record inserted On  subject timetable id 106', '106', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (304, 'New Record inserted On  subject timetable id 105', '105', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (305, 'New Record inserted On  subject timetable id 112', '112', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (306, 'New Record inserted On  subject timetable id 111', '111', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (307, 'New Record inserted On  subject timetable id 110', '110', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:43:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (308, 'New Record inserted On  subject timetable id 115', '115', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (309, 'New Record inserted On  subject timetable id 114', '114', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (310, 'New Record inserted On  subject timetable id 113', '113', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (311, 'New Record inserted On  subject timetable id 112', '112', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (312, 'New Record inserted On  subject timetable id 111', '111', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (313, 'New Record inserted On  subject timetable id 110', '110', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (314, 'New Record inserted On  subject timetable id 121', '121', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:47:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (315, 'New Record inserted On  subject timetable id 120', '120', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:47:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (316, 'New Record inserted On  subject timetable id 119', '119', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:47:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (317, 'New Record inserted On  subject timetable id 118', '118', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:47:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (318, 'New Record inserted On  subject timetable id 125', '125', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:48:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (319, 'New Record inserted On  subject timetable id 124', '124', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:48:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (320, 'New Record inserted On  subject timetable id 123', '123', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:48:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (321, 'New Record inserted On  subject timetable id 122', '122', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:48:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (322, 'New Record inserted On  subject timetable id 121', '121', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:48:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (323, 'New Record inserted On  subject timetable id 130', '130', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (324, 'New Record inserted On  subject timetable id 129', '129', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (325, 'New Record inserted On  subject timetable id 128', '128', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (326, 'New Record inserted On  subject timetable id 127', '127', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (327, 'New Record inserted On  subject timetable id 126', '126', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (328, 'New Record inserted On  subject timetable id 125', '125', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:49:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (329, 'New Record inserted On  subject timetable id 136', '136', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (330, 'New Record inserted On  subject timetable id 135', '135', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (331, 'New Record inserted On  subject timetable id 134', '134', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (332, 'New Record inserted On  subject timetable id 139', '139', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (333, 'New Record inserted On  subject timetable id 138', '138', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (334, 'New Record inserted On  subject timetable id 137', '137', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:51:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (335, 'New Record inserted On  subject timetable id 142', '142', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (336, 'New Record inserted On  subject timetable id 141', '141', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (337, 'New Record inserted On  subject timetable id 140', '140', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (338, 'New Record inserted On  subject timetable id 139', '139', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (339, 'New Record inserted On  subject timetable id 138', '138', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (340, 'New Record inserted On  subject timetable id 137', '137', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:54:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (341, 'New Record inserted On  subject timetable id 148', '148', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:55:08', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (342, 'New Record inserted On  subject timetable id 147', '147', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:55:08', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (343, 'New Record inserted On  subject timetable id 146', '146', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:55:08', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (344, 'New Record inserted On  subject timetable id 145', '145', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:55:08', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (345, 'New Record inserted On  subject timetable id 152', '152', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:56:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (346, 'New Record inserted On  subject timetable id 151', '151', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:56:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (347, 'New Record inserted On  subject timetable id 150', '150', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:56:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (348, 'New Record inserted On  subject timetable id 149', '149', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:56:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (349, 'New Record inserted On  subject timetable id 148', '148', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:56:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (350, 'New Record inserted On  subject timetable id 157', '157', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (351, 'New Record inserted On  subject timetable id 156', '156', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (352, 'New Record inserted On  subject timetable id 155', '155', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (353, 'New Record inserted On  subject timetable id 154', '154', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (354, 'New Record inserted On  subject timetable id 161', '161', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (355, 'New Record inserted On  subject timetable id 160', '160', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (356, 'New Record inserted On  subject timetable id 159', '159', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (357, 'New Record inserted On  subject timetable id 158', '158', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (358, 'New Record inserted On  subject timetable id 157', '157', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:57:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (359, 'New Record inserted On  subject timetable id 166', '166', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (360, 'New Record inserted On  subject timetable id 165', '165', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (361, 'New Record inserted On  subject timetable id 164', '164', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (362, 'New Record inserted On  subject timetable id 169', '169', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (363, 'New Record inserted On  subject timetable id 168', '168', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (364, 'New Record inserted On  subject timetable id 167', '167', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:58:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (365, 'New Record inserted On  subject timetable id 172', '172', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:59:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (366, 'New Record inserted On  subject timetable id 171', '171', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:59:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (367, 'New Record inserted On  subject timetable id 170', '170', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:59:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (368, 'New Record inserted On  subject timetable id 169', '169', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 22:59:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (369, 'New Record inserted On  subject timetable id 176', '176', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (370, 'New Record inserted On  subject timetable id 175', '175', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (371, 'New Record inserted On  subject timetable id 174', '174', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (372, 'New Record inserted On  subject timetable id 173', '173', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (373, 'New Record inserted On  subject timetable id 172', '172', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:17', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (374, 'New Record inserted On  subject timetable id 181', '181', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (375, 'New Record inserted On  subject timetable id 180', '180', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (376, 'New Record inserted On  subject timetable id 179', '179', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (377, 'New Record inserted On  subject timetable id 178', '178', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:00:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (378, 'New Record inserted On  subject timetable id 185', '185', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:01:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (379, 'New Record inserted On  subject timetable id 184', '184', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:01:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (380, 'New Record inserted On  subject timetable id 183', '183', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:01:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (381, 'New Record inserted On  subject timetable id 182', '182', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:01:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (382, 'New Record inserted On  subject timetable id 181', '181', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:01:36', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (383, 'New Record inserted On  subject timetable id 190', '190', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (384, 'New Record inserted On  subject timetable id 189', '189', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (385, 'New Record inserted On  subject timetable id 188', '188', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (386, 'New Record inserted On  subject timetable id 187', '187', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (387, 'New Record inserted On  subject timetable id 186', '186', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (388, 'New Record inserted On  subject timetable id 185', '185', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:02:33', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (389, 'New Record inserted On  subject timetable id 196', '196', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:03:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (390, 'New Record inserted On  subject timetable id 195', '195', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:03:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (391, 'New Record inserted On  subject timetable id 194', '194', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:03:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (392, 'New Record inserted On  subject timetable id 199', '199', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (393, 'New Record inserted On  subject timetable id 198', '198', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (394, 'New Record inserted On  subject timetable id 197', '197', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (395, 'New Record inserted On  subject timetable id 196', '196', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (396, 'New Record inserted On  subject timetable id 195', '195', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (397, 'New Record inserted On  subject timetable id 194', '194', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (398, 'New Record inserted On  subject timetable id 205', '205', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (399, 'New Record inserted On  subject timetable id 204', '204', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (400, 'New Record inserted On  subject timetable id 203', '203', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (401, 'New Record inserted On  subject timetable id 202', '202', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (402, 'New Record inserted On  subject timetable id 201', '201', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (403, 'New Record inserted On  subject timetable id 200', '200', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:04:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (404, 'New Record inserted On  subject timetable id 211', '211', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (405, 'New Record inserted On  subject timetable id 210', '210', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (406, 'New Record inserted On  subject timetable id 209', '209', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (407, 'New Record inserted On  subject timetable id 208', '208', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (408, 'New Record inserted On  subject timetable id 207', '207', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (409, 'New Record inserted On  subject timetable id 206', '206', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:06:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (410, 'New Record inserted On  subject timetable id 217', '217', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (411, 'New Record inserted On  subject timetable id 216', '216', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (412, 'New Record inserted On  subject timetable id 215', '215', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (413, 'New Record inserted On  subject timetable id 214', '214', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (414, 'New Record inserted On  subject timetable id 213', '213', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (415, 'New Record inserted On  subject timetable id 212', '212', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:07:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (416, 'New Record inserted On  subject timetable id 223', '223', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (417, 'New Record inserted On  subject timetable id 222', '222', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (418, 'New Record inserted On  subject timetable id 221', '221', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (419, 'New Record inserted On  subject timetable id 220', '220', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (420, 'New Record inserted On  subject timetable id 219', '219', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (421, 'New Record inserted On  subject timetable id 218', '218', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:08:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (422, 'New Record inserted On  subject timetable id 229', '229', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (423, 'New Record inserted On  subject timetable id 228', '228', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (424, 'New Record inserted On  subject timetable id 227', '227', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (425, 'New Record inserted On  subject timetable id 232', '232', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (426, 'New Record inserted On  subject timetable id 231', '231', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (427, 'New Record inserted On  subject timetable id 230', '230', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:10:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (428, 'New Record inserted On  subject timetable id 235', '235', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:13:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (429, 'New Record inserted On  subject timetable id 234', '234', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:13:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (430, 'New Record inserted On  subject timetable id 233', '233', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:13:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (431, 'New Record inserted On  subject timetable id 238', '238', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:14:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (432, 'New Record inserted On  subject timetable id 237', '237', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:14:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (433, 'New Record inserted On  subject timetable id 236', '236', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:14:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (434, 'New Record inserted On  subject timetable id 241', '241', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (435, 'New Record inserted On  subject timetable id 240', '240', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (436, 'New Record inserted On  subject timetable id 239', '239', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (437, 'New Record inserted On  subject timetable id 244', '244', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (438, 'New Record inserted On  subject timetable id 243', '243', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (439, 'New Record inserted On  subject timetable id 242', '242', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:15:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (440, 'New Record inserted On  subject timetable id 247', '247', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (441, 'New Record inserted On  subject timetable id 246', '246', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (442, 'New Record inserted On  subject timetable id 245', '245', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (443, 'New Record inserted On  subject timetable id 244', '244', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (444, 'New Record inserted On  subject timetable id 251', '251', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (445, 'New Record inserted On  subject timetable id 250', '250', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (446, 'New Record inserted On  subject timetable id 249', '249', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:16:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (447, 'New Record inserted On  subject timetable id 254', '254', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:17:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (448, 'New Record inserted On  subject timetable id 253', '253', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:17:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (449, 'New Record inserted On  subject timetable id 252', '252', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:17:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (450, 'New Record inserted On  subject timetable id 257', '257', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (451, 'New Record inserted On  subject timetable id 256', '256', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (452, 'New Record inserted On  subject timetable id 255', '255', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (453, 'New Record inserted On  subject timetable id 260', '260', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (454, 'New Record inserted On  subject timetable id 259', '259', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (455, 'New Record inserted On  subject timetable id 258', '258', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (456, 'New Record inserted On  subject timetable id 263', '263', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (457, 'New Record inserted On  subject timetable id 262', '262', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (458, 'New Record inserted On  subject timetable id 261', '261', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:18:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (459, 'New Record inserted On  subject timetable id 266', '266', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (460, 'New Record inserted On  subject timetable id 265', '265', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (461, 'New Record inserted On  subject timetable id 264', '264', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (462, 'New Record inserted On  subject timetable id 269', '269', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (463, 'New Record inserted On  subject timetable id 268', '268', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (464, 'New Record inserted On  subject timetable id 267', '267', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (465, 'New Record inserted On  subject timetable id 272', '272', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (466, 'New Record inserted On  subject timetable id 271', '271', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (467, 'New Record inserted On  subject timetable id 270', '270', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (468, 'New Record inserted On  subject timetable id 275', '275', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:20:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (469, 'New Record inserted On  subject timetable id 274', '274', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:20:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (470, 'New Record inserted On  subject timetable id 273', '273', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:20:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (471, 'New Record inserted On  subject timetable id 278', '278', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (472, 'New Record inserted On  subject timetable id 277', '277', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (473, 'New Record inserted On  subject timetable id 276', '276', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (474, 'New Record inserted On  subject timetable id 281', '281', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:50', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (475, 'New Record inserted On  subject timetable id 280', '280', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:50', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (476, 'New Record inserted On  subject timetable id 279', '279', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:50', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (477, 'New Record inserted On  subject timetable id 284', '284', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (478, 'New Record inserted On  subject timetable id 283', '283', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (479, 'New Record inserted On  subject timetable id 282', '282', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:21:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (480, 'New Record inserted On  subject timetable id 287', '287', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (481, 'New Record inserted On  subject timetable id 286', '286', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (482, 'New Record inserted On  subject timetable id 285', '285', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:16', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (483, 'New Record inserted On  subject timetable id 290', '290', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (484, 'New Record inserted On  subject timetable id 289', '289', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (485, 'New Record inserted On  subject timetable id 288', '288', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:22:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (486, 'New Record inserted On  subject timetable id 293', '293', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:23:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (487, 'New Record inserted On  subject timetable id 292', '292', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:23:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (488, 'New Record inserted On  subject timetable id 291', '291', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:23:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (489, 'New Record inserted On  subject timetable id 296', '296', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:24:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (490, 'New Record inserted On  subject timetable id 295', '295', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:24:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (491, 'New Record inserted On  subject timetable id 294', '294', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:24:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (492, 'New Record inserted On  subject timetable id 299', '299', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (493, 'New Record inserted On  subject timetable id 298', '298', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (494, 'New Record inserted On  subject timetable id 297', '297', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (495, 'New Record inserted On  subject timetable id 302', '302', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (496, 'New Record inserted On  subject timetable id 301', '301', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (497, 'New Record inserted On  subject timetable id 300', '300', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (498, 'New Record inserted On  subject timetable id 305', '305', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:53', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (499, 'New Record inserted On  subject timetable id 304', '304', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:53', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (500, 'New Record inserted On  subject timetable id 303', '303', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:25:53', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (501, 'New Record inserted On  subject timetable id 308', '308', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (502, 'New Record inserted On  subject timetable id 307', '307', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (503, 'New Record inserted On  subject timetable id 306', '306', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (504, 'New Record inserted On  subject timetable id 311', '311', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (505, 'New Record inserted On  subject timetable id 310', '310', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (506, 'New Record inserted On  subject timetable id 309', '309', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:26:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (507, 'New Record inserted On  subject timetable id 314', '314', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (508, 'New Record inserted On  subject timetable id 313', '313', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (509, 'New Record inserted On  subject timetable id 312', '312', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (510, 'New Record inserted On  subject timetable id 317', '317', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (511, 'New Record inserted On  subject timetable id 316', '316', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (512, 'New Record inserted On  subject timetable id 315', '315', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:31', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (513, 'New Record inserted On  subject timetable id 320', '320', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (514, 'New Record inserted On  subject timetable id 319', '319', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (515, 'New Record inserted On  subject timetable id 318', '318', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (516, 'New Record inserted On  subject timetable id 323', '323', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (517, 'New Record inserted On  subject timetable id 322', '322', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (518, 'New Record inserted On  subject timetable id 321', '321', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (519, 'New Record inserted On  subject timetable id 326', '326', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (520, 'New Record inserted On  subject timetable id 325', '325', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (521, 'New Record inserted On  subject timetable id 324', '324', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (522, 'New Record inserted On  subject timetable id 329', '329', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (523, 'New Record inserted On  subject timetable id 328', '328', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (524, 'New Record inserted On  subject timetable id 327', '327', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:28:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (525, 'New Record inserted On  subject timetable id 332', '332', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:30:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (526, 'New Record inserted On  subject timetable id 331', '331', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:30:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (527, 'New Record inserted On  subject timetable id 330', '330', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:30:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (528, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:36:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (529, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:37:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (530, 'New Record inserted On sms config id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:38:00', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (531, 'Record updated On sms config id custom', 'custom', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:38:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (532, 'Record updated On settings id 1', '1', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:46:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (533, 'Record updated On  online_admission_fields id 4', '4', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:46:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (534, 'Record updated On  online_admission_fields id 8', '8', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:46:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (535, 'Record updated On  online_admission_fields id 9', '9', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:00', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (536, 'Record updated On  online_admission_fields id 5', '5', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:06', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (537, 'Record updated On  online_admission_fields id 10', '10', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:10', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (538, 'Record updated On  online_admission_fields id 11', '11', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (539, 'Record updated On  online_admission_fields id 12', '12', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:18', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (540, 'Record updated On  online_admission_fields id 13', '13', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:23', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (541, 'Record updated On  online_admission_fields id 14', '14', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:25', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (542, 'Record updated On  online_admission_fields id 15', '15', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (543, 'Record updated On  online_admission_fields id 16', '16', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:32', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (544, 'Record updated On  online_admission_fields id 18', '18', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (545, 'Record updated On  online_admission_fields id 17', '17', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (546, 'Record updated On  online_admission_fields id 19', '19', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:39', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (547, 'Record updated On  online_admission_fields id 20', '20', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:42', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (548, 'Record updated On  online_admission_fields id 28', '28', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:52', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (549, 'Record updated On  online_admission_fields id 39', '39', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (550, 'Record updated On  online_admission_fields id 40', '40', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:47:58', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (551, 'Record updated On  online_admission_fields id 29', '29', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:48:02', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (552, 'Record updated On  online_admission_fields id 34', '34', 1, 'Update', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:48:11', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (553, 'New Record inserted On  expense head id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:50:04', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (554, 'New Record inserted On  expense head id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:50:30', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (555, 'New Record inserted On  expense head id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:50:39', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (556, 'New Record inserted On  expense head id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:50:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (557, 'New Record inserted On  expense head id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:51:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (558, 'New Record inserted On  expenses   id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:52:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (559, 'New Record inserted On  expenses   id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:52:29', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (560, 'New Record inserted On  expenses   id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:54:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (561, 'New Record inserted On  expenses   id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:55:12', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (562, 'New Record inserted On  fee type id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:56:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (563, 'New Record inserted On  fee type id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:57:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (564, 'New Record inserted On  fee type id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:57:24', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (565, 'New Record inserted On  fee type id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:57:39', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (566, 'New Record inserted On  fee type id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:57:58', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (567, 'New Record inserted On  fee type id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:58:15', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (568, 'New Record inserted On  fee group id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:58:48', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (569, 'New Record inserted On  fee group id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:58:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (570, 'New Record inserted On  fee group id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:59:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (571, 'New Record inserted On  fee group id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:59:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (572, 'New Record inserted On  fee group id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-13 23:59:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (573, 'New Record inserted On  fee group id 6', '6', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:00:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (574, 'New Record inserted On  fee group id 7', '7', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:00:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (575, 'New Record inserted On  fee groups feetype id 1', '1', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:00:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (576, 'New Record inserted On  fee groups feetype id 2', '2', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:01:24', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (577, 'New Record inserted On  fee groups feetype id 3', '3', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:01:46', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (578, 'New Record inserted On  fee groups feetype id 4', '4', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:02:01', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (579, 'New Record inserted On  fee groups feetype id 5', '5', 1, 'Insert', '103.25.248.241', 'Windows 10', 'Chrome 109.0.0.0', '2023-03-14 00:02:42', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (580, 'New Record inserted On students id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:26:04', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (581, 'New Record inserted On  student session id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:26:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (582, 'New Record inserted On users id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:26:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (583, 'New Record inserted On users id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:26:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (584, 'Record updated On students id 1', '1', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:26:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (585, 'New Record inserted On students id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:44:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (586, 'New Record inserted On  student session id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:44:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (587, 'New Record inserted On users id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:44:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (588, 'New Record inserted On users id 4', '4', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:44:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (589, 'Record updated On students id 2', '2', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:44:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (590, 'New Record inserted On students id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:55:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (591, 'New Record inserted On  student session id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:55:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (592, 'New Record inserted On users id 5', '5', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:55:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (593, 'New Record inserted On users id 6', '6', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:55:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (594, 'Record updated On students id 3', '3', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 18:55:55', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (595, 'New Record inserted On students id 4', '4', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:02:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (596, 'New Record inserted On  student session id 4', '4', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:02:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (597, 'New Record inserted On users id 7', '7', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:02:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (598, 'New Record inserted On users id 8', '8', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:02:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (599, 'Record updated On students id 4', '4', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:02:27', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (600, 'New Record inserted On students id 5', '5', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:07:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (601, 'New Record inserted On  student session id 5', '5', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:07:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (602, 'New Record inserted On users id 9', '9', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:07:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (603, 'New Record inserted On users id 10', '10', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:07:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (604, 'Record updated On students id 5', '5', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:07:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (605, 'New Record inserted On students id 6', '6', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:16:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (606, 'New Record inserted On  student session id 6', '6', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:16:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (607, 'New Record inserted On users id 11', '11', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:16:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (608, 'New Record inserted On users id 12', '12', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:16:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (609, 'Record updated On students id 6', '6', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:16:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (610, 'New Record inserted On students id 7', '7', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:21:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (611, 'New Record inserted On  student session id 7', '7', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:21:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (612, 'New Record inserted On users id 13', '13', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:21:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (613, 'New Record inserted On users id 14', '14', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:21:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (614, 'Record updated On students id 7', '7', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:21:44', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (615, 'New Record inserted On students id 8', '8', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:26:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (616, 'New Record inserted On  student session id 8', '8', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:26:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (617, 'New Record inserted On users id 15', '15', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:26:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (618, 'New Record inserted On users id 16', '16', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:26:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (619, 'Record updated On students id 8', '8', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:26:49', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (620, 'New Record inserted On students id 9', '9', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:31:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (621, 'New Record inserted On  student session id 9', '9', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:31:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (622, 'New Record inserted On users id 17', '17', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:31:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (623, 'New Record inserted On users id 18', '18', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:31:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (624, 'Record updated On students id 9', '9', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:31:57', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (625, 'New Record inserted On students id 10', '10', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:36:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (626, 'New Record inserted On  student session id 10', '10', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:36:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (627, 'New Record inserted On users id 19', '19', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:36:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (628, 'New Record inserted On users id 20', '20', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:36:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (629, 'Record updated On students id 10', '10', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:36:22', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (630, 'New Record inserted On students id 11', '11', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:43:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (631, 'New Record inserted On  student session id 11', '11', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:43:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (632, 'New Record inserted On users id 21', '21', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:43:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (633, 'New Record inserted On users id 22', '22', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:43:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (634, 'Record updated On students id 11', '11', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:43:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (635, 'New Record inserted On students id 12', '12', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:48:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (636, 'New Record inserted On  student session id 12', '12', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:48:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (637, 'New Record inserted On users id 23', '23', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:48:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (638, 'New Record inserted On users id 24', '24', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:48:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (639, 'Record updated On students id 12', '12', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:48:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (640, 'New Record inserted On students id 13', '13', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:54:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (641, 'New Record inserted On  student session id 13', '13', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:54:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (642, 'New Record inserted On users id 25', '25', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:54:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (643, 'New Record inserted On users id 26', '26', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:54:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (644, 'Record updated On students id 13', '13', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 19:54:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (645, 'New Record inserted On students id 14', '14', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (646, 'New Record inserted On  student session id 14', '14', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (647, 'New Record inserted On users id 27', '27', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (648, 'New Record inserted On users id 28', '28', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (649, 'Record updated On students id 14', '14', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:01:03', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (650, 'New Record inserted On students id 15', '15', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:05:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (651, 'New Record inserted On  student session id 15', '15', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:05:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (652, 'New Record inserted On users id 29', '29', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:05:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (653, 'New Record inserted On users id 30', '30', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:05:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (654, 'Record updated On students id 15', '15', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:05:35', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (655, 'New Record inserted On students id 16', '16', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:11:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (656, 'New Record inserted On  student session id 16', '16', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:11:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (657, 'New Record inserted On users id 31', '31', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:11:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (658, 'New Record inserted On users id 32', '32', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:11:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (659, 'Record updated On students id 16', '16', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:11:19', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (660, 'New Record inserted On students id 17', '17', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (661, 'New Record inserted On  student session id 17', '17', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (662, 'New Record inserted On users id 33', '33', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (663, 'New Record inserted On users id 34', '34', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (664, 'Record updated On students id 17', '17', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:19:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (665, 'New Record inserted On students id 18', '18', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:27:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (666, 'New Record inserted On  student session id 18', '18', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:27:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (667, 'New Record inserted On users id 35', '35', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:27:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (668, 'New Record inserted On users id 36', '36', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:27:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (669, 'Record updated On students id 18', '18', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:27:40', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (670, 'New Record inserted On staff attendance id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (671, 'New Record inserted On staff attendance id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (672, 'New Record inserted On staff attendance id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (673, 'New Record inserted On staff attendance id 4', '4', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (674, 'New Record inserted On staff attendance id 5', '5', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (675, 'New Record inserted On staff attendance id 6', '6', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:37:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (676, 'New Record inserted On staff attendance id 7', '7', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:38:05', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (677, 'New Record inserted On staff attendance id 8', '8', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:38:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (678, 'New Record inserted On staff attendance id 9', '9', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:38:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (679, 'New Record inserted On staff attendance id 10', '10', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:38:37', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (680, 'New Record inserted On student apply leave id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:40:45', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (681, 'New Record inserted On student apply leave id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:40:46', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (682, 'New Record inserted On student apply leave id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:40:46', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (683, 'Record deleted On student apply leave id 2', '2', 1, 'Delete', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:40:51', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (684, 'Record deleted On student apply leave id 1', '1', 1, 'Delete', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:40:56', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (685, 'New Record inserted On student apply leave id 4', '4', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:41:59', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (686, 'New Record inserted On student apply leave id 5', '5', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:43:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (687, 'New Record inserted On student apply leave id 6', '6', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:43:26', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (688, 'New Record inserted On Staff Payslip id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:47:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (689, 'New Record inserted On payslip allowance id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:47:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (690, 'New Record inserted On payslip allowance id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:47:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (691, 'New Record inserted On leave types id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:48:28', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (692, 'New Record inserted On leave types id 2', '2', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:48:34', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (693, 'New Record inserted On leave types id 3', '3', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:48:41', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (694, 'New Record inserted On exam groups id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:49:47', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (695, 'New Record inserted On exam group exams name id 1', '1', 1, 'Insert', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 20:51:21', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (696, 'Record updated On  marksheets id 1', '1', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:09:14', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (697, 'Record updated On  marksheets id 1', '1', 1, 'Update', '103.25.249.241', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:10:09', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (698, 'Record updated On  marksheets id 1', '1', 1, 'Update', '58.145.186.245', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:17:07', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (699, 'Record updated On  marksheets id 1', '1', 1, 'Update', '58.145.186.245', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:22:53', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (700, 'Record updated On  marksheets id 1', '1', 1, 'Update', '58.145.186.245', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:25:13', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (701, 'Record updated On  admit cards id 1', '1', 1, 'Update', '58.145.186.245', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:28:54', NULL);
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (702, 'Record updated On  admit cards id 1', '1', 1, 'Update', '58.145.186.245', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 21:30:13', NULL);


#
# TABLE STRUCTURE FOR: mark_divisions
#

DROP TABLE IF EXISTS `mark_divisions`;

CREATE TABLE `mark_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `percentage_from` float(10,2) DEFAULT NULL,
  `percentage_to` float(10,2) DEFAULT NULL,
  `is_active` int(10) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `template_id` varchar(100) DEFAULT NULL,
  `email_template_id` int(11) DEFAULT NULL,
  `sms_template_id` int(11) DEFAULT NULL,
  `send_through` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT 0,
  `is_schedule` int(1) NOT NULL,
  `sent` int(11) DEFAULT NULL,
  `schedule_date_time` datetime DEFAULT NULL,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `schedule_class` int(11) DEFAULT NULL,
  `schedule_section` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `is_notification` int(11) NOT NULL DEFAULT 0,
  `display_notification` int(11) NOT NULL DEFAULT 0,
  `display_sms` int(11) NOT NULL DEFAULT 1,
  `is_student_recipient` int(1) DEFAULT NULL,
  `is_guardian_recipient` int(1) DEFAULT NULL,
  `is_staff_recipient` int(1) DEFAULT NULL,
  `display_student_recipient` int(1) DEFAULT NULL,
  `display_guardian_recipient` int(1) DEFAULT NULL,
  `display_staff_recipient` int(1) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `template_id` varchar(100) NOT NULL,
  `template` longtext NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (1, 'student_admission', '1', '0', 0, 0, 1, 1, 1, NULL, 1, 1, NULL, 'Student Admission', '', 'Dear {{student_name}} your admission is confirm in Class: {{class}} Section:  {{section}} for Session: {{current_session_name}} for more \r\ndetail\r\n contact\r\n System\r\n Admin\r\n {{class}} {{section}} {{admission_no}} {{roll_no}} {{admission_date}} {{mobileno}} {{email}} {{dob}} {{guardian_name}} {{guardian_relation}} {{guardian_phone}} {{father_name}} {{father_phone}} {{blood_group}} {{mother_name}} {{gender}} {{guardian_email}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (2, 'exam_result', '1', '0', 0, 1, 1, 1, NULL, NULL, 1, 1, NULL, 'Exam Result', '', 'Dear {{student_name}} - {{exam_roll_no}}, your {{exam}} result has been published.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (3, 'fee_submission', '1', '0', 0, 1, 1, 1, 1, NULL, 1, 1, NULL, 'Fee Submission', '', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (4, 'absent_attendence', '1', '0', 0, 1, 1, 1, 1, NULL, 1, 1, NULL, 'Absent Attendence', '', 'Absent Notice :{{student_name}}  was absent on date {{date}} in period {{subject_name}} {{subject_code}} {{subject_type}} from Your School Name', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}} {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (6, 'homework', '1', '0', 0, 1, 1, 1, NULL, NULL, 1, 1, NULL, 'Homework', '', 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}} {{admission_no}} ', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (7, 'fees_reminder', '1', '0', 0, 1, 1, 1, 1, NULL, 1, 1, NULL, 'Fees Reminder', '', 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (8, 'forgot_password', '1', '0', 0, 0, 0, 1, 1, 1, 1, 1, 1, 'Forgot Password', '', 'Dear  {{name}} , \r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (9, 'online_examination_publish_exam', '1', '0', 0, 1, 1, 1, NULL, NULL, 1, 1, NULL, 'Online Examination Publish Exam', '', 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (10, 'online_examination_publish_result', '1', '0', 0, 1, 1, 1, NULL, NULL, 1, 1, NULL, 'Online Examination Publish Result', '', 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (11, 'online_admission_form_submission', '1', '0', 0, 1, 1, 1, 1, NULL, 1, 1, NULL, 'Online Admission Form Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully  on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{reference_no}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (12, 'online_admission_fees_submission', '0', '0', 0, 1, 1, 1, 1, NULL, 1, 1, NULL, 'Online Admission Fees Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has recieved successfully on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}}', '2022-12-28 04:52:24');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (13, 'student_login_credential', '1', '1', 0, 0, 1, 1, 1, 0, 1, 1, NULL, 'Student Login Credential', '1707163291685208209', 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} admission No: {{admission_no}}', '{{url}} {{display_name}} {{username}} {{password}} {{admission_no}}', '2022-08-06 01:34:41');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (14, 'staff_login_credential', '1', '1', 0, 0, 1, 0, 0, 1, NULL, NULL, 1, 'Staff Login Credential', '1707163291685208209', 'Hello {{first_name}} {{last_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} Employee ID: {{employee_id}}', '{{url}} {{first_name}} {{last_name}} {{username}} {{password}} {{employee_id}}', '2021-12-23 06:59:13');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (15, 'fee_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Fee processing', '1707163291301326898', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{email}} {{contact_no}}\r\n\r\n{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} transaction_id :{{transaction_id}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} {{transaction_id}} {{fee_amount}}', '2021-12-22 05:15:42');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (16, 'online_admission_fees_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Online Admission Fees Processing', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has processing on date {{date}}. Your Reference number is {{reference_no}} and your transaction id {{transaction_id}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}} {{transaction_id}}', '2022-08-06 07:09:47');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (17, 'student_apply_leave', '1', '1', 0, 0, 1, 0, 1, 1, NULL, 1, 1, 'Student Apply Leave ( {{student_name}} - {{admission_no}} )', '', 'My Name is {{student_name}} Class {{class}} section {{section}}. I have to apply leave on {{apply_date}}and from {{from_date}} to {{to_date}}. {{message}} please provide.', '{{message}} {{apply_date}} {{from_date}} {{to_date}} {{student_name}} {{class}} {{section}}', '2022-03-12 06:58:37');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (18, 'email_pdf_exam_marksheet', '1', '0', 0, 0, 0, 1, 1, 0, 1, 1, NULL, 'Email PDF Exam Marksheet ( {{student_name}} - {{admission_no}} )', '', 'Dear {{student_name}} ({{admission_no}}) {{class}} Section {{section}}. We have mailed you the marksheet of Exam {{exam}} Roll no.{{roll_no}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}} {{exam}} {{admit_card_roll_no}} ', '2022-03-12 07:24:42');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (19, 'gmeet_online_classes', '1', '0', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Gmeet Live Classes', '', 'Dear student, your live class {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}}', '2021-05-20 09:47:22');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (20, 'gmeet_online_meeting', '1', '0', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Gmeet Live Meeting', '', 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2021-05-20 09:47:09');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (21, 'gmeet_online_classes_start', '1', '0', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Gmeet  Live Classes Start', '', 'Dear student, your live class {{title}} has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}}', '2021-05-20 09:47:41');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (22, 'gmeet_online_meeting_start', '1', '0', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Gmeet Live Meeting Start', '', 'Dear {{name}},  your live meeting {{title}} has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2021-05-20 09:47:31');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (23, 'online_classes', '1', '0', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Zoom Live Classes', '', 'Dear student, your live class {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}}', '2021-05-20 09:49:16');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (24, 'online_meeting', '1', '0', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Zoom Live Meeting', '', 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2021-05-20 09:49:38');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (25, 'zoom_online_classes_start', '1', '0', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Zoom Live Classes Start', '', 'Dear student, your live class {{title}} has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}}', '2021-01-08 11:00:47');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES (26, 'zoom_online_meeting_start', '1', '0', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Zoom Live Meeting Start', '', 'Dear {{name}},  your live meeting {{title}}  has been started  for the duration of {{duration}} minute.', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2021-01-08 11:00:47');


#
# TABLE STRUCTURE FOR: offline_fees_payments
#

DROP TABLE IF EXISTS `offline_fees_payments`;

CREATE TABLE `offline_fees_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(50) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `bank_from` varchar(200) DEFAULT NULL,
  `bank_account_transferred` varchar(200) DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_fees_master_id` (`student_fees_master_id`),
  KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  KEY `student_transport_fee_id` (`student_transport_fee_id`),
  KEY `offline_fees_payments_ibfk_4` (`approved_by`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `offline_fees_payments_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offline_fees_payments_ibfk_2` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offline_fees_payments_ibfk_3` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offline_fees_payments_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offline_fees_payments_ibfk_5` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: online_admission_custom_field_value
#

DROP TABLE IF EXISTS `online_admission_custom_field_value`;

CREATE TABLE `online_admission_custom_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`),
  CONSTRAINT `online_admission_custom_field_value_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: online_admission_fields
#

DROP TABLE IF EXISTS `online_admission_fields`;

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (1, 'middlename', 0, '2021-05-28 06:29:23');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (2, 'lastname', 1, '2021-06-02 00:49:19');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (3, 'category', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (4, 'religion', 1, '2023-03-13 13:46:48');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (5, 'cast', 1, '2023-03-13 13:47:06');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (6, 'mobile_no', 1, '2021-06-02 00:50:24');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (7, 'admission_date', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (8, 'student_photo', 1, '2023-03-13 13:46:55');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (9, 'is_student_house', 1, '2023-03-13 13:47:00');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (10, 'is_blood_group', 1, '2023-03-13 13:47:10');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (11, 'student_height', 1, '2023-03-13 13:47:14');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (12, 'student_weight', 1, '2023-03-13 13:47:18');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (13, 'father_name', 1, '2023-03-13 13:47:23');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (14, 'father_phone', 1, '2023-03-13 13:47:25');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (15, 'father_occupation', 1, '2023-03-13 13:47:28');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (16, 'father_pic', 1, '2023-03-13 13:47:32');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (17, 'mother_name', 1, '2023-03-13 13:47:37');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (18, 'mother_phone', 1, '2023-03-13 13:47:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (19, 'mother_occupation', 1, '2023-03-13 13:47:39');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (20, 'mother_pic', 1, '2023-03-13 13:47:42');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (21, 'guardian_name', 1, '2021-06-02 00:50:54');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (22, 'guardian_phone', 1, '2021-06-02 00:50:54');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (23, 'if_guardian_is', 1, '2021-06-02 00:50:54');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (24, 'guardian_relation', 1, '2021-06-02 00:50:54');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (25, 'guardian_email', 1, '2021-06-02 00:51:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (26, 'guardian_occupation', 1, '2021-06-02 00:51:26');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (27, 'guardian_address', 1, '2021-06-02 00:51:31');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (28, 'bank_account_no', 1, '2023-03-13 13:47:52');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (29, 'bank_name', 1, '2023-03-13 13:48:02');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (30, 'ifsc_code', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (31, 'national_identification_no', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (32, 'local_identification_no', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (33, 'rte', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (34, 'previous_school_details', 1, '2023-03-13 13:48:11');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (35, 'guardian_photo', 1, '2021-06-02 00:51:29');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (36, 'student_note', 0, '2021-06-02 00:55:08');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (37, 'measurement_date', 0, '2021-06-02 00:48:35');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (38, 'student_email', 1, '2021-06-02 00:49:38');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (39, 'current_address', 1, '2023-03-13 13:47:55');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (40, 'permanent_address', 1, '2023-03-13 13:47:58');
INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES (41, 'upload_documents', 1, '2022-09-20 04:00:32');


#
# TABLE STRUCTURE FOR: online_admission_payment
#

DROP TABLE IF EXISTS `online_admission_payment`;

CREATE TABLE `online_admission_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `online_admission_id` int(11) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `online_admission_id` (`online_admission_id`),
  CONSTRAINT `online_admission_payment_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: online_admissions
#

DROP TABLE IF EXISTS `online_admissions`;

CREATE TABLE `online_admissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(255) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(255) NOT NULL,
  `mother_pic` varchar(255) NOT NULL,
  `guardian_pic` varchar(255) NOT NULL,
  `is_enroll` int(255) DEFAULT 0,
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `form_status` int(11) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `app_key` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `disable_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `category_id` (`category_id`),
  KEY `hostel_room_id` (`hostel_room_id`),
  KEY `school_house_id` (`school_house_id`),
  CONSTRAINT `online_admissions_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_admissions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_admissions_ibfk_3` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_admissions_ibfk_4` FOREIGN KEY (`school_house_id`) REFERENCES `school_houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam
#

DROP TABLE IF EXISTS `onlineexam`;

CREATE TABLE `onlineexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `exam` text DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `exam_from` datetime DEFAULT NULL,
  `exam_to` datetime DEFAULT NULL,
  `is_quiz` int(11) NOT NULL DEFAULT 0,
  `auto_publish_date` datetime DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` time NOT NULL,
  `passing_percentage` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `publish_result` int(11) NOT NULL DEFAULT 0,
  `answer_word_count` int(11) NOT NULL DEFAULT -1,
  `is_active` varchar(1) DEFAULT '0',
  `is_marks_display` int(11) NOT NULL DEFAULT 0,
  `is_neg_marking` int(11) NOT NULL DEFAULT 0,
  `is_random_question` int(11) NOT NULL DEFAULT 0,
  `is_rank_generated` int(1) NOT NULL DEFAULT 0,
  `publish_exam_notification` int(1) NOT NULL,
  `publish_result_notification` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `onlineexam_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_attempts
#

DROP TABLE IF EXISTS `onlineexam_attempts`;

CREATE TABLE `onlineexam_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_student_id` (`onlineexam_student_id`),
  CONSTRAINT `onlineexam_attempts_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_questions
#

DROP TABLE IF EXISTS `onlineexam_questions`;

CREATE TABLE `onlineexam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_id` (`onlineexam_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `onlineexam_questions_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_questions_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_student_results
#

DROP TABLE IF EXISTS `onlineexam_student_results`;

CREATE TABLE `onlineexam_student_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_student_id` int(11) NOT NULL,
  `onlineexam_question_id` int(11) NOT NULL,
  `select_option` longtext DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `attachment_upload_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_student_id` (`onlineexam_student_id`),
  KEY `onlineexam_question_id` (`onlineexam_question_id`),
  CONSTRAINT `onlineexam_student_results_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_student_results_ibfk_2` FOREIGN KEY (`onlineexam_question_id`) REFERENCES `onlineexam_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_students
#

DROP TABLE IF EXISTS `onlineexam_students`;

CREATE TABLE `onlineexam_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_attempted` int(1) NOT NULL DEFAULT 0,
  `rank` int(1) DEFAULT 0,
  `quiz_attempted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_id` (`onlineexam_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `onlineexam_students_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `gateway_mode` int(11) NOT NULL COMMENT '0 Testing, 1 live',
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `gateway_mode`, `paytm_website`, `paytm_industrytype`, `created_at`, `updated_at`) VALUES (1, 'sslcommerz', NULL, '', '', 'xxxxxxxxxxxx', 'xxxxxxxxx', NULL, NULL, '', '', 'yes', 0, '', '', '2023-03-13 08:42:13', NULL);


#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `payslip_id` (`payslip_id`),
  CONSTRAINT `payslip_allowance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payslip_allowance_ibfk_2` FOREIGN KEY (`payslip_id`) REFERENCES `staff_payslip` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (1, 1, '', '0', 2, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (2, 1, '', '0', 2, 'negative');


#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_short_code` (`short_code`),
  KEY `perm_group_id` (`perm_group_id`),
  CONSTRAINT `permission_category_ibfk_1` FOREIGN KEY (`perm_group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6006 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (1, 1, 'Student', 'student', 1, 1, 1, 1, '2019-10-24 01:42:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 06:17:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 06:17:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 06:17:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 06:21:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-26 20:18:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-26 20:18:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 06:21:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 06:23:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 06:22:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 06:23:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 06:24:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 06:23:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 06:24:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (15, 5, 'Student / Period Attendance', 'student_attendance', 1, 1, 1, 0, '2019-11-28 20:19:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 06:25:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (21, 7, 'Class Timetable', 'class_timetable', 1, 0, 1, 0, '2019-11-23 22:05:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 06:32:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 06:32:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 06:31:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 06:32:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 06:33:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (28, 9, 'Books List', 'books', 1, 1, 1, 1, '2019-11-23 19:37:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (29, 9, 'Issue Return', 'issue_return', 1, 0, 0, 0, '2019-11-23 19:37:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 07:37:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (31, 10, 'Issue Item', 'issue_item', 1, 1, 1, 1, '2019-11-29 01:39:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (32, 10, 'Add Item Stock', 'item_stock', 1, 1, 1, 1, '2019-11-23 19:39:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (33, 10, 'Add Item', 'item', 1, 1, 1, 1, '2019-11-23 19:39:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (34, 10, 'Item Store', 'store', 1, 1, 1, 1, '2019-11-23 19:40:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (35, 10, 'Item Supplier', 'supplier', 1, 1, 1, 1, '2019-11-23 19:40:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 06:39:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 06:39:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 00:39:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 06:40:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 06:40:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 02:23:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 06:41:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (44, 13, 'Email', 'email', 1, 0, 0, 0, '2019-11-26 00:20:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 06:41:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (53, 15, 'Languages', 'languages', 0, 1, 0, 1, '2021-01-23 02:09:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 05:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 06:44:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 05:08:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 05:08:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 05:08:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 05:08:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 05:08:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-08 23:50:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-08 23:50:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 06:46:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 06:46:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 06:47:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 06:47:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 04:39:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 06:20:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 06:19:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 06:20:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 06:20:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 06:20:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 06:20:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 06:30:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 06:51:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 06:51:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 06:48:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 06:50:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 06:50:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 06:50:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 04:40:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 06:49:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 06:53:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 06:53:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 06:53:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 06:52:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 06:53:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-26 23:07:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 06:41:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 06:37:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 06:41:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 06:41:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 06:54:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 06:34:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 06:54:45');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 02:21:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 0, 1, 1, '2020-10-05 04:56:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 0, '2019-11-28 18:47:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 06:17:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-25 23:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-25 23:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 03:08:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 03:08:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 03:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 03:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 03:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 03:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 04:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 04:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 04:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 04:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (128, 1, 'Student Timeline', 'student_timeline', 1, 1, 1, 1, '2022-12-28 04:52:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (129, 18, 'Staff Timeline', 'staff_timeline', 1, 1, 1, 1, '2022-12-28 04:52:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 00:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 00:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (134, 1, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2019-11-27 01:39:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (135, 2, 'Fees Reminder', 'fees_reminder', 1, 0, 1, 0, '2019-10-24 20:39:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (136, 5, 'Approve Leave', 'approve_leave', 1, 1, 1, 1, '2022-12-28 04:52:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (137, 6, 'Exam Group', 'exam_group', 1, 1, 1, 1, '2019-10-24 21:02:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (141, 6, 'Design Admit Card', 'design_admit_card', 1, 1, 1, 1, '2019-10-24 21:06:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (142, 6, 'Print Admit Card', 'print_admit_card', 1, 0, 0, 0, '2019-11-23 18:57:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (143, 6, 'Design Marksheet', 'design_marksheet', 1, 1, 1, 1, '2019-10-24 21:10:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (144, 6, 'Print Marksheet', 'print_marksheet', 1, 0, 0, 0, '2019-10-24 21:11:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (145, 7, 'Teachers Timetable', 'teachers_time_table', 1, 0, 0, 0, '2019-11-29 21:52:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (146, 14, 'Student Report', 'student_report', 1, 0, 0, 0, '2019-10-24 21:27:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (147, 14, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2019-10-24 21:30:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (148, 14, 'Student History', 'student_history', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (149, 14, 'Student Login Credential Report', 'student_login_credential_report', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (150, 14, 'Class Subject Report', 'class_subject_report', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (151, 14, 'Admission Report', 'admission_report', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (152, 14, 'Sibling Report', 'sibling_report', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (153, 14, 'Homework Evaluation Report', 'homehork_evaluation_report', 1, 0, 0, 0, '2019-11-23 20:04:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (154, 14, 'Student Profile', 'student_profile', 1, 0, 0, 0, '2019-10-24 21:39:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (155, 14, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (156, 14, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (157, 14, 'Fees Collection Report', 'fees_collection_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (158, 14, 'Online Fees Collection Report', 'online_fees_collection_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (159, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (160, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (161, 14, 'PayRoll Report', 'payroll_report', 1, 0, 0, 0, '2019-10-30 20:23:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (162, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (163, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (164, 14, 'Attendance Report', 'attendance_report', 1, 0, 0, 0, '2019-10-24 22:08:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (165, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-10-24 22:08:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (174, 14, 'Transport Report', 'transport_report', 1, 0, 0, 0, '2019-10-24 22:13:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (175, 14, 'Hostel Report', 'hostel_report', 1, 0, 0, 0, '2019-11-27 01:51:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (176, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2019-10-24 22:16:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (177, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2019-10-24 22:19:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (178, 14, 'Book Issue Report', 'book_issue_report', 1, 0, 0, 0, '2019-10-24 22:29:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (179, 14, 'Book Due Report', 'book_due_report', 1, 0, 0, 0, '2019-10-24 22:29:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (180, 14, 'Book Inventory Report', 'book_inventory_report', 1, 0, 0, 0, '2019-10-24 22:29:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (181, 14, 'Stock Report', 'stock_report', 1, 0, 0, 0, '2019-10-24 22:31:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (182, 14, 'Add Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-24 22:31:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (183, 14, 'Issue Item Report', 'issue_item_report', 1, 0, 0, 0, '2019-11-28 22:48:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (185, 23, 'Online Examination', 'online_examination', 1, 1, 1, 1, '2019-11-23 18:54:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (186, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2019-11-23 18:55:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (187, 6, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2019-11-23 18:58:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (188, 7, 'Subject Group', 'subject_group', 1, 1, 1, 1, '2019-11-23 19:34:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (189, 18, 'Teachers Rating', 'teachers_rating', 1, 0, 1, 1, '2019-11-23 22:12:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (190, 22, 'Fees Awaiting Payment Widegts', 'fees_awaiting_payment_widegts', 1, 0, 0, 0, '2019-11-23 19:52:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (191, 22, 'Conveted Leads Widegts', 'conveted_leads_widegts', 1, 0, 0, 0, '2019-11-23 19:58:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (192, 22, 'Fees Overview Widegts', 'fees_overview_widegts', 1, 0, 0, 0, '2019-11-23 19:57:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (193, 22, 'Enquiry Overview Widegts', 'enquiry_overview_widegts', 1, 0, 0, 0, '2019-12-02 00:06:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (194, 22, 'Library Overview Widegts', 'book_overview_widegts', 1, 0, 0, 0, '2019-11-30 20:13:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (195, 22, 'Student Today Attendance Widegts', 'today_attendance_widegts', 1, 0, 0, 0, '2019-12-02 23:57:45');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (196, 6, 'Marks Import', 'marks_import', 1, 0, 0, 0, '2019-11-23 20:02:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (197, 14, 'Student Attendance Type Report', 'student_attendance_type_report', 1, 0, 0, 0, '2019-11-23 20:06:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (198, 14, 'Exam Marks Report', 'exam_marks_report', 1, 0, 0, 0, '2019-11-23 20:11:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (200, 14, 'Online Exam Wise Report', 'online_exam_wise_report', 1, 0, 0, 0, '2019-11-23 20:18:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (201, 14, 'Online Exams Report', 'online_exams_report', 1, 0, 0, 0, '2019-11-28 21:48:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (202, 14, 'Online Exams Attempt Report', 'online_exams_attempt_report', 1, 0, 0, 0, '2019-11-28 21:46:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (203, 14, 'Online Exams Rank Report', 'online_exams_rank_report', 1, 0, 0, 0, '2019-11-23 20:22:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (204, 14, 'Staff Report', 'staff_report', 1, 0, 0, 0, '2019-11-23 20:25:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (205, 6, 'Exam', 'exam', 1, 1, 1, 1, '2019-11-23 23:55:48');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (207, 6, 'Exam Publish', 'exam_publish', 1, 0, 0, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (208, 6, 'Link Exam', 'link_exam', 1, 0, 1, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (210, 6, 'Assign / View student', 'exam_assign_view_student', 1, 0, 1, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (211, 6, 'Exam Subject', 'exam_subject', 1, 0, 1, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (212, 6, 'Exam Marks', 'exam_marks', 1, 0, 1, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (213, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2019-11-24 00:17:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (214, 23, 'Add Questions in Exam ', 'add_questions_in_exam', 1, 0, 1, 0, '2019-11-27 20:38:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (215, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2019-11-28 23:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (216, 15, 'System Fields', 'system_fields', 1, 0, 0, 0, '2019-11-24 19:15:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (217, 13, 'SMS', 'sms', 1, 0, 0, 0, '2018-06-22 06:40:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (219, 14, 'Student / Period Attendance Report', 'student_period_attendance_report', 1, 0, 0, 0, '2019-11-28 21:19:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (220, 14, 'Biometric Attendance Log', 'biometric_attendance_log', 1, 0, 0, 0, '2019-11-27 00:59:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (221, 14, 'Book Issue Return Report', 'book_issue_return_report', 1, 0, 0, 0, '2019-11-27 01:30:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (222, 23, 'Assign / View Student', 'online_assign_view_student', 1, 0, 1, 0, '2019-11-27 23:20:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (223, 14, 'Rank Report', 'rank_report', 1, 0, 0, 0, '2019-11-28 21:30:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (224, 25, 'Chat', 'chat', 1, 0, 0, 0, '2019-11-28 23:10:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (226, 22, 'Income Donut Graph', 'income_donut_graph', 1, 0, 0, 0, '2019-11-29 00:00:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (227, 22, 'Expense Donut Graph', 'expense_donut_graph', 1, 0, 0, 0, '2019-11-29 00:01:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (228, 9, 'Import Book', 'import_book', 1, 0, 0, 0, '2019-11-29 01:21:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (229, 22, 'Staff Present Today Widegts', 'staff_present_today_widegts', 1, 0, 0, 0, '2019-11-29 01:48:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (230, 22, 'Student Present Today Widegts', 'student_present_today_widegts', 1, 0, 0, 0, '2019-11-29 01:47:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (231, 26, 'Multi Class Student', 'multi_class_student', 1, 1, 1, 1, '2020-10-05 04:56:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (232, 27, 'Online Admission', 'online_admission', 1, 0, 1, 1, '2019-12-02 01:11:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (233, 15, 'Print Header Footer', 'print_header_footer', 1, 0, 0, 0, '2020-02-11 21:02:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (234, 28, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2020-06-01 23:15:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (235, 28, 'Events', 'events', 1, 1, 1, 1, '2020-05-28 17:48:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (236, 29, 'Manage Lesson Plan', 'manage_lesson_plan', 1, 1, 1, 0, '2020-05-28 18:17:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (237, 29, 'Manage Syllabus Status', 'manage_syllabus_status', 1, 0, 1, 0, '2020-05-28 18:20:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (238, 29, 'Lesson', 'lesson', 1, 1, 1, 1, '2020-05-28 18:20:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (239, 29, 'Topic', 'topic', 1, 1, 1, 1, '2020-05-28 18:20:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (240, 14, 'Syllabus Status Report', 'syllabus_status_report', 1, 0, 0, 0, '2020-05-28 19:17:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (241, 14, 'Teacher Syllabus Status Report', 'teacher_syllabus_status_report', 1, 0, 0, 0, '2020-05-28 19:17:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (242, 14, 'Alumni Report', 'alumni_report', 1, 0, 0, 0, '2020-06-07 19:59:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (243, 15, 'Student Profile Update', 'student_profile_update', 1, 0, 0, 0, '2020-08-21 01:36:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (244, 14, 'Student Gender Ratio Report', 'student_gender_ratio_report', 1, 0, 0, 0, '2020-08-22 08:37:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (245, 14, 'Student Teacher Ratio Report', 'student_teacher_ratio_report', 1, 0, 0, 0, '2020-08-22 08:42:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (246, 14, 'Daily Attendance Report', 'daily_attendance_report', 1, 0, 0, 0, '2020-08-22 08:43:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (247, 23, 'Import Question', 'import_question', 1, 0, 0, 0, '2019-11-23 13:25:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (248, 20, 'Staff ID Card', 'staff_id_card', 1, 1, 1, 1, '2018-07-06 06:41:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (249, 20, 'Generate Staff ID Card', 'generate_staff_id_card', 1, 0, 0, 0, '2018-07-06 06:41:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (250, 19, 'Daily Assignment', 'daily_assignment', 1, 0, 0, 0, '2022-03-02 02:28:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (251, 6, 'Marks Division', 'marks_division', 1, 1, 1, 1, '2022-07-01 11:24:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (252, 13, 'Schedule Email SMS Log', 'schedule_email_sms_log', 1, 0, 1, 0, '2022-07-09 07:25:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (253, 13, 'Login Credentials Send', 'login_credentials_send', 1, 0, 0, 0, '2022-07-01 11:46:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (254, 13, 'Email Template', 'email_template', 1, 1, 1, 1, '2022-07-01 11:46:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (255, 13, 'SMS Template', 'sms_template', 1, 1, 1, 1, '2022-07-01 11:46:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (256, 14, 'Balance Fees Report With Remark', 'balance_fees_report_with_remark', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (257, 14, 'Balance Fees Statement', 'balance_fees_statement', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (258, 14, 'Daily Collection Report', 'daily_collection_report', 1, 0, 0, 0, '2019-10-24 21:55:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (259, 11, 'Fees Master', 'transport_fees_master', 1, 0, 1, 0, '2022-07-05 05:29:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (260, 11, 'Pickup Point', 'pickup_point', 1, 1, 1, 1, '2022-07-04 05:50:08');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (261, 11, 'Route Pickup Point', 'route_pickup_point', 1, 1, 1, 1, '2022-07-04 05:50:08');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (262, 11, 'Student Transport Fees', 'student_transport_fees', 1, 1, 1, 0, '2022-07-05 06:15:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (263, 29, 'Comments', 'lesson_plan_comments', 1, 1, 0, 1, '2020-05-28 18:20:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (264, 15, 'Sidebar Menu', 'sidebar_menu', 1, 0, 0, 0, '2022-07-11 08:01:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (265, 15, 'Currency', 'currency', 1, 0, 0, 0, '2020-08-21 01:36:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (266, 6, 'Exam Schedule', 'exam_schedule', 1, 0, 0, 0, '2019-11-23 18:58:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (267, 6, 'Generate Rank', 'generate_rank', 1, 0, 0, 0, '2019-11-24 00:15:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (268, 8, 'Content Type', 'content_type', 1, 1, 1, 1, '2022-07-08 01:18:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (269, 8, 'Content Share List', 'content_share_list', 1, 0, 0, 1, '2022-07-08 01:18:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (270, 8, 'Video Tutorial', 'video_tutorial', 1, 1, 1, 1, '2022-07-08 01:19:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (271, 15, 'Currency Switcher', 'currency_switcher', 1, 0, 0, 0, '2019-11-24 00:17:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (272, 2, 'Offline Bank Payments', 'offline_bank_payments', 1, 0, 0, 0, '2018-06-26 20:18:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (273, 29, 'Copy Old Lessons', 'copy_old_lesson', 1, 0, 0, 0, '2020-05-28 18:20:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5001, 500, 'Setting', 'setting', 1, 0, 1, 0, '2020-06-10 13:39:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5002, 500, 'Live Classes', 'live_classes', 1, 1, 0, 1, '2020-05-31 15:41:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5003, 500, 'Live Meeting', 'live_meeting', 1, 1, 0, 1, '2020-06-01 12:41:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5004, 500, 'Live Meeting Report', 'live_meeting_report', 1, 0, 0, 0, '2020-06-10 05:07:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5005, 500, 'Live Classes Report', 'live_classes_report', 1, 0, 0, 0, '2020-06-10 06:29:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6001, 600, 'Live Classes', 'gmeet_live_classes', 1, 1, 0, 1, '2020-09-22 10:03:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6002, 600, 'Live Meeting', 'gmeet_live_meeting', 1, 1, 0, 1, '2020-09-22 10:03:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6003, 600, 'Live Meeting Report', 'gmeet_live_meeting_report', 1, 0, 0, 0, '2020-09-22 10:03:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6004, 600, 'Live Classes Report', 'gmeet_live_classes_report', 1, 0, 0, 0, '2020-09-22 10:04:08');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6005, 600, 'Setting', 'gmeet_setting', 1, 0, 1, 0, '2020-09-22 10:04:08');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (1, 'Student Information', 'student_information', 1, 1, '2019-03-15 05:30:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 'Fees Collection', 'fees_collection', 1, 0, '2020-06-10 20:51:35');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (3, 'Income', 'income', 1, 0, '2020-05-31 21:57:39');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (4, 'Expense', 'expense', 1, 0, '2019-03-15 05:06:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (5, 'Student Attendance', 'student_attendance', 1, 0, '2018-07-02 03:48:08');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (6, 'Examination', 'examination', 1, 0, '2018-07-10 22:49:08');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (7, 'Academics', 'academics', 1, 1, '2018-07-02 03:25:43');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (8, 'Download Center', 'download_center', 1, 0, '2018-07-02 03:49:29');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (9, 'Library', 'library', 1, 0, '2018-06-28 07:13:14');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (10, 'Inventory', 'inventory', 1, 0, '2018-06-26 20:48:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (11, 'Transport', 'transport', 1, 0, '2018-06-27 03:51:26');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (12, 'Hostel', 'hostel', 1, 0, '2018-07-02 03:49:32');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (13, 'Communicate', 'communicate', 1, 0, '2018-07-02 03:50:00');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (14, 'Reports', 'reports', 1, 1, '2018-06-26 23:40:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (15, 'System Settings', 'system_settings', 1, 1, '2018-06-26 23:40:28');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (16, 'Front CMS', 'front_cms', 1, 0, '2018-07-10 01:16:54');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (17, 'Front Office', 'front_office', 1, 0, '2018-06-26 23:45:30');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (18, 'Human Resource', 'human_resource', 1, 1, '2018-06-26 23:41:02');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (19, 'Homework', 'homework', 1, 0, '2018-06-26 20:49:38');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (20, 'Certificate', 'certificate', 1, 0, '2018-06-27 03:51:29');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2019-03-15 05:06:25');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2018-06-26 23:41:17');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (23, 'Online Examination', 'online_examination', 1, 0, '2020-05-31 22:25:36');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (25, 'Chat', 'chat', 1, 0, '2019-11-23 18:54:04');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (26, 'Multi Class', 'multi_class', 1, 0, '2019-11-27 07:14:14');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (27, 'Online Admission', 'online_admission', 1, 0, '2019-11-26 21:42:13');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (28, 'Alumni', 'alumni', 1, 0, '2020-05-28 20:26:38');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (29, 'Lesson Plan', 'lesson_plan', 1, 0, '2020-06-07 01:38:30');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (500, 'Zoom Live Classes', 'zoom_live_classes', 1, 0, '2020-06-10 13:37:23');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (600, 'Gmeet Live Classes', 'gmeet_live_classes', 1, 0, '2020-11-12 13:37:03');


#
# TABLE STRUCTURE FOR: permission_student
#

DROP TABLE IF EXISTS `permission_student`;

CREATE TABLE `permission_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `system` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `permission_student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (1, 'Fees', 'fees', 0, 1, 1, 2, '2020-06-10 20:51:35');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2020-05-30 15:57:50');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (3, 'Homework', 'homework', 0, 1, 1, 19, '2020-05-31 22:49:14');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (4, 'Download Center', 'download_center', 0, 1, 1, 8, '2020-05-31 22:52:49');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (5, 'Attendance', 'attendance', 0, 1, 1, 5, '2020-05-31 22:57:18');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (7, 'Examinations', 'examinations', 0, 1, 1, 6, '2020-05-31 22:59:50');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (8, 'Notice Board', 'notice_board', 0, 1, 1, 13, '2020-05-31 23:00:35');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (11, 'Library', 'library', 0, 1, 1, 9, '2020-05-31 23:02:37');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (12, 'Transport Routes', 'transport_routes', 0, 1, 1, 11, '2020-05-31 23:51:30');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (13, 'Hostel Rooms', 'hostel_rooms', 0, 1, 1, 12, '2020-05-31 23:52:27');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (14, 'Calendar To Do List', 'calendar_to_do_list', 0, 1, 1, 21, '2020-05-31 23:53:18');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (15, 'Online Examination', 'online_examination', 0, 1, 1, 23, '2020-06-11 01:20:01');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (16, 'Teachers Rating', 'teachers_rating', 0, 1, 1, NULL, '2022-12-28 04:52:28');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (17, 'Chat', 'chat', 0, 1, 1, 25, '2020-06-01 00:53:06');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (18, 'Multi Class', 'multi_class', 1, 1, 1, 26, '2020-05-30 15:56:52');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (19, 'Lesson Plan', 'lesson_plan', 0, 1, 1, 29, '2020-06-07 01:38:30');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (20, 'Syllabus Status', 'syllabus_status', 0, 1, 1, 29, '2020-06-07 01:38:30');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (23, 'Apply Leave', 'apply_leave', 0, 1, 1, NULL, '2022-12-28 04:52:28');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (24, 'Visitor Book', 'visitor_book', 0, 1, 1, NULL, '2022-10-10 07:45:18');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (25, 'Student Timeline', 'student_timeline', 0, 1, 1, NULL, '2022-10-11 00:50:29');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (26, 'Gmeet Live Classes ', 'gmeet_live_classes', 0, 1, 1, 600, '2020-11-12 13:37:03');
INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (500, 'Zoom Live Classes', 'live_classes', 0, 1, 1, 500, '2023-03-12 00:10:53');


#
# TABLE STRUCTURE FOR: pickup_point
#

DROP TABLE IF EXISTS `pickup_point`;

CREATE TABLE `pickup_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: print_headerfooter
#

DROP TABLE IF EXISTS `print_headerfooter`;

CREATE TABLE `print_headerfooter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_type` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `footer_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES (1, 'staff_payslip', 'header_image.jpg', 'This payslip is computer generated hence no signature is required.', 1, '2020-02-28 10:41:08', '2022-12-28 04:52:24');
INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES (2, 'student_receipt', 'header_image.jpg', 'This receipt is computer generated hence no signature is required.', 1, '2020-02-28 10:40:58', '2022-12-28 04:52:24');
INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES (3, 'online_admission_receipt', 'header_image.jpg', 'This receipt is for online admission  computer ffffffff generated hence no signature is required.', 1, '2021-05-27 08:50:24', '2022-12-28 04:52:24');
INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES (4, 'online_exam', '1655913577-198504634062b33c698fde1!online-exam.jpg', 'This receipt is for online exam computer  generated hence no signature is required.', 1, '2022-08-30 08:58:46', '2022-09-08 13:28:34');


#
# TABLE STRUCTURE FOR: questions
#

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `question_type` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `opt_a` text DEFAULT NULL,
  `opt_b` text DEFAULT NULL,
  `opt_c` text DEFAULT NULL,
  `opt_d` text DEFAULT NULL,
  `opt_e` text DEFAULT NULL,
  `correct` text DEFAULT NULL,
  `descriptive_word_limit` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `staff_id` (`staff_id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `class_section_id` (`class_section_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_6` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  KEY `staff_id` (`staff_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `read_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `read_notification_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `read_notification_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: reference
#

DROP TABLE IF EXISTS `reference`;

CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (1, 'Admin', NULL, 0, 1, 0, '2018-06-30 11:39:11', '0000-00-00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 'Teacher', NULL, 0, 1, 0, '2018-06-30 11:39:14', '0000-00-00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 11:39:17', '0000-00-00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (4, 'Librarian', NULL, 0, 1, 0, '2018-06-30 11:39:21', '0000-00-00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 01:39:03', '0000-00-00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 10:11:29', '0000-00-00');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `perm_cat_id` (`perm_cat_id`),
  CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`perm_cat_id`) REFERENCES `permission_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1513 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (11, 1, 78, 1, 1, 1, 1, '2018-07-02 20:49:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (23, 1, 12, 1, 1, 1, 1, '2018-07-06 05:45:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (24, 1, 13, 1, 1, 1, 1, '2018-07-06 05:48:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (26, 1, 15, 1, 1, 1, 0, '2019-11-27 18:47:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (31, 1, 21, 1, 0, 1, 0, '2019-11-25 23:51:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (34, 1, 24, 1, 1, 1, 1, '2019-11-28 01:35:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (43, 1, 32, 1, 1, 1, 1, '2018-07-06 06:22:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (44, 1, 33, 1, 1, 1, 1, '2018-07-06 06:22:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (45, 1, 34, 1, 1, 1, 1, '2018-07-06 06:23:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (46, 1, 35, 1, 1, 1, 1, '2018-07-06 06:24:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (47, 1, 104, 1, 1, 1, 1, '2018-07-06 06:23:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (48, 1, 37, 1, 1, 1, 1, '2018-07-06 06:25:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (49, 1, 38, 1, 1, 1, 1, '2018-07-09 01:15:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (61, 1, 55, 1, 1, 1, 1, '2018-07-02 05:24:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (67, 1, 61, 1, 1, 0, 1, '2018-07-09 01:59:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (68, 1, 62, 1, 1, 0, 1, '2018-07-09 01:59:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (69, 1, 63, 1, 1, 0, 1, '2018-07-08 23:51:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (70, 1, 64, 1, 1, 1, 1, '2018-07-08 23:02:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (71, 1, 65, 1, 1, 1, 1, '2018-07-08 23:11:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (72, 1, 66, 1, 1, 1, 1, '2018-07-08 23:13:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (73, 1, 67, 1, 1, 1, 1, '2018-07-08 23:14:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (74, 1, 79, 1, 1, 0, 1, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (75, 1, 80, 1, 1, 1, 1, '2018-07-06 05:41:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (76, 1, 81, 1, 1, 1, 1, '2018-07-06 05:41:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (78, 1, 83, 1, 1, 1, 1, '2018-07-06 05:41:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (79, 1, 84, 1, 1, 1, 1, '2018-07-06 05:41:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (80, 1, 85, 1, 1, 1, 1, '2018-07-11 20:16:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (94, 1, 82, 1, 1, 1, 1, '2018-07-06 05:41:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (120, 1, 39, 1, 1, 1, 1, '2018-07-06 06:26:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (156, 1, 9, 1, 1, 1, 1, '2019-11-27 18:45:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (157, 1, 10, 1, 1, 1, 1, '2019-11-27 18:45:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (159, 1, 40, 1, 1, 1, 1, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (160, 1, 41, 1, 1, 1, 1, '2019-12-02 00:43:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (161, 1, 42, 1, 1, 1, 1, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (169, 1, 27, 1, 1, 0, 1, '2019-11-29 01:15:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (178, 1, 54, 1, 0, 1, 0, '2018-07-05 05:09:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (179, 1, 56, 1, 0, 1, 0, '2019-11-29 19:49:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (180, 1, 57, 1, 0, 1, 0, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (181, 1, 58, 1, 0, 1, 0, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (182, 1, 59, 1, 0, 1, 0, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (183, 1, 60, 1, 0, 1, 0, '2019-11-29 19:59:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (201, 1, 14, 1, 0, 0, 0, '2018-07-02 07:22:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (204, 1, 26, 1, 0, 0, 0, '2018-07-02 07:32:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (206, 1, 29, 1, 0, 0, 0, '2018-07-02 07:43:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (207, 1, 30, 1, 0, 0, 0, '2018-07-02 07:43:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (208, 1, 31, 1, 1, 1, 1, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (222, 1, 1, 1, 1, 1, 1, '2019-11-27 17:55:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (307, 1, 126, 1, 0, 0, 0, '2018-07-03 05:26:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (315, 1, 123, 1, 0, 0, 0, '2018-07-03 06:27:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (369, 1, 102, 1, 1, 1, 1, '2019-12-02 00:02:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (435, 1, 96, 1, 1, 1, 1, '2018-07-08 21:03:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (461, 1, 97, 1, 0, 0, 0, '2018-07-08 21:00:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (464, 1, 86, 1, 1, 1, 1, '2019-11-28 01:39:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (474, 1, 130, 1, 1, 0, 1, '2018-07-09 06:56:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (476, 1, 131, 1, 0, 0, 0, '2018-07-09 00:53:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (557, 6, 82, 1, 1, 1, 1, '2019-11-30 20:48:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (558, 6, 83, 1, 1, 1, 1, '2019-11-30 20:49:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (559, 6, 84, 1, 1, 1, 1, '2019-11-30 20:49:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (575, 6, 44, 1, 0, 0, 0, '2018-07-10 03:35:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (576, 6, 46, 1, 0, 0, 0, '2018-07-10 03:35:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (578, 6, 102, 1, 1, 1, 1, '2019-11-30 20:52:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (625, 1, 28, 1, 1, 1, 1, '2019-11-29 01:19:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (634, 4, 102, 1, 1, 1, 1, '2019-11-30 20:03:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (669, 1, 145, 1, 0, 0, 0, '2019-11-25 23:51:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (677, 1, 153, 1, 0, 0, 0, '2019-10-31 22:28:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (720, 1, 216, 1, 0, 0, 0, '2019-11-26 00:24:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (728, 1, 185, 1, 1, 1, 1, '2019-11-27 21:50:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (729, 1, 186, 1, 1, 1, 1, '2019-11-27 21:49:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (730, 1, 214, 1, 0, 1, 0, '2019-11-27 20:47:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (732, 1, 198, 1, 0, 0, 0, '2019-11-26 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (734, 1, 200, 1, 0, 0, 0, '2019-11-26 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (735, 1, 201, 1, 0, 0, 0, '2019-11-26 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (736, 1, 202, 1, 0, 0, 0, '2019-11-26 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (737, 1, 203, 1, 0, 0, 0, '2019-11-26 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (747, 1, 2, 1, 0, 0, 0, '2019-11-27 17:56:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (748, 1, 3, 1, 1, 1, 1, '2019-11-27 17:56:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (749, 1, 4, 1, 1, 1, 1, '2019-11-27 17:56:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (751, 1, 128, 0, 1, 0, 1, '2019-11-27 17:57:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (754, 1, 134, 1, 1, 1, 1, '2019-11-27 18:18:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (755, 1, 5, 1, 1, 0, 1, '2019-11-27 18:35:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (756, 1, 6, 1, 0, 0, 0, '2019-11-27 18:35:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (757, 1, 7, 1, 1, 1, 1, '2019-11-27 18:36:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (758, 1, 8, 1, 1, 1, 1, '2019-11-27 18:37:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (760, 1, 68, 1, 0, 0, 0, '2019-11-27 18:38:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (761, 1, 69, 1, 1, 1, 1, '2019-11-27 18:39:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (762, 1, 70, 1, 1, 1, 1, '2019-11-27 18:39:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (763, 1, 71, 1, 0, 0, 0, '2019-11-27 18:39:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (765, 1, 73, 1, 0, 0, 0, '2019-11-27 18:43:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (766, 1, 74, 1, 0, 0, 0, '2019-11-27 18:43:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (768, 1, 11, 1, 0, 0, 0, '2019-11-27 18:45:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (769, 1, 122, 1, 0, 0, 0, '2019-11-27 18:52:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (771, 1, 136, 1, 0, 0, 0, '2019-11-27 18:55:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (772, 1, 20, 1, 1, 1, 1, '2019-11-27 23:06:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (773, 1, 137, 1, 1, 1, 1, '2019-11-27 19:46:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (774, 1, 141, 1, 1, 1, 1, '2019-11-27 19:59:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (775, 1, 142, 1, 0, 0, 0, '2019-11-27 18:56:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (776, 1, 143, 1, 1, 1, 1, '2019-11-27 19:59:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (777, 1, 144, 1, 0, 0, 0, '2019-11-27 18:56:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (778, 1, 187, 1, 0, 0, 0, '2019-11-27 18:56:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (779, 1, 196, 1, 0, 0, 0, '2019-11-27 18:56:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (781, 1, 207, 1, 0, 0, 0, '2019-11-27 18:56:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (782, 1, 208, 1, 0, 1, 0, '2019-11-27 19:10:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (783, 1, 210, 1, 0, 1, 0, '2019-11-27 19:34:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (784, 1, 211, 1, 0, 1, 0, '2019-11-27 19:38:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (785, 1, 212, 1, 0, 1, 0, '2019-11-27 19:42:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (786, 1, 205, 1, 1, 1, 1, '2019-11-27 19:42:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (787, 1, 222, 1, 0, 1, 0, '2019-11-27 20:36:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (788, 1, 77, 1, 1, 1, 1, '2019-11-28 01:22:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (789, 1, 188, 1, 1, 1, 1, '2019-11-28 01:26:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (790, 1, 23, 1, 1, 1, 1, '2019-11-28 01:34:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (791, 1, 25, 1, 1, 1, 1, '2019-11-28 01:36:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (792, 1, 127, 1, 0, 0, 0, '2019-11-28 01:41:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (794, 1, 88, 1, 1, 1, 0, '2019-11-28 01:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (795, 1, 90, 1, 1, 0, 1, '2019-11-28 01:46:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (796, 1, 108, 1, 0, 1, 1, '2021-01-23 02:09:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (797, 1, 109, 1, 1, 0, 0, '2019-11-28 18:38:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (798, 1, 110, 1, 1, 1, 1, '2019-11-28 18:49:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (799, 1, 111, 1, 1, 1, 1, '2019-11-28 18:49:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (800, 1, 112, 1, 1, 1, 1, '2019-11-28 18:49:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (801, 1, 129, 0, 1, 0, 1, '2019-11-28 18:49:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (802, 1, 189, 1, 0, 1, 1, '2019-11-28 18:59:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (810, 2, 1, 1, 1, 1, 1, '2019-11-29 21:54:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (817, 1, 93, 1, 1, 1, 1, '2019-11-28 19:56:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (825, 1, 87, 1, 0, 0, 0, '2019-11-28 19:56:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (829, 1, 94, 1, 1, 0, 0, '2019-11-28 19:57:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (836, 1, 146, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (837, 1, 147, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (838, 1, 148, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (839, 1, 149, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (840, 1, 150, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (841, 1, 151, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (842, 1, 152, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (843, 1, 154, 1, 0, 0, 0, '2019-11-28 20:13:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (862, 1, 155, 1, 0, 0, 0, '2019-11-28 21:07:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (863, 1, 156, 1, 0, 0, 0, '2019-11-28 21:07:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (864, 1, 157, 1, 0, 0, 0, '2019-11-28 21:08:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (874, 1, 158, 1, 0, 0, 0, '2019-11-28 21:14:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (875, 1, 159, 1, 0, 0, 0, '2019-11-28 21:14:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (876, 1, 160, 1, 0, 0, 0, '2019-11-28 21:14:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (878, 1, 162, 1, 0, 0, 0, '2019-11-28 21:15:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (879, 1, 163, 1, 0, 0, 0, '2019-11-28 21:16:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (882, 1, 164, 1, 0, 0, 0, '2019-11-28 21:25:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (884, 1, 165, 1, 0, 0, 0, '2019-11-28 21:25:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (886, 1, 197, 1, 0, 0, 0, '2019-11-28 21:25:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (887, 1, 219, 1, 0, 0, 0, '2019-11-28 21:26:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (889, 1, 220, 1, 0, 0, 0, '2019-11-28 21:26:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (932, 1, 204, 1, 0, 0, 0, '2019-11-28 22:43:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (933, 1, 221, 1, 0, 0, 0, '2019-11-28 22:45:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (934, 1, 178, 1, 0, 0, 0, '2019-11-28 22:45:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (935, 1, 179, 1, 0, 0, 0, '2019-11-28 22:45:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (936, 1, 161, 1, 0, 0, 0, '2019-11-28 22:45:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (937, 1, 180, 1, 0, 0, 0, '2019-11-28 22:45:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (938, 1, 181, 1, 0, 0, 0, '2019-11-28 22:49:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (939, 1, 182, 1, 0, 0, 0, '2019-11-28 22:49:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (940, 1, 183, 1, 0, 0, 0, '2019-11-28 22:49:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (941, 1, 174, 1, 0, 0, 0, '2019-11-28 22:50:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (943, 1, 176, 1, 0, 0, 0, '2019-11-28 22:52:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (944, 1, 177, 1, 0, 0, 0, '2019-11-28 22:52:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (945, 1, 53, 0, 1, 0, 1, '2021-01-23 02:09:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (946, 1, 215, 1, 0, 0, 0, '2019-11-28 23:01:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (947, 1, 213, 1, 0, 0, 0, '2019-11-28 23:07:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (974, 1, 224, 1, 0, 0, 0, '2019-11-28 23:32:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1026, 1, 135, 1, 0, 1, 0, '2019-11-29 01:02:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1031, 1, 228, 1, 0, 0, 0, '2019-11-29 01:21:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1083, 1, 175, 1, 0, 0, 0, '2019-11-29 19:37:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1086, 1, 43, 1, 1, 1, 1, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1087, 1, 44, 1, 0, 0, 0, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1088, 1, 46, 1, 0, 0, 0, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1089, 1, 217, 1, 0, 0, 0, '2019-11-29 19:49:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1090, 1, 98, 1, 1, 1, 1, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1091, 1, 99, 1, 0, 0, 0, '2019-11-29 20:30:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1092, 1, 223, 1, 0, 0, 0, '2019-11-29 20:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1103, 2, 205, 1, 1, 1, 1, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1105, 2, 23, 1, 0, 0, 0, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1106, 2, 24, 1, 0, 0, 0, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1107, 2, 25, 1, 0, 0, 0, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1108, 2, 77, 1, 0, 0, 0, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1119, 2, 117, 1, 0, 0, 0, '2019-11-29 20:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1123, 3, 8, 1, 1, 1, 1, '2019-11-30 01:46:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1125, 3, 69, 1, 1, 1, 1, '2019-11-30 02:00:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1126, 3, 70, 1, 1, 1, 1, '2019-11-30 02:04:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1130, 3, 9, 1, 1, 1, 1, '2019-11-30 02:14:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1131, 3, 10, 1, 1, 1, 1, '2019-11-30 02:16:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1134, 3, 35, 1, 1, 1, 1, '2019-11-30 02:25:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1135, 3, 104, 1, 1, 1, 1, '2019-11-30 02:25:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1140, 3, 41, 1, 1, 1, 1, '2019-11-30 02:37:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1141, 3, 42, 1, 1, 1, 1, '2019-11-30 02:37:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1142, 3, 43, 1, 1, 1, 1, '2019-11-30 02:42:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1151, 3, 87, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1152, 3, 88, 1, 1, 1, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1153, 3, 90, 1, 1, 0, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1154, 3, 108, 1, 0, 1, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1155, 3, 109, 1, 1, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1156, 3, 110, 1, 1, 1, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1157, 3, 111, 1, 1, 1, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1158, 3, 112, 1, 1, 1, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1159, 3, 127, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1160, 3, 129, 0, 1, 0, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1161, 3, 102, 1, 1, 1, 1, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1162, 3, 106, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1163, 3, 113, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1164, 3, 114, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1165, 3, 115, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1166, 3, 116, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1167, 3, 117, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1168, 3, 118, 1, 0, 0, 0, '2019-11-29 21:23:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1171, 2, 142, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1172, 2, 144, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1179, 2, 212, 1, 0, 1, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1183, 2, 148, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1184, 2, 149, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1185, 2, 150, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1186, 2, 151, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1187, 2, 152, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1188, 2, 153, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1189, 2, 154, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1190, 2, 197, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1191, 2, 198, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1193, 2, 200, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1194, 2, 201, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1195, 2, 202, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1196, 2, 203, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1197, 2, 219, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1198, 2, 223, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1199, 2, 213, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1201, 2, 230, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1204, 2, 214, 1, 0, 1, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1206, 2, 224, 1, 0, 0, 0, '2019-11-29 21:36:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1208, 2, 2, 1, 0, 0, 0, '2019-11-29 21:55:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1210, 2, 143, 1, 1, 1, 1, '2019-11-29 21:57:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1211, 2, 145, 1, 0, 0, 0, '2019-11-29 21:57:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1214, 2, 3, 1, 1, 1, 1, '2019-11-29 22:03:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1216, 2, 4, 1, 1, 1, 1, '2019-11-29 22:32:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1218, 2, 128, 0, 1, 0, 1, '2019-11-29 22:37:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1220, 3, 135, 1, 0, 1, 0, '2019-11-30 02:08:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1231, 3, 190, 1, 0, 0, 0, '2019-11-29 22:44:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1232, 3, 192, 1, 0, 0, 0, '2019-11-29 22:44:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1233, 3, 226, 1, 0, 0, 0, '2019-11-29 22:44:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1234, 3, 227, 1, 0, 0, 0, '2019-11-29 22:44:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1235, 3, 224, 1, 0, 0, 0, '2019-11-29 22:44:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1236, 2, 15, 1, 1, 1, 0, '2019-11-29 22:54:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1239, 2, 122, 1, 0, 0, 0, '2019-11-29 22:57:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1240, 2, 136, 1, 0, 0, 0, '2019-11-29 22:57:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1242, 6, 217, 1, 0, 0, 0, '2019-11-29 23:00:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1243, 6, 224, 1, 0, 0, 0, '2019-11-29 23:00:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1245, 2, 20, 1, 1, 1, 1, '2019-11-29 23:01:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1246, 2, 137, 1, 1, 1, 1, '2019-11-29 23:02:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1248, 2, 141, 1, 1, 1, 1, '2019-11-29 23:04:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1250, 2, 187, 1, 0, 0, 0, '2019-11-29 23:11:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1252, 2, 207, 1, 0, 0, 0, '2019-11-29 23:21:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1253, 2, 208, 1, 0, 1, 0, '2019-11-29 23:22:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1255, 2, 210, 1, 0, 1, 0, '2019-11-29 23:22:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1256, 2, 211, 1, 0, 1, 0, '2019-11-29 23:24:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1257, 2, 21, 1, 0, 0, 0, '2019-11-29 23:32:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1259, 2, 188, 1, 0, 0, 0, '2019-11-29 23:34:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1260, 2, 27, 1, 0, 0, 0, '2019-11-29 23:36:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1262, 2, 43, 1, 1, 1, 1, '2019-11-29 23:39:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1263, 2, 44, 1, 0, 0, 0, '2019-11-29 23:41:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1264, 2, 46, 1, 0, 0, 0, '2019-11-29 23:41:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1265, 2, 217, 1, 0, 0, 0, '2019-11-29 23:41:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1266, 2, 146, 1, 0, 0, 0, '2019-11-29 23:46:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1267, 2, 147, 1, 0, 0, 0, '2019-11-29 23:47:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1269, 2, 164, 1, 0, 0, 0, '2019-11-29 23:51:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1271, 2, 109, 1, 1, 0, 0, '2019-11-30 00:03:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1272, 2, 93, 1, 1, 1, 1, '2019-11-30 00:07:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1273, 2, 94, 1, 1, 0, 0, '2019-11-30 00:07:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1275, 2, 102, 1, 1, 1, 1, '2019-11-30 00:11:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1277, 2, 196, 1, 0, 0, 0, '2019-11-30 00:15:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1278, 2, 195, 1, 0, 0, 0, '2019-11-30 00:19:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1279, 2, 185, 1, 1, 1, 1, '2019-11-30 00:21:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1280, 2, 186, 1, 1, 1, 1, '2019-11-30 00:22:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1281, 2, 222, 1, 0, 1, 0, '2019-11-30 00:24:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1283, 3, 5, 1, 1, 0, 1, '2019-11-30 01:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1284, 3, 6, 1, 0, 0, 0, '2019-11-30 01:43:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1285, 3, 7, 1, 1, 1, 1, '2019-11-30 01:44:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1286, 3, 68, 1, 0, 0, 0, '2019-11-30 01:46:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1287, 3, 71, 1, 0, 0, 0, '2019-11-30 02:05:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1288, 3, 73, 1, 0, 0, 0, '2019-11-30 02:05:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1289, 3, 74, 1, 0, 0, 0, '2019-11-30 02:06:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1290, 3, 11, 1, 0, 0, 0, '2019-11-30 02:16:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1291, 3, 12, 1, 1, 1, 1, '2019-11-30 02:19:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1292, 3, 13, 1, 1, 1, 1, '2019-11-30 02:22:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1294, 3, 14, 1, 0, 0, 0, '2019-11-30 02:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1295, 3, 31, 1, 1, 1, 1, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1297, 3, 37, 1, 1, 1, 1, '2019-11-30 02:28:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1298, 3, 38, 1, 1, 1, 1, '2019-11-30 02:29:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1299, 3, 39, 1, 1, 1, 1, '2019-11-30 02:30:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1300, 3, 40, 1, 1, 1, 1, '2019-11-30 02:32:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1301, 3, 44, 1, 0, 0, 0, '2019-11-30 02:44:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1302, 3, 46, 1, 0, 0, 0, '2019-11-30 02:44:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1303, 3, 217, 1, 0, 0, 0, '2019-11-30 02:44:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1304, 3, 155, 1, 0, 0, 0, '2019-11-30 02:44:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1305, 3, 156, 1, 0, 0, 0, '2019-11-30 02:45:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1306, 3, 157, 1, 0, 0, 0, '2019-11-30 02:45:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1307, 3, 158, 1, 0, 0, 0, '2019-11-30 02:46:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1308, 3, 159, 1, 0, 0, 0, '2019-11-30 02:46:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1309, 3, 160, 1, 0, 0, 0, '2019-11-30 02:46:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1313, 3, 161, 1, 0, 0, 0, '2019-11-30 02:48:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1314, 3, 162, 1, 0, 0, 0, '2019-11-30 02:48:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1315, 3, 163, 1, 0, 0, 0, '2019-11-30 02:48:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1316, 3, 164, 1, 0, 0, 0, '2019-11-30 02:49:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1317, 3, 165, 1, 0, 0, 0, '2019-11-30 02:49:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1318, 3, 174, 1, 0, 0, 0, '2019-11-30 02:49:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1319, 3, 175, 1, 0, 0, 0, '2019-11-30 02:49:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1320, 3, 181, 1, 0, 0, 0, '2019-11-30 02:50:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1321, 3, 86, 1, 1, 1, 1, '2019-11-30 02:54:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1322, 4, 28, 1, 1, 1, 1, '2019-11-30 19:52:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1324, 4, 29, 1, 0, 0, 0, '2019-11-30 19:53:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1325, 4, 30, 1, 0, 0, 0, '2019-11-30 19:53:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1326, 4, 123, 1, 0, 0, 0, '2019-11-30 19:54:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1327, 4, 228, 1, 0, 0, 0, '2019-11-30 19:54:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1328, 4, 43, 1, 1, 1, 1, '2019-11-30 19:58:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1332, 4, 44, 1, 0, 0, 0, '2019-11-30 19:59:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1333, 4, 46, 1, 0, 0, 0, '2019-11-30 19:59:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1334, 4, 217, 1, 0, 0, 0, '2019-11-30 19:59:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1335, 4, 178, 1, 0, 0, 0, '2019-11-30 19:59:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1336, 4, 179, 1, 0, 0, 0, '2019-11-30 20:00:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1337, 4, 180, 1, 0, 0, 0, '2019-11-30 20:00:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1338, 4, 221, 1, 0, 0, 0, '2019-11-30 20:00:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1339, 4, 86, 1, 0, 0, 0, '2019-11-30 20:01:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1341, 4, 106, 1, 0, 0, 0, '2019-11-30 20:05:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1342, 1, 107, 1, 0, 0, 0, '2019-11-30 20:06:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1343, 4, 117, 1, 0, 0, 0, '2019-11-30 20:10:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1344, 4, 194, 1, 0, 0, 0, '2019-11-30 20:11:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1348, 4, 230, 1, 0, 0, 0, '2019-11-30 20:19:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1350, 6, 1, 1, 0, 0, 0, '2019-11-30 20:35:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1351, 6, 21, 1, 0, 0, 0, '2019-11-30 20:36:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1352, 6, 23, 1, 0, 0, 0, '2019-11-30 20:36:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1353, 6, 24, 1, 0, 0, 0, '2019-11-30 20:37:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1354, 6, 25, 1, 0, 0, 0, '2019-11-30 20:37:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1355, 6, 77, 1, 0, 0, 0, '2019-11-30 20:38:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1356, 6, 188, 1, 0, 0, 0, '2019-11-30 20:38:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1357, 6, 43, 1, 1, 1, 1, '2019-11-30 20:40:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1358, 6, 78, 1, 1, 1, 1, '2019-11-30 20:43:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1360, 6, 79, 1, 1, 0, 1, '2019-11-30 20:44:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1361, 6, 80, 1, 1, 1, 1, '2019-11-30 20:45:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1362, 6, 81, 1, 1, 1, 1, '2019-11-30 20:47:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1363, 6, 85, 1, 1, 1, 1, '2019-11-30 20:50:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1364, 6, 86, 1, 0, 0, 0, '2019-11-30 20:51:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1365, 6, 106, 1, 0, 0, 0, '2019-11-30 20:52:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1366, 6, 117, 1, 0, 0, 0, '2019-11-30 20:53:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1394, 1, 106, 1, 0, 0, 0, '2019-12-02 00:20:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1395, 1, 113, 1, 0, 0, 0, '2019-12-02 00:20:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1396, 1, 114, 1, 0, 0, 0, '2019-12-02 00:21:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1397, 1, 115, 1, 0, 0, 0, '2019-12-02 00:21:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1398, 1, 116, 1, 0, 0, 0, '2019-12-02 00:21:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1399, 1, 117, 1, 0, 0, 0, '2019-12-02 00:22:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1400, 1, 118, 1, 0, 0, 0, '2019-12-02 00:22:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1402, 1, 191, 1, 0, 0, 0, '2019-12-02 00:23:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1403, 1, 192, 1, 0, 0, 0, '2019-12-02 00:23:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1404, 1, 193, 1, 0, 0, 0, '2019-12-02 00:23:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1405, 1, 194, 1, 0, 0, 0, '2019-12-02 00:24:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1406, 1, 195, 1, 0, 0, 0, '2019-12-02 00:24:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1408, 1, 227, 1, 0, 0, 0, '2019-12-02 00:25:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1410, 1, 226, 1, 0, 0, 0, '2019-12-02 00:31:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1411, 1, 229, 1, 0, 0, 0, '2019-12-02 00:32:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1412, 1, 230, 1, 0, 0, 0, '2019-12-02 00:32:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1413, 1, 190, 1, 0, 0, 0, '2019-12-02 00:43:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1414, 2, 174, 1, 0, 0, 0, '2019-12-02 00:54:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1415, 2, 175, 1, 0, 0, 0, '2019-12-02 00:54:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1418, 2, 232, 1, 0, 1, 1, '2019-12-02 01:11:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1419, 2, 231, 1, 0, 0, 0, '2019-12-02 01:12:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1420, 1, 231, 1, 1, 1, 1, '2021-01-23 02:09:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1421, 1, 232, 1, 0, 1, 1, '2019-12-02 01:19:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1422, 3, 32, 1, 1, 1, 1, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1423, 3, 33, 1, 1, 1, 1, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1424, 3, 34, 1, 1, 1, 1, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1425, 3, 182, 1, 0, 0, 0, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1426, 3, 183, 1, 0, 0, 0, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1427, 3, 189, 1, 0, 1, 1, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1428, 3, 229, 1, 0, 0, 0, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1429, 3, 230, 1, 0, 0, 0, '2019-12-02 01:30:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1430, 4, 213, 1, 0, 0, 0, '2019-12-02 01:32:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1432, 4, 224, 1, 0, 0, 0, '2019-12-02 01:32:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1433, 4, 195, 1, 0, 0, 0, '2019-12-02 23:57:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1434, 4, 229, 1, 0, 0, 0, '2019-12-02 23:58:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1436, 6, 213, 1, 0, 0, 0, '2019-12-03 00:10:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1437, 6, 191, 1, 0, 0, 0, '2019-12-03 00:10:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1438, 6, 193, 1, 0, 0, 0, '2019-12-03 00:10:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1439, 6, 230, 1, 0, 0, 0, '2019-12-03 00:10:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1440, 2, 106, 1, 0, 0, 0, '2020-01-24 23:21:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1441, 2, 107, 1, 0, 0, 0, '2020-02-11 21:10:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1442, 2, 134, 1, 1, 1, 1, '2020-02-11 21:12:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1443, 1, 233, 1, 0, 0, 0, '2020-02-11 21:21:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1444, 2, 86, 1, 0, 0, 0, '2020-02-11 21:22:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1445, 3, 233, 1, 0, 0, 0, '2020-02-11 22:51:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1446, 1, 234, 1, 1, 1, 1, '2020-06-01 17:51:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1447, 1, 235, 1, 1, 1, 1, '2020-05-29 19:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1448, 1, 236, 1, 1, 1, 0, '2020-05-29 19:17:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1449, 1, 237, 1, 0, 1, 0, '2020-05-29 19:18:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1450, 1, 238, 1, 1, 1, 1, '2020-05-29 19:19:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1451, 1, 239, 1, 1, 1, 1, '2020-05-29 19:22:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1452, 2, 236, 1, 1, 1, 0, '2020-05-29 19:40:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1453, 2, 237, 1, 0, 1, 0, '2020-05-29 19:40:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1454, 2, 238, 1, 1, 1, 1, '2020-05-29 19:40:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1455, 2, 239, 1, 1, 1, 1, '2020-05-29 19:40:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1456, 2, 240, 1, 0, 0, 0, '2020-05-28 16:51:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1457, 2, 241, 1, 0, 0, 0, '2020-05-28 16:51:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1458, 1, 240, 1, 0, 0, 0, '2020-06-07 14:30:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1459, 1, 241, 1, 0, 0, 0, '2020-06-07 14:30:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1460, 1, 242, 1, 0, 0, 0, '2020-06-07 14:30:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1461, 2, 242, 1, 0, 0, 0, '2020-06-11 18:45:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1462, 3, 242, 1, 0, 0, 0, '2020-06-14 18:46:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1463, 6, 242, 1, 0, 0, 0, '2020-06-14 18:48:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1464, 1, 243, 1, 0, 0, 0, '2020-09-12 02:05:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1465, 1, 109, 1, 1, 0, 0, '2020-09-21 02:33:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1466, 1, 108, 1, 1, 1, 1, '2020-09-21 02:50:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1467, 1, 244, 1, 0, 0, 0, '2020-09-21 02:59:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1468, 1, 245, 1, 0, 0, 0, '2020-09-21 02:59:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1469, 1, 246, 1, 0, 0, 0, '2020-09-21 02:59:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1470, 1, 247, 1, 0, 0, 0, '2021-01-07 01:12:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1472, 2, 247, 1, 0, 0, 0, '2021-01-21 07:46:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1473, 1, 248, 1, 1, 1, 1, '2021-05-19 08:52:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1474, 1, 249, 1, 0, 0, 0, '2021-05-19 08:52:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1475, 2, 248, 1, 1, 1, 1, '2021-05-28 09:11:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1476, 3, 248, 1, 1, 1, 1, '2021-05-28 05:36:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1477, 3, 249, 1, 0, 0, 0, '2021-05-28 05:36:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1478, 6, 248, 1, 0, 0, 0, '2021-05-28 05:56:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1479, 6, 249, 1, 0, 0, 0, '2021-05-28 05:56:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1480, 2, 249, 1, 0, 0, 0, '2021-05-28 09:11:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1481, 2, 6001, 1, 1, 0, 1, '2021-01-29 09:31:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1482, 1, 6001, 1, 1, 0, 1, '2020-09-23 12:59:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1483, 1, 6002, 1, 1, 0, 1, '2020-09-23 13:01:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1484, 1, 6003, 1, 0, 0, 0, '2020-09-23 13:02:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1485, 1, 6004, 1, 0, 0, 0, '2020-09-23 13:02:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1486, 1, 6005, 1, 0, 1, 0, '2021-01-29 07:45:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1487, 2, 6005, 1, 0, 1, 0, '2021-01-29 11:08:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1488, 2, 6002, 1, 1, 0, 1, '2021-01-29 07:58:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1489, 3, 6002, 1, 1, 0, 1, '2021-01-29 07:26:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1490, 3, 6003, 1, 0, 0, 0, '2021-01-29 07:26:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1491, 3, 6005, 1, 0, 1, 0, '2021-01-29 07:26:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1492, 4, 6001, 1, 1, 0, 1, '2021-01-29 07:26:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1493, 4, 6002, 1, 1, 0, 1, '2021-01-29 07:26:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1494, 6, 6001, 1, 1, 0, 1, '2021-01-29 07:27:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1495, 6, 6002, 1, 1, 0, 1, '2021-01-29 07:27:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1496, 6, 6005, 1, 0, 1, 0, '2021-01-29 07:27:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1497, 2, 6003, 1, 0, 0, 0, '2021-01-29 09:31:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1498, 2, 6004, 1, 0, 0, 0, '2021-01-29 09:31:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1499, 1, 5005, 1, 0, 0, 0, '2020-06-14 12:42:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1500, 2, 5005, 1, 0, 0, 0, '2020-06-14 12:59:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1501, 3, 5004, 1, 0, 0, 0, '2020-06-14 13:03:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1502, 2, 5004, 1, 0, 0, 0, '2020-06-14 13:03:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1503, 1, 5004, 1, 0, 0, 0, '2020-06-14 12:42:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1504, 6, 5003, 1, 0, 0, 0, '2020-06-14 13:05:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1505, 4, 5003, 1, 0, 0, 0, '2020-06-14 13:05:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1506, 3, 5003, 1, 1, 0, 1, '2020-06-14 13:03:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1507, 2, 5003, 1, 1, 0, 1, '2020-06-14 12:59:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1508, 1, 5003, 1, 1, 0, 1, '2020-06-14 12:42:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1509, 2, 5002, 1, 1, 0, 1, '2020-06-14 12:59:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1510, 1, 5002, 1, 1, 0, 1, '2020-06-14 12:42:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1511, 1, 5001, 1, 0, 1, 0, '2020-06-14 12:42:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1512, 2, 5001, 1, 0, 1, 0, '2020-06-14 12:42:11');


#
# TABLE STRUCTURE FOR: room_types
#

DROP TABLE IF EXISTS `room_types`;

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: route_pickup_point
#

DROP TABLE IF EXISTS `route_pickup_point`;

CREATE TABLE `route_pickup_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transport_route_id` int(11) NOT NULL,
  `pickup_point_id` int(11) NOT NULL,
  `fees` float(10,2) DEFAULT 0.00,
  `destination_distance` float(10,1) DEFAULT 0.0,
  `pickup_time` time DEFAULT NULL,
  `order_number` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `transport_route_id` (`transport_route_id`),
  KEY `pickup_point_id` (`pickup_point_id`),
  CONSTRAINT `route_pickup_point_ibfk_1` FOREIGN KEY (`transport_route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  CONSTRAINT `route_pickup_point_ibfk_2` FOREIGN KEY (`pickup_point_id`) REFERENCES `pickup_point` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `base_url` varchar(500) DEFAULT NULL,
  `folder_path` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(500) NOT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `is_duplicate_fees_invoice` varchar(100) DEFAULT '0',
  `collect_back_date_fees` int(11) NOT NULL,
  `single_page_print` int(1) DEFAULT 0,
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `cron_secret_key` varchar(100) NOT NULL,
  `currency_place` varchar(50) NOT NULL DEFAULT 'before_number',
  `currency_format` varchar(20) DEFAULT NULL,
  `class_teacher` varchar(100) NOT NULL,
  `start_month` varchar(40) NOT NULL,
  `attendence_type` int(10) NOT NULL DEFAULT 0,
  `low_attendance_limit` float(10,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `admin_logo` varchar(255) NOT NULL,
  `admin_small_logo` varchar(255) NOT NULL,
  `admin_login_page_background` varchar(255) NOT NULL,
  `user_login_page_background` varchar(255) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `fee_due_days` int(3) DEFAULT 0,
  `adm_auto_insert` int(1) NOT NULL DEFAULT 1,
  `adm_prefix` varchar(50) NOT NULL DEFAULT 'ssadm19/20',
  `adm_start_from` varchar(11) NOT NULL,
  `adm_no_digit` int(10) NOT NULL DEFAULT 6,
  `adm_update_status` int(11) NOT NULL DEFAULT 0,
  `staffid_auto_insert` int(11) NOT NULL DEFAULT 1,
  `staffid_prefix` varchar(100) NOT NULL DEFAULT 'staffss/19/20',
  `staffid_start_from` varchar(50) NOT NULL,
  `staffid_no_digit` int(11) NOT NULL DEFAULT 6,
  `staffid_update_status` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `online_admission` int(1) DEFAULT 0,
  `online_admission_payment` varchar(50) NOT NULL,
  `online_admission_amount` float NOT NULL,
  `online_admission_instruction` text NOT NULL,
  `online_admission_conditions` text NOT NULL,
  `online_admission_application_form` varchar(255) DEFAULT NULL,
  `exam_result` int(11) NOT NULL,
  `is_blood_group` int(10) NOT NULL DEFAULT 1,
  `is_student_house` int(10) NOT NULL DEFAULT 1,
  `roll_no` int(11) NOT NULL DEFAULT 1,
  `category` int(11) NOT NULL,
  `religion` int(11) NOT NULL DEFAULT 1,
  `cast` int(11) NOT NULL DEFAULT 1,
  `mobile_no` int(11) NOT NULL DEFAULT 1,
  `student_email` int(11) NOT NULL DEFAULT 1,
  `admission_date` int(11) NOT NULL DEFAULT 1,
  `lastname` int(11) NOT NULL,
  `middlename` int(11) NOT NULL DEFAULT 1,
  `student_photo` int(11) NOT NULL DEFAULT 1,
  `student_height` int(11) NOT NULL DEFAULT 1,
  `student_weight` int(11) NOT NULL DEFAULT 1,
  `measurement_date` int(11) NOT NULL DEFAULT 1,
  `father_name` int(11) NOT NULL DEFAULT 1,
  `father_phone` int(11) NOT NULL DEFAULT 1,
  `father_occupation` int(11) NOT NULL DEFAULT 1,
  `father_pic` int(11) NOT NULL DEFAULT 1,
  `mother_name` int(11) NOT NULL DEFAULT 1,
  `mother_phone` int(11) NOT NULL DEFAULT 1,
  `mother_occupation` int(11) NOT NULL DEFAULT 1,
  `mother_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_name` int(1) NOT NULL,
  `guardian_relation` int(11) NOT NULL DEFAULT 1,
  `guardian_phone` int(1) NOT NULL,
  `guardian_email` int(11) NOT NULL DEFAULT 1,
  `guardian_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_occupation` int(1) NOT NULL,
  `guardian_address` int(11) NOT NULL DEFAULT 1,
  `current_address` int(11) NOT NULL DEFAULT 1,
  `permanent_address` int(11) NOT NULL DEFAULT 1,
  `route_list` int(11) NOT NULL DEFAULT 1,
  `hostel_id` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` int(11) NOT NULL DEFAULT 1,
  `ifsc_code` int(1) NOT NULL,
  `bank_name` int(1) NOT NULL,
  `national_identification_no` int(11) NOT NULL DEFAULT 1,
  `local_identification_no` int(11) NOT NULL DEFAULT 1,
  `rte` int(11) NOT NULL DEFAULT 1,
  `previous_school_details` int(11) NOT NULL DEFAULT 1,
  `student_note` int(11) NOT NULL DEFAULT 1,
  `upload_documents` int(11) NOT NULL DEFAULT 1,
  `student_barcode` int(11) NOT NULL DEFAULT 1,
  `staff_designation` int(11) NOT NULL DEFAULT 1,
  `staff_department` int(11) NOT NULL DEFAULT 1,
  `staff_last_name` int(11) NOT NULL DEFAULT 1,
  `staff_father_name` int(11) NOT NULL DEFAULT 1,
  `staff_mother_name` int(11) NOT NULL DEFAULT 1,
  `staff_date_of_joining` int(11) NOT NULL DEFAULT 1,
  `staff_phone` int(11) NOT NULL DEFAULT 1,
  `staff_emergency_contact` int(11) NOT NULL DEFAULT 1,
  `staff_marital_status` int(11) NOT NULL DEFAULT 1,
  `staff_photo` int(11) NOT NULL DEFAULT 1,
  `staff_current_address` int(11) NOT NULL DEFAULT 1,
  `staff_permanent_address` int(11) NOT NULL DEFAULT 1,
  `staff_qualification` int(11) NOT NULL DEFAULT 1,
  `staff_work_experience` int(11) NOT NULL DEFAULT 1,
  `staff_note` int(11) NOT NULL DEFAULT 1,
  `staff_epf_no` int(11) NOT NULL DEFAULT 1,
  `staff_basic_salary` int(11) NOT NULL DEFAULT 1,
  `staff_contract_type` int(11) NOT NULL DEFAULT 1,
  `staff_work_shift` int(11) NOT NULL DEFAULT 1,
  `staff_work_location` int(11) NOT NULL DEFAULT 1,
  `staff_leaves` int(11) NOT NULL DEFAULT 1,
  `staff_account_details` int(11) NOT NULL DEFAULT 1,
  `staff_social_media` int(11) NOT NULL DEFAULT 1,
  `staff_upload_documents` int(11) NOT NULL DEFAULT 1,
  `staff_barcode` int(11) NOT NULL DEFAULT 1,
  `staff_notification_email` varchar(50) NOT NULL,
  `mobile_api_url` tinytext NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `admin_mobile_api_url` tinytext NOT NULL,
  `admin_app_primary_color_code` varchar(20) NOT NULL,
  `admin_app_secondary_color_code` varchar(20) NOT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  `zoom_api_key` varchar(100) DEFAULT NULL,
  `zoom_api_secret` varchar(100) DEFAULT NULL,
  `student_profile_edit` int(1) NOT NULL DEFAULT 0,
  `start_week` varchar(10) NOT NULL,
  `my_question` int(1) NOT NULL,
  `superadmin_restriction` varchar(20) NOT NULL,
  `student_timeline` varchar(20) NOT NULL,
  `calendar_event_reminder` int(2) DEFAULT NULL,
  `event_reminder` varchar(20) NOT NULL,
  `student_login` varchar(100) DEFAULT NULL,
  `parent_login` varchar(100) DEFAULT NULL,
  `student_panel_login` int(1) NOT NULL DEFAULT 1,
  `parent_panel_login` int(1) NOT NULL DEFAULT 1,
  `is_student_feature_lock` int(1) NOT NULL DEFAULT 0,
  `maintenance_mode` int(1) NOT NULL DEFAULT 0,
  `lock_grace_period` int(10) NOT NULL DEFAULT 0,
  `is_offline_fee_payment` int(1) NOT NULL DEFAULT 0,
  `offline_bank_payment_instruction` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sch_settings` (`id`, `base_url`, `folder_path`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `collect_back_date_fees`, `single_page_print`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `currency_format`, `class_teacher`, `start_month`, `attendence_type`, `low_attendance_limit`, `image`, `admin_logo`, `admin_small_logo`, `admin_login_page_background`, `user_login_page_background`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `online_admission_payment`, `online_admission_amount`, `online_admission_instruction`, `online_admission_conditions`, `online_admission_application_form`, `exam_result`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `student_barcode`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `staff_barcode`, `staff_notification_email`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `admin_mobile_api_url`, `admin_app_primary_color_code`, `admin_app_secondary_color_code`, `app_logo`, `zoom_api_key`, `zoom_api_secret`, `student_profile_edit`, `start_week`, `my_question`, `superadmin_restriction`, `student_timeline`, `calendar_event_reminder`, `event_reminder`, `student_login`, `parent_login`, `student_panel_login`, `parent_panel_login`, `is_student_feature_lock`, `maintenance_mode`, `lock_grace_period`, `is_offline_fee_payment`, `offline_bank_payment_instruction`, `created_at`, `updated_at`) VALUES (1, 'https://school.elitedesign.com.bd/', '/home/elitedes/school.elitedesign.com.bd/', 'রূপনগর হাই স্কুল', 0, '', 'info@elitedesign.com.bd', '০১৭৭৫৪৫৭০০৮', 'হাউজঃ মুন্সি বাড়ি, নয়ার হাট স্কুল সংলগ্ন, বড়বাড়ী, লালমনিরহাট-৫৫০০,বাংলাদেশ', 11, '[\"4\",\"11\"]', 'RUP', 'd-m-Y', '12-hour', '13', '$', 'disabled', '0', 0, 0, 'Asia/Dhaka', 19, '', 'after_number', '####.##', 'no', '1', 0, '0.00', '1678691890-1073341271640ece325d9da!front_logo-640c37d3c0a324.62439798.png', '1.png', '1.png', '1663064530-1070210809632059d2b8b0b!1662796232-1721792380631c41c80d038!login_bg3.jpg', '1663065284-93117584263205cc49769c!1662964519-2099955753631ed327d0ffa!login_bg5.jpg', 'blue.jpg', 60, 0, '', '', 0, 1, 0, '', '', 0, 1, 'no', 1, 'yes', '50', '২০২২ সালের সরকারি স্কুলে ভর্তি অনলাইনে ফরম পূরণের নিয়ম<br />\r\n২০২৩ শিক্ষাবর্ষের সরকারি স্কুল সমূহের ভর্তি বিজ্ঞপ্তির নির্ধারিত সময়ের মধ্যে অনলাইনে ফরম পূরণ করতে হবে। এরপর টেলিটকের প্রি-পেইড মোবাইল এসএমএস এর মাধ্যমে আবেদন ফি পরিশোধ করতে হবে। শুধুমাত্র অনলাইনে ভর্তির জন্য আবেদন করা যাবে।', '<p>&nbsp;Please enter your institution online admission terms &amp; conditions here.</p>\r\n', '1678729595-1803642080640f617baaf1f!admission-fron.png', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', '/app.apk', '#424242', '#eeeeee', '', '', '', '1678689166-1654925228640ec38e7f039!1.png', NULL, NULL, 0, 'Saturday', 1, 'enabled', 'enabled', 0, 'disabled', '[\"admission_no\",\"mobile_number\",\"email\"]', '[\"mobile_number\",\"email\"]', 1, 1, 0, 0, 0, 0, '', '2023-03-13 13:46:35', NULL);


#
# TABLE STRUCTURE FOR: school_houses
#

DROP TABLE IF EXISTS `school_houses`;

CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: sections
#

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'A', 'no', '2023-03-13 11:38:58', NULL);
INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'B', 'no', '2023-03-13 11:39:06', NULL);
INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'C', 'no', '2023-03-13 11:39:11', NULL);


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_id` (`created_id`),
  CONSTRAINT `send_notification_ibfk_1` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: sessions
#

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (7, '2016-17', 'no', '2017-04-20 02:42:19', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (11, '2017-18', 'no', '2017-04-20 02:41:37', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (13, '2018-19', 'no', '2016-08-24 15:26:44', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (14, '2019-20', 'no', '2016-08-24 15:26:55', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (15, '2020-21', 'no', '2016-10-01 01:28:08', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (16, '2021-22', 'no', '2016-10-01 01:28:20', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (18, '2022-23', 'no', '2016-10-01 01:29:02', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (19, '2023-24', 'no', '2016-10-01 01:29:10', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (20, '2024-25', 'no', '2016-10-01 01:29:18', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (21, '2025-26', 'no', '2016-10-01 01:30:10', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (22, '2026-27', 'no', '2016-10-01 01:30:18', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (23, '2027-28', 'no', '2016-10-01 01:30:24', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (24, '2028-29', 'no', '2016-10-01 01:30:30', '0000-00-00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (25, '2029-30', 'no', '2016-10-01 01:30:37', '0000-00-00');


#
# TABLE STRUCTURE FOR: share_content_for
#

DROP TABLE IF EXISTS `share_content_for`;

CREATE TABLE `share_content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(20) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `user_parent_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_content_id` (`share_content_id`),
  KEY `student_id` (`student_id`),
  KEY `staff_id` (`staff_id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `user_parent_id` (`user_parent_id`),
  CONSTRAINT `share_content_for_ibfk_1` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `share_content_for_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `share_content_for_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `share_content_for_ibfk_4` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  CONSTRAINT `share_content_for_ibfk_5` FOREIGN KEY (`user_parent_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: share_contents
#

DROP TABLE IF EXISTS `share_contents`;

CREATE TABLE `share_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `share_date` date DEFAULT NULL,
  `valid_upto` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `share_contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: share_upload_contents
#

DROP TABLE IF EXISTS `share_upload_contents`;

CREATE TABLE `share_upload_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_content_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_content_id` (`upload_content_id`),
  KEY `share_content_id` (`share_content_id`),
  CONSTRAINT `share_upload_contents_ibfk_1` FOREIGN KEY (`upload_content_id`) REFERENCES `upload_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `share_upload_contents_ibfk_2` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: sidebar_menus
#

DROP TABLE IF EXISTS `sidebar_menus`;

CREATE TABLE `sidebar_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_group_id` int(10) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `activate_menu` varchar(100) DEFAULT NULL,
  `lang_key` varchar(250) NOT NULL,
  `system_level` int(3) DEFAULT 0,
  `level` int(5) DEFAULT NULL,
  `sidebar_display` int(1) DEFAULT 0,
  `access_permissions` text DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `permission_group_id` (`permission_group_id`),
  CONSTRAINT `sidebar_menus_ibfk_1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (1, 17, 'fa fa-ioxhost ftlayer', 'Front Office', 'front_office', 'front_office', 10, 1, 1, '(\'admission_enquiry\', \'can_view\') || (\'visitor_book\', \'can_view\') ||       (\'phon_call_log\', \'can_view\') ||  (\'postal_dispatch\', \'can_view\') ||       (\'postal_receive\', \'can_view\') || (\'complaint\', \'can_view\') ||(\'setup_font_office\', \'can_view\')', 1, '2023-01-10 07:49:51');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (2, 1, 'fa fa-user-plus ftlayer', 'Student Information', 'student_information', 'student_information', 20, 2, 1, '(\'student\', \'can_view\') || (\'student\', \'can_add\') || (\'student_history\', \'can_view\') || (\'student_categories\', \'can_view\') || (\'student_houses\', \'can_view\') || (\'disable_student\', \'can_view\') || (\'disable_reason\', \'can_view\') || (\'online_admission\', \'can_view\') || (\'multiclass_student\', \'can_view\') || (\'disable_reason\', \'can_view\')', 1, '2023-01-10 07:49:51');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (3, 2, 'fa fa-money ftlayer', 'Fees Collection', 'fees_collection', 'fees_collection', 30, 3, 1, '(\'collect_fees\', \'can_view\') || (\'search_fees_payment\', \'can_view\') || (\'search_due_fees\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'fees_carry_forward\', \'can_view\') || (\'fees_master\', \'can_view\') || (\'fees_group\', \'can_view\') || (\'fees_type\', \'can_view\') || (\'fees_discount\', \'can_view\') || (\'accountants\', \'can_view\')', 1, '2023-01-10 07:49:51');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (4, 3, 'fa fa-usd ftlayer', 'Income', 'income', 'income', 40, 10, 1, '(\'income\', \'can_view\') || (\'search_income\', \'can_view\') || (\'income_head\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (7, 4, 'fa fa-credit-card ftlayer', 'Expense', 'expense', 'expenses', 50, 11, 1, '(\'expense\', \'can_view\') || (\'search_expense\', \'can_view\') || (\'expense_head\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (10, 5, 'fa fa-calendar-check-o ftlayer', 'Attendance', 'attendance', 'attendance', 60, 13, 1, '(\'student_attendance\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (11, 6, 'fa fa-map-o ftlayer', 'Examinations', 'examinations', 'examinations', 70, 12, 1, '(\'exam_group\', \'can_view\') || (\'exam_result\', \'can_view\') || (\'design_admit_card\', \'can_view\') || (\'print_admit_card\', \'can_view\') || (\'design_marksheet\', \'can_view\') || (\'print_marksheet\', \'can_view\') || (\'marks_grade\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (12, 23, 'fa fa-rss ftlayer', 'Online Examinations', 'online_examinations', 'online_examinations', 80, 14, 1, '(\'online_examination\', \'can_view\') ||  (\'question_bank\', \'can_view\'', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (13, 29, 'fa fa-list-alt ftlayer', 'Lesson Plan', 'lesson_plan', 'lesson_plan', 90, 16, 1, '(\'manage_lesson_plan\', \'can_view\') || (\'manage_syllabus_status\', \'can_view\') || (\'lesson\', \'can_view\') ||  (\'topic\', \'can_view\')||  (\'copy_old_lesson\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (14, 7, 'fa fa-mortar-board ftlayer', 'Academics', 'academics', 'academics', 100, 15, 1, '(\'class_timetable\', \'can_view\') || (\'teachers_timetable\', \'can_view\') || (\'assign_class_teacher\', \'can_view\') || (\'promote_student\', \'can_view\') || (\'subject_group\', \'can_view\') || (\'section\', \'can_view\') || (\'subject\', \'can_view\') || (\'class\', \'can_view\') || (\'section\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (15, 18, 'fa fa-sitemap ftlayer', 'Human Resource', 'human_resource', 'human_resource', 110, 17, 1, '(\'staff\', \'can_view\') || (\'approve_leave_request\', \'can_view\') || (\'apply_leave\', \'can_view\') || (\'leave_types\', \'can_view\') || (\'teachers_rating\', \'can_view\') || (\'department\', \'can_view\') || (\'designation\', \'can_view\') || (\'disable_staff\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (16, 13, 'fa fa-bullhorn ftlayer', 'Communicate', 'communicate', 'communicate', 120, 18, 1, '(\'notice_board\', \'can_view\') || (\'email\', \'can_view\') || (\'sms\', \'can_view\') || (\'email_sms_log\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (17, 8, 'fa fa-download ftlayer', 'Download Center', 'download_center', 'download_center', 130, 19, 1, '(\'upload_content\', \'can_view\') || (\'video_tutorial\', \'can_view\') || (\'content_type\', \'can_view\') || (\'content_share_list\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (18, 19, 'fa fa-flask ftlayer', 'Homework', 'homework', 'homework', 140, 20, 1, '(\'homework\', \'can_view\') || (\'homework\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (19, 9, 'fa fa-book ftlayer', 'Library', 'library', 'library', 150, 21, 1, '(\'books\', \'can_view\') || (\'issue_return\', \'can_view\') || (\'add_staff_member\', \'can_view\') || (\'add_student\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (20, 10, 'fa fa-object-group ftlayer', 'Inventory', 'inventory', 'inventory', 160, 22, 1, '(\'issue_item\', \'can_view\') || (\'item_stock\', \'can_view\') || (\'item\', \'can_view\') || (\'item_category\', \'can_view\') || (\'item_category\', \'can_view\') || (\'store\', \'can_view\') || (\'supplier\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (21, 11, 'fa fa-bus ftlayer', 'Transport', 'transport', 'transport', 170, 23, 1, '(\'routes\', \'can_view\') || (\'vehicle\', \'can_view\') || (\'assign_vehicle\', \'can_view\') || (\'transport_fees_master\', \'can_view\') || (\'pickup_point\', \'can_view\') || (\'route_pickup_point\', \'can_view\') || (\'student_transport_fees\', \'can_view\')      ', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (22, 12, 'fa fa-building-o ftlayer', 'Hostel', 'hostel', 'hostel', 180, 24, 1, '(\'hostel_rooms\', \'can_view\') || (\'room_type\', \'can_view\') || (\'hostel\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (23, 20, 'fa fa-newspaper-o ftlayer', 'Certificate', 'certificate', 'certificate', 190, 25, 1, '(\'student_certificate\', \'can_view\') || (\'generate_certificate\', \'can_view\') || (\'student_id_card\', \'can_view\') || (\'generate_id_card\', \'can_view\') || (\'staff_id_card\', \'can_view\') || (\'generate_staff_id_card\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (24, 16, 'fa fa-empire ftlayer', 'Front CMS', 'front_cms', 'front_cms', 200, 26, 1, '(\'event\', \'can_view\') || (\'gallery\', \'can_view\') || (\'notice\', \'can_view\') || (\'media_manager\', \'can_view\') || (\'pages\', \'can_view\') || (\'menus\', \'can_view\') || (\'banner_images\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (25, 28, 'fa fa-universal-access ftlayer', 'Alumni', 'alumni', 'alumni', 210, 27, 1, '(\'manage_alumni\', \'can_view\') || (\'events\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (26, 14, 'fa fa-line-chart ftlayer', 'Reports', 'reports', 'reports', 220, 28, 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\') || (\'exam_marks_report\', \'can_view\') ||        (\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'transport_report\', \'can_view\') || (\'hostel_report\', \'can_view\') || (\'audit_trail_report\', \'can_view\') || (\'user_log\', \'can_view\') || (\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\') || (\'stock_report\', \'can_view\') ||      (\'add_item_report\', \'can_view\') || (\'issue_inventory_report\', \'can_view\') || (\'syllabus_status_report\', \'can_view\') ||    (\'teacher_syllabus_status_report\', \'can_view\') || (\'daily_collection_report\', \'can_view\') || (\'balance_fees_statement\', \'can_view\') || (\'balance_fees_report_with_remark\', \'can_view\')', 1, '2023-01-10 07:49:37');
INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES (27, 15, 'fa fa-gears ftlayer', 'System Settings', 'system_settings', 'system_setting', 230, 29, 1, '(\'general_setting\', \'can_view\') || (\'session_setting\', \'can_view\') || (\'notification_setting\', \'can_view\') || (\'sms_setting\', \'can_view\') || (\'email_setting\', \'can_view\') || (\'payment_methods\', \'can_view\') || (\'languages\', \'can_view\') || (\'user_status\', \'can_view\') || (\'backup_restore\', \'can_view\') || (\'print_header_footer\', \'can_view\') || (\'backup\', \'can_view\') || (\'front_cms_setting\', \'can_view\') || (\'custom_fields\', \'can_view\') || (\'system_fields\', \'can_view\') || (\'student_profile_update\', \'can_view\') || (\'currency\', \'can_view\') || (\'language_switcher\', \'can_view\') || (\'sidebar_menu\', \'can_view\') || (\'online_admission\', \'can_view\')\r\n', 1, '2023-01-10 07:49:37');


#
# TABLE STRUCTURE FOR: sidebar_sub_menus
#

DROP TABLE IF EXISTS `sidebar_sub_menus`;

CREATE TABLE `sidebar_sub_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sidebar_menu_id` int(10) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `lang_key` varchar(250) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `level` int(5) DEFAULT NULL,
  `access_permissions` varchar(500) DEFAULT NULL,
  `permission_group_id` int(11) DEFAULT NULL,
  `activate_controller` varchar(100) DEFAULT NULL COMMENT 'income',
  `activate_methods` varchar(500) DEFAULT NULL COMMENT 'index,edit',
  `addon_permission` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sidebar_menu_id` (`sidebar_menu_id`),
  KEY `permission_group_id` (`permission_group_id`),
  CONSTRAINT `sidebar_sub_menus_ibfk_1` FOREIGN KEY (`sidebar_menu_id`) REFERENCES `sidebar_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sidebar_sub_menus_ibfk_2` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (1, 1, 'admission_enquiry', NULL, 'admission_enquiry', 'admin/enquiry', 1, '(\'admission_enquiry\', \'can_view\')', NULL, 'enquiry', 'index', NULL, 1, '2022-07-11 08:04:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (2, 1, 'visitor_book', NULL, 'visitor_book', 'admin/visitors', 2, '(\'visitor_book\', \'can_view\')', NULL, 'visitors', 'index', NULL, 1, '2022-07-11 08:04:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (3, 1, 'phone_call_log', NULL, 'phone_call_log', 'admin/generalcall', 3, '(\'phone_call_log\', \'can_view\')', NULL, 'generalcall', 'index,edit', NULL, 1, '2022-05-10 07:40:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (4, 1, 'postal_dispatch', NULL, 'postal_dispatch', 'admin/dispatch', 4, '(\'postal_dispatch\', \'can_view\')', NULL, 'dispatch', 'index,editdispatch', NULL, 1, '2022-05-10 07:40:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (5, 1, 'postal_receive', NULL, 'postal_receive', 'admin/receive', 5, '(\'postal_receive\', \'can_view\')', NULL, 'receive', 'index,editreceive', NULL, 1, '2022-05-10 07:40:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (6, 1, 'complain', NULL, 'complain', 'admin/complaint', 6, '(\'complaint\', \'can_view\')', NULL, 'complaint', 'index,edit', NULL, 1, '2022-05-10 07:40:00');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (7, 1, 'setup_front_office', NULL, 'setup_front_office', 'admin/visitorspurpose', 7, '(\'setup_font_office\', \'can_view\')', NULL, 'visitorspurpose', 'index,edit', NULL, 1, '2022-04-18 11:43:15');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (9, 2, 'student_admission', NULL, 'student_admission', 'student/create', 2, '(\'student\', \'can_add\')', NULL, 'student', 'create,import', NULL, 1, '2022-08-30 03:51:02');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (10, 2, 'online_admission', NULL, 'online_admission', 'admin/onlinestudent', 3, '(\'online_admission\', \'can_view\')', 27, 'onlinestudent', 'index,edit', NULL, 1, '2022-05-10 07:40:30');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (11, 2, 'disable_student', NULL, 'disabled_students', 'student/disablestudentslist', 4, '(\'disable_student\', \'can_view\')', NULL, 'student', 'disablestudentslist', '', 1, '2022-07-23 02:49:00');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (12, 3, 'collect_fees', NULL, 'collect_fees', 'studentfee', 1, '(\'collect_fees\', \'can_view\')', NULL, 'studentfee', 'index,addfee', NULL, 1, '2022-07-23 02:53:34');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (13, 3, 'search_fees_payment', NULL, 'search_fees_payment', 'studentfee/searchpayment', 3, '(\'search_fees_payment\', \'can_view\')', NULL, 'studentfee', 'searchpayment', NULL, 1, '2022-08-08 02:03:40');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (14, 3, 'search_due_fees', NULL, 'search_due_fees', 'studentfee/feesearch', 4, '(\'search_due_fees\', \'can_view\')', NULL, 'studentfee', 'feesearch', NULL, 1, '2022-08-08 02:03:38');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (15, 3, 'fees_master', NULL, 'fees_master', 'admin/feemaster', 5, '(\'fees_master\', \'can_view\')', NULL, 'feemaster', 'index,assign,edit', NULL, 1, '2022-09-24 03:35:55');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (16, 3, 'fees_group', NULL, 'fees_group', 'admin/feegroup', 6, '(\'fees_group\', \'can_view\')', NULL, 'feegroup', 'index,edit', NULL, 1, '2022-08-08 02:03:32');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (17, 4, 'add_income', NULL, 'add_income', 'admin/income', 1, '(\'income\', \'can_view\')', NULL, 'income', 'index,edit', NULL, 1, '2022-07-23 03:03:40');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (18, 4, 'search_income', NULL, 'search_income', 'admin/income/incomesearch', 2, '(\'search_income\', \'can_view\')', NULL, 'income', 'incomesearch', NULL, 1, '2022-07-23 03:10:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (19, 4, 'income_head', NULL, 'income_head', 'admin/incomehead', 3, '(\'income_head\', \'can_view\')', NULL, 'incomehead', 'index,edit', NULL, 1, '2022-07-23 03:11:11');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (20, 2, 'student_details', NULL, 'student_details', 'student/search', 1, '(\'student\', \'can_view\')', NULL, 'student', 'search,view,edit', NULL, 1, '2022-08-30 03:51:05');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (21, 2, 'multi_class_student', NULL, 'multi_class_student', 'student/multiclass', 5, '(\'multi_class_student\', \'can_view\')', 26, 'student', 'multiclass', NULL, 1, '2022-07-23 02:48:37');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (22, 2, 'bulk_delete', NULL, 'bulk_delete', 'student/bulkdelete', 6, '(\'student\', \'can_delete\')', NULL, 'student', 'bulkdelete', NULL, 1, '2022-07-23 02:48:11');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (23, 2, 'student_categories', NULL, 'student_categories', 'category', 7, '(\'student_categories\', \'can_view\')', NULL, 'category', 'index,edit', NULL, 1, '2022-07-23 02:47:24');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (24, 2, 'student_house', NULL, 'student_house', 'admin/schoolhouse', 8, '(\'student_houses\', \'can_view\')', NULL, 'schoolhouse', 'index,edit', NULL, 1, '2022-07-23 02:49:59');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (25, 2, 'disable_reason', NULL, 'disable_reason', 'admin/disable_reason', 9, '(\'disable_reason\', \'can_view\')', NULL, 'disable_reason', 'index,edit', NULL, 1, '2022-07-23 02:50:41');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (29, 7, 'add_expense', NULL, 'add_expense', 'admin/expense', 1, '(\'expense\', \'can_view\')', NULL, 'expense', 'index,edit', '', 1, '2022-07-23 03:12:25');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (32, 3, 'fees_type', NULL, 'fees_type', 'admin/feetype', 7, '(\'fees_type\', \'can_view\')', NULL, 'feetype', 'index,edit', '', 1, '2022-08-08 02:03:29');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (33, 10, 'attendance_by_date', 'attendance_by_date', 'attendance_by_date', 'admin/stuattendence/attendencereport', 3, '(\'attendance_by_date\', \'can_view\')', NULL, 'stuattendence', 'attendencereport', '', 1, '2022-10-20 01:50:25');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (34, 10, 'student_attendance', 'student_attendance', 'student_attendance', 'admin/stuattendence', 1, '(\'student_attendance\', \'can_view\')', NULL, 'stuattendence', 'index', '', 1, '2022-10-20 01:50:25');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (35, 10, 'approve_leave', 'approve_leave', 'approve_leave', 'admin/approve_leave', 2, '(\'approve_leave\', \'can_view\')', NULL, 'approve_leave', 'index', '', 1, '2022-10-14 12:16:44');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (36, 11, 'exam_group', NULL, 'exam_group', 'admin/examgroup', 1, '(\'exam_group\', \'can_view\')', NULL, 'examgroup', 'index,addexam,edit', '', 1, '2022-07-23 03:23:01');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (37, 11, 'exam_schedule', NULL, 'exam_schedule', 'admin/exam_schedule', 2, '(\'student_attendance\', \'can_view\')', NULL, 'exam_schedule', 'index', '', 1, '2022-05-16 03:01:34');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (38, 11, 'exam_result', NULL, 'exam_result', 'admin/examresult', 3, '(\'exam_result\', \'can_view\')', NULL, 'examresult', 'index', '', 1, '2022-05-16 03:01:34');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (39, 11, 'design_admit_card', NULL, 'design_admit_card', 'admin/admitcard', 4, '(\'design_admit_card\', \'can_view\')', NULL, 'admitcard', 'index,edit', '', 1, '2022-07-23 03:28:02');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (40, 11, 'print_admit_card', NULL, 'print_admit_card', 'admin/examresult/admitcard', 5, '(\'print_admit_card\', \'can_view\')', NULL, 'examresult', 'admitcard', '', 1, '2022-05-16 03:01:34');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (41, 11, 'design_marksheet', NULL, 'design_marksheet', 'admin/marksheet', 6, '(\'design_marksheet\', \'can_view\')', NULL, 'marksheet', 'index,edit', '', 1, '2022-07-23 03:35:35');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (42, 11, 'print_marksheet', NULL, 'print_marksheet', 'admin/examresult/marksheet', 7, '(\'print_marksheet\', \'can_view\')', NULL, 'examresult', 'marksheet', '', 1, '2022-05-16 03:01:38');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (43, 11, 'marks_grade', NULL, 'marks_grade', 'admin/grade', 8, '(\'marks_grade\', \'can_view\')', NULL, 'grade', 'index,edit', '', 1, '2022-07-23 03:37:15');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (44, 11, 'marks_division', NULL, 'marks_division', 'admin/marksdivision', 9, '(\'marks_division\', \'can_view\')', NULL, 'marksdivision', 'index,edit', '', 1, '2022-08-25 02:04:26');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (45, 12, 'online_exam', NULL, 'online_exam', 'admin/onlineexam', 1, '(\'online_examination\', \'can_view\')', NULL, 'onlineexam', 'index,evalution,assign', '', 1, '2022-08-30 09:03:45');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (46, 12, 'question_bank', NULL, 'question_bank', 'admin/question', 1, '(\'question_bank\', \'can_view\')', NULL, 'question', 'index,read', '', 1, '2022-08-30 07:03:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (47, 13, 'manage_lesson_plan', NULL, 'manage_lesson_plan', 'admin/syllabus', 2, '(\'manage_lesson_plan\', \'can_view\')', NULL, 'syllabus', 'index', '', 1, '2022-09-03 12:59:31');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (48, 13, 'manage_syllabus_status', NULL, 'manage_syllabus_status', 'admin/syllabus/status', 3, '(\'manage_syllabus_status\', \'can_view\')', NULL, 'syllabus', 'status', '', 1, '2022-09-03 12:59:35');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (49, 13, 'lesson', NULL, 'lesson', 'admin/lessonplan/lesson', 4, '(\'lesson\', \'can_view\')', NULL, 'lessonplan', 'lesson,editlesson', '', 1, '2022-09-15 07:30:55');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (50, 13, 'topic', NULL, 'topic', 'admin/lessonplan/topic', 5, '(\'topic\', \'can_view\')', NULL, 'lessonplan', 'topic,edittopic', '', 1, '2022-09-15 07:30:24');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (51, 14, 'class_timetable', NULL, 'class_timetable', 'admin/timetable/classreport', 1, '(\'class_timetable\', \'can_view\')', NULL, 'timetable', 'classreport,create', '', 1, '2022-07-23 05:01:22');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (52, 14, 'teachers_timetable', NULL, 'teachers_timetable', 'admin/timetable/mytimetable', 2, '(\'teachers_time_table\', \'can_view\')', NULL, 'timetable', 'mytimetable', '', 1, '2022-07-20 08:22:59');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (53, 14, 'assign_class_teacher', NULL, 'assign_class_teacher', 'admin/teacher/assign_class_teacher', 3, '(\'assign_class_teacher\', \'can_view\')', NULL, 'teacher', 'assign_class_teacher,update_class_teacher', '', 1, '2022-07-23 05:00:19');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (54, 14, 'promote_students', NULL, 'promote_students', 'admin/stdtransfer', 4, '(\'promote_student\', \'can_view\')', NULL, 'stdtransfer', 'index', '', 1, '2022-07-20 08:22:54');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (55, 14, 'subject_group', NULL, 'subject_group', 'admin/subjectgroup', 5, '(\'subject_group\', \'can_view\')', NULL, 'subjectgroup', 'index,edit', '', 1, '2022-07-23 04:59:42');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (56, 14, 'subjects', NULL, 'subjects', 'admin/subject', 6, '(\'subject\', \'can_view\')', NULL, 'subject', 'index,edit', '', 1, '2022-07-23 04:59:20');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (57, 14, 'class', NULL, 'class', 'classes', 7, '(\'class\', \'can_view\')', NULL, 'classes', 'index,edit', '', 1, '2022-07-23 04:58:49');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (58, 14, 'sections', NULL, 'sections', 'sections', 8, '(\'section\', \'can_view\')', NULL, 'sections', 'index,edit', '', 1, '2022-07-23 04:58:21');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (59, 15, 'staff_directory', NULL, 'staff_directory', 'admin/staff', 1, '(\'staff\', \'can_view\')', NULL, 'staff', 'index,edit,profile,create', '', 1, '2022-10-12 05:13:24');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (60, 15, 'staff_attendance', NULL, 'staff_attendance', 'admin/staffattendance', 1, '(\'staff_attendance\', \'can_view\')', NULL, 'staffattendance', 'index', '', 1, '2022-09-07 08:04:15');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (61, 15, 'payroll', NULL, 'payroll', 'admin/payroll', 1, '(\'staff_payroll\', \'can_view\')', NULL, 'payroll', 'index,edit,create', '', 1, '2022-08-16 07:58:44');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (62, 15, 'approve_leave_request', NULL, 'approve_leave_request', 'admin/leaverequest/leaverequest', 1, '(\'approve_leave_request\', \'can_view\')', NULL, 'leaverequest', 'leaverequest', '', 1, '2022-05-16 05:04:33');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (74, 15, 'apply_leave', NULL, 'apply_leave', 'admin/staff/leaverequest', 1, '(\'apply_leave\', \'can_view\')', NULL, 'staff', 'leaverequest', '', 1, '2022-05-16 05:11:41');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (75, 15, 'leave_type', NULL, 'leave_type', 'admin/leavetypes', 1, '(\'leave_types\', \'can_view\')', NULL, 'leavetypes', 'index,leaveedit,createleavetype', '', 1, '2022-10-18 07:19:22');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (76, 15, 'teachers_rating', NULL, 'teachers_rating', 'admin/staff/rating', 1, '(\'teachers_rating\', \'can_view\')', NULL, 'staff', 'rating', '', 1, '2022-05-16 05:15:31');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (77, 15, 'department', NULL, 'department', 'admin/department/department', 1, '(\'department\', \'can_view\')', NULL, 'department', 'department,departmentedit', '', 1, '2022-07-23 05:14:20');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (78, 15, 'designation', NULL, 'designation', 'admin/designation/designation', 1, '(\'designation\', \'can_view\')', NULL, 'designation', 'designation,designationedit', '', 1, '2022-07-23 05:15:04');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (79, 15, 'disabled_staff', NULL, 'disabled_staff', 'admin/staff/disablestafflist', 1, '(\'disable_staff\', \'can_view\')', NULL, 'staff', 'disablestafflist', '', 1, '2022-09-13 03:46:56');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (80, 16, 'notice_board', NULL, 'notice_board', 'admin/notification', 1, '(\'notice_board\', \'can_view\')', NULL, 'notification', 'index,edit,add', '', 1, '2022-07-23 05:17:24');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (81, 16, 'send_email', NULL, 'send_email', 'admin/mailsms/compose', 2, '(\'email\', \'can_view\')', NULL, 'mailsms', 'compose', '', 1, '2022-09-02 12:52:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (82, 16, 'send_sms', NULL, 'send_sms', 'admin/mailsms/compose_sms', 3, '(\'sms\', \'can_view\')', NULL, 'mailsms', 'compose_sms', '', 1, '2022-09-02 12:52:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (83, 16, 'email_sms_log', NULL, 'email_sms_log', 'admin/mailsms/index', 4, '(\'email_sms_log\', \'can_view\')', NULL, 'mailsms', 'index', '', 1, '2022-09-02 12:52:50');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (84, 16, 'schedule_email_sms_log', NULL, 'schedule_email_sms_log', 'admin/mailsms/schedule', 5, '(\'schedule_email_sms_log\', \'can_view\')', NULL, 'mailsms', 'schedule,edit_schedule', '', 1, '2022-09-13 03:07:38');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (85, 16, 'login_credentials_send', NULL, 'login_credentials_send', 'student/bulkmail', 6, '(\'login_credentials_send\', \'can_view\')', NULL, 'student', 'bulkmail', '', 1, '2022-09-02 12:52:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (86, 16, 'email_template', NULL, 'email_template', 'admin/mailsms/email_template', 7, '(\'email_template\', \'can_view\')', NULL, 'mailsms', 'email_template', '', 1, '2022-09-02 12:52:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (87, 16, 'sms_template', NULL, 'sms_template', 'admin/mailsms/sms_template', 8, '(\'sms_template\', \'can_view\')', NULL, 'mailsms', 'sms_template', '', 1, '2022-09-02 12:52:46');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (88, 17, 'content_type', NULL, 'content_type', 'admin/contenttype', 1, '(\'content_type\', \'can_view\')', NULL, 'contenttype', 'index,edit', '', 1, '2022-07-23 05:24:45');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (89, 17, 'content_share_list', NULL, 'content_share_list', 'admin/content/list', 1, '(\'content_share_list\', \'can_view\')', NULL, 'content', 'list', '', 1, '2022-07-22 06:07:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (90, 17, 'upload_content', NULL, 'upload_content', 'admin/content/upload', 1, '(\'upload_content\', \'can_view\')', NULL, 'content', 'upload', '', 1, '2022-07-22 06:07:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (91, 17, 'video_tutorial', NULL, 'video_tutorial', 'admin/video_tutorial', 1, '(\'video_tutorial\', \'can_view\')', NULL, 'video_tutorial', 'index', '', 1, '2022-07-22 06:07:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (92, 18, 'add_homework', NULL, 'add_homework', 'homework', 1, '(\'homework\', \'can_view\')', NULL, 'homework', 'index', '', 1, '2022-06-25 05:50:01');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (93, 18, 'daily_assignment', NULL, 'daily_assignment', 'homework/dailyassignment', 2, '(\'daily_assignment\', \'can_view\')', NULL, 'homework', 'dailyassignment', '', 1, '2022-07-23 05:27:23');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (94, 19, 'book_list', NULL, 'book_list', 'admin/book/getall', 1, '(\'books\', \'can_view\')', NULL, 'book', 'getall,index,edit,import,issue_returnreport', '', 1, '2022-09-07 07:45:50');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (95, 19, 'issue_return', NULL, 'issue_return', 'admin/member', 1, '(\'issue_return\', \'can_view\')', NULL, 'member', 'index,issue', '', 1, '2022-07-23 05:32:48');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (96, 19, 'add_student', NULL, 'add_student', 'admin/member/student', 1, '(\'add_student\', \'can_view\')', NULL, 'member', 'student', '', 1, '2022-05-16 07:22:54');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (97, 19, 'add_staff_member', NULL, 'add_staff_member', 'admin/member/teacher', 1, '(\'add_staff_member\', \'can_view\')', NULL, 'member', 'teacher', '', 1, '2022-05-16 07:31:43');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (98, 7, 'search_expense', NULL, 'search_expense', 'admin/expense/expensesearch', 1, '(\'search_expense\', \'can_view\')', NULL, 'expense', 'expensesearch', '', 1, '2022-05-16 07:36:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (99, 7, 'expense_head', NULL, 'expense_head', 'admin/expensehead', 1, '(\'expense_head\', \'can_view\')', NULL, 'expensehead', 'index,edit', '', 1, '2022-07-23 03:16:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (100, 20, 'issue_item', NULL, 'issue_item', 'admin/issueitem', 1, '(\'issue_item\', \'can_view\')', NULL, 'issueitem', 'index,create', '', 1, '2022-07-23 05:35:03');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (101, 20, 'add_item_stock', NULL, 'add_item_stock', 'admin/itemstock', 1, '(\'item_stock\', \'can_view\')', NULL, 'itemstock', 'index,edit', '', 1, '2022-07-23 05:36:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (102, 20, 'add_item', NULL, 'add_item', 'admin/item', 1, '(\'item\', \'can_view\')', NULL, 'item', 'index,edit', '', 1, '2022-07-23 05:36:56');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (103, 20, 'item_category', NULL, 'item_category', 'admin/itemcategory', 1, '(\'item_category\', \'can_view\')', NULL, 'itemcategory', 'index,edit', '', 1, '2022-07-23 05:37:12');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (104, 20, 'item_store', NULL, 'item_store', 'admin/itemstore', 1, '(\'store\', \'can_view\')', NULL, 'itemstore', 'index,edit,create', '', 1, '2022-09-16 07:49:03');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (105, 20, 'item_supplier', NULL, 'item_supplier', 'admin/itemsupplier', 1, '(\'supplier\', \'can_view\')', NULL, 'itemsupplier', 'index,edit,create', '', 1, '2022-07-23 05:38:22');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (106, 21, 'fees_master', NULL, 'fees_master', 'admin/transport/feemaster', 1, '(\'transport\', \'can_view\')', NULL, 'transport', 'feemaster', '', 1, '2022-07-16 09:15:23');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (107, 21, 'pickup_point', NULL, 'pickup_point', 'admin/pickuppoint', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'index', '', 1, '2022-05-16 08:25:27');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (108, 21, 'routes', NULL, 'routes', 'admin/route', 1, '(\'routes\', \'can_view\')', NULL, 'route', 'index,edit', '', 1, '2022-09-17 02:21:23');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (109, 21, 'vehicles', NULL, 'vehicles', 'admin/vehicle', 1, '(\'vehicle\', \'can_view\')', NULL, 'vehicle', 'index', '', 1, '2022-05-16 08:29:35');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (110, 21, 'assign_vehicle', NULL, 'assign_vehicle', 'admin/vehroute', 1, '(\'assign_vehicle\',\'can_view\')', NULL, 'vehroute', 'index,edit', '', 1, '2022-10-19 03:06:08');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (111, 21, 'route_pickup_point', NULL, 'route_pickup_point', 'admin/pickuppoint/assign', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'assign', '', 1, '2022-05-16 08:33:05');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (112, 21, 'student_transport_fees', NULL, 'student_transport_fees', 'admin/pickuppoint/student_fees', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'student_fees', '', 1, '2022-05-16 08:49:48');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (113, 22, 'hostel_rooms', NULL, 'hostel_rooms', 'admin/hostelroom', 1, '(\'hostel_rooms\', \'can_view\')', NULL, 'hostelroom', 'index,edit', '', 1, '2022-07-23 06:27:48');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (114, 22, 'room_type', NULL, 'room_type', 'admin/roomtype', 2, '(\'room_type\', \'can_view\')', NULL, 'roomtype', 'index,edit', '', 1, '2022-07-23 06:32:14');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (115, 22, 'hostel', NULL, 'hostel', 'admin/hostel', 3, '(\'hostel\', \'can_view\')', NULL, 'hostel', 'index,edit', '', 1, '2022-07-23 06:32:39');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (116, 23, 'student_certificate', NULL, 'student_certificate', 'admin/certificate', 1, '(\'student_certificate\', \'can_view\')', NULL, 'certificate', 'index,edit', '', 1, '2022-07-23 06:44:30');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (117, 23, 'generate_certificate', NULL, 'generate_certificate', 'admin/generatecertificate', 1, '(\'generate_certificate\', \'can_view\')', NULL, 'generatecertificate', 'index,search', '', 1, '2022-07-23 06:46:16');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (118, 23, 'student_id_card', NULL, 'student_id_card', 'admin/studentidcard', 1, '(\'student_id_card\', \'can_view\')', NULL, 'studentidcard', 'index,edit', '', 1, '2022-07-23 06:47:01');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (119, 23, 'generate_id_card', NULL, 'generate_id_card', 'admin/generateidcard/search', 1, '(\'generate_id_card\', \'can_view\')', NULL, 'generateidcard', 'search', '', 1, '2022-05-18 01:35:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (120, 23, 'staff_id_card', NULL, 'staff_id_card', 'admin/staffidcard', 1, '(\'staff_id_card\', \'can_view\')', NULL, 'staffidcard', 'index,edit', '', 1, '2022-07-23 06:48:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (121, 23, 'generate_staff_id_card', NULL, 'generate_staff_id_card', 'admin/generatestaffidcard', 1, '(\'generate_staff_id_card\', \'can_view\')', NULL, 'generatestaffidcard', 'index,search', '', 1, '2022-07-23 06:49:06');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (122, 24, 'event', NULL, 'event', 'admin/front/events', 1, '(\'event\', \'can_view\')', NULL, 'events', 'index,edit,create', '', 1, '2022-07-23 06:51:51');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (123, 24, 'gallery', NULL, 'gallery', 'admin/front/gallery', 1, '(\'gallery\', \'can_view\')', NULL, 'gallery', 'index,edit,create', '', 1, '2022-07-23 06:52:22');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (124, 24, 'news', NULL, 'news', 'admin/front/notice', 1, '(\'notice\', \'can_view\')', NULL, 'notice', 'index,edit,create', '', 1, '2022-07-23 06:54:23');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (125, 24, 'media_manager', NULL, 'media_manager', 'admin/front/media', 1, '(\'media_manager\', \'can_view\')', NULL, 'media', 'index', '', 1, '2022-05-18 02:03:32');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (126, 24, 'pages', NULL, 'pages', 'admin/front/page', 1, '(\'pages\', \'can_view\')', NULL, 'page', 'index,edit,create', '', 1, '2022-07-23 06:55:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (127, 24, 'menus', NULL, 'menus', 'admin/front/menus', 1, '(\'menus\', \'can_view\')', NULL, 'menus', 'index,additem', '', 1, '2022-07-23 06:56:31');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (128, 24, 'banner_images', NULL, 'banner_images', 'admin/front/banner', 1, '(\'banner_images\', \'can_view\')', NULL, 'banner', 'index', '', 1, '2022-05-18 02:10:53');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (129, 25, 'manage_alumini', NULL, 'manage_alumini', 'admin/alumni/alumnilist', 1, '(\'manage_alumni\', \'can_view\')', NULL, 'alumni', 'alumnilist', '', 1, '2022-07-23 06:58:36');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (130, 25, 'events', NULL, 'events', 'admin/alumni/events', 1, '(\'events\', \'can_view\')', NULL, 'alumni', 'events', '', 1, '2022-07-23 06:59:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (131, 26, 'student_information', NULL, 'student_information', 'report/studentinformation', 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'homehork_evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'student_gender_ratio_report\', \'can_view\') || (\'student_teacher_ratio_report\', \'can_view\')', NULL, 'report', 'studentinformation,studentreport,online_admission_report,student_teacher_ratio,boys_girls_ratio,student_profile,sibling_report,admission_report,class_subject,classsectionreport,guardianreport,admissionreport,logindetailreport,parentlogindetailreport', '', 1, '2022-09-26 01:26:53');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (132, 26, 'finance', NULL, 'finance', 'financereports/finance', 2, '(\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'online_admission\', \'can_view\')', NULL, 'financereports', 'finance,reportduefees,reportdailycollection,reportbyname,studentacademicreport,collection_report,onlinefees_report,duefeesremark,income,expense,payroll,incomegroup,expensegroup,onlineadmission', '', 1, '2022-09-24 08:20:32');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (133, 26, 'attendance', NULL, 'attendance', 'attendencereports/attendance', 3, '(\'attendance_report\', \'can_view\') || (\'student_attendance_type_report\', \'can_view\') || (\'daily_attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\')', NULL, 'attendencereports', 'attendance,classattendencereport,attendancereport,daily_attendance_report,staffattendancereport,biometric_attlog,reportbymonthstudent,reportbymonth', '', 1, '2022-09-26 07:36:08');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (134, 26, 'examinations', NULL, 'examinations', 'admin/examresult/examinations', 4, '(\'rank_report\', \'can_view\')', NULL, 'examresult', 'rankreport,examinations', '', 1, '2022-09-20 04:34:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (135, 26, 'lesson_plan', NULL, 'lesson_plan', 'report/lesson_plan', 6, '(\'syllabus_status_report\', \'can_view\') || (\'teacher_syllabus_status_report\', \'can_view\')', NULL, 'report', 'lesson_plan,teachersyllabusstatus', '', 1, '2022-07-25 07:39:17');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (136, 26, 'human_resource', NULL, 'human_resource', 'report/human_resource', 7, '(\'staff_report\', \'can_view\') || (\'payroll_report\', \'can_view\')', NULL, 'report', 'human_resource,staff_report,payrollreport', '', 1, '2022-07-25 07:38:20');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (137, 26, 'library', NULL, 'library', 'report/library', 9, '(\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_issue_return_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\')', NULL, 'report', 'library,studentbookissuereport,bookduereport,bookinventory', '', 1, '2022-09-07 07:53:15');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (138, 26, 'inventory', NULL, 'inventory', 'report/inventory', 10, '(\'stock_report\', \'can_view\') || (\'add_item_report\', \'can_view\') || (\'issue_item_report\', \'can_view\')', NULL, 'report', 'inventory,inventorystock,additem,issueinventory', '', 1, '2022-07-25 07:30:57');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (139, 26, 'hostel', NULL, 'hostel', 'admin/hostelroom/studenthosteldetails', 12, '(\'hostel_report\', \'can_view\')', NULL, 'hostelroom', 'studenthosteldetails', '', 1, '2022-07-20 08:30:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (140, 26, 'alumni', NULL, 'alumni', 'report/alumnireport', 13, '(\'alumni_report\', \'can_view\')', NULL, 'report', 'alumnireport', '', 1, '2022-07-20 08:30:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (141, 26, 'user_log', NULL, 'user_log', 'admin/userlog', 14, '(\'user_log\', \'can_view\')', NULL, 'userlog', 'index', '', 1, '2022-07-20 08:30:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (142, 26, 'audit_trail_report', NULL, 'audit_trail_report', 'admin/audit', 15, '(\'audit_trail_report\', \'can_view\')', NULL, 'audit', 'index', '', 1, '2022-07-20 08:30:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (143, 26, 'online_examinations', NULL, 'online_examinations', 'admin/onlineexam/report', 5, '(\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\')', NULL, 'onlineexam', 'report,onlineexams', '', 1, '2022-07-25 07:48:23');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (144, 26, 'homework', NULL, 'homework', 'homework/homeworkordailyassignmentreport', 8, '(\'homework\', \'can_view\') || (\'daily_assignment\', \'can_view\')', NULL, 'homework', 'homeworkordailyassignmentreport,homeworkreport,evaluation_report,dailyassignmentreport', '', 1, '2022-09-21 05:28:47');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (145, 26, 'transport', NULL, 'transport', 'admin/route/studenttransportdetails', 11, '(\'transport_report\', \'can_view\')', NULL, 'route', 'studenttransportdetails', '', 1, '2022-07-20 08:30:07');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (146, 27, 'general_setting', NULL, 'general_setting', 'schsettings', 1, '(\'general_setting\', \'can_view\')', NULL, 'schsettings', 'index,logo,miscellaneous,backendtheme,mobileapp,studentguardianpanel,fees,idautogeneration,attendancetype,maintenance', '', 1, '2022-07-25 07:14:13');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (147, 27, 'session_setting', NULL, 'session_setting', 'sessions', 2, '(\'session_setting\', \'can_view\')', NULL, 'sessions', 'index,edit', '', 1, '2022-07-23 07:57:16');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (148, 27, 'notification_setting', NULL, 'notification_setting', 'admin/notification/setting', 3, '(\'notification_setting\', \'can_view\')', NULL, 'notification', 'setting', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (149, 27, 'sms_setting', NULL, 'sms_setting', 'smsconfig', 4, '(\'sms_setting\', \'can_view\')', NULL, 'smsconfig', 'index', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (150, 27, 'email_setting', NULL, 'email_setting', 'emailconfig', 5, '(\'email_setting\', \'can_view\')', NULL, 'emailconfig', 'index', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (151, 27, 'payment_methods', NULL, 'payment_methods', 'admin/paymentsettings', 6, '(\'payment_methods\', \'can_view\')', NULL, 'paymentsettings', 'index', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (152, 27, 'print_headerfooter', NULL, 'print_headerfooter', 'admin/print_headerfooter', 7, '(\'print_header_footer\', \'can_view\')', NULL, 'print_headerfooter', 'index', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (153, 27, 'front_cms_setting', NULL, 'front_cms_setting', 'admin/frontcms', 8, '(\'front_cms_setting\', \'can_view\')', NULL, 'frontcms', 'index', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (154, 27, 'roles_permissions', NULL, 'roles_permissions', 'admin/roles', 9, '(\'superadmin\', \'can_view\')', NULL, 'roles', 'index,permission', '', 1, '2022-09-09 07:03:34');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (155, 27, 'backup_restore', NULL, 'backup_restore', 'admin/admin/backup', 10, '(\'backup\', \'can_view\')', NULL, 'admin', 'backup', '', 1, '2022-07-08 04:12:28');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (156, 27, 'users', NULL, 'users', 'admin/users', 13, '(\'user_status\', \'can_view\')', NULL, 'users', 'index', '', 1, '2022-07-20 08:34:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (157, 27, 'languages', NULL, 'languages', 'admin/language', 11, '(\'languages\', \'can_view\')', NULL, 'language', 'index,create', '', 1, '2022-09-10 05:14:52');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (158, 27, 'modules', NULL, 'modules', 'admin/module', 14, '(\'superadmin\', \'can_view\')', NULL, 'module', 'index', '', 1, '2022-07-20 08:34:06');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (159, 27, 'custom_fields', NULL, 'custom_fields', 'admin/customfield', 15, '(\'custom_fields\', \'can_view\')', NULL, 'customfield', 'index,edit', '', 1, '2022-07-23 08:02:14');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (160, 27, 'captcha_setting', NULL, 'captcha_setting', 'admin/captcha', 16, '(\'superadmin\', \'can_view\')', NULL, 'captcha', 'index', '', 1, '2022-07-20 08:34:06');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (161, 27, 'system_fields', NULL, 'system_fields', 'admin/systemfield', 17, '(\'system_fields\', \'can_view\')', NULL, 'systemfield', 'index', '', 1, '2022-07-22 02:07:38');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (162, 27, 'student_profile_update', NULL, 'student_profile_update', 'student/profilesetting', 18, '(\'student_profile_update\', \'can_view\')', NULL, 'student', 'profilesetting', '', 1, '2022-07-20 08:34:06');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (163, 27, 'online_admission', NULL, 'online_admission', 'admin/onlineadmission/admissionsetting', 19, '(\'online_admission\', \'can_view\')', NULL, 'onlineadmission', 'admissionsetting', '', 1, '2022-07-20 08:34:06');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (164, 27, 'file_types', NULL, 'file_types', 'admin/admin/filetype', 20, '(\'superadmin\', \'can_view\')', NULL, 'admin', 'filetype', '', 1, '2022-07-20 08:34:30');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (165, 27, 'system_update', NULL, 'system_update', 'admin/updater', 22, '(\'superadmin\', \'can_view\')', NULL, 'updater', 'index', '', 1, '2022-10-13 07:49:51');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (166, 27, 'sidebar_menu', NULL, 'sidebar_menu', 'admin/sidemenu', 21, '(\'sidebar_menu\', \'can_view\')', NULL, 'sidemenu', 'index', '', 1, '2022-10-13 07:49:51');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (181, 3, 'fees_discount', NULL, 'fees_discount', 'admin/feediscount', 8, '(\'fees_discount\', \'can_view\')', NULL, 'feediscount', 'index,edit,assign', '', 1, '2022-08-08 02:03:27');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (182, 3, 'fees_carry_forward', NULL, 'fees_carry_forward', 'admin/feesforward', 9, '(\'fees_carry_forward\', \'can_view\')', NULL, 'feesforward', 'index', '', 1, '2022-08-08 02:03:24');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (183, 3, 'fees_reminder', NULL, 'fees_reminder', 'admin/feereminder/setting', 10, '(\'fees_reminder\', \'can_view\')', NULL, 'feereminder', 'setting', '', 1, '2022-08-08 02:03:21');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (184, 27, 'currency', NULL, 'currency', 'admin/currency', 12, '(\'currency\', \'can_view\')', NULL, 'currency', 'index', '', 1, '2022-07-20 08:34:09');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (190, 3, 'offline_bank_payments', NULL, 'offline_bank_payments', 'admin/offlinepayment', 2, '(\'offline_bank_payments\', \'can_view\')', NULL, 'offlinepayment', 'index', '', 1, '2022-08-08 02:05:29');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (191, 13, 'Copy Old Lessons', NULL, 'copy_old_lesson', 'admin/lessonplan/copylesson', 1, '(\'copy_old_lesson\', \'can_view\')', NULL, 'lessonplan', 'copylesson', NULL, 1, '2022-09-09 06:20:37');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (192, 10, 'Period Attendance', 'period_attendance', 'period_attendance', 'admin/subjectattendence/index', 4, '(\'student_attendance\',\'can_view\')', NULL, 'subjectattendence', 'index', NULL, 0, '2022-10-20 01:50:25');
INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES (193, 10, 'Period Attendance By Date', 'period_attendance_by_date', 'period_attendance_by_date', 'admin/subjectattendence/reportbydate', 5, '(\'attendance_by_date\', \'can_view\')', NULL, 'subjectattendence', 'reportbydate', NULL, 0, '2022-10-20 01:50:25');


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sms_config` (`id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'custom', 'Shadhin SMS', '', '', '', NULL, NULL, NULL, NULL, 'enabled', '2023-03-13 13:38:00', NULL);


#
# TABLE STRUCTURE FOR: sms_template
#

DROP TABLE IF EXISTS `sms_template`;

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT 0,
  `department` int(11) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` int(11) DEFAULT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `zoom_api_key` varchar(100) DEFAULT NULL,
  `zoom_api_secret` varchar(100) DEFAULT NULL,
  `disable_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `designation` (`designation`),
  KEY `department` (`department`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`designation`) REFERENCES `staff_designation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (1, '10258', 11, 0, NULL, NULL, '', '', 'Super Admin', '', '', '', '', '', 'info@elitedesign.com.bd', '2020-01-01', '', NULL, NULL, '', '', '', '1678711200-1182916080640f19a0e94f8!1.png', '$2y$10$nMeM/VoC6EK3aucseD4eIeVdj.mfmzoCW61KGpQSwF2tovhXk9dpi', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (2, '101', 0, 0, 4, 2, 'BSC In English', '6 yeras', 'md  abu', 'bakker', 'Md Kashem Ali', 'Mst. Jahanara Begum', '01775457009', '01775457010', 'bakkar@elitedesign.com.bd', '1990-02-08', 'Married', '2023-02-22', NULL, '35/3/1, gazipur, dhaka', '35/3/1, gazipur, dhaka', 'Nothing to say', '1678720477-394532141640f3ddd6a0ed!2.jpg', '$2y$10$K0iQr.vziU66PqA0Yyw8Ee6r9fvdIQIdnMjvp4N6SoIe1dwbRHewi', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (3, '102', 0, 0, 4, 6, 'Diploma in Electical', '9', 'Md Khaled', 'Mahmud', 'Khaled Sharif', 'Shadida Begum', '01775457011', '01775457012', 'khaled@elitedesign.com.bd', '1980-02-07', '', '2023-02-01', NULL, 'GAZipur, Bangladesh', 'GAZipur, Bangladesh', 'Nothing to say', '1678720545-782723544640f3e213434c!3.jpeg', '$2y$10$dGwA.EDTJtk6/dfP4UItEe8GUA02tXrl.9Gn13vR5ZgGpDMT4GRJK', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (4, '104', 0, 0, NULL, 6, 'hsc', '65', 'Md Shamim', 'Khan', 'Shamima Khan', 'Salehca Begum', '01775457004', '01775457005', 'shamim@elitedesicgn.com.bd', '1985-02-07', 'Single', '2023-02-09', NULL, '35/3/1-Dhaka', '35/3/1-Dhaka', '', '1678721263-1819292567640f40efd4548!4 (3).jpeg', '$2y$10$CwLhZGPAXaoWrJueW1WaCuVzVxHhA0OIXQ8kYIfY90/k1p5lYaLqq', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (5, '1050', 0, 0, 3, 8, 'Hons in Chemestry', '1', 'Jhanara', 'Khanom', 'Md Abid ALi', 'JAmila', '01775457007', '01775457009', 'jhancara@elitedesignc.com.bd', '1998-02-07', '', '2023-02-21', NULL, '35/1,section-13,bangladesh', '35/1,section-13,bangladesh', 'Nothing to say', '1678721525-2110712971640f41f5a47b1!5.jpg', '$2y$10$g90PJaerY4dgQmFALHKPueyKem6mL/j/EH3h3xx.scbFm2.8WdD1O', 'Female', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (6, '5464', 0, 0, 3, 1, 'Hons in Bangla', '', 'Seuli', 'AKter', 'AKter', 'Sabia Begum', '01775457006', '8', 'seuli@elitedesign.com.bd', '1992-02-14', 'Married', '2023-02-28', NULL, '35/3/1-B,section-13,Dhaka', '35/3/1-B,section-13,Dhaka', '', '1678721561-1422522567640f42194247c!6.jpg', '$2y$10$mbVP7HRyMTohp3za4akHmuPwqg/lEBUe0L4LvpZLi/RqcuPn0OybK', 'Female', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (7, '4552', 0, 0, 2, 9, 'BSC in Acounting', '7', 'MD Hasib', 'ALI', 'ALI Mia', 'mst Khaleda Begum', '01775457654', '01775457654', 'hasib@elitedesign.com.bd', '1998-02-08', 'Single', '2023-02-22', NULL, '2554/4, bangladesh', '2554/4, bangladesh', 'Nothing to say', '1678721625-1266411702640f425939a5f!7.jpeg', '$2y$10$SJGbnGVb1DpQLWigeu4jluJMUv9gv2qMZ4B3HOK0fR8fJVoLBByRC', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (8, '458', 0, 0, 1, 7, 'MBA', '8', 'Md Nayeem', 'Hossain', 'Md Abdur RASHID', 'NCurunnahar', '01775457008', 'cc01775457008', 'nayeem@elitedesign.com.bd', '1997-02-07', '', '2023-02-21', NULL, 'dhaka', 'dhaka', '', '1678721668-664335998640f42845ecca!8.jpeg', '$2y$10$8PnSTkkcx2/pXzhUolCENuTdRQWrq0Na3jwAM1p4lvbX7ejVng4k.', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (9, '4855', 0, 0, 5, 4, 'ssc', '8', 'Md Rakib', 'Hossain', 'MD abir', 'Khaleda Hossain', '01775457008', '01775457008', 'rakib@elitedesign.com', '1990-02-22', '', '2023-02-15', NULL, 'dhaka', 'dhaka', '', '1678721715-58544131640f42b3cb1b3!9.jpeg', '$2y$10$2LGuqbFh3ryQbNG8mJe2KOn.3TQ3gs/4/YHGgDvHA9NrT1RMFsEbi', 'Male', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `currency_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`, `disable_at`) VALUES (10, '459', 0, 0, 4, 1, 'ssc', '1', 'Shadida', 'Akter', 'Khadd', 'AMina Begum', '01775457009', '01775457009', 'shahida@elitedesign.com.bd', '2002-02-21', '', '2023-02-28', NULL, 'dchaka', 'bangladesh', '', '1678721774-346780042640f42eeda968!10.jpg', '$2y$10$7uPloCEDLHijk.RThTmh6evsbJ5z/VyRpJrI8uvvRpRMhVNXR9x52', 'Female', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `biometric_attendence` int(1) DEFAULT 0,
  `biometric_device_data` text DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_attendance_staff` (`staff_id`),
  KEY `FK_staff_attendance_staff_attendance_type` (`staff_attendance_type_id`),
  CONSTRAINT `FK_staff_attendance_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_attendance_staff_attendance_type` FOREIGN KEY (`staff_attendance_type_id`) REFERENCES `staff_attendance_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (1, '2023-03-17', 2, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (2, '2023-03-17', 3, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (3, '2023-03-17', 4, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (4, '2023-03-17', 5, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (5, '2023-03-17', 6, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (6, '2023-03-17', 9, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (7, '2023-03-17', 7, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (8, '2023-03-17', 8, 1, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (9, '2023-03-17', 10, 2, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `biometric_attendence`, `biometric_device_data`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (10, '2023-03-17', 1, 3, 0, NULL, '', 0, '0000-00-00 00:00:00', NULL);


#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-06 21:56:16', '0000-00-00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00');


#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (1, 'Senior Teacher	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (2, 'Principal	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (3, 'Pion	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (4, 'Health Teacher	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (5, 'Driver	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (6, 'Assistant Principal	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (7, 'librarian	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (8, 'Assiatant Teacher	', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (9, 'Accountant	', 'yes');


#
# TABLE STRUCTURE FOR: staff_id_card
#

DROP TABLE IF EXISTS `staff_id_card`;

CREATE TABLE `staff_id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` varchar(255) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_barcode` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_vertical_card`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `enable_staff_barcode`, `status`) VALUES (1, 'Sample Staff ID Card Horizontal', 'Roupnagar High School', 'Munshi Bari, Beside nayar Hat High School, Noyar hat, lalmonir Hat', '1678712850-908807718640f20122da76!1.png', '1678712850-1476123437640f20122dd0d!1.png', '1678712850-1902586392640f20122df56!sign.png', '#9b1818', 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1);
INSERT INTO `staff_id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_vertical_card`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `enable_staff_barcode`, `status`) VALUES (2, 'Sample Staff ID Card Vertical', 'Roupnagar High School', 'Munshi Bari, Beside Nayar Hat High Scholl,Nayar hat, Lalmonir Hat', '1678712977-2133893228640f2091a5e30!1.png', '1678712977-1265288896640f2091a60f7!1.png', '1678712977-1268563976640f2091a62ef!sign.png', '#9b1818', 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1);


#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_leave_details_staff` (`staff_id`),
  KEY `FK_staff_leave_details_leave_types` (`leave_type_id`),
  CONSTRAINT `FK_staff_leave_details_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_leave_details_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `applied_by` int(11) DEFAULT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_staff_leave_request_staff` (`staff_id`),
  KEY `FK_staff_leave_request_leave_types` (`leave_type_id`),
  KEY `applied_by` (`applied_by`),
  CONSTRAINT `FK_staff_leave_request_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_leave_request_ibfk_1` FOREIGN KEY (`applied_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `basic` float(10,2) NOT NULL,
  `total_allowance` float(10,2) NOT NULL,
  `total_deduction` float(10,2) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` float(10,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_staff_payslip_staff` (`staff_id`),
  CONSTRAINT `FK_staff_payslip_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`, `generated_by`, `created_at`) VALUES (1, 2, '1780.00', '0.00', '0.00', 0, '0', '1780.00', 'generated', 'February', '2023', '', '2023-03-17', '', NULL, '2023-03-17 10:47:34');


#
# TABLE STRUCTURE FOR: staff_rating
#

DROP TABLE IF EXISTS `staff_rating`;

CREATE TABLE `staff_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 decline, 1 Approve',
  `entrydt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_staff_rating_staff` (`staff_id`),
  CONSTRAINT `FK_staff_rating_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `FK_staff_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_roles_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 7, 1, 0, '2023-03-12 00:04:48', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 2, 0, '2023-03-13 10:22:58', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (3, 2, 3, 0, '2023-03-13 10:28:01', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (4, 2, 4, 0, '2023-03-13 10:33:19', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (5, 2, 5, 0, '2023-03-13 10:38:05', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (6, 2, 6, 0, '2023-03-13 10:41:54', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (7, 3, 7, 0, '2023-03-13 10:49:24', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (8, 4, 8, 0, '2023-03-13 10:52:50', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (9, 2, 9, 0, '2023-03-13 10:57:06', NULL);
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (10, 6, 10, 0, '2023-03-13 11:00:40', NULL);


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_staff_timeline_staff` (`staff_id`),
  CONSTRAINT `FK_staff_timeline_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_applyleave
#

DROP TABLE IF EXISTS `student_applyleave`;

CREATE TABLE `student_applyleave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `apply_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `docs` varchar(200) DEFAULT NULL,
  `reason` text NOT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `request_type` int(11) NOT NULL COMMENT '0 student,1 staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `approve_by` (`approve_by`),
  CONSTRAINT `student_applyleave_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_applyleave_ibfk_2` FOREIGN KEY (`approve_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_applyleave` (`id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `docs`, `reason`, `approve_by`, `approve_date`, `request_type`, `created_at`) VALUES (3, 1, '2023-03-20', '2023-03-23', '2023-03-17', 1, NULL, '', 1, '2023-03-17', 1, '2023-03-17 10:40:46');
INSERT INTO `student_applyleave` (`id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `docs`, `reason`, `approve_by`, `approve_date`, `request_type`, `created_at`) VALUES (4, 6, '2023-03-14', '2023-03-16', '2023-03-17', 0, NULL, '', NULL, NULL, 1, '2023-03-17 10:41:59');
INSERT INTO `student_applyleave` (`id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `docs`, `reason`, `approve_by`, `approve_date`, `request_type`, `created_at`) VALUES (5, 13, '2023-03-31', '2023-04-03', '2023-03-17', 1, NULL, '', 1, '2023-03-17', 1, '2023-03-17 10:43:07');
INSERT INTO `student_applyleave` (`id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `docs`, `reason`, `approve_by`, `approve_date`, `request_type`, `created_at`) VALUES (6, 14, '2023-04-04', '2023-04-07', '2023-03-17', 2, NULL, '', 1, '2023-03-17', 1, '2023-03-17 10:43:26');


#
# TABLE STRUCTURE FOR: student_attendences
#

DROP TABLE IF EXISTS `student_attendences`;

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `biometric_device_data` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `attendence_type_id` (`attendence_type_id`),
  CONSTRAINT `student_attendences_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_attendences_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (1, 5, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:12', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 0, '2023-03-17', 6, '', NULL, 'no', '2023-03-17 10:36:12', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (3, 3, 0, '2023-03-17', 4, '', NULL, 'no', '2023-03-17 10:36:12', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (4, 2, 0, '2023-03-17', 3, '', NULL, 'no', '2023-03-17 10:36:12', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (5, 1, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:12', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (6, 11, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (7, 10, 0, '2023-03-17', 4, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (8, 9, 0, '2023-03-17', 6, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (9, 8, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (10, 7, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (11, 6, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:36:34', NULL);
INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (12, 17, 0, '2023-03-17', 1, '', NULL, 'no', '2023-03-17 10:37:05', NULL);


#
# TABLE STRUCTURE FOR: student_doc
#

DROP TABLE IF EXISTS `student_doc`;

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_edit_fields
#

DROP TABLE IF EXISTS `student_edit_fields`;

CREATE TABLE `student_edit_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_fees
#

DROP TABLE IF EXISTS `student_fees`;

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feemaster_id` (`feemaster_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `student_fees_ibfk_1` FOREIGN KEY (`feemaster_id`) REFERENCES `feemasters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_fees_deposite
#

DROP TABLE IF EXISTS `student_fees_deposite`;

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_fees_master_id` (`student_fees_master_id`),
  KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  KEY `student_transport_fee_id` (`student_transport_fee_id`),
  CONSTRAINT `student_fees_deposite_ibfk_1` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_deposite_ibfk_2` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_deposite_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (1, 1, 3, NULL, '{\"1\":{\"amount\":\"4565.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:31:30');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (2, 2, 2, NULL, '{\"1\":{\"amount\":\"600.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"34\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:31:30');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (3, 3, 5, NULL, '{\"1\":{\"amount\":\"345.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:31:59');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (4, 4, 2, NULL, '{\"1\":{\"amount\":\"600.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"34\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:31:59');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (5, 6, 2, NULL, '{\"1\":{\"amount\":\"600.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"34\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:32:36');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (6, 19, 2, NULL, '{\"1\":{\"amount\":\"600.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"34\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:33:03');
INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `student_transport_fee_id`, `amount_detail`, `is_active`, `created_at`) VALUES (7, 20, 5, NULL, '{\"1\":{\"amount\":\"345.00\",\"date\":\"2023-03-17\",\"description\":\"\",\"amount_discount\":0,\"collected_by\":\"Super Admin(10258)\",\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2023-03-17 10:33:03');


#
# TABLE STRUCTURE FOR: student_fees_discounts
#

DROP TABLE IF EXISTS `student_fees_discounts`;

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fees_discount_id` (`fees_discount_id`),
  CONSTRAINT `student_fees_discounts_ibfk_1` FOREIGN KEY (`fees_discount_id`) REFERENCES `fees_discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_discounts_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_fees_master
#

DROP TABLE IF EXISTS `student_fees_master`;

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fee_session_group_id` (`fee_session_group_id`),
  CONSTRAINT `student_fees_master_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_master_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (1, 0, 1, 3, '0.00', 'no', '2023-03-17 08:26:05');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 0, 1, 2, '0.00', 'no', '2023-03-17 08:26:05');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (3, 0, 2, 5, '0.00', 'no', '2023-03-17 08:44:55');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (4, 0, 2, 2, '0.00', 'no', '2023-03-17 08:44:55');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (5, 0, 3, 5, '0.00', 'no', '2023-03-17 08:55:55');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (6, 0, 3, 2, '0.00', 'no', '2023-03-17 08:55:55');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (7, 0, 4, 3, '0.00', 'no', '2023-03-17 09:02:27');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (8, 0, 4, 2, '0.00', 'no', '2023-03-17 09:02:27');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (9, 0, 5, 5, '0.00', 'no', '2023-03-17 09:07:41');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (10, 0, 5, 2, '0.00', 'no', '2023-03-17 09:07:41');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (11, 0, 6, 5, '0.00', 'no', '2023-03-17 09:16:37');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (12, 0, 6, 2, '0.00', 'no', '2023-03-17 09:16:37');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (13, 0, 7, 5, '0.00', 'no', '2023-03-17 09:21:44');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (14, 0, 7, 2, '0.00', 'no', '2023-03-17 09:21:44');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (15, 0, 8, 2, '0.00', 'no', '2023-03-17 09:26:49');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (16, 0, 8, 5, '0.00', 'no', '2023-03-17 09:26:49');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (17, 0, 10, 5, '0.00', 'no', '2023-03-17 09:36:22');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (18, 0, 10, 2, '0.00', 'no', '2023-03-17 09:36:22');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (19, 0, 11, 2, '0.00', 'no', '2023-03-17 09:43:09');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (20, 0, 11, 5, '0.00', 'no', '2023-03-17 09:43:09');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (21, 0, 13, 2, '0.00', 'no', '2023-03-17 09:54:40');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (22, 0, 13, 5, '0.00', 'no', '2023-03-17 09:54:40');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (23, 0, 14, 5, '0.00', 'no', '2023-03-17 10:01:03');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (24, 0, 14, 2, '0.00', 'no', '2023-03-17 10:01:03');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (25, 0, 15, 5, '0.00', 'no', '2023-03-17 10:05:35');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (26, 0, 15, 2, '0.00', 'no', '2023-03-17 10:05:35');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (27, 0, 16, 5, '0.00', 'no', '2023-03-17 10:11:19');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (28, 0, 16, 2, '0.00', 'no', '2023-03-17 10:11:19');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (29, 0, 17, 5, '0.00', 'no', '2023-03-17 10:19:51');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (30, 0, 17, 2, '0.00', 'no', '2023-03-17 10:19:51');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (31, 0, 18, 2, '0.00', 'no', '2023-03-17 10:27:40');
INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (32, 0, 18, 4, '0.00', 'no', '2023-03-17 10:27:40');


#
# TABLE STRUCTURE FOR: student_fees_processing
#

DROP TABLE IF EXISTS `student_fees_processing`;

CREATE TABLE `student_fees_processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_ins_id` int(11) NOT NULL,
  `fee_category` varchar(255) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_fees_master_id` (`student_fees_master_id`),
  KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  KEY `student_transport_fee_id` (`student_transport_fee_id`),
  KEY `gateway_ins_id` (`gateway_ins_id`),
  CONSTRAINT `student_fees_processing_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_processing_ibfk_2` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_processing_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fees_processing_ibfk_4` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_session
#

DROP TABLE IF EXISTS `student_session`;

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `route_pickup_point_id` int(11) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_leave` int(1) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `is_alumni` int(11) NOT NULL,
  `default_login` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `student_session_ibfk_5` (`vehroute_id`),
  KEY `hostel_room_id` (`hostel_room_id`),
  KEY `student_session_ibfk_6` (`route_pickup_point_id`),
  CONSTRAINT `student_session_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_5` FOREIGN KEY (`vehroute_id`) REFERENCES `vehicle_routes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `student_session_ibfk_6` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE SET NULL,
  CONSTRAINT `student_session_ibfk_7` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (1, 19, 1, 1, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 08:26:05', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (2, 19, 2, 1, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 08:44:55', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (3, 19, 3, 1, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 08:55:55', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (4, 19, 4, 1, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:02:27', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (5, 19, 5, 1, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:07:41', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (6, 19, 6, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:16:37', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (7, 19, 7, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:21:44', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (8, 19, 8, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:26:49', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (9, 19, 9, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:31:57', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (10, 19, 10, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:36:22', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (11, 19, 11, 2, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:43:09', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (12, 19, 12, 3, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:48:03', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (13, 19, 13, 3, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 09:54:40', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (14, 19, 14, 3, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 10:01:03', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (15, 19, 15, 3, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 10:05:35', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (16, 19, 16, 3, 1, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 10:11:19', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (17, 19, 17, 4, 2, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 10:19:51', NULL);
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `hostel_room_id`, `vehroute_id`, `route_pickup_point_id`, `transport_fees`, `fees_discount`, `is_leave`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (18, 19, 18, 4, 3, NULL, NULL, NULL, '0.00', '0.00', 0, 'no', 0, 0, '2023-03-17 10:27:40', NULL);


#
# TABLE STRUCTURE FOR: student_subject_attendances
#

DROP TABLE IF EXISTS `student_subject_attendances`;

CREATE TABLE `student_subject_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `attendence_type_id` (`attendence_type_id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `subject_timetable_id` (`subject_timetable_id`),
  CONSTRAINT `student_subject_attendances_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subject_attendances_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subject_attendances_ibfk_3` FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_timeline
#

DROP TABLE IF EXISTS `student_timeline`;

CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` text NOT NULL,
  `document` varchar(200) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `created_student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_timeline_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_transport_fees
#

DROP TABLE IF EXISTS `student_transport_fees`;

CREATE TABLE `student_transport_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transport_feemaster_id` int(10) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `route_pickup_point_id` int(11) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `route_pickup_point_id` (`route_pickup_point_id`),
  KEY `transport_feemaster_id` (`transport_feemaster_id`),
  CONSTRAINT `student_transport_fees_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_transport_fees_ibfk_2` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_transport_fees_ibfk_3` FOREIGN KEY (`transport_feemaster_id`) REFERENCES `transport_feemaster` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: students
#

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `dis_reason` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `dis_note` text NOT NULL,
  `app_key` text DEFAULT NULL,
  `parent_app_key` text DEFAULT NULL,
  `disable_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (1, 2, '101', '1', '2023-03-17', 'Md Shamim', NULL, 'Mia', 'No', NULL, '01778208785', 'muttakinasa2@gmail.com', NULL, NULL, NULL, 'Islam', '', '2016-03-07', 'Male', '', '', '', 0, 'A+', 0, '', '', '', '', '', 'father', 'Md Abul kashem', '01778208785', 'Business', 'Fatema Khatun', '01778208785', 'Housewife', 'Md Abul kashem', 'Father', '01778208785', 'Business', '', '', '', '', '', 'yes', '', '4', '50', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 08:26:05', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 4, '102', '2', '2023-03-17', 'md nayeem', NULL, 'mia', 'No', NULL, '01827708714', 'muttakinasa3@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'shameul', '01827708714', 'keshe', 'zame', '01752863699', 'gehene', 'shameul', 'পিতা', '01827708714', 'keshe', '', '', '', '', '', 'yes', '', '4', '15', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 08:44:55', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (3, 6, '103', '3', '2023-03-17', 'md sohel', NULL, 'Muttakin', 'No', NULL, '0175434647', 'muttakinasa4@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'korem', '01824584556', ' babshah', 'lazena', '01754569895', 'gehene', 'korem', 'পিতা', '01824584556', ' babshah', '', '', '', '', '', 'yes', '', '3', '16', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 08:55:55', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (4, 8, '104', '4', '2023-03-17', 'md zakir', NULL, 'mia', 'No', NULL, '01720514864', 'muttakinasa5@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-18', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'moinul', '0196451237', 'babshah', 'rumi', '0145682457', 'gehene', 'moinul', 'পিতা', '0196451237', 'babshah', '', '', '', '', '', 'yes', '', '4', '18', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:02:27', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (5, 10, '105', '5', '2023-03-17', 'md rakib', NULL, 'mia', 'No', NULL, '0172556456', 'muttakinasa6@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'shahid', '0172588636', 'babshah', 'rena', '0185758644', 'gehene', 'shahid', 'পিতা', '0172588636', 'babshah', '', '', '', '', '', 'yes', '', '3', '15', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:07:41', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (6, 12, '106', '1', '2023-03-17', 'SM', NULL, 'Muttakin', 'No', NULL, '0175286396', 'muttakinasa7@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'nazrul', '0175865445', 'babshah', 'tanya', '0175283265', 'grihini', 'nazrul', 'পিতা', '0175865445', 'babshah', '', '', '', '', '', 'yes', '', '3', '12', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:16:37', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (7, 14, '107', '2', '2023-03-17', 'md roke', NULL, 'mia', 'No', NULL, '01954125634', 'muttakinasa8@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'kanall', '0185241522', 'babshah', 'somya', '0178549365', 'grihini', 'kanall', 'পিতা', '0185241522', 'babshah', '', '', '', '', '', 'yes', '', '', '', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:21:44', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (8, 16, '108', '2', '2023-03-17', 'SM', NULL, 'Muttakin', 'No', NULL, '0172696555', 'muttakinasa9@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'sabir', '0178523694', 'babshah', 'roma', '0178214136', 'grihini', 'sabir', 'পিতা', '0178523694', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:26:49', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (9, 18, '109', '3', '2023-03-17', 'md sopekul', NULL, 'eislam', 'No', NULL, '0175289635', 'muttakinasa10@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'ropeik', '01852147941', 'babshah', 'sameia', '01963245814', 'grihini', 'ropeik', 'পিতা', '01852147941', 'babshah', '', '', '', '', '', 'yes', '', '3', '13', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:31:57', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (10, 20, '110', '4', '2023-03-17', 'md zakri', NULL, 'eislam', 'No', NULL, '01785221498', 'muttakinasa11@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'polshs', '01752869324', 'babshah', 'moreom', '0175236925', 'grihini', 'polshs', 'পিতা', '01752869324', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:36:22', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (11, 22, '111', '5', '2023-03-17', 'ms roshema', NULL, 'akhtar', 'No', NULL, '0185214785', 'muttakinasa12@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'faruk', '0185245665', 'babshah', 'reia', '0185214782', 'grihini', 'faruk', 'পিতা', '0185245665', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:43:09', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (12, 24, '113', '1', '2023-03-17', 'md tahir', NULL, 'eislam', 'No', NULL, '0185241463', 'muttakinasa14@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'nayeem', '0142582163', 'babshah', 'luna', '0185214745', 'grihini', 'nayeem', 'পিতা', '0142582163', 'babshah', '', '', '', '', '', 'yes', '', '3', '13', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:48:03', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (13, 26, '114', '2', '2023-03-17', 'jami', NULL, 'akhtar', 'No', NULL, '0185214454', '', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'shamam', '0185214785', 'babshah', 'rohema', '0148535695', 'grihini', 'shamam', 'পিতা', '0185214785', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 09:54:40', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (14, 28, '115', '3', '2023-03-17', 'ms shema', NULL, 'akhtar', 'No', NULL, '0185214632', 'muttakinasa15@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Female', '', '', '', 0, 'O+', 0, '', '', '', '', '', 'father', 'roheim', '0185247957', 'babshah', 'renia', '0185214785', 'grihini', 'roheim', 'পিতা', '0185247957', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 10:01:03', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (15, 30, '116', '4', '2023-03-17', 'md abier', NULL, 'mia', 'No', NULL, '0182541785', 'muttakinasa17@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, 'O+', 0, '', '', '', '', '', 'father', 'kamal', '01827702714', 'babshah', 'lazena', '01827702476', 'grihini', 'kamal', 'পিতা', '01827702714', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 10:05:35', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (16, 32, '117', '5', '2023-03-17', 'shahen', NULL, 'mia', 'No', NULL, '01827702415', 'muttakinasa18@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, 'B+', 0, '', '', '', '', '', 'father', 'robel', '01702587416', 'grihini', 'zorena', '01825506313', 'babshah', 'robel', 'পিতা', '01702587416', 'grihini', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 10:11:19', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (17, 34, '118', '1', '2023-03-17', 'md zebon', NULL, 'mia', 'No', NULL, '01734567890', 'muttakinasa19@gmail.com', NULL, NULL, NULL, 'eislam', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'kathar', '0185214785', 'babshah', 'soma', '0185214785', 'grihini', 'kathar', 'পিতা', '0185214785', 'babshah', '', '', '', '', '', 'yes', '', '3', '14', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 10:19:51', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `school_house_id`, `blood_group`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (18, 36, '119', '2', '2023-03-17', 'md jidon', NULL, 'Muttakin', 'No', NULL, '015457009', 'muttakinasa19b@gmail.com', NULL, NULL, NULL, 'mohammad', '', '2023-03-17', 'Male', '', '', '', 0, '', 0, '', '', '', '', '', 'father', 'junaid', '015457009', 'Business', 'Khaleda', '015457009', 'housewife', 'junaid', 'পিতা', '015457009', 'Business', '', '', '', '', '', 'yes', '', 'junaid', 'qureshi', '2023-03-17', 0, '', '', NULL, NULL, NULL, '2023-03-17 10:27:40', NULL);


#
# TABLE STRUCTURE FOR: subject_group_class_sections
#

DROP TABLE IF EXISTS `subject_group_class_sections`;

CREATE TABLE `subject_group_class_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_group_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `subject_group_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_class_sections_ibfk_2` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_class_sections_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, 19, NULL, 0, '2023-03-13 11:46:21', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 2, 19, NULL, 0, '2023-03-13 11:46:40', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (3, 3, 3, 19, NULL, 0, '2023-03-13 11:47:26', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (4, 4, 4, 19, NULL, 0, '2023-03-13 11:48:06', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (5, 4, 5, 19, NULL, 0, '2023-03-13 11:48:06', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (6, 5, 6, 19, NULL, 0, '2023-03-13 11:48:47', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (7, 6, 7, 19, NULL, 0, '2023-03-13 11:49:51', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (8, 7, 8, 19, NULL, 0, '2023-03-13 11:53:16', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (9, 8, 9, 19, NULL, 0, '2023-03-13 11:53:59', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (10, 9, 10, 19, NULL, 0, '2023-03-13 11:54:29', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (11, 10, 11, 19, NULL, 0, '2023-03-13 11:55:42', NULL);
INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (12, 10, 12, 19, NULL, 0, '2023-03-13 11:55:42', NULL);


#
# TABLE STRUCTURE FOR: subject_group_subjects
#

DROP TABLE IF EXISTS `subject_group_subjects`;

CREATE TABLE `subject_group_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `subject_group_subjects_ibfk_1` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_subjects_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_subjects_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (1, 1, 19, 1, '2023-03-13 11:46:21');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (2, 1, 19, 2, '2023-03-13 11:46:21');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (3, 1, 19, 4, '2023-03-13 11:46:21');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (4, 2, 19, 1, '2023-03-13 11:46:40');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (5, 2, 19, 2, '2023-03-13 11:46:40');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (6, 2, 19, 4, '2023-03-13 11:46:40');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (7, 3, 19, 1, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (8, 3, 19, 2, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (9, 3, 19, 3, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (10, 3, 19, 4, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (11, 3, 19, 5, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (12, 3, 19, 6, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (13, 3, 19, 7, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (14, 3, 19, 8, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (15, 3, 19, 9, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (16, 3, 19, 10, '2023-03-13 11:47:26');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (17, 4, 19, 1, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (18, 4, 19, 2, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (19, 4, 19, 3, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (20, 4, 19, 4, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (21, 4, 19, 5, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (22, 4, 19, 6, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (23, 4, 19, 7, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (24, 4, 19, 8, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (25, 4, 19, 9, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (26, 4, 19, 10, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (27, 4, 19, 11, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (28, 4, 19, 12, '2023-03-13 11:48:06');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (29, 5, 19, 1, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (30, 5, 19, 2, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (31, 5, 19, 3, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (32, 5, 19, 4, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (33, 5, 19, 5, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (34, 5, 19, 6, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (35, 5, 19, 7, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (36, 5, 19, 8, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (37, 5, 19, 9, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (38, 5, 19, 10, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (39, 5, 19, 11, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (40, 5, 19, 12, '2023-03-13 11:48:47');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (41, 6, 19, 1, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (42, 6, 19, 2, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (43, 6, 19, 3, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (44, 6, 19, 4, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (45, 6, 19, 5, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (46, 6, 19, 6, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (47, 6, 19, 7, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (48, 6, 19, 8, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (49, 6, 19, 9, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (50, 6, 19, 10, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (51, 6, 19, 11, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (52, 6, 19, 12, '2023-03-13 11:49:51');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (53, 7, 19, 1, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (54, 7, 19, 2, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (55, 7, 19, 3, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (56, 7, 19, 4, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (57, 7, 19, 5, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (58, 7, 19, 6, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (59, 7, 19, 7, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (60, 7, 19, 8, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (61, 7, 19, 9, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (62, 7, 19, 10, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (63, 7, 19, 11, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (64, 7, 19, 12, '2023-03-13 11:53:16');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (65, 8, 19, 1, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (66, 8, 19, 2, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (67, 8, 19, 3, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (68, 8, 19, 4, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (69, 8, 19, 5, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (70, 8, 19, 6, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (71, 8, 19, 7, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (72, 8, 19, 8, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (73, 8, 19, 9, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (74, 8, 19, 10, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (75, 8, 19, 11, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (76, 8, 19, 12, '2023-03-13 11:53:59');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (77, 9, 19, 1, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (78, 9, 19, 2, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (79, 9, 19, 3, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (80, 9, 19, 4, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (81, 9, 19, 5, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (82, 9, 19, 6, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (83, 9, 19, 7, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (84, 9, 19, 8, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (85, 9, 19, 9, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (86, 9, 19, 10, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (87, 9, 19, 11, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (88, 9, 19, 12, '2023-03-13 11:54:29');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (89, 10, 19, 1, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (90, 10, 19, 2, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (91, 10, 19, 3, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (92, 10, 19, 4, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (93, 10, 19, 5, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (94, 10, 19, 6, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (95, 10, 19, 7, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (96, 10, 19, 8, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (97, 10, 19, 9, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (98, 10, 19, 10, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (99, 10, 19, 11, '2023-03-13 11:55:42');
INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (100, 10, 19, 12, '2023-03-13 11:55:42');


#
# TABLE STRUCTURE FOR: subject_groups
#

DROP TABLE IF EXISTS `subject_groups`;

CREATE TABLE `subject_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `subject_groups_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (1, 'For Class: 1', '', 19, '2023-03-13 11:46:21');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (2, 'For Class: 2', '', 19, '2023-03-13 11:46:40');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (3, 'For Class: 3', '', 19, '2023-03-13 11:47:26');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (4, 'For Class: 4', '', 19, '2023-03-13 11:48:06');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (5, 'For Class: 5', '', 19, '2023-03-13 11:48:47');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (6, 'For Class: 6', '', 19, '2023-03-13 11:49:51');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (7, 'For Class: 7', '', 19, '2023-03-13 11:53:16');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (8, 'For Class: 8', '', 19, '2023-03-13 11:53:59');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (9, 'For Class: 9', '', 19, '2023-03-13 11:54:29');
INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES (10, 'For Class: 10', '', 19, '2023-03-13 11:55:42');


#
# TABLE STRUCTURE FOR: subject_syllabus
#

DROP TABLE IF EXISTS `subject_syllabus`;

CREATE TABLE `subject_syllabus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` varchar(255) NOT NULL,
  `time_to` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `attachment` text NOT NULL,
  `lacture_youtube_url` varchar(255) NOT NULL,
  `lacture_video` varchar(255) NOT NULL,
  `sub_topic` text NOT NULL,
  `teaching_method` text NOT NULL,
  `general_objectives` text NOT NULL,
  `previous_knowledge` text NOT NULL,
  `comprehensive_questions` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `session_id` (`session_id`),
  KEY `created_by` (`created_by`),
  KEY `created_for` (`created_for`),
  CONSTRAINT `subject_syllabus_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_4` FOREIGN KEY (`created_for`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: subject_timetable
#

DROP TABLE IF EXISTS `subject_timetable`;

CREATE TABLE `subject_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_from` varchar(20) DEFAULT NULL,
  `time_to` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `staff_id` (`staff_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `subject_timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_3` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_4` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (10, 19, 1, 1, 1, 1, 4, 'Saturday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:12:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (11, 19, 1, 1, 1, 2, 6, 'Saturday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:12:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (12, 19, 1, 1, 1, 3, 4, 'Saturday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:12:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (13, 19, 1, 1, 1, 1, 3, 'Sunday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:18:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (14, 19, 1, 1, 1, 2, 4, 'Sunday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:18:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (15, 19, 1, 1, 1, 3, 6, 'Sunday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:18:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (16, 19, 1, 1, 1, 1, 5, 'Monday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:19:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (17, 19, 1, 1, 1, 2, 2, 'Monday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:19:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (18, 19, 1, 1, 1, 3, 6, 'Monday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:19:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (19, 19, 1, 1, 1, 1, 4, 'Tuesday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:19:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (20, 19, 1, 1, 1, 2, 4, 'Tuesday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:19:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (21, 19, 1, 1, 1, 3, 6, 'Tuesday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:19:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (22, 19, 1, 1, 1, 1, 4, 'Wednesday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:19:55');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (23, 19, 1, 1, 1, 2, 5, 'Wednesday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:19:55');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (24, 19, 1, 1, 1, 3, 9, 'Wednesday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:19:55');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (25, 19, 1, 1, 1, 1, 4, 'Thursday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:21:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (26, 19, 1, 1, 1, 3, 3, 'Thursday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:21:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (27, 19, 1, 1, 1, 2, 5, 'Thursday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:21:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (28, 19, 1, 1, 1, 1, 3, 'Friday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '101', '2023-03-13 12:21:32');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (29, 19, 1, 1, 1, 2, 5, 'Friday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '101', '2023-03-13 12:21:32');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (30, 19, 1, 1, 1, 3, 5, 'Friday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '101', '2023-03-13 12:21:32');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (31, 19, 2, 3, 2, 4, 2, 'Saturday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:24:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (32, 19, 2, 3, 2, 5, 5, 'Saturday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:24:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (33, 19, 2, 3, 2, 6, 3, 'Saturday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '102', '2023-03-13 12:24:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (34, 19, 2, 3, 2, 4, 3, 'Sunday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:24:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (35, 19, 2, 3, 2, 5, 6, 'Sunday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:24:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (36, 19, 2, 3, 2, 6, 3, 'Sunday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '102', '2023-03-13 12:24:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (37, 19, 2, 3, 2, 4, 5, 'Monday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:25:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (38, 19, 2, 3, 2, 5, 6, 'Monday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:25:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (39, 19, 2, 3, 2, 6, 9, 'Monday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '102', '2023-03-13 12:25:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (40, 19, 2, 3, 2, 4, 2, 'Tuesday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (41, 19, 2, 3, 2, 5, 6, 'Tuesday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (43, 19, 2, 3, 2, 4, 2, 'Tuesday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (46, 19, 2, 3, 2, 4, 5, 'Wednesday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:27:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (47, 19, 2, 3, 2, 5, 2, 'Wednesday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:27:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (48, 19, 2, 3, 2, 6, 6, 'Wednesday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '102', '2023-03-13 12:27:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (49, 19, 2, 3, 2, 4, 3, 'Thursday', '8:00 AM', '08:30 AM', '08:00:00', '08:30:00', '102', '2023-03-13 12:28:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (50, 19, 2, 3, 2, 5, 6, 'Thursday', '08:50 AM', '09:20 AM', '08:50:00', '09:20:00', '102', '2023-03-13 12:28:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (51, 19, 2, 3, 2, 6, 5, 'Thursday', '09:40 AM', '10:10 AM', '09:40:00', '10:10:00', '102', '2023-03-13 12:28:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (52, 19, 3, 1, 3, 7, 2, 'Saturday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (53, 19, 3, 1, 3, 8, 3, 'Saturday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (54, 19, 3, 1, 3, 9, 5, 'Saturday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (55, 19, 3, 1, 3, 10, 9, 'Saturday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (56, 19, 3, 1, 3, 11, 3, 'Saturday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (57, 19, 3, 1, 3, 13, 2, 'Saturday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:30:57');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (58, 19, 3, 1, 3, 7, 2, 'Sunday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (59, 19, 3, 1, 3, 8, 4, 'Sunday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (60, 19, 3, 1, 3, 9, 5, 'Sunday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (61, 19, 3, 1, 3, 11, 6, 'Sunday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (62, 19, 3, 1, 3, 13, 9, 'Sunday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (63, 19, 3, 1, 3, 12, 4, 'Sunday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:32:21');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (64, 19, 3, 1, 3, 7, 6, 'Monday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (65, 19, 3, 1, 3, 8, 5, 'Monday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (66, 19, 3, 1, 3, 9, 9, 'Monday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (67, 19, 3, 1, 3, 10, 4, 'Monday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (68, 19, 3, 1, 3, 13, 6, 'Monday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (69, 19, 3, 1, 3, 15, 5, 'Monday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:33:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (70, 19, 3, 1, 3, 7, 2, 'Tuesday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (71, 19, 3, 1, 3, 9, 5, 'Tuesday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (72, 19, 3, 1, 3, 10, 6, 'Tuesday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (73, 19, 3, 1, 3, 13, 9, 'Tuesday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (74, 19, 3, 1, 3, 10, 9, 'Tuesday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (75, 19, 3, 1, 3, 15, 2, 'Tuesday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:35:09');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (76, 19, 3, 1, 3, 7, 2, 'Wednesday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (77, 19, 3, 1, 3, 8, 3, 'Wednesday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (78, 19, 3, 1, 3, 11, 6, 'Wednesday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (79, 19, 3, 1, 3, 14, 9, 'Wednesday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (80, 19, 3, 1, 3, 10, 4, 'Wednesday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (81, 19, 3, 1, 3, 15, 6, 'Wednesday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:36:34');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (82, 19, 3, 1, 3, 7, 2, 'Wednesday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (83, 19, 3, 1, 3, 8, 3, 'Wednesday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (84, 19, 3, 1, 3, 11, 6, 'Wednesday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (85, 19, 3, 1, 3, 14, 9, 'Wednesday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (86, 19, 3, 1, 3, 10, 4, 'Wednesday', '01:30 PM', '02:00 PM', '13:30:00', '14:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (87, 19, 3, 1, 3, 15, 6, 'Wednesday', '02:30 PM', '03:00 PM', '14:30:00', '15:00:00', '103', '2023-03-13 12:36:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (88, 19, 3, 1, 3, 11, 3, 'Thursday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:37:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (89, 19, 3, 1, 3, 9, 6, 'Thursday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:37:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (90, 19, 3, 1, 3, 14, 3, 'Thursday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:37:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (91, 19, 3, 1, 3, 15, 6, 'Thursday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:37:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (92, 19, 3, 1, 3, 11, 3, 'Thursday', '9:30 AM', '10:00 AM', '09:30:00', '10:00:00', '103', '2023-03-13 12:37:52');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (93, 19, 3, 1, 3, 9, 6, 'Thursday', '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '103', '2023-03-13 12:37:52');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (94, 19, 3, 1, 3, 14, 3, 'Thursday', '11:30 AM', '12:00 PM', '11:30:00', '12:00:00', '103', '2023-03-13 12:37:52');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (95, 19, 3, 1, 3, 15, 6, 'Thursday', '12:30 PM', '01:00 PM', '12:30:00', '13:00:00', '103', '2023-03-13 12:37:52');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (96, 19, 4, 2, 4, 21, 5, 'Monday', '9:00 AM', '09:45 AM', '09:00:00', '09:45:00', '104', '2023-03-13 12:42:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (97, 19, 4, 2, 4, 17, 2, 'Monday', '10:15 AM', '11:00 AM', '10:15:00', '11:00:00', '104', '2023-03-13 12:42:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (98, 19, 4, 2, 4, 21, 6, 'Monday', '11:30 AM', '12:15 PM', '11:30:00', '12:15:00', '104', '2023-03-13 12:42:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (99, 19, 4, 2, 4, 24, 6, 'Monday', '12:45 PM', '01:30 PM', '12:45:00', '13:30:00', '104', '2023-03-13 12:42:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (100, 19, 4, 2, 4, 21, 5, 'Tuesday', '9:00 AM', '09:45 AM', '09:00:00', '09:45:00', '104', '2023-03-13 12:42:38');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (101, 19, 4, 2, 4, 18, 3, 'Tuesday', '10:15 AM', '11:00 AM', '10:15:00', '11:00:00', '104', '2023-03-13 12:42:38');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (102, 19, 4, 2, 4, 24, 9, 'Tuesday', '11:30 AM', '12:15 PM', '11:30:00', '12:15:00', '104', '2023-03-13 12:42:38');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (103, 19, 4, 2, 4, 23, 2, 'Tuesday', '12:45 PM', '01:30 PM', '12:45:00', '13:30:00', '104', '2023-03-13 12:42:38');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (104, 19, 4, 2, 4, 21, 5, 'Wednesday', '9:00 AM', '09:45 AM', '09:00:00', '09:45:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (105, 19, 4, 2, 4, 18, 2, 'Wednesday', '10:15 AM', '11:00 AM', '10:15:00', '11:00:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (106, 19, 4, 2, 4, 19, 9, 'Wednesday', '11:30 AM', '12:15 PM', '11:30:00', '12:15:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (107, 19, 4, 2, 4, 25, 4, 'Wednesday', '12:45 PM', '01:30 PM', '12:45:00', '13:30:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (108, 19, 4, 2, 4, 21, 5, 'Wednesday', '9:00 AM', '09:45 AM', '09:00:00', '09:45:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (109, 19, 4, 2, 4, 18, 2, 'Wednesday', '10:15 AM', '11:00 AM', '10:15:00', '11:00:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (110, 19, 4, 2, 4, 19, 9, 'Wednesday', '11:30 AM', '12:15 PM', '11:30:00', '12:15:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (111, 19, 4, 2, 4, 25, 4, 'Wednesday', '12:45 PM', '01:30 PM', '12:45:00', '13:30:00', '104', '2023-03-13 12:43:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (112, 19, 4, 2, 4, 20, 5, 'Thursday', '9:00 AM', '09:45 AM', '09:00:00', '09:45:00', '104', '2023-03-13 12:43:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (113, 19, 4, 2, 4, 21, 3, 'Thursday', '10:15 AM', '11:00 AM', '10:15:00', '11:00:00', '104', '2023-03-13 12:43:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (114, 19, 4, 2, 4, 21, 9, 'Thursday', '11:30 AM', '12:15 PM', '11:30:00', '12:15:00', '104', '2023-03-13 12:43:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (115, 19, 4, 3, 4, 17, 2, 'Sunday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (116, 19, 4, 3, 4, 18, 4, 'Sunday', '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (117, 19, 4, 3, 4, 19, 5, 'Sunday', '12:30 PM', '01:15 PM', '12:30:00', '13:15:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (118, 19, 4, 3, 4, 20, 6, 'Sunday', '01:45 PM', '02:30 PM', '13:45:00', '14:30:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (119, 19, 4, 3, 4, 22, 9, 'Sunday', '03:00 PM', '03:45 PM', '15:00:00', '15:45:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (120, 19, 4, 3, 4, 24, 4, 'Sunday', '04:15 PM', '05:00 PM', '16:15:00', '17:00:00', '105', '2023-03-13 12:46:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (121, 19, 4, 3, 4, 19, 3, 'Monday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:47:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (122, 19, 4, 3, 4, 18, 6, 'Monday', '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', '105', '2023-03-13 12:47:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (123, 19, 4, 3, 4, 21, 9, 'Monday', '12:30 PM', '01:15 PM', '12:30:00', '13:15:00', '105', '2023-03-13 12:47:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (124, 19, 4, 3, 4, 27, 3, 'Monday', '01:45 PM', '02:30 PM', '13:45:00', '14:30:00', '105', '2023-03-13 12:47:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (125, 19, 4, 3, 4, 17, 5, 'Tuesday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:48:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (126, 19, 4, 3, 4, 18, 3, 'Tuesday', '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', '105', '2023-03-13 12:48:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (127, 19, 4, 3, 4, 20, 9, 'Tuesday', '12:30 PM', '01:15 PM', '12:30:00', '13:15:00', '105', '2023-03-13 12:48:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (128, 19, 4, 3, 4, 23, 4, 'Tuesday', '01:45 PM', '02:30 PM', '13:45:00', '14:30:00', '105', '2023-03-13 12:48:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (129, 19, 4, 3, 4, 27, 6, 'Tuesday', '03:00 PM', '03:45 PM', '15:00:00', '15:45:00', '105', '2023-03-13 12:48:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (130, 19, 4, 3, 4, 17, 3, 'Wednesday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (131, 19, 4, 3, 4, 18, 4, 'Wednesday', '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (132, 19, 4, 3, 4, 19, 2, 'Wednesday', '12:30 PM', '01:15 PM', '12:30:00', '13:15:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (133, 19, 4, 3, 4, 21, 5, 'Wednesday', '01:45 PM', '02:30 PM', '13:45:00', '14:30:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (134, 19, 4, 3, 4, 27, 9, 'Wednesday', '03:00 PM', '03:45 PM', '15:00:00', '15:45:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (135, 19, 4, 3, 4, 19, 2, 'Wednesday', '04:15 PM', '05:00 PM', '16:15:00', '17:00:00', '105', '2023-03-13 12:49:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (136, 19, 4, 3, 4, 21, 5, 'Thursday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:51:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (137, 19, 4, 3, 4, 18, 3, 'Thursday', '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', '105', '2023-03-13 12:51:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (139, 19, 4, 3, 4, 21, 5, 'Thursday', '10:00 AM', '10:45 AM', '10:00:00', '10:45:00', '105', '2023-03-13 12:51:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (142, 19, 5, 2, 5, 29, 3, 'Saturday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (143, 19, 5, 2, 5, 30, 4, 'Saturday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (144, 19, 5, 2, 5, 31, 6, 'Saturday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (145, 19, 5, 2, 5, 33, 5, 'Saturday', '02:15 PM', '03:00 PM', '14:15:00', '15:00:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (146, 19, 5, 2, 5, 35, 9, 'Saturday', '03:30 PM', '04:15 PM', '15:30:00', '16:15:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (147, 19, 5, 2, 5, 39, 2, 'Saturday', '04:45 PM', '05:30 PM', '16:45:00', '17:30:00', '107', '2023-03-13 12:54:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (148, 19, 5, 2, 5, 31, 2, 'Sunday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:55:08');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (149, 19, 5, 2, 5, 33, 5, 'Sunday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:55:08');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (150, 19, 5, 2, 5, 35, 6, 'Sunday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:55:08');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (151, 19, 5, 2, 5, 39, 2, 'Sunday', '02:15 PM', '03:00 PM', '14:15:00', '15:00:00', '107', '2023-03-13 12:55:08');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (152, 19, 5, 2, 5, 30, 4, 'Monday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:56:03');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (153, 19, 5, 2, 5, 31, 3, 'Monday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:56:03');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (154, 19, 5, 2, 5, 33, 5, 'Monday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:56:03');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (155, 19, 5, 2, 5, 35, 9, 'Monday', '02:15 PM', '03:00 PM', '14:15:00', '15:00:00', '107', '2023-03-13 12:56:03');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (156, 19, 5, 2, 5, 40, 6, 'Monday', '03:30 PM', '04:15 PM', '15:30:00', '16:15:00', '107', '2023-03-13 12:56:03');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (157, 19, 5, 2, 5, 29, 3, 'Tuesday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:57:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (158, 19, 5, 2, 5, 33, 5, 'Tuesday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:57:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (159, 19, 5, 2, 5, 35, 6, 'Tuesday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:57:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (160, 19, 5, 2, 5, 36, 6, 'Tuesday', '02:15 PM', '03:00 PM', '14:15:00', '15:00:00', '107', '2023-03-13 12:57:05');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (161, 19, 5, 2, 5, 32, 5, 'Wednesday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:57:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (162, 19, 5, 2, 5, 30, 2, 'Wednesday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:57:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (163, 19, 5, 2, 5, 33, 6, 'Wednesday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:57:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (164, 19, 5, 2, 5, 35, 9, 'Wednesday', '02:15 PM', '03:00 PM', '14:15:00', '15:00:00', '107', '2023-03-13 12:57:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (165, 19, 5, 2, 5, 40, 4, 'Wednesday', '03:30 PM', '04:15 PM', '15:30:00', '16:15:00', '107', '2023-03-13 12:57:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (166, 19, 5, 2, 5, 33, 4, 'Thursday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (167, 19, 5, 2, 5, 36, 6, 'Thursday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (168, 19, 5, 2, 5, 30, 9, 'Thursday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (169, 19, 5, 2, 5, 33, 4, 'Thursday', '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (170, 19, 5, 2, 5, 36, 6, 'Thursday', '11:45 AM', '12:30 PM', '11:45:00', '12:30:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (171, 19, 5, 2, 5, 30, 9, 'Thursday', '01:00 PM', '01:45 PM', '13:00:00', '13:45:00', '107', '2023-03-13 12:58:26');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (172, 19, 6, 1, 6, 41, 3, 'Saturday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 12:59:40');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (173, 19, 6, 1, 6, 43, 6, 'Saturday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 12:59:40');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (174, 19, 6, 1, 6, 45, 2, 'Saturday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 12:59:40');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (175, 19, 6, 1, 6, 45, 6, 'Saturday', '01:58 PM', '02:28 PM', '13:58:00', '14:28:00', '119', '2023-03-13 12:59:40');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (176, 19, 6, 1, 6, 43, 3, 'Sunday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 13:00:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (177, 19, 6, 1, 6, 44, 5, 'Sunday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 13:00:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (178, 19, 6, 1, 6, 41, 6, 'Sunday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 13:00:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (179, 19, 6, 1, 6, 47, 9, 'Sunday', '01:58 PM', '02:28 PM', '13:58:00', '14:28:00', '119', '2023-03-13 13:00:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (180, 19, 6, 1, 6, 50, 9, 'Sunday', '02:58 PM', '03:28 PM', '14:58:00', '15:28:00', '119', '2023-03-13 13:00:17');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (181, 19, 6, 1, 6, 45, 5, 'Monday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 13:00:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (182, 19, 6, 1, 6, 42, 3, 'Monday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 13:00:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (183, 19, 6, 1, 6, 45, 6, 'Monday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 13:00:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (184, 19, 6, 1, 6, 48, 9, 'Monday', '01:58 PM', '02:28 PM', '13:58:00', '14:28:00', '119', '2023-03-13 13:00:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (185, 19, 6, 1, 6, 42, 2, 'Tuesday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 13:01:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (186, 19, 6, 1, 6, 45, 6, 'Tuesday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 13:01:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (187, 19, 6, 1, 6, 47, 5, 'Tuesday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 13:01:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (188, 19, 6, 1, 6, 47, 9, 'Tuesday', '01:58 PM', '02:28 PM', '13:58:00', '14:28:00', '119', '2023-03-13 13:01:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (189, 19, 6, 1, 6, 51, 5, 'Tuesday', '02:58 PM', '03:28 PM', '14:58:00', '15:28:00', '119', '2023-03-13 13:01:36');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (190, 19, 6, 1, 6, 41, 2, 'Wednesday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (191, 19, 6, 1, 6, 42, 3, 'Wednesday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (192, 19, 6, 1, 6, 43, 5, 'Wednesday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (193, 19, 6, 1, 6, 45, 6, 'Wednesday', '01:58 PM', '02:28 PM', '13:58:00', '14:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (194, 19, 6, 1, 6, 46, 9, 'Wednesday', '02:58 PM', '03:28 PM', '14:58:00', '15:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (195, 19, 6, 1, 6, 50, 9, 'Wednesday', '03:58 PM', '04:28 PM', '15:58:00', '16:28:00', '119', '2023-03-13 13:02:33');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (196, 19, 6, 1, 6, 43, 4, 'Thursday', '10:58 AM', '11:28 AM', '10:58:00', '11:28:00', '119', '2023-03-13 13:03:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (197, 19, 6, 1, 6, 47, 6, 'Thursday', '11:58 AM', '12:28 PM', '11:58:00', '12:28:00', '119', '2023-03-13 13:03:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (198, 19, 6, 1, 6, 51, 5, 'Thursday', '12:58 PM', '01:28 PM', '12:58:00', '13:28:00', '119', '2023-03-13 13:03:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (199, 19, 7, 1, 7, 53, 2, 'Saturday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (200, 19, 7, 1, 7, 54, 3, 'Saturday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (201, 19, 7, 1, 7, 55, 5, 'Saturday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (202, 19, 7, 1, 7, 56, 6, 'Saturday', '02:48 PM', '03:33 PM', '14:48:00', '15:33:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (203, 19, 7, 1, 7, 59, 9, 'Saturday', '04:03 PM', '04:48 PM', '16:03:00', '16:48:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (204, 19, 7, 1, 7, 59, 5, 'Saturday', '05:18 PM', '06:03 PM', '17:18:00', '18:03:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (205, 19, 7, 1, 7, 53, 2, 'Saturday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (206, 19, 7, 1, 7, 54, 3, 'Saturday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (207, 19, 7, 1, 7, 55, 5, 'Saturday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (208, 19, 7, 1, 7, 56, 6, 'Saturday', '02:48 PM', '03:33 PM', '14:48:00', '15:33:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (209, 19, 7, 1, 7, 59, 9, 'Saturday', '04:03 PM', '04:48 PM', '16:03:00', '16:48:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (210, 19, 7, 1, 7, 59, 5, 'Saturday', '05:18 PM', '06:03 PM', '17:18:00', '18:03:00', '120', '2023-03-13 13:04:45');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (211, 19, 7, 1, 7, 53, 2, 'Sunday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (212, 19, 7, 1, 7, 54, 3, 'Sunday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (213, 19, 7, 1, 7, 55, 4, 'Sunday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (214, 19, 7, 1, 7, 56, 6, 'Sunday', '02:48 PM', '03:33 PM', '14:48:00', '15:33:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (215, 19, 7, 1, 7, 57, 9, 'Sunday', '04:03 PM', '04:48 PM', '16:03:00', '16:48:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (216, 19, 7, 1, 7, 60, 6, 'Sunday', '05:18 PM', '06:03 PM', '17:18:00', '18:03:00', '120', '2023-03-13 13:06:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (217, 19, 7, 1, 7, 53, 2, 'Monday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (218, 19, 7, 1, 7, 55, 5, 'Monday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (219, 19, 7, 1, 7, 57, 6, 'Monday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (220, 19, 7, 1, 7, 59, 9, 'Monday', '02:48 PM', '03:33 PM', '14:48:00', '15:33:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (221, 19, 7, 1, 7, 60, 5, 'Monday', '04:03 PM', '04:48 PM', '16:03:00', '16:48:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (222, 19, 7, 1, 7, 64, 6, 'Monday', '05:18 PM', '06:03 PM', '17:18:00', '18:03:00', '120', '2023-03-13 13:07:19');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (223, 19, 7, 1, 7, 54, 2, 'Tuesday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (224, 19, 7, 1, 7, 56, 5, 'Tuesday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (225, 19, 7, 1, 7, 57, 6, 'Tuesday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (226, 19, 7, 1, 7, 57, 9, 'Tuesday', '02:48 PM', '03:33 PM', '14:48:00', '15:33:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (227, 19, 7, 1, 7, 61, 4, 'Tuesday', '04:03 PM', '04:48 PM', '16:03:00', '16:48:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (228, 19, 7, 1, 7, 62, 2, 'Tuesday', '05:18 PM', '06:03 PM', '17:18:00', '18:03:00', '120', '2023-03-13 13:08:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (229, 19, 7, 1, 7, 55, 3, 'Wednesday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:10:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (230, 19, 7, 1, 7, 57, 6, 'Wednesday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:10:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (231, 19, 7, 1, 7, 61, 9, 'Wednesday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:10:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (232, 19, 7, 1, 7, 55, 6, 'Thursday', '11:03 AM', '11:48 AM', '11:03:00', '11:48:00', '120', '2023-03-13 13:10:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (233, 19, 7, 1, 7, 54, 5, 'Thursday', '12:18 PM', '01:03 PM', '12:18:00', '13:03:00', '120', '2023-03-13 13:10:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (234, 19, 7, 1, 7, 59, 2, 'Thursday', '01:33 PM', '02:18 PM', '13:33:00', '14:18:00', '120', '2023-03-13 13:10:48');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (235, 19, 8, 1, 8, 65, 3, 'Saturday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:13:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (236, 19, 8, 1, 8, 68, 6, 'Saturday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:13:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (237, 19, 8, 1, 8, 69, 3, 'Saturday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:13:56');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (238, 19, 8, 1, 8, 67, 2, 'Sunday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:14:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (239, 19, 8, 1, 8, 66, 5, 'Sunday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:14:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (240, 19, 8, 1, 8, 71, 6, 'Sunday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:14:35');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (241, 19, 8, 1, 8, 66, 2, 'Monday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:15:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (242, 19, 8, 1, 8, 69, 4, 'Monday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:15:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (243, 19, 8, 1, 8, 72, 6, 'Monday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:15:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (244, 19, 8, 1, 8, 69, 4, 'Tuesday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:15:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (245, 19, 8, 1, 8, 66, 6, 'Tuesday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:15:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (246, 19, 8, 1, 8, 72, 9, 'Tuesday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:15:25');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (247, 19, 8, 1, 8, 68, 2, 'Wednesday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:16:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (248, 19, 8, 1, 8, 65, 3, 'Wednesday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:16:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (249, 19, 8, 1, 8, 69, 6, 'Wednesday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:16:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (250, 19, 8, 1, 8, 72, 9, 'Wednesday', '01:43 PM', '02:13 PM', '13:43:00', '14:13:00', '236', '2023-03-13 13:16:02');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (251, 19, 8, 1, 8, 65, 2, 'Thursday', '11:13 AM', '11:43 AM', '11:13:00', '11:43:00', '236', '2023-03-13 13:16:30');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (252, 19, 8, 1, 8, 66, 3, 'Thursday', '12:03 PM', '12:33 PM', '12:03:00', '12:33:00', '236', '2023-03-13 13:16:30');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (253, 19, 8, 1, 8, 68, 6, 'Thursday', '12:53 PM', '01:23 PM', '12:53:00', '13:23:00', '236', '2023-03-13 13:16:30');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (254, 19, 9, 3, 9, 81, 2, 'Saturday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:17:41');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (255, 19, 9, 3, 9, 78, 5, 'Saturday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:17:41');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (256, 19, 9, 3, 9, 84, 6, 'Saturday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:17:41');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (257, 19, 9, 3, 9, 84, 5, 'Sunday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (258, 19, 9, 3, 9, 81, 6, 'Sunday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (259, 19, 9, 3, 9, 88, 9, 'Sunday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (260, 19, 9, 3, 9, 84, 5, 'Sunday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (261, 19, 9, 3, 9, 81, 6, 'Sunday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (262, 19, 9, 3, 9, 88, 9, 'Sunday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:18:10');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (263, 19, 9, 3, 9, 81, 2, 'Monday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:18:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (264, 19, 9, 3, 9, 78, 4, 'Monday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:18:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (265, 19, 9, 3, 9, 87, 5, 'Monday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:18:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (267, 19, 9, 3, 9, 78, 2, 'Tuesday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:19:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (268, 19, 9, 3, 9, 84, 9, 'Tuesday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:19:06');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (269, 19, 9, 3, 9, 81, 5, 'Tuesday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:19:07');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (272, 19, 9, 3, 9, 80, 2, 'Wednesday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:19:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (273, 19, 9, 3, 9, 77, 6, 'Wednesday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:19:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (274, 19, 9, 3, 9, 78, 6, 'Wednesday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:19:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (275, 19, 9, 3, 9, 81, 4, 'Thursday', '11:16 AM', '11:46 AM', '11:16:00', '11:46:00', '345', '2023-03-13 13:20:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (276, 19, 9, 3, 9, 79, 5, 'Thursday', '12:16 PM', '12:46 PM', '12:16:00', '12:46:00', '345', '2023-03-13 13:20:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (277, 19, 9, 3, 9, 77, 9, 'Thursday', '01:16 PM', '01:46 PM', '13:16:00', '13:46:00', '345', '2023-03-13 13:20:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (278, 19, 10, 2, 10, 89, 2, 'Saturday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:21:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (279, 19, 10, 2, 10, 92, 5, 'Saturday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:21:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (280, 19, 10, 2, 10, 91, 3, 'Saturday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:21:29');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (281, 19, 10, 2, 10, 89, 4, 'Sunday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:21:50');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (282, 19, 10, 2, 10, 91, 5, 'Sunday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:21:50');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (283, 19, 10, 2, 10, 93, 6, 'Sunday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:21:50');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (284, 19, 10, 2, 10, 89, 4, 'Sunday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:21:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (285, 19, 10, 2, 10, 91, 5, 'Sunday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:21:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (286, 19, 10, 2, 10, 93, 6, 'Sunday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:21:51');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (287, 19, 10, 2, 10, 92, 4, 'Monday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:22:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (288, 19, 10, 2, 10, 93, 6, 'Monday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:22:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (289, 19, 10, 2, 10, 96, 9, 'Monday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:22:16');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (290, 19, 10, 2, 10, 91, 4, 'Tuesday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:22:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (291, 19, 10, 2, 10, 93, 6, 'Tuesday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:22:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (292, 19, 10, 2, 10, 99, 9, 'Tuesday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:22:47');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (293, 19, 10, 2, 10, 93, 3, 'Wednesday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:23:59');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (294, 19, 10, 2, 10, 89, 6, 'Wednesday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:23:59');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (295, 19, 10, 2, 10, 98, 5, 'Wednesday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:23:59');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (296, 19, 10, 2, 10, 90, 5, 'Thursday', '11:20 AM', '12:05 PM', '11:20:00', '12:05:00', '432', '2023-03-13 13:24:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (297, 19, 10, 2, 10, 93, 6, 'Thursday', '12:35 PM', '01:20 PM', '12:35:00', '13:20:00', '432', '2023-03-13 13:24:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (298, 19, 10, 2, 10, 94, 9, 'Thursday', '01:50 PM', '02:35 PM', '13:50:00', '14:35:00', '432', '2023-03-13 13:24:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (299, 19, 10, 3, 10, 89, 4, 'Saturday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (300, 19, 10, 3, 10, 91, 2, 'Saturday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (301, 19, 10, 3, 10, 92, 6, 'Saturday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (302, 19, 10, 3, 10, 89, 4, 'Saturday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (303, 19, 10, 3, 10, 91, 2, 'Saturday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (304, 19, 10, 3, 10, 92, 6, 'Saturday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:25:22');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (305, 19, 10, 3, 10, 91, 4, 'Sunday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:25:53');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (306, 19, 10, 3, 10, 94, 2, 'Sunday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:25:53');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (307, 19, 10, 3, 10, 95, 5, 'Sunday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:25:53');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (308, 19, 10, 3, 10, 93, 2, 'Monday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (309, 19, 10, 3, 10, 90, 4, 'Monday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (310, 19, 10, 3, 10, 95, 6, 'Monday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:26:15');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (311, 19, 10, 3, 10, 90, 3, 'Tuesday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:26:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (312, 19, 10, 3, 10, 92, 6, 'Tuesday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:26:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (313, 19, 10, 3, 10, 96, 9, 'Tuesday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:26:44');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (314, 19, 10, 3, 10, 93, 4, 'Wednesday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:28:31');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (326, 19, 10, 3, 10, 93, 4, 'Wednesday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:28:32');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (329, 19, 10, 3, 10, 93, 4, 'Wednesday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:28:32');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (332, 19, 10, 3, 10, 91, 3, 'Thursday', '11:24 AM', '11:45 AM', '11:24:00', '11:45:00', '456', '2023-03-13 13:30:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (333, 19, 10, 3, 10, 93, 4, 'Thursday', '12:05 PM', '12:26 PM', '12:05:00', '12:26:00', '456', '2023-03-13 13:30:01');
INSERT INTO `subject_timetable` (`id`, `session_id`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `day`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `created_at`) VALUES (334, 19, 10, 3, 10, 99, 6, 'Thursday', '12:46 PM', '01:07 PM', '12:46:00', '13:07:00', '456', '2023-03-13 13:30:01');


#
# TABLE STRUCTURE FOR: subjects
#

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Bangla', '101', 'theory', 'no', '2023-03-13 11:41:29', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Math', 'English', 'theory', 'no', '2023-03-13 11:41:49', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Genarel Science', '104', 'theory', 'no', '2023-03-13 11:42:14', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'English', '103', 'theory', 'no', '2023-03-13 11:42:30', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'English For Today', '105', 'theory', 'no', '2023-03-13 11:42:57', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'English Gramer', '106', 'theory', 'no', '2023-03-13 11:43:18', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'Bangla Gramer', '107', 'theory', 'no', '2023-03-13 11:43:53', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'Computer Training', '108', 'practical', 'no', '2023-03-13 11:44:12', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'Science Class', '109', 'practical', 'no', '2023-03-13 11:44:28', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (10, 'Socail Science', '110', 'theory', 'no', '2023-03-13 11:44:40', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'Health Book', '111', 'theory', 'no', '2023-03-13 11:44:54', NULL);
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (12, 'Health Book -2', '112', 'practical', 'no', '2023-03-13 11:45:11', NULL);


#
# TABLE STRUCTURE FOR: submit_assignment
#

DROP TABLE IF EXISTS `submit_assignment`;

CREATE TABLE `submit_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `docs` varchar(225) NOT NULL,
  `file_name` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `homework_id` (`homework_id`),
  CONSTRAINT `submit_assignment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submit_assignment_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: template_admitcards
#

DROP TABLE IF EXISTS `template_admitcards`;

CREATE TABLE `template_admitcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(250) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `is_name` int(1) NOT NULL DEFAULT 1,
  `is_father_name` int(1) NOT NULL DEFAULT 1,
  `is_mother_name` int(1) NOT NULL DEFAULT 1,
  `is_dob` int(1) NOT NULL DEFAULT 1,
  `is_admission_no` int(1) NOT NULL DEFAULT 1,
  `is_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_address` int(1) NOT NULL DEFAULT 1,
  `is_gender` int(1) NOT NULL DEFAULT 1,
  `is_photo` int(11) NOT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `template_admitcards` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES (1, 'Sample Admit Card', '1st Tutorial Examination', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION (10+2) 2014', '1679066934-1423497628641487367d61e!1678711200-1182916080640f19a0e94f8!1.png', '', '1st Tutorial', '1st Tutorial', 'Roupnagar Abasik high School', '1679066934-2063070918641487367da3c!Oprah-Winfrey-Signature-1.png', '1679066934-1582565547641487367dbe0!admit.png', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, '', '2023-03-17 11:30:13', NULL);


#
# TABLE STRUCTURE FOR: template_marksheets
#

DROP TABLE IF EXISTS `template_marksheets`;

CREATE TABLE `template_marksheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header_image` varchar(200) DEFAULT NULL,
  `template` varchar(200) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `left_sign` varchar(200) DEFAULT NULL,
  `middle_sign` varchar(200) DEFAULT NULL,
  `right_sign` varchar(200) DEFAULT NULL,
  `exam_session` int(1) DEFAULT 1,
  `is_name` int(1) DEFAULT 1,
  `is_father_name` int(1) DEFAULT 1,
  `is_mother_name` int(1) DEFAULT 1,
  `is_dob` int(1) DEFAULT 1,
  `is_admission_no` int(1) DEFAULT 1,
  `is_roll_no` int(1) DEFAULT 1,
  `is_photo` int(11) DEFAULT 1,
  `is_division` int(1) NOT NULL DEFAULT 1,
  `is_rank` int(1) NOT NULL DEFAULT 0,
  `is_customfield` int(1) NOT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_teacher_remark` int(11) NOT NULL DEFAULT 1,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `template_marksheets` (`id`, `header_image`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `left_sign`, `middle_sign`, `right_sign`, `exam_session`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_photo`, `is_division`, `is_rank`, `is_customfield`, `background_img`, `date`, `is_class`, `is_teacher_remark`, `is_section`, `content`, `content_footer`, `created_at`, `updated_at`) VALUES (1, '1679066713-5799130136414865904d22!1678689719-2115230064640ec5b7e072f!new.png', 'Sample Marksheet', NULL, NULL, '', '', '1st Tutorial Examination', 'Roupnagar Abasik High School', 'Roupnagar Abasik High School', '', '', '1679065754-7512422326414829a63e5c!Oprah-Winfrey-Signature-1.png', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '1679066713-161155105464148659042bc!1677172282-184627447863f79e3a69c6b!marksheet.png', '', 1, 1, 1, '', '', '2023-03-17 11:25:13', NULL);


#
# TABLE STRUCTURE FOR: topic
#

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `complete_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: transport_feemaster
#

DROP TABLE IF EXISTS `transport_feemaster`;

CREATE TABLE `transport_feemaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `month` varchar(50) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `fine_amount` float(10,2) DEFAULT 0.00,
  `fine_type` varchar(50) DEFAULT NULL,
  `fine_percentage` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `transport_feemaster_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: transport_route
#

DROP TABLE IF EXISTS `transport_route`;

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: upload_contents
#

DROP TABLE IF EXISTS `upload_contents`;

CREATE TABLE `upload_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(10) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `real_name` text NOT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `mime_type` text NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  `upload_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `upload_by` (`upload_by`),
  KEY `upload_contents_ibfk_2` (`content_type_id`),
  CONSTRAINT `upload_contents_ibfk_1` FOREIGN KEY (`upload_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_contents_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `content_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (1, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.244', 'Chrome 109.0.0.0, Windows 10', '2023-03-12 05:05:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.244', 'Chrome 109.0.0.0, Windows 10', '2023-03-12 05:14:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (3, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.244', 'Chrome 109.0.0.0, Windows 10', '2023-03-12 05:17:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (4, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.251.249', 'Chrome 109.0.0.0, Windows 10', '2023-03-12 13:17:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (5, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 05:30:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (6, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 05:39:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (7, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 05:44:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (8, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 05:51:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (9, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 06:24:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (10, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 12:39:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (11, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.225', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 13:16:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (12, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.241', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 18:38:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (13, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.241', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 18:46:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (14, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.241', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 18:51:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (15, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.241', 'Chrome 109.0.0.0, Windows 10', '2023-03-13 20:01:13');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (16, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.250.248', 'Chrome 109.0.0.0, Windows 10', '2023-03-15 14:12:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (17, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.250', 'Chrome 109.0.0.0, Windows 10', '2023-03-16 00:01:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (18, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.228', 'Chrome 109.0.0.0, Windows 10', '2023-03-16 13:43:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (19, 'info@elitedesign.com.bd', 'Super Admin', NULL, '180.92.233.138', 'Chrome 111.0.0.0, Windows 10', '2023-03-16 18:20:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (20, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.241', 'Chrome 111.0.0.0, Windows 10', '2023-03-17 18:14:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (21, 'info@elitedesign.com.bd', 'Super Admin', NULL, '58.145.186.245', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 02:49:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (22, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.253', 'Chrome 109.0.0.0, Android', '2023-03-18 11:53:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (23, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.253', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 15:47:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (24, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.183.141.3', 'Chrome 111.0.0.0, Android', '2023-03-18 16:16:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (25, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.250.241', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 19:21:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (26, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.248.251', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 23:10:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (27, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.248', 'Chrome 111.0.5563.58, Android', '2023-03-23 11:03:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (28, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.25.249.248', 'Chrome 111.0.5563.58, Android', '2023-03-23 14:10:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (29, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.31.154.234', 'Chrome 111.0.0.0, Windows 10', '2023-03-23 23:24:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (30, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.166.187.83', 'Chrome 109.0.5414.118, Android', '2023-03-25 09:06:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (31, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.126.60.194', 'Chrome 109.0.5414.117, Android', '2023-03-25 21:04:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (32, 'info@elitedesign.com.bd', 'Super Admin', NULL, '27.147.176.50', 'Chrome 111.0.0.0, Windows 10', '2023-04-06 22:24:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (33, 'info@elitedesign.com.bd', 'Super Admin', NULL, '103.60.175.86', 'Chrome 111.0.0.0, Windows 10', '2023-04-08 22:25:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (34, 'info@elitedesign.com.bd', 'Super Admin', NULL, '118.179.194.241', 'Chrome 112.0.0.0, Android', '2023-04-09 13:49:46');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `currency_id` int(1) DEFAULT 0,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 'std1', 'cmv5bz', '', 'student', 11, 0, '', 'yes', '2023-03-17 08:26:05', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (2, 0, 'parent1', 'otlygv', '1', 'parent', 0, 0, '', 'yes', '2023-03-17 08:26:05', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (3, 2, 'std2', 'xhv9cd', '', 'student', 11, 0, '', 'yes', '2023-03-17 08:44:55', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (4, 0, 'parent2', '6nov4w', '2', 'parent', 0, 0, '', 'yes', '2023-03-17 08:44:55', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (5, 3, 'std3', 'xl0305', '', 'student', 11, 0, '', 'yes', '2023-03-17 08:55:55', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (6, 0, 'parent3', 'aez8cn', '3', 'parent', 0, 0, '', 'yes', '2023-03-17 08:55:55', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (7, 4, 'std4', '155vwj', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:02:27', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (8, 0, 'parent4', 'qzzxoy', '4', 'parent', 0, 0, '', 'yes', '2023-03-17 09:02:27', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (9, 5, 'std5', 's81ifb', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:07:41', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (10, 0, 'parent5', '5gexj7', '5', 'parent', 0, 0, '', 'yes', '2023-03-17 09:07:41', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (11, 6, 'std6', '8i1c9e', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:16:37', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (12, 0, 'parent6', 'lsmwct', '6', 'parent', 0, 0, '', 'yes', '2023-03-17 09:16:37', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (13, 7, 'std7', '950vc8', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:21:44', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (14, 0, 'parent7', '6flexs', '7', 'parent', 0, 0, '', 'yes', '2023-03-17 09:21:44', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (15, 8, 'std8', 'kihxr8', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:26:49', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (16, 0, 'parent8', '5vukzv', '8', 'parent', 0, 0, '', 'yes', '2023-03-17 09:26:49', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (17, 9, 'std9', 'dcz1yk', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:31:57', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (18, 0, 'parent9', 'klgjox', '9', 'parent', 0, 0, '', 'yes', '2023-03-17 09:31:57', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (19, 10, 'std10', 'bhdypc', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:36:22', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (20, 0, 'parent10', '67byb0', '10', 'parent', 0, 0, '', 'yes', '2023-03-17 09:36:22', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (21, 11, 'std11', 'cbtzbs', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:43:09', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (22, 0, 'parent11', '3ptnyw', '11', 'parent', 0, 0, '', 'yes', '2023-03-17 09:43:09', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (23, 12, 'std12', 'jk064r', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:48:03', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (24, 0, 'parent12', 'f8ogex', '12', 'parent', 0, 0, '', 'yes', '2023-03-17 09:48:03', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (25, 13, 'std13', 'o9h3yv', '', 'student', 11, 0, '', 'yes', '2023-03-17 09:54:40', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (26, 0, 'parent13', 'jrcaxb', '13', 'parent', 0, 0, '', 'yes', '2023-03-17 09:54:40', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (27, 14, 'std14', 'trzf6o', '', 'student', 11, 0, '', 'yes', '2023-03-17 10:01:03', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (28, 0, 'parent14', 'ab9vmk', '14', 'parent', 0, 0, '', 'yes', '2023-03-17 10:01:03', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (29, 15, 'std15', 'syop8v', '', 'student', 11, 0, '', 'yes', '2023-03-17 10:05:35', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (30, 0, 'parent15', 'tuvsci', '15', 'parent', 0, 0, '', 'yes', '2023-03-17 10:05:35', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (31, 16, 'std16', '3myykp', '', 'student', 11, 0, '', 'yes', '2023-03-17 10:11:19', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (32, 0, 'parent16', 'c6m1vo', '16', 'parent', 0, 0, '', 'yes', '2023-03-17 10:11:19', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (33, 17, 'std17', 'mbuevv', '', 'student', 11, 0, '', 'yes', '2023-03-17 10:19:51', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (34, 0, 'parent17', 'h0ful7', '17', 'parent', 0, 0, '', 'yes', '2023-03-17 10:19:51', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (35, 18, 'std18', 'li1p3t', '', 'student', 11, 0, '', 'yes', '2023-03-17 10:27:40', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `lang_id`, `currency_id`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (36, 0, 'parent18', 'sm7yr9', '18', 'parent', 0, 0, '', 'yes', '2023-03-17 10:27:40', NULL);


#
# TABLE STRUCTURE FOR: users_authentication
#

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: vehicle_routes
#

DROP TABLE IF EXISTS `vehicle_routes`;

CREATE TABLE `vehicle_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `route_id` (`route_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `vehicle_routes_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_routes_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `vehicle_photo` varchar(255) DEFAULT NULL,
  `manufacture_year` varchar(4) DEFAULT NULL,
  `registration_number` varchar(50) NOT NULL,
  `chasis_number` varchar(100) NOT NULL,
  `max_seating_capacity` varchar(255) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: video_tutorial
#

DROP TABLE IF EXISTS `video_tutorial`;

CREATE TABLE `video_tutorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `vid_title` text DEFAULT NULL,
  `description` text NOT NULL,
  `thumb_path` varchar(500) DEFAULT NULL,
  `dir_path` varchar(500) DEFAULT NULL,
  `img_name` varchar(300) NOT NULL,
  `thumb_name` varchar(300) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `video_tutorial_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: video_tutorial_class_sections
#

DROP TABLE IF EXISTS `video_tutorial_class_sections`;

CREATE TABLE `video_tutorial_class_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_tutorial_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `video_tutorial_id` (`video_tutorial_id`),
  CONSTRAINT `video_tutorial_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `video_tutorial_class_sections_ibfk_2` FOREIGN KEY (`video_tutorial_id`) REFERENCES `video_tutorial` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `meeting_with` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `student_session_id` (`student_session_id`),
  CONSTRAINT `visitors_book_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visitors_book_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: zoom_settings
#

DROP TABLE IF EXISTS `zoom_settings`;

CREATE TABLE `zoom_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoom_api_key` varchar(200) DEFAULT NULL,
  `zoom_api_secret` varchar(200) DEFAULT NULL,
  `use_teacher_api` int(1) DEFAULT 1,
  `use_zoom_app` int(1) DEFAULT 1,
  `use_zoom_app_user` int(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

