-- 사원 정보 테이블
select * from employees;

-- 부서 정보 테이블
select * from DEPARTMENTS;

-- 부서 상세 정보 테이블
select * from LOCATIONS;

-- 원하는 컬럼만 출력
select employee_id, first_name, last_name from EMPLOYEES

-- 별칭 달기**
-- 별칭에 스페이스가 포함되면 ""으로 묶어야 한다.
select 
	employee_id as id,
	first_name fname,
	last_name lname,
	commission_pct "사원 보너스"
from employees


-- 컬럼 합치기 => ||
select 
	employee_id as id,
	'abc',
	first_name || last_name,
	commission_pct "사원 보너스"
from employees


select 
	employee_id as id,
	first_name || ' ' || last_name name,
	commission_pct "사원 보너스"
from employees

-- 이름에 () 치기 > (이름)
select 
	employee_id as id,
	'(', 
	first_name || ' ' || last_name name,
	')',
	commission_pct "사원 보너스"
from employees


select 
	employee_id as id,
	'(' || first_name || ' ' || last_name || ')' name,
	commission_pct "사원 보너스"
from employees


select * from EMPLOYEES

-- 테이블이 가지고 있는 row 수 만큼 출력된다. (행을 걸러냄 => select 컬럼명 지정)
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES


-- 위의 결과에서 부서번호가 80번인 부서만 출격 (row을 걸러냄 => where로 조건 설정)
-- 같음 => =
-- 같지 않음 => !=
select *
from EMPLOYEES
where department_id = 80


select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id = 80


select 
	employee_id, 
	first_name || ' ' || last_name name, 
	salary, 
	hire_date, 
	commission_pct, 
	department_id
from EMPLOYEES
where department_id = 80


-- 80번 부서에서 월급이 10000 이상인 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id = 80 and salary >= 10000


-- 80번 부서에서 월급이 5000 이상 10000 이하인 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id = 80 and salary >= 5000 and salary <= 10000


-- 한 컬럼에서 어느 값 사이값을 참조하는 경우 between ~ and ~ 를 사용한다
-- 5000과 10000이 포함
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id = 80 and salary between 5000 and 10000



-- 80번 부서와 100번 부서의 정보 출력
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id = 80 or department_id = 100


-- 같은 걸럼 이름에서 or를 사용하는 경우 보통 in(value, value) 사용
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where department_id in(80, 100)

-- 이름이 A, D인 직원 (매칭)
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name in('A', 'D')


-- 포함된 직원이 표시됨 (포함)
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name between 'A' and 'D'


-- 이름이 'A'로 시작되는 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name = 'A'  -- 이름이 'A'인 직원. 매칭 직원이 존재하지 않음

-- 포함 관계는 like로 검색. %이후의 모든 것(와일드카드 역할)
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like 'A%'


-- 'a'로 끝나는 사람
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like '%a'


-- 'a'가 포함된 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like '%a%'


-- 이름이 3글자인 직원. 언더바 1개가 1 글자를 의미
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like '___'


-- 두번째에 'a'가 오는 직원
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where first_name like '_a%'


select * from EMPLOYEES

-- commission_pct가 있는 직원만 검색
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where commission_pct != null

-- null 검색은 조건 연산자가 아닌 is null, is not null을 사용한다**
select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where commission_pct is null

select employee_id, first_name, salary, hire_date, commission_pct, department_id
from EMPLOYEES
where commission_pct is not null


