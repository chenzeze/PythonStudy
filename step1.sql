create database homework;
use homework;
-- 建立department表，主键为dept_name
create table department(
	dept_name varchar(20) NOT NULL,
	building varchar(20),
        budget int(7),
	PRIMARY key (dept_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建立student表，主键为ID
create table student(
	ID int(5) NOT NULL,
	name varchar(20),
	sex char(1),
	age int(3),
	emotion_state varchar(20),
	dept_name varchar(20),
	PRIMARY key (ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建立exam表，主键为student_ID,exam_name
create table exam(
    student_ID int(5)  NOT NULL,
    exam_name varchar(10) NOT NULL,
    grade int(3),
    PRIMARY key (student_ID,exam_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 外键，student表的dept_name以department表的dept_name为参考
-- 若是department表的dept_name删除，但这个系的学生不可能就退学了，所以student表的dept_name SET NULL
-- 若是department表的dept_name更改，则student表的dept_name相应更改，CASCADE
ALTER TABLE `homework`.`student` 
ADD INDEX `fk_student_1_idx` (`dept_name` ASC);
ALTER TABLE `homework`.`student` 
ADD CONSTRAINT `fk_student_1`
  FOREIGN KEY (`dept_name`)
  REFERENCES `homework`.`department` (`dept_name`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
  
-- 外键，exam表的student_ID以student表的ID为参考
-- 若是student表的ID删除，即这个学生退学，此时该学生的考试成绩也没意义，所以exam表的student_ID相应删除
-- 若是student表的ID更改，则这个学生改了学号，所以exam表的student_ID相应更改
ALTER TABLE `homework`.`exam` 
ADD CONSTRAINT `fk_exam_1`
  FOREIGN KEY (`student_ID`)
  REFERENCES `homework`.`student` (`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

