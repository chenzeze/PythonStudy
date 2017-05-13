create database homework;
use homework;
create table exam(
    student_ID int(5)  NOT NULL,
    exam_name varchar(10) NOT NULL,
    grade int(3),
    PRIMARY key (student_ID,exam_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table student(
	ID int(5) NOT NULL,
	name varchar(20),
	sex char(1),
	age int(3),
	emotion_state varchar(20),
	dept_name varchar(20),
	PRIMARY key (ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table department(
	dept_name varchar(20) NOT NULL,
	building varchar(20),
    budget int(7),
	PRIMARY key (dept_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `homework`.`exam` 
ADD CONSTRAINT `fk_exam_1`
  FOREIGN KEY (`student_ID`)
  REFERENCES `homework`.`student` (`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `homework`.`student` 
ADD INDEX `fk_student_1_idx` (`dept_name` ASC);
ALTER TABLE `homework`.`student` 
ADD CONSTRAINT `fk_student_1`
  FOREIGN KEY (`dept_name`)
  REFERENCES `homework`.`department` (`dept_name`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;