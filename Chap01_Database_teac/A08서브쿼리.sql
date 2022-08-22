----------- 서브쿼리 -------------

-- 150번 사원보다 월급을 많이 받는 직원은?
select salary from employees
where employee_id = 150

select 
	employee_id,
	first_name,
	salary
from employees
where salary > 10000


-- 자바에서 연산자 우선 순위중 첫번째 순위

-- 단일행 서브쿼리
-- 서브쿼리에서 결정되는 값이 딱 1개이다. 이 값을 이용해서 메인쿼리를 구성
select 
	employee_id,
	first_name,
	salary
from employees
where salary > (select salary from employees
where employee_id = 150)


-- 80번 부서의 평균 연봉보다 더 많이 받는 직원은?
select employee_id, salary
from employees
where salary > (select avg(salary) 
				from employees)

-- manager가 Adam과 같은 직원 출력
select employee_id, first_name, manager_id
from EMPLOYEES
where manager_id = (select manager_id 
					from employees 
					where first_name = 'Adam')	


-- 다중행 서브쿼리

-- John과 월급이 같은 직원
-- in
select employee_id, first_name, salary
from EMPLOYEES
where salary in (select salary 
					from employees 
					where first_name = 'John')


-- any
-- 결과에서 가장 큰 값보다 작은 값은 모두 매칭
select employee_id, first_name, salary
from EMPLOYEES
where salary = any(select salary 
					from employees 
					where first_name = 'John')
					
					
-- 각 부서별 평균 연봉중 가장 큰 값보다 적게 받는 직원은?
select department_id, avg(salary)
from employees
group by department_id

-- <= any: 서브쿼리에서 가장 큰 값보다 같거나 작은 값
-- >= any: 서브쿼리에서 가장 작은 값보다 같거나 큰 값
select employee_id, first_name, salary
from EMPLOYEES
where salary >= any(select avg(salary)
						from employees
						group by department_id)
						
-- all				
-- >= 서브쿼리의 결과값 중 가장 큰 값보다 큰 값
-- <= 서브쿼리의 결과값 중 가장 작은 값 보다 작은 값		
select employee_id, first_name, salary
from EMPLOYEES
where salary <= all(select avg(salary)
						from employees
						group by department_id)

