-- 테이블 복사

create table emp
as
select * from employees

select * from emp

-- 테이블 삭제
drop table emp


-- 테이블의 일부 값만 복사하는 경우
create table emp
as
select * from employees
where department_id in(50, 60, 70, 100)


-- 구조만 복사
-- 조건이 거짓이라 포함되는 row가 존재하지 않는다.
create table emp
as
select * from employees
where 1 != 1


-- 일부 컬럼만 복사 (일부 테이터만 복사 포함 가능)
create table emp
as 
select 
	employee_id,
	first_name,
	salary, 
	commission_pct
from employees


-- 복사할 컬럼과 row를 동시에 지정
create table emp
as 
select 
	employee_id,
	first_name,
	salary, 
	commission_pct
from employees
where department_id in(60, 80, 100)

-- 컬럼 이름을 변경해서 작성
create table emp
as 
select 
	employee_id AS eid,
	first_name || ' ' || last_name name,
	salary, 
	commission_pct pct
from employees
where department_id in(60, 80, 100)



----------------- 테이블 컬럼 조작 ---------------------

-- 컬럼 추가 => add 컬럼명 컬럼타입
alter table emp
add department_id varchar2(3)


-- 컬럼 이름 변경 => rename column 원래컬럼명 to 바꿀컬럼명
alter table emp
rename column department_id to did

-- 컬럼의 타입 변경 => modify 컬럼명 타입
alter table emp
modify did number(3)

-- 이클립스테서는 동작하지 않음 - 도스창으로 확인
desc emp


-- 컬럼 삭제 => drop column 컬럼명
alter table emp
drop column did


-- 테이블의 모든 데이터 삭제 - 구조는 유지된다
truncate table emp

-- 테이블 삭제
drop table emp


select * from emp


---------------- 제약 조건 -------------------
-- primary key => 고유키. null은 입력될 수 없음(not null), 중복 값 입력될 수 없음(unique)
-- foreign key => 참조키. 다른 테이블의 PK를 참조할 목적. null 허용, 중복 값 허용
-- not null => 반드시 값을 입력해야 한다
-- unique => 값이 중복될 수 없다. 다만 NULL은 가능하다
-- check => 부여한 조건에 만족하는 값만 대입 가능

-- table을 복사하면 기존의 제약조건은 복사되지 않고 아무런 제약 조건이 없는 상태로 복사된다
create table emp
as
select
	employee_id empid,
	first_name || ' ' || last_name name,
	hire_date hire,
	job_id jobid,
	salary,
	commission_pct pct,
	department_id deptid
from employees


alter table emp
modify(empid primary key)


-- db에 있는 모든 테이블의 제약 조건 확인
select * from user_constraints

select * from user_constraints
where table_name = 'EMP'


-- 제약 조건 삭제
alter table emp
drop constraint SYS_C007029


-- 제약 조건을 걸때 이름을 지정해서 설정
alter table emp
modify(empid constraint emp_empid_pk primary key)


-- 제약 조건의 이름 변경
ALTER TABLE emp
RENAME CONSTRAINT emp_empid_pk TO emp_eid_pk


-- name => not null
-- salary, pct => check
-- deptid => fk

-- not null
alter table emp
modify(name constraint emp_name_nn not null)

-- check
alter table emp
modify(salary constraint emp_salary_ck check(salary >= 1000))

alter table emp
modify(pct constraint emp_pct_ck check(pct between 0 and 0.99))


-- FK
alter table emp
modify(deptid constraint emp_deptid_fk references departments(department_id))


select * from user_constraints
where table_name = 'EMP'

select * from emp


--------------------- 테이블 작성 -------------------------
drop table emp

-- 테이블의 이름은 30byte까지 가능
-- 특수문자는 $, _, 한글 사용 가능
-- 예약어 사용 불가 => create, from
-- 테이블 이름의 시작은 문자로 시작되야 한다
create table 테이블이름(
	컬럼명	타입		제약조건,
	컬럼명	타입		제약조건,
	..
)

-- 문자타입
-- varchar2(글자수) => 가변.
-- varchar2(10) => 10 입력 자리 확보. 데이터 3자만 들어오면 알아서 3자리로 변경. 11자리 입력하면 에러
-- char(글자수) => varchar2와는 달리 지정한 글자수 고정. 값에 의해 크기가 변경되지 않음

-- number(총확보자리수, 소수점자리수)
-- number(6) => 정수만 6자리까지 입력가능(999999). 값이 넘으면 에러
-- number(6, 2) => 정수는 4자리까지(9999), 소수점이 2자리 확보(.99). 합쳐서 총 6자리가 된다
-- number(2, 2) => 정수 입력 안됨. 소수점이 2자리 확보(.99)

-- date	=> () 없이 사용. 9999년까지 입력 가능

-- default value => 입력 할때 값을 입력하지 않으면 지정한 value 값이 기본으로 입력된다

-- 테이블을 만들때 컬럼 옆에 제약조건을 달면 제약조건 이름을 할당할 수 없다
create table emp(
	empid		number(3)		primary key,
	name		varchar2(50)	not null,
	salary		number(8, 2)	check(salary >= 1000),
	hire		date									default sysdate,
	nick		varchar2(50)	unique,
	deptid		number(4)		references departments(department_id)
)

select * from EMP

-- table 이름은 대문자로
select * from user_constraints
where table_name = 'EMP'


drop table emp

-- 제약 조건의 이름을 붙여서 생성
-- not null 제약 조건은 따로 뺄 수 없음
create table emp(
	empid		number(3),
	name		varchar2(50)	constraint emp_name_nn not null,
	salary		number(8, 2),
	hire		date			default sysdate,
	nick		varchar2(50),
	deptid		number(4),
	
	constraint	emp_empid_pk	primary key(empid),
	constraint 	emp_salary_ck	check(salary >= 1000),
	constraint	emp_nick_uk		unique(nick),
	constraint 	emp_did_fk		foreign key(deptid) 
									references departments(department_id)
)

select * from EMP

-- db에 있는 테이블 확인
select * from user_tables





