-- 기타 함수

-- null과의 연산 결과는 null이다
-- commission_pct를 반영한 보너스 금액은 얼마인가
select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	salary * commission_pct as pct,
	department_id
from EMPLOYEES
where department_id in(60, 80)


-- nvl(column, 지정한 컬럼 값이 null인 경우 치환할 값)
select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	salary * nvl(commission_pct, 0) as pct,
	department_id
from EMPLOYEES
where department_id in(60, 80)

-- commission_pct가 없는 직원은 0.1%의 보너스 지급
select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	salary * nvl(commission_pct, 0.1) as pct,
	department_id
from EMPLOYEES
where department_id in(60, 80)


-- nvl2(컬럼명, 값이 있는 경우 치환값, 값이 없는 경우(null) 치환값)
-- 모든 직원의 보너스를 0.1(commission_pct) 더해서 지급할 금액
select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	salary * nvl2(commission_pct, commission_pct+0.1, 0.1) as pct,
	department_id
from EMPLOYEES
where department_id in(60, 80)



------------------ if or switch 구문과 같은 형식 *** --------------
-- decode(컬럼명, 값, 치환값, 값, 치환값......)

select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	department_id,
	decode(department_id, 
		60, '영업부',
		70, '개발부',
		100, '운영부'
	)
from EMPLOYEES
where department_id in(60, 70, 100)


-- case 
-- 	when 조건 then 조건에 해당되면 치환할 값
-- 	when 조건 then 조건에 해당되면 치환할 값
-- 	... 
-- end

-- decode 구문은 값이 같은 경우 즉 =(같다)의 경우만
-- case 구문은 다양한 조건 연산자 사용이 가능
select employee_id, first_name, hire_date,
	salary,
	commission_pct,
	department_id,
	case
		when department_id = 60 then '영업부'
		when department_id = 70 then '개발부'
		when department_id = 100 then '운영부'
	end AS deptname
from EMPLOYEES
where department_id in(60, 70, 100)

-- 이름이 'A'로 시작하면 'A팀', 이름이 'B'로 시작하면 'B팀', 나머지는 모두 'C팀'으로 출력 
select 
	employee_id, 
	first_name, 
	case
		when first_name like 'A%' then 'A팀'
		when first_name like 'B%' then 'B팀'
		else 'C팀'
	end as team,
	hire_date, salary, commission_pct, department_id
from EMPLOYEES
where department_id in(60, 70, 100)


