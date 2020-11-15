//Creation of database called "online_exam"
CREATE DATABASE `online_exam`; 

//set time time zone +5GMT
SET time_zone = "+05:00";

//creation of user_roles table, which includes id and their name, unique attribute is id
CREATE TABLE `user_roles` (    
  `role_id` int(11) NOT NULL,    
  `role_name` varchar(255) NOT NULL,    
PRIMARY KEY (role_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//creation of department table, which includes id, code and their name, unique attribute is id
CREATE TABLE `department` (    
  `department_id` int(11) NOT NULL,    
  `department_code` varchar(255) NOT NULL,    
  `department_name` varchar(255) NOT NULL,    
PRIMARY KEY (department_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    

//creation of advertisements table, which includes id, relation to department id and their description, unique attribute is id, while foreign is for department_id
CREATE TABLE `advertisements` (    
  `advertisements_id` int(10) NOT NULL,    
  `department_id` int(11) NOT NULL,    
  `description` varchar(255) NOT NULL,    
PRIMARY KEY (advertisements_id),    
FOREIGN KEY (department_id) REFERENCES department (department_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//creation of users table, which includes id, main information about them (full name, department, role, is they studying or not, when they were applied, their login and user info) 
//unique attribute is user`s id, which related with other tables roles, department
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
  `exam_checker` int(11) NOT NULL,    
PRIMARY KEY (user_id),    
FOREIGN KEY (department_id) REFERENCES department (department_id),    
FOREIGN KEY (role_id) REFERENCES user_roles (role_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//creation of payments table, it includes payment id, whihc is primary key of table and date, also each payment related to exact user, where user_id shows it as foreign key    
CREATE TABLE `payments` (    
  `payment_id` int(10) NOT NULL,    
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),    
  `user_id` int(10) NOT NULL,    
PRIMARY KEY (payment_id),    
FOREIGN KEY (user_id) REFERENCES users(user_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
  
  
//creation of exams table, unique row is exam_id, each exam is provided for one exact department, so a foreign key if deparment_id. Table includes info about exam name, duration of passing  
//passing score, which must be received to pass the exam,creation date, modification date, also time limit for each exam.
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
  `department_id` int(11) NOT NULL,    
PRIMARY KEY (exam_id),    
FOREIGN KEY (department_id) REFERENCES department (department_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//creation of exams_question table, each question is unique so the question_id shows its unique in this system. As it was said, question relates to exam table, so this table includes foreign key called exam_id.   
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
  `essay_points` int(11) NOT NULL,    
PRIMARY KEY (question_id),  
FOREIGN KEY (exam_id) REFERENCES exams (exam_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//creation of table exam_answers, each answer relates to one question, it includes the answer type, and is it correct or not. Foreign for question_id row
CREATE TABLE `exams_answers` (  
  `answer_id` int(11) NOT NULL,    
  `question_id` int(11) NOT NULL,    
  `answer_name` longtext NOT NULL,    
  `answer_flag` int(11) NOT NULL DEFAULT 0,    
PRIMARY KEY (answer_id),    
FOREIGN KEY (question_id) REFERENCES exams_question (question_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    
    
//This table includes information of user`s transaction for one exam. Unique attribute is given for transaction_code, but each transaction is unique because includes data for the exam passing of exact user
CREATE TABLE `transaction` (    
  `transaction_id` int(11) NOT NULL UNIQUE,    
  `transaction_date` date NOT NULL,    
  `transaction_code` varchar(255) NOT NULL,    
  `user_id` int(11) NOT NULL,    
  `exam_id` int(11) NOT NULL,    
  `time_consumed` int(11) NOT NULL,    
  `check_status` int(11) NOT NULL,
PRIMARY KEY (transaction_code),    
FOREIGN KEY (exam_id) REFERENCES exams (exam_id),    
FOREIGN KEY (user_id) REFERENCES users (user_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    

//This table relates to the above table, because includes info of transaction, but more detailed. Relation between them through transaction_code (FK). It also refers to user, exams, exams_question, exams_answers tables
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
  `checked_by` int(11) NOT NULL,    
PRIMARY KEY (transaction_dtl_id),    
FOREIGN KEY (transaction_code) REFERENCES transaction (transaction_code),    
FOREIGN KEY (user_id) REFERENCES users (user_id),    
FOREIGN KEY (question_id) REFERENCES exams_question (question_id),    
FOREIGN KEY (transaction_answer_id) REFERENCES exams_answers (answer_id),    
FOREIGN KEY (exam_id) REFERENCES exams (exam_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

