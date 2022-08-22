---------------- 실습문제 ----------------------

-- 테이블 작성
create table examtbl(
	sNo		number(5)		primary key,
	sName	varchar2(10),
	kor		number(3),
	eng		number(3),
	math	number(3),
	hist	number(3)
);

-- 데이터 입력
insert into examtbl values(10101, '김학생', 75, 85, 90, 60);
insert into examtbl values(10102, '이학생', 70, 75, 70, 60);
insert into examtbl values(10103, '박학생', 70, 85, 80, 75);
insert into examtbl values(10201, '조학생', 90, 85, 100, 50);
insert into examtbl values(10202, '황학생', 65, 65, 60, 70);
insert into examtbl values(10203, '임학생', 45, 55, 50, 55);
insert into examtbl values(10304, '천학생', 70, 75, 85, 80);
insert into examtbl values(10305, '남학생', 100, 85, 90, 90);
insert into examtbl values(10306, '여학생', 80, 95, 90, 85);
insert into examtbl values(10307, '노학생', 35, 55, 70, 55);

-- 전체 리스트 출력
select * from examtbl

-- 각 학생별 점수, 합계, 평균 출력
select
	sno, sname, kor, eng, math, hist, 
	kor+eng+math+hist AS total,
	(kor+eng+math+hist) / 4 AS avg
from examtbl



--- 회원 정보 명세서 테이블
create table member_tbl(
	custno		number(6)		primary key,
	custname	varchar2(20),
	phone		varchar2(13),
	address		varchar2(60),
	joindate	date,
	grade		char(1),
	city		char(2)
);

insert into member_tbl values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '2015-12-02', 'A', '01');
insert into member_tbl values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '2015-12-06', 'B', '01');
insert into member_tbl values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '2015-10-01', 'B', '30');
insert into member_tbl values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '2015-11-13', 'A', '30');
insert into member_tbl values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '2015-12-25', 'B', '60');
insert into member_tbl values(100006, '차공단', '010-1111-7777', '제주시 제주시 감나무골', '2015-12-11', 'C', '60');



create table money_tbl(
	custno		number(6),
	salenol		number(8),
	pcost		number(8),
	amount		number(4),
	price		number(8),
	pcode		varchar2(4),
	sdate		date,
	
	constraint 	money_no_sale_pk	primary key(custno, salenol)
)


insert into money_tbl values(100001, 2016001, 50, 5, 250, 'A01', '2016-01-01');
insert into money_tbl values(100001, 2016002, 100, 4, 400, 'A02', '2016-01-01');
insert into money_tbl values(100001, 2016003, 50, 3, 150, 'A08', '2016-01-01');
insert into money_tbl values(100002, 2016004, 200, 1, 200, 'A04', '2016-01-02');
insert into money_tbl values(100002, 2016005, 50, 1, 50, 'A01', '2016-01-03');
insert into money_tbl values(100003, 2016006, 150, 2, 300, 'A03', '2016-01-03');
insert into money_tbl values(100004, 2016007, 50, 2, 100, 'A01', '2016-01-04');
insert into money_tbl values(100004, 2016008, 30, 1, 30, 'A05', '2016-01-04');
insert into money_tbl values(100004, 2016009, 60, 1, 60, 'A06', '2016-01-04');
insert into money_tbl values(100004, 2016010, 300, 1, 300, 'A07', '2016-01-06');

-- 데이터 입력 후에는 값이 들어갔는지 반드시 체크한다
select * from money_tbl

delete from money_tbl

truncate table money_tbl
commit


-- 회원 목록 전체 조회
SELECT * FROM member_tbl
ORDER BY custno


-- 회원번호 100002 조회
SELECT * FROM member_tbl
where custno = 100002

-- 회원 매출 조회
SELECT mem.custno, custname, 
	decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, 
	sum(price) price
FROM member_tbl mem, money_tbl mon
WHERE mem.custno = mon.custno
GROUP BY mem.custno, custname, grade
ORDER BY price desc


-- 전체 리스트 
select custno, custname, phone, address, joindate, 
	decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city
from member_tbl


select * from emp
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


-- 입력되는 member의 id 값을 자동 산출
select nvl(max(custno), 0) + 1 as custno from member_tbl



-- 테스트로 입력한 게시물 삭제
delete from MEMBER_TBL where custno = 100007
commit

select * from member_tbl







