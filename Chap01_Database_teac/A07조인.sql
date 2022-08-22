-------------- join***** -----------------

select * from employees
where employee_id = 100

select * from departments

-- join. 한개 이상의 테이블을 form 절에서 연결해서 사용
-- 기본은 close join 이다
select * 
from EMPLOYEES, DEPARTMENTS


-- departments 테이블의 PK와 employees 테이블의 FK가 같은 요소만 추출하면
-- 각 row당 매칭되는 값이 1개라 1줄만 표시
select * 
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.department_id = DEPARTMENTS.department_id


-- 컬럼을 필요한 것만 출력해보자
select employee_id, first_name, salary, hire_date, department_name
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.department_id = DEPARTMENTS.department_id


-- 두 테이블에 중복된 컬럼이 있는 경우는 반드시 어느 테이블에서 꺼내서 출력할 것인가를 지정해야 한다
select 
	employee_id, first_name, salary, hire_date, 
	EMPLOYEES.department_id,
	department_name
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.department_id = DEPARTMENTS.department_id


-- alias를 이용해서 간단히 표시
select 
	employee_id, first_name, salary, hire_date, 
	e.department_id,
	department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id


-- 부서의 주소까지 표시하고자 한다
select * from EMPLOYEES
select * from DEPARTMENTS
select * from LOCATIONS

-- 3개의 테이블을 하나로 연결
select 
	employee_id, first_name, salary, hire_date, 
	e.department_id,
	department_name,
	street_address
	city
from EMPLOYEES e, DEPARTMENTS d, LOCATIONS loc
where e.department_id = d.department_id and
	d.location_id = loc.location_id



-- outer join
-- department_id가 없는 직원은 표시되지 않는다
-- 또한 departments 테이블에 부서에 해당된 직원이 없는 부서도 표시되지 않는다
select 
	employee_id, first_name, salary, hire_date, 
	e.department_id,
	department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id


-- 조건에 만족하지 않아 표시되지 않은 ROW도 표시하고자 할 경우 
-- where에서 표시하고자 하는 테이블명의 반대편에 (+)를 추가한다

-- EMPLOYEES 테이블에 조건이 매칭되지 않아 표시되지 않은 데이터도 포함시켜 표시
select 
	employee_id, first_name, salary, hire_date, 
	e.department_id,
	department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id(+)


-- DEPARTMENTS 테이블에 조건이 매칭되지 않아 표시되지 않은 부서도 포함시켜 표시
select 
	employee_id, first_name, salary, hire_date, 
	d.department_id,
	department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id(+) = d.department_id



-- self 조인
-- 각 사원별 관리자 이름 출력
select 
	e.employee_id, 
	e.first_name, 
	e.salary, 
	e.hire_date,
	e.manager_id,
	m.first_name,
	e.department_id
from EMPLOYEES e, EMPLOYEES m
where e.manager_id = m.employee_id




-- ANSI Join (표준 조인 방식)

-- equals join
select 
	employee_id, 
	d.department_id, 
	department_name
from employees e join departments d
on (e.department_id = d.department_id)

-- 위와 동일
select 
	employee_id, 
	d.department_id, 
	department_name
from employees e inner join departments d
on (e.department_id = d.department_id)


-- OUTER JOIN

-- 좌측 테이블에 매칭되지 않은 항목도 표시
select 
	employee_id, 
	d.department_id, 
	department_name
from employees e left outer join departments d
on (e.department_id = d.department_id)

-- 우측 테이블에 매칭되지 않은 항목도 표시
select 
	employee_id, 
	d.department_id, 
	department_name
from employees e right outer join departments d
on (e.department_id = d.department_id)

-- 양쪽 모두 매칭되지 않은 데이터를 표시 (오라클은 없음)
select 
	employee_id, 
	d.department_id, 
	department_name
from employees e full outer join departments d
on (e.department_id = d.department_id)
