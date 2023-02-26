use quanlysinhvien;
# Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where StudentName like "h%";
# Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where StartDate like "%12%";
# Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject 
where Credit between 3 and  5;
# Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set ClassId = 2
where StudentName = "Hung";
# Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select StudentName, SubName, Mark from student, subject, mark
order by Mark desc, StudentName asc ;