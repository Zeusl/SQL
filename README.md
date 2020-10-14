# SQL
Solutions to SQL Problems

## 개념정리

DISTINCT 쿼리는 중복된 값을 제거한 결과를 반환한다.
SELECT DISTINCT 칼럼명 FROM 테이블명;

: 중복제거는 GROUP BY 와 DISTINCT가 있음
 
LIMIT 를 사용하여 결과에서 몇개의 행을 반환할지 제한 할 수가 있다.

SELECT 칼럼명 FROM 테이블명
LIMIT 제한할갯수;
>> 딱 제한할갯수 만큼의 행이 반환됨



LIMIT 를 써서 좋은점은
예를들어 노래 순위 중에서 100위 까지만 보고 싶다면 LIMIT 100;
라고 하면 되겠고,


또, 50위~ 100위 까지만 보고 싶다면 LIMIT 49, 50;
으로 하면 되겠다.
여기에서 49는 시작 인덱스 번호이고 뒤의 50은 표시할 행의 갯수이다
( 인덱스는 0부터 시작이므로 49번 인덱스가 50위의 노래 데이터 일 것이다 )


SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS COUNT
FROM ANIMAL_INS 
GROUP BY ANIMAL_TYPE;

group by 개와 고양이 몇 마리있을까

WHERE절 
GROUP BY
ORDER BY

GROUP BY를 사용할 때는 두가지를 기억해야 합니다.

특정 컬럼을 그룹화 하는 GROUP BY 

특정 컬럼을 그룹화한 결과에 조건을 거는 HAVING

* WHERE랑 HAVING을 헷깔리는 경우가 많은데 WHERE는 그룹화 하기 전이고, HAVING은 그룹화 후에 조건입니다.






## 함수와 프로시저 차이
- 함수: 클라이언트 단에서 실행, 느림, 리턴함(단일값 리턴), 특정한 결과 도출, 실행은 SELECT 함수명(인자,,);
- 프로시저: 서버 단에서 실행, 빠름, 리턴함(파라미터로 받음, 여러개가능), 절차(실행,수행), CALL 프로시저명(파라미터)



