# ict-first-trimester-final
ICT First Trimester`s Final project

GitHub Repository created by Alimkhan Akimzhan and Arsen Abdullin from CS-2006 to provide an ICT Final Project.

Form the data takes.
Current system consists of two parts, such as the exam and the checking process.
The exam:   My client provides his own clients (students) the opportunity to test their level of English. 
To do that, first of all, he decides to exam the students. Then he appoints the exam on the certain date, 
which comfortable for all members of such system. When the day has come, the students take the exam papers 
and write the answers to the questions. After the exact period of time the teacher collects all exam papers.

Checking:   After the papers are collected at all, the teacher starts to check the papers for correct and 
mistaken answers. First of all, he chooses the exam paper and checks the answers one by one. If the certain answer 
is correct he adds one point, else does nothing and after this goes to the next answers if there is no answer 
left. If this was the last one, he calculates all points by summing all points. Using such information, he 
enters the grades in the journal.

What works well what doesn't?
The current system has its advantages and disadvantages. The process of data collection and storage is quite simple but takes time and efforts to enter the information into the journal. Moreover, there is a chance of making a mistake due to the human factors, such as bad attention or something else, which can lead to serious problems on both sides: company and customer. Automation and digitalization of the system would improve the efficiency of the system and help the learning center to develop and move forward in the future.


Nature of the problem.
The main problem that the system has is it is not automated referring to modern requirement. 
The system does not support an electronic input and output data. 
As for solution, we chose to use a database management system to have an opportunity to call any request related to updates of storage. 
As for possible approaches, a MySQL is chosen, because it has many advantages such as it is very easy to install, 
and thanks to a bevy of third-party tools that can be added to the database, setting up an implementation is 
a relatively simple task. In addition, it’s also an easy database to work with. So long as you understand the 
language, you shouldn’t run into too many problems.

Data Structure.
In general, desired system will have 10 entities, users with their users’ roles, departments, where they do study, exams with the exam question and exam question-answers, users’ transactions with separate detailed info about them, users’ payment information, advertisements of payments.
Business Rules.
1. User can have one role
2. User can make one or many payments
3. User can be related to one department
4. User can make one or many transaction
5. Transaction can have one or many details
6. User can have one transaction details
7. Users in one department can pass one or many exams
8. Department can have zero or many advertisements
9. Exam can have one or many exam questions
10. One exam answer can be the answer to one or many exam questions
11. Transaction is performed for one exam
12. Exam can have one transaction details
13. Exam question can be related to one transaction details
14. Exam answer can be related to one transaction details
