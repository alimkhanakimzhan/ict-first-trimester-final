
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:00";


CREATE TABLE `advertisements` (
  `advertisements_id` int(10) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_code` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` longtext NOT NULL,
  `exam_from` date NOT NULL,
  `exam_to` date NOT NULL,
  `passing_score` int(11) NOT NULL,
  `exam_date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `exam_created_by` int(11) NOT NULL,
  `exam_modified_by` int(11) NOT NULL,
  `exam_time_limit` int(11) NOT NULL,
  `isdeleted` int(11) DEFAULT 0,
  `passing_grade` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exams_answers` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_name` longtext NOT NULL,
  `answer_flag` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exams_question` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_name` longtext NOT NULL,
  `question_code` varchar(255) NOT NULL,
  `question_type` int(11) DEFAULT 0,
  `question_date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `question_date_modified` datetime NOT NULL,
  `question_modified_by` int(11) NOT NULL,
  `question_created_by` int(11) NOT NULL,
  `essay_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `payment_date` date NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `time_consumed` int(11) NOT NULL,
  `check_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `transaction_dtl` (
  `transaction_dtl_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `transaction_answer_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `essay` longtext DEFAULT NULL,
  `transaction_code` varchar(255) NOT NULL,
  `transaction_question_type` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `israted` int(11) NOT NULL,
  `checked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(256) NOT NULL,
  `user_lname` varchar(256) NOT NULL,
  `department_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 4,
  `user_enabled` int(11) DEFAULT 0,
  `user_createdby` int(11) NOT NULL,
  `user_createdon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modifiedby` int(11) DEFAULT NULL,
  `user_modifiedon` datetime DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `exam_checker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`advertisements_id`);


ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);


ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);


ALTER TABLE `exams_answers`
  ADD PRIMARY KEY (`answer_id`);


ALTER TABLE `exams_question`
  ADD PRIMARY KEY (`question_id`);


ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);


ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);


ALTER TABLE `transaction_dtl`
  ADD PRIMARY KEY (`transaction_dtl_id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

