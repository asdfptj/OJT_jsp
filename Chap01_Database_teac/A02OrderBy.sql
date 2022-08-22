-- 정렬 => order by
-- from => where => order by => select

select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where commission_pct is not null
order by salary

-- 내림차순 => desc
-- 올림차순(기본값) => asc
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where commission_pct is not null
order by salary desc


-- 부서번호가 60, 50, 100번인 부서의 직원을 출력하고 부서번호 순으로 먼저 올림차순으로 정렬후
-- 부서별 급료가 많은 직원 순으로 정렬
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id in (60, 50, 100)
order by department_id asc, salary desc

