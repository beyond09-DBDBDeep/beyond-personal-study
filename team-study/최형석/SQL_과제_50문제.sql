SELECT
		 * 
	FROM employee;
	
SELECT
		 * 
	FROM department;
	
SELECT
		 * 
	FROM job;
	
SELECT
		 * 
	FROM location;
	
SELECT
		 * 
	FROM national;
	
SELECT
		 * 
	FROM sal_grade;
	
	
	
-- <JOIN 미사용 연습문제>
-- 1. 모든 사원 모든 컬럼 조회
SELECT
		   *
  FROM employee;
  
  
-- 2. 사원들의 사번(사원번호), 이름 조회
SELECT
		   EMP_NO, EMP_NAME
  FROM employee;
  
-- 3. 201번 사번의 사번 및 이름 조회
SELECT
		   EMP_NO, EMP_NAME
  FROM employee
 WHERE EMP_ID = 201;
 
-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
SELECT
		   *
  FROM employee
 WHERE DEPT_CODE = 'D9';
 
-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
SELECT
		 *
  FROM employee
 WHERE JOB_CODE = 'J1';
 
-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.
SELECT
		 EMP_NO
	  , EMP_NAME
	  , DEPT_CODE
	  , SALARY
  FROM employee
 WHERE SALARY >= 3000000;

-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회
SELECT
		 EMP_NAME
	  , DEPT_CODE
	  , SALARY
  FROM employee
 WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;

-- 8. 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회
SELECT
		 EMP_NO
	  , EMP_NAME
	  , SALARY
	  , BONUS
  FROM employee
 WHERE BONUS IS NULL;
 
-- 9. 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회
SELECT
		 EMP_NO
	  , EMP_NAME
	  , DEPT_CODE
  FROM employee
 WHERE DEPT_CODE != 'D9';
 
-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)
SELECT
		 EMP_NO AS '사번'
	  , EMP_NAME AS '이름'
	  , HIRE_DATE AS '입사일'
  FROM employee
 WHERE ENT_YN = 'N';

-- 11. employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기
SELECT
		 EMP_NO AS '사번'
	  , EMP_NAME AS '이름'
	  , SALARY AS '급여'
	  , DEPT_CODE AS '부서코드'
	  , JOB_CODE AS '직급코드'
  FROM employee
 WHERE SALARY >= 3500000 AND SALARY <= 5500000;
 
-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
SELECT
		 EMP_NO AS '사번'
	  , EMP_NAME AS '이름'
	  , HIRE_DATE AS '입사일'
  FROM employee
 WHERE EMP_NAME LIKE '김%';
 
-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
SELECT
		 EMP_NO AS '사번'
	  , EMP_NAME AS '이름'
	  , HIRE_DATE AS '입사일'
  FROM employee
 WHERE EMP_NAME NOT LIKE '김%';

-- 14. EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회
SELECT
	    EMP_NAME AS '이름'
	  , EMP_NO
	  , DEPT_CODE
  FROM employee
 WHERE EMP_NAME LIKE '%하%';
 
-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회
SELECT
	    EMP_NAME AS '이름'
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE JOB_CODE = 'j2' AND SALARY >= 2000000 OR JOB_CODE = 'j7';
 
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회
SELECT
	    EMP_NAME AS '이름'
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE JOB_CODE = 'j2' AND SALARY >= 2000000 AND JOB_CODE = 'j7';

-- 17. IN 연산자로 업그레이드
SELECT
	    EMP_NAME AS '이름'
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE JOB_CODE IN ('j2', 'j7') AND SALARY >= 2000000;

-- ------------------------------------------
-- <JOIN 사용 연습문제>              

-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1명)
SELECT
		 a.EMP_ID
	  , a.EMP_NAME
	  , b.DEPT_TITLE
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
 WHERE a.EMP_NAME LIKE '%형%';

-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9명)
SELECT
	    a.EMP_NAME
	  , c.JOB_NAME
	  , a.DEPT_CODE
	  , b.DEPT_TITLE
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
 WHERE b.DEPT_TITLE LIKE '%해외영업%';

-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8명)(INNER JOIN 결과)
SELECT
	    a.EMP_NAME
	  , a.BONUS
	  , b.DEPT_TITLE
	  , c.LOCAL_NAME
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
  JOIN location c ON (b.LOCATION_ID = c.LOCAL_CODE)
 WHERE a.BONUS IS NOT NULL;

-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3명)
SELECT
	    a.EMP_NAME
	  , c.JOB_NAME
	  , b.DEPT_TITLE
	  , d.LOCAL_NAME
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
  JOIN location d ON (b.LOCATION_ID = d.LOCAL_CODE)
 WHERE a.DEPT_CODE = 'D2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20명)
SELECT
	    a.EMP_NAME
	  , c.JOB_NAME
	  , a.SALARY
	  , a.SALARY * 12 * (1 + a.BONUS) AS '연봉'
  FROM employee a
  JOIN sal_grade b ON (a.SAL_LEVEL = b.SAL_LEVEL AND a.BONUS IS NOT NULL)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
 WHERE a.SALARY > b.MIN_SAL
 UNION
SELECT
	    a.EMP_NAME
	  , c.JOB_NAME
	  , a.SALARY
	  , a.SALARY * 12 AS '연봉'
  FROM employee a
  JOIN sal_grade b ON (a.SAL_LEVEL = b.SAL_LEVEL AND a.BONUS IS NULL)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
 WHERE a.SALARY > b.MIN_SAL;
 
 
-- 연봉 ??


-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15명)

SELECT
	    a.EMP_NAME
	  , b.DEPT_TITLE
	  , d.LOCAL_NAME
	  , e.NATIONAL_NAME
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
  JOIN location d ON (b.LOCATION_ID = d.LOCAL_CODE)
  JOIN national e ON (d.NATIONAL_CODE = e.NATIONAL_CODE)
  WHERE d.NATIONAL_CODE = 'KO' OR d.NATIONAL_CODE = 'JP';


-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용(60명)

SELECT
		 b.EMP_NAME AS '사원명'
	  , a.DEPT_CODE
	  , a.EMP_NAME AS '동료이름'
  FROM employee a 
  CROSS JOIN employee b ON(a.DEPT_CODE = b.DEPT_CODE AND a.EMP_NAME != b.EMP_NAME);

-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8명)
SELECT
		 a.EMP_NAME
	  , b.JOB_NAME
	  , a.SALARY
  FROM employee a
  JOIN job b ON (a.BONUS IS NULL AND a.JOB_CODE = b.JOB_CODE)
 WHERE a.JOB_CODE IN ('j4', 'J7');
  

-- 9. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)
SELECT
		 a.EMP_ID
	  , a.EMP_NAME
	  , c.JOB_NAME
	  , b.DEPT_TITLE
	  , d.LOCAL_NAME
	  , a.SALARY
  FROM employee a
  JOIN department b ON (a.DEPT_CODE = b.DEPT_ID)
  JOIN job c ON (a.JOB_CODE = c.JOB_CODE)
  JOIN location d ON (b.LOCATION_ID = d.LOCAL_CODE)
 WHERE c.JOB_NAME = '대리' AND d.LOCAL_NAME IN ('ASIA1', 'ASIA2', 'ASIA3');

