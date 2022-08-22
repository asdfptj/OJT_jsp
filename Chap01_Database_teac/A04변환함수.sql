----------------- 변환 함수 *** -------------------

-- 문자를 숫자로 변경
-- 문자를 숫자로 변경하는 경우 자리수 맞추자
select 
	to_number('123456789', '000000000') + 1,
	to_number('123456789', '999999999') + 1
from dual

-- 숫자를 문자로 변경
select 
	to_char(123456789, '000,000,000,000'),		-- 값이 없으면 0으로 채운다
	to_char(123456789, '999,999,999,999')		-- 값이 없으면 무시(있는것 만큼만 출력)
from dual

select 
	to_char(123456789, '$000,000,000,000'),		-- 무조건 $로 붙음
	to_char(123456789, 'L999,999,999,999')		-- OS의 나라 환율 표시
from dual


-- 날짜 *******
-- 오늘 날짜를 년/월/일 형태로 표시
select sysdate from dual

select
	to_char(sysdate, 'yyyy/MM/DD day am HH24:MI:SS')
from dual

select
	to_char(sysdate, 'yy/mm/dd dy am hh:MI:ss')
from dual


select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY"년" MM"월" DD"일"') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where department_id in(50, 100)


-- 올해 12월 25일은 무슨 요일
select
	to_char( to_date('2023-12-25', 'yyyy-mm-dd'), 'day')
from dual


-- 각 사원의 입사일을 입사 연도만 표시하시오
select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where department_id in(50, 100)


-- 수요일에 입사한 직원은?
select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY day') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where to_char(hire_date, 'd') = 4

-- 2005년 입사한 직원
select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY day') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where to_char(hire_date, 'yyyy') = '2005'

-- 2005년 이후 입사 직원
select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY day') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where to_char(hire_date, 'yyyy') >= 2005

select 
	employee_id, 
	first_name, 
	trim(to_char(salary, '999,999,999')) salary, 
	to_char(hire_date, 'YYYY day') hire, 
	commission_pct, 
	department_id
from EMPLOYEES
where to_number(to_char(hire_date, 'yyyy'), '0000') >= 2005

