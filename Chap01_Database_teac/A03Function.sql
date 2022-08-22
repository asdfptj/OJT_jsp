--A03Function

-- 문자 함수
-- upper, lower, length, instr**
select 
	employee_id, 
	upper(first_name) upper,
	lower(first_name) lower,
	lower(first_name || ' ' || last_name) name,
	replace(first_name, 'a', 'A') change,
	replace(first_name, 'ea', 'EA') ae,				-- ea 모두 매칭되야 변경
	translate(first_name, 'ea', 'EA') ae,			-- e는 E로 a는 A로 각각 개별 변경
	translate('010-1214-5678', '0123456789', '영일이삼사오육칠팔구') tel
from EMPLOYEES
where department_id in (60, 50, 100)


-- 사원명이 john인 직원은
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name = 'john'		-- 직원의 첫 글자는 모두 대문자(대소문자 구분)


select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where lower(first_name) = 'john'		-- 직원의 첫 글자는 모두 대문자(대소문자 구분)

-- 이름이 5글자 이하인 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where length(first_name) <= 5

-- 이름에 'a'가 포함된 직원은
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like '%a%'

select employee_id, 
	first_name, 
	instr(first_name, 'a', 1, 1)
	salary, hire_date, commission_pct, department_id
from EMPLOYEES

-- db에서는 시작 번호가 0이 아닌 1부터 시작한다 
select employee_id, 
	first_name, 
	-- first_name에서 'a'를 1번째 부터 검색해서 1번째 나오는 위치
	instr(first_name, 'a', 1, 1),	
	salary, hire_date, commission_pct, department_id
from EMPLOYEES
where instr(first_name, 'a', 1, 1) != 0


-- 이름의 첫 글자가 'A'로 시작되면 검색에서 제외된다. 대 소문자 구분
select employee_id, 
	first_name, 
	-- first_name에서 'a'를 1번째 부터 검색해서 1번째 나오는 위치
	instr(first_name, 'a', 1, 1),	
	salary, hire_date, commission_pct, department_id
from EMPLOYEES
where instr(lower(first_name), 'a', 1, 1) != 0			-- 이름을 먼저 소문자로 변경 후 검색


-- pad
select employee_id, 
	first_name, 
	rpad(first_name, 10, '*'),	
	salary, hire_date, commission_pct, department_id
from EMPLOYEES



--------------- 숫자 함수 --------------------
-- round, trunc **

-- dual table은 컬럼과 row가 1개씩만 존재하는 테이블
-- 어떤 값을 출력할때 테이블 이름을 기술하면 그 테이블의 row수 만큼 출력된다
select 'abc' from EMPLOYEES				-- 107 줄이 출력된다

select * from dual
select 'abc' from dual					-- 1줄

select
	ceil(10.001),
	floor(10.99),
	round(123.45678, 2),			-- 소수점 2자리에서 반올림
	trunc(123.45678, 2)				-- 소수점 2자리에서 버림
from dual


-- 월급을 100단위로 출력
select employee_id, first_name, 
	round(salary, -2), 
	hire_date, commission_pct, department_id
from EMPLOYEES
where department_id in (60, 100)


select mod(10, 3) from dual


--------------- 날짜 함수 ------------------
-- add_months, round, trunc, sysdate

-- 오늘이 며칠
select sysdate from dual

-- 오늘부터 100일 후의 날짜는
-- 날짜 타입에 값에 +, -로 더하면 일 기준으로 더해진다.
-- 28, 30, 31 등은 알아서 계산해서 표시해 준다
select sysdate + 100 from dual


-- 오늘부터 3달 후.
-- 일 계산은 +, -로 가능하지만 월 계산은 날짜 수를 따져야 해서 함수 형태로 존재
select add_months(sysdate, 3) from dual

-- 올해는 몇날 남았나
select months_between(sysdate, '2022-12-31') from dual

-- 남은 날짜 기준으로 15일 이상이면 반올림(round). 무조건 버림(trunc)
select round(months_between(sysdate, '2022-12-31')) from dual
select trunc(months_between(sysdate, '2022-12-31')) from dual

-- 시간 기준으로 반올림
select round(sysdate) from dual

-- 일자로 반올림해서 월의 첫 날짜가 표시된다. 그 달에 반 이상이 되면 반올림(다음달) 아니면 이번달
select round(sysdate, 'month') from dual
select round(sysdate, 'year') from dual



