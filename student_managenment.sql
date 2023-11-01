CREATE DATABASE student_managenment;
USE student_managenment;

-- bang class
CREATE TABLE class(
	class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60)NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);

CREATE TABLE student(
	student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY(class_id) REFERENCES class(class_id)
);

-- Bang mon hoc
 CREATE TABLE subject(
	sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    -- TINYINT: kiểu dữ liệu nguyên nhỏ
    -- DEFAULT 1: là trị mặc định, nếu k nhập thì nó sẽ nhận giá trị mặc định là 1
    -- CHECK(credit>=1): kiểm tra data có phù hợp với đk trong ràng buộc hay k 
    credit TINYINT NOT NULL DEFAULT 1 CHECK(credit>=1),
    -- BIT: lưu trữ giá trị 0 hoặc 1 (hoặc True/False)
    status BIT DEFAULT 1
 );
 
 -- bang diem
 CREATE TABLE mark(
	mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    -- BETWEEN: giá trị trong cột "Mark" nằm trong khoảng từ 0 đến 100.
    mark FLOAT DEFAULT 0 CHECK(mark BETWEEN 0 AND 100),
    exam_time TINYINT DEFAULT 1,
    -- UNIQUE: tính duy nhất (sub_id,student_id) của cặp giá trị trong bang mark,
    -- nếu nhập trùng dòng dữ liệu 1 trong 2 cột này thì sẽ k thể  INSERT hoặc UPDATE 
    UNIQUE(sub_id,student_id),
    FOREIGN KEY (sub_id) REFERENCES subject(sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
 )


