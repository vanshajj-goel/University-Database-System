select dept_name AS "DEPARTMENT" , fac_name AS "HOD" , TIMESTAMPDIFF(YEAR,DOB,CURDATE()) AS "AGE"  , address AS "CITY" , experience AS "EXPERIENCE" from hod h, faculty f, dept d where h.hod_id=f.fac_id and d.dept_id=h.dept_id ;

select h.hostel_id AS "HOSTEL ID", CONCAT("HOSTEL - ",h.hostel_name) AS "HOSTEL NAME" ,h.category AS "GIRLS/BOYS" , count(*) AS "TOTAL RESIDENTS" from student s , hostel h , allocated_hostel a where h.hostel_id=a.hostel_id and s.roll_no=a.roll_no group by h.hostel_id,h.hostel_name,h.category order by h.hostel_id; 

select f.fac_id AS "FACULTY ID", f.fac_name "FACULTY NAME",UPPER(g.grade_name) as "DESIGNATION", (1+f.experience/100)*(g.basic_pay+g.hra+g.da) AS "MONTHLY SALARY" from faculty f , grade_pay g where f.grade_id=g.grade_id and (1+f.experience/100)*(g.basic_pay+g.hra+g.da)>=200000 order by fac_id;

select d.dept_id AS "DEPARTMENT ID", d.dept_name AS "DEPARTMENT NAME" , count(*) AS "TOTAL STAFF" from teaching_fac f, dept d where f.dept_id=d.dept_id group by d.dept_id,d.dept_name;

select d.dept_id AS "DEPARTMENT ID", d.dept_name AS "DEPARTMENT NAME" ,f.fac_name AS "NAME",f.experience AS "EXPERIENCE"  from faculty f,teaching_fac t, dept d where t.dept_id=d.dept_id and f.fac_id=t.fac_id and (d.dept_id,f.experience) in (select d.dept_id , max(f.experience) from dept d , faculty f , teaching_fac t where d.dept_id=t.dept_id and t.fac_id=f.fac_id group by d.dept_id);

select s.roll_no AS "ROLL NO" , s.name AS "NAME" , TIMESTAMPDIFF(YEAR,s.DOB,CURDATE()) AS "AGE", s.address AS "CITY" , s.phone_no AS "PHONE NO" , c.course_name AS "COURSE"  from student s, course c where s.roll_no not in (select a.roll_no from allocated_hostel a) and c.course_id=s.course_id order by s.roll_no;

select s.roll_no AS "ROLL NO" , s.name AS "NAME" , c.course_name AS "COURSE" , r.cgpa from student s, course c ,result r where s.roll_no=r.roll_no and c.course_id=s.course_id and r.semester=(s.semester-1) order by r.cgpa desc LIMIT 10;

select address AS "CITY" ,count(*) AS "TOTAL STUDENTS" from student group by address order by count(*) desc; 

select c.course_name AS "COURSE NAME" , d.dept_name AS "DEPARTMENT NAME" from dept d, course c where d.dept_id=c.dept_id and c.course_name like "BE%";

select c.course_name AS "COURSE NAME" , d.dept_name AS "DEPARTMENT NAME" from dept d, course c where d.dept_id=c.dept_id and c.duration = 2;

select d.designation AS "DESIGNATION" , f.fac_name AS "NAME" , d.email_id AS "EMAIL ID" , d.office_contact AS "CONTACT NO." from deans d,faculty f where d.dean_id=f.fac_id;

select upper(d.designation) AS "DESIGNATION" , f.fac_name AS "NAME" , d.email_id AS "EMAIL ID" , d.office_contact AS "CONTACT NO." from directorate d,faculty f where d.dir_id=f.fac_id;

select f.fac_id AS "FACULTY ID", f.fac_name AS "NAME" ,t.designation AS "DESIGNATION", TIMESTAMPDIFF(YEAR,f.DOB,CURDATE()) AS "AGE"  , f.address AS "CITY" , f.experience AS "EXPERIENCE" from faculty f, non_teaching_fac t where t.fac_id=f.fac_id;

select s.sub_id AS "SUBJECT ID", s.sub_name "SUBJECT NAME" from course c , subject s , course_subject cs where c.course_id=cs.course_id and s.sub_id=cs.sub_id and c.course_id = (select course_id from course where course_name = 'BE ENC');

select s.roll_no AS "ROLL NO" , upper(s.name) AS "NAME" , concat('HOSTEL - ',h.hostel_name) AS "HOSTEL" from student s , allocated_hostel a , hostel h where a.roll_no=s.roll_no and a.hostel_id=h.hostel_id and a.room_type='AC' and a.room_occupancy='2S'; 

select dept_name AS "DEPARTMENT" , location AS "LOCATION" from dept;

select c.course_id AS "COURSE ID" , c.course_name AS "COURSE NAME" , d.dept_name AS "DEPARTMENT", c.credits AS "CREDITS"  from course c , dept d where c.dept_id=d.dept_id;

select concat('HOSTEL - ',h.hostel_name) AS "HOSTEL NAME" , f.fac_name "WARDEN" , h.capacity AS "CAPACITY", h.category AS "CATEGORY" from hostel h , faculty f where h.warden_id=f.fac_id;

select qualification AS "QUALIFICATION",count(*) AS "NO. OF TEACHERS" from teaching_fac group by qualification;

select c.course_name ,count(*) from student s , course c where s.course_id = c.course_id group by c.course_name;

select f.fac_id AS "FACULTY ID", f.fac_name "FACULTY NAME",UPPER(g.grade_name) as "DESIGNATION" ,f.experience AS "EXPERIENCE" from faculty f , grade_pay g ,teaching_fac t where f.grade_id=g.grade_id and f.fac_id=t.fac_id order by f.experience LIMIT 5;

select f.fac_id AS "FACULTY ID", f.fac_name "FACULTY NAME",UPPER(g.grade_name) as "DESIGNATION" ,f.experience AS "EXPERIENCE" from faculty f , grade_pay g ,hod h,deans d where f.grade_id=g.grade_id and f.fac_id=h.hod_id and d.dean_id=f.fac_id;

select semester AS "SEMESTER", ROUND(avg(sgpa),2) AS "AVERAGE SGPA" from result group by semester;

select CASE WHEN gender='M' THEN 'MALE' WHEN gender='F' THEN 'FEMALE' END AS "GENDER" , count(*) AS "NO. OF STUDENTS" from student group by gender;

select CASE WHEN gender='M' THEN 'MALE' WHEN gender='F' THEN 'FEMALE' END AS "GENDER" , count(*) AS "NO. OF STUDENTS" from faculty group by gender;

