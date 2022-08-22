
drop table emp;

create table emp(
	empid		number(3),
	name		varchar2(50)	constraint emp_name_nn not null,
	salary		number(8, 2),
	hire		date			default sysdate,
	pct			number(2, 2),
	nick		varchar2(50),
	deptid		number(4),
	
	constraint	emp_empid_pk	primary key(empid),
	constraint 	emp_salary_ck	check(salary >= 1000),
	constraint	emp_pct_ck		check(pct >= 0.01 and pct <= 0.99),
	constraint	emp_nick_uk		unique(nick),
	constraint 	emp_did_fk		foreign key(deptid) 
									references departments(department_id)
)

-- 데이터 입력
-- insert info 테이블명(컬럼명, 컬럼명...) values(순서대로 값 대입)

-- 전체 컬럼에 값을 정의한 순서대로 입력하는 경우는 컬럼명을 생략할 수 있다
-- insert info 테이블명 values(순서대로 값 대입)

insert into emp(empid, hire, salary, name, nick, deptid, pct)
	values(100, '2022-05-27', 1500, '놀부', '흥부전', 100, 0.1)

-- OK check 제약조건은 null 허용. 여기서는 pct 값 입력 안함
insert into emp(empid, hire, salary, name, nick, deptid)
	values(101, to_date('2022-05-27', 'YYYY-MM-DD'), 1500, '흥부', '놀부전', 100)
	
-- Error empid 값이 중복 => primary key는 not null이면서 unique(여기서 중복 조건에 걸림)
insert into emp(empid, hire, salary, name, nick, deptid)
	values(101, to_date('2022-05-27', 'YYYY-MM-DD'), 1500, '방자', '방자전', 100)
 
-- OK empid 값은 건너뛰어도 상관없음. unique하기만 하면 된다
insert into emp(empid, hire, salary, name, nick, deptid)
	values(103, to_date('2022-05-27', 'YYYY-MM-DD'), 1500, '방자', '방자전', 100)
	
-- Error salary의 제약 조건이 1000 이상. 900이라 에러
insert into emp(empid, hire, salary, name, nick, deptid)
	values(102, to_date('2022-05-27', 'YYYY-MM-DD'), 900, '방자', '향단전', 80)
	
-- Error empid는 PK. PK => not null (값이 반드시 들어와야 한다)
insert into emp(hire, salary, name, nick, deptid)
	values(to_date('2022-05-27', 'YYYY-MM-DD'), 900, '방자', '향단전', 80)

-- Error name 필드는 not null로 반드시 입력해야 한다
insert into emp(empid, hire, salary, nick, deptid)
	values(102, to_date('2022-05-27', 'YYYY-MM-DD'), 900, '향단전', 80)
	
-- OK hire는 입력하지 않으면 테이블 작성시 정의한 default 값이 자동 입력된다.
insert into emp(empid, salary, name, nick, deptid)
	values(102, 2000, '방자', '향단전', 80)

-- 컬럼명이 생략된 경우는 테이블 생성시 정의한 컬럼 순서대로 모든 값을 넣어야 한다
insert into emp values(105, '춘향', 3000, '2022-05-08', 0.1, '춘향전', 50)



------------------- 수정 update --------------------
-- *** where 절이 없으면 모든 컬럼이 변경된다
-- 수정도 제약 조건을 따른다
update 테이블명 set 컬럼명=값, 컬럼명=값, ....
where 조건

-- OK
update emp set name='몽룡', salary = 1200, hire='2022-06-01'
where empid = 101

-- ERROR	nick이 unique 이미 춘향전이 있음
update emp set name='토끼', salary = 1300, hire='2022-06-01', nick='춘향전'
where empid = 102


update emp set name='신천재', salary = 1300, hire='2022-06-01'

delete from emp where empid = 100



-- rollback => commit 명령이 내려진 후 모든 작업을 취소
rollback


-- commit => 현재까지의 작업을 모두 적용
commit

------------- 삭제 delete ------------------
--*** where 절이 없으면 모든 데이터가 삭제된다
-- delete from 테이블명 where 조건
-- 조건이 만족되는 row는 모두 삭제된다

-- 2명이 삭제됨 -> 입력된 결과에 따라 달라질 수 있음
delete from emp
where deptid = 100

commit

select * from emp
order by empid 






