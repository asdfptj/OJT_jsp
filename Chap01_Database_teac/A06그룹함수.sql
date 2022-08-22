----------- 그룹함수 -------------

-- 그룹함수는 결과가 한 row로 출력된다.
select
	sum(salary),			-- salary 컬럼의 합계
	count(salary),			-- 직원수. 주의 - null 컬럼은 카운트에서 제외된다
	count(commission_pct),
	round(avg(salary), 2),
	max(salary),
	min(salary)
from employees


-- 입사일이 가장 빠른 직원은
select 
	min(hire_date),
	max(hire_date),
	min(first_name),
	max(first_name)
from employees

-- 80번 부서의 월급의 총합, 평균, 인원수를 출력하시오
select
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
where department_id = 80


-- Group by
-- 결과가 다중 row 컬럼과 단일 row 컬럼(그룹함수)가 혼합되면 에러
select
	80,						-- department_id
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
where department_id = 80


-- group by 명령은 같은 값을 가진 요소를 1개의 이름으로 통합
select
	department_id
from employees
where department_id = 80
group by department_id


select
	department_id,
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
where department_id = 80
group by department_id


-- 각 부서별로 구한다면

select
	department_id
from employees
group by department_id


select
	department_id,
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
group by department_id


-- 이름도 같이 출력한다면 (의미 없음)
select
	first_name,
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
group by first_name


-- group by에 참여한 컬럼은 select 구문에 참여할 수 있다
select
	first_name, department_id
	sum(salary),
	round(avg(salary)),
	count(*)
from employees
group by first_name, department_id


-- 급여를 5000이상 받는 직원 수를 부서별로 출력. 부서 번호도 같이 출력
select department_id, count(*)
from EMPLOYEES
where salary > 5000
group by department_id
order by department_id 


----------- having --------------
-- from에서 걸러내서 결과를 얻고자 한다면 => where
-- group by (그룹이 된 결과)에서 걸러내려면 => having 

-- 위의 결과에서 null인 부서(부서가 없음)은 표시하지 않고자 한다면
select department_id, count(*)
from EMPLOYEES
where salary > 5000
group by department_id
having department_id is not null
order by department_id 

-- 연습. 입사 연도별 입사 인원 조회
select to_char(hire_date, 'YYYY'), count(*)
from EMPLOYEES
group by to_char(hire_date, 'YYYY')
order by to_char(hire_date, 'YYYY')

-- 위의 조건에서 인원수가 10명 이상인 년도만 표시
select to_char(hire_date, 'YYYY'), count(*)
from EMPLOYEES
group by to_char(hire_date, 'YYYY')
having count(*) >= 10
order by to_char(hire_date, 'YYYY')


-- 직원의 평균 월급이 7000 이상인 부서를 부서별 조회. null 제외
select 
	department_id, 
	trunc(avg(salary), 2)
from EMPLOYEES
group by department_id
having department_id is not null and avg(salary) >= 7000
order by department_id desc




