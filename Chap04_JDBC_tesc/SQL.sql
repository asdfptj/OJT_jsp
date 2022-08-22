drop table emp

create table emp
as
select
	employee_id id,
	first_name name,
	salary,
	commission_pct pct,
	hire_date hire,
	department_id deptid
from employees
where department_id in(50, 60, 70, 100)


-- 전체 가져오기
select * from EMP order by id desc


-- 게시물 1개 가져오기
select * from emp where id = 199


-- 게시물 삭제
delete from emp where id = 204


-- insert
select max(id) + 1 from emp

insert into emp(id, name, salary, pct, hire, deptid) 
values( (select nvl(max(id), 0) + 1 from emp), 'ABC', 1000, 0.1, '2022-06-02', 100)




















