Quiz System is an app for Mac OSX platform, support Mac OSX 10.11.

I. What is QuizSystem

QuizSystem is an application for examination: 
    * store quizzes/examine questions into an host(recognised by IP address);
    * generate examine paper randomly, store examine result into host Database;
    * support subjective questions, comment and review by teachers.
For overview business logic, refer to architecture.

II. How To Use：
This is an utility application to generate paper ramdomly and keep examination record in server database.

Step 1. Build Mysql database server, install Mysql Database on a host and connect to network.

	DataBase essentail: create a database and essential sheets as below
	
	Sheet1: Administrators -- store info of Administrators
	+----+----------+-----------+---------------------+--------+
  | id | user     | passwords | department          | unread |
  +----+----------+-----------+---------------------+--------+
  |  1 | F7684885 | HJKL:     | PSD_NPI_TDE_SMT_FA  | 0      |
  +----+----------+-----------+---------------------+--------+
	
	Sheet2: Administrators_Configuration -- store info of Configuration of department
	
	Sheet3: Testers -- store info of Testers
	
	Sheet4: Testers_Record -- store info of Testers's testing record
	
	

2.1. DataBase Support:

2.2. DataBase Essential:

2.3. Business Logic:

III. Architecture

3.1. UI architecture

3.2. Data Modal architecture




+----+----------+-----------------+------+------+-----+-----------+------------------+--------+-------+
| id | user     | name            | time | cost | sum | score_obj | timeStamp        | unread | score |
+----+----------+-----------------+------+------+-----+-----------+------------------+--------+-------+
|  1 | F1012885 | Super man       | 120  | 30   | 150 | 90        | 201512120000     | N      | 96    |
|  2 | F7686117 | 超级管理员      | 120  | 150  | 37  | 24        | 2015/12/12 00:00 | N      | 0     |
+----+----------+-----------------+------+------+-----+-----------+------------------+--------+-------+
