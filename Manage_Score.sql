Create database Manage_Score;
Use Manage_Score;
CREATE TABLE student(
	student_id VARCHAR(20) PRIMARY KEY,
    student_name VARCHAR(50),
    birithday DATETIME,
    class VARCHAR(20),
    sex VARCHAR(20)
);

-- mon hoc
CREATE TABLE subject(
	subject_id VARCHAR(20)PRIMARY KEY,
    subject_name VARCHAR(50)
);

-- BangDiem
CREATE TABLE transcript(
	student_id VARCHAR(20),
    subject_id VARCHAR(20),
    score INT,
    test_day DATETIME,
    PRIMARY KEY (student_id,subject_id),
    --  tham chiếu đến cột "student_id" trong bảng "student","student_id" trong "transcript" là khóa ngoại liên kết với "student_id" trong "student".
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
);

CREATE TABLE teacher(
	teacher_id VARCHAR(20)PRIMARY KEY,
    teacher_name VARCHAR(20),
    phone VARCHAR(20)
);

-- bảng MonHoc bổ sung thêm trường MaGV là khoá ngoại của bảng MonHoc
-- thêm một cột mới có tên là "MaGV" vào bảng "MonHoc"
ALTER TABLE subject add teacher_id VARCHAR(20);
ALTER TABLE subject ADD CONSTRAINT FK_teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id);
-- xoa cot trong bang
-- ALTER TABLE transcript 
-- DROP COLUMN teacher_id;


 



