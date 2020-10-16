# GROUP BY와 DISTINCT 
###  GROUP BY
- 동일한 값을 가진 데이터의 수치를 하나 이상의 열을 기준으로 <b>그룹으로 묶어서 결과를 가져오기 위한 집계함수</b>
- 즉, 그룹단위로 묶어서 결과를 도출한다라고 생각하면 쉬움!
- 이는 보통 그룹 단위로 묶어서 무언가를 계산할 때, 사용하지만 이를 통해서 중복제거도 구현할 수 있음

###  DISTINCT 
- 중복된 값을 제거한 결과를 반환<br>

### 중복 제거 구현 예시 
- DISTINCT는 단순 그룹핑 작업한 수행하지만, 
- GROUP BY 는 그룹핑 작업 + 정렬 작업을 동반해서 수행한다.
- 그러므로 별도의 정렬 작업이 요구되지 않는 경우 DISTINCT 를 사용하는 것이 성능상 BETTER!
```
-- 중복 제거 구현 2 (DISTINCT 사용)
SELECT DISTINCT 칼럼명 FROM 테이블명;
```

```
-- 중복 제거 구현 1 (GROUP BY 사용)
SELECT 컬럼명 FROM 테이블명 GROUP BY 컬럼명;
```

# LIMIT
- 이를 사용하여 결과에서 몇개의 행을 반환할지 제한 할 수 있음
- 딱 제한할 갯수 만큼의 행이 반환됨 

```
SELECT 칼럼명 FROM 테이블명
LIMIT 제한할 갯수;
```
###  LIMIT 구현 방식
- 노래 순위 중에서 100위 까지만 보고 싶다면 ```LIMIT 100; ``` 으로 식을 세우고
- 50위~ 100위 까지만 보고 싶다면 ```LIMIT 인덱스 시작번호, 보여줄 행의 갯수; ``` <br>
```LIMIT 49, 50; ``` ( 인덱스는 0부터 시작이므로 49번 인덱스가 50위의 노래 데이터 일 것이다 ) <br>


# 함수와 프로시저 차이
- 함수: 클라이언트 단에서 실행, 느림, 리턴함(단일값 리턴), 특정한 결과 도출, 실행은 SELECT 함수명(인자,,);
- 프로시저: 서버 단에서 실행, 빠름, 리턴함(파라미터로 받음, 여러개가능), 절차(실행,수행), CALL 프로시저명(파라미터)


# JOIN 
<b> 1. INNER JOIN<br>2. LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN<br>3. CROSS JOIN<br>4. SELF JOIN </b>

### INNER JOIN
- 기존 테이블과 JOIN한 테이블의 중복된 값을 보여줌. (교집합 영역)
- 결과값은 A의 테이블과 B테이블이 모두 가지고있는 데이터만 검색됨 <br>
<img src="https://user-images.githubusercontent.com/30151642/96210087-27b69200-0fac-11eb-9824-4fc52d2449dd.JPG" width="30%"></img>

```
SELECT
      A.NAME, --A테이블의 NAME조회
      B.AGE --B테이블의 AGE조회
FROM EX_TABLE A
INNER JOIN JOIN_TABLE B ON A.NO_EMP = B.NO_EMP AND A.DEPT = B.DEPT;
```

###  LEFT OUTER JOIN
- 왼쪽 테이블을 기준으로 JOIN을 하겠다는 의미 
- 왼쪽 테이블(기준 테이블)의 모든 데이터와 왼쪽과 오른쪽 테이블의 교집합 영역이 검색됨 <br>
<img src="https://user-images.githubusercontent.com/30151642/96210818-b677de80-0fad-11eb-8eec-e5b86c8545f4.png" width="30%"></img>

```
SELECT
      A.NAME, --A테이블의 NAME조회
      B.AGE --B테이블의 AGE조회
FROM EX_TABLE A --기준 테이블 별칭
LEFT OUTER JOIN JOIN_TABLE B ON A.NO_EMP = B.NO_EMP AND A.DEPT = B.DEPT;  --LEFT OUTER JOIN 조인테이블 별칭 ON 기준테이블별칭.기준키 = 조인테이블별칭.기준키 ...

```

###  RIGHT OUTER JOIN
- 오른쪽 테이블을 기준으로 JOIN을 하겠다는 의미
- 오른쪽 테이블의 모든 데이터와 오른쪽과 왼쪽 테이블의 교집합 영역이 검색됨 <br>
<img src="https://user-images.githubusercontent.com/30151642/96210966-0c4c8680-0fae-11eb-86a3-cd6446bd352e.png" width="30%"></img>
```
SELECT
      A.NAME, --A테이블의 NAME조회
      B.AGE --B테이블의 AGE조회
FROM EX_TABLE A
RIGHT OUTER JOIN JOIN_TABLE B ON A.NO_EMP = B.NO_EMP AND A.DEPT = B.DEPT; 
```

###  FULL OUTER JOIN
- 두 테이블의 합집합 영역 (왼쪽 테이블이 가진 모든 데이터와 오른쪽 테이블이 가진 모든 데이터를 보여줌)
- 사실상 기준 테이블이 누구인지는 의미가 없음 <br>
<img src="https://user-images.githubusercontent.com/30151642/96211107-677e7900-0fae-11eb-8c71-89a0d3252f7d.png" width="30%"></img>
```
SELECT
      A.NAME, --A테이블의 NAME조회
      B.AGE --B테이블의 AGE조회
FROM EX_TABLE A --기준테이블 별칭
FULL OUTER JOIN JOIN_TABLE B ON A.NO_EMP = B.NO_EMP AND A.DEPT = B.DEPT; --FULL OUTER JOIN 조인테이블 별칭 ON 기준테이블별칭.기준키 = 조인테이블별칭.기준키 .....
```
###  CROSS JOIN
- 모든 경우의 수를 표현해주는 방식
- 기준 테이블이 A일 경우, A의 데이터 하나 하나를 B테이블 전체와 JOIN 하는 방식
- 아래 사진에서는 A테이블에 데이터가 3개, B테이블에는 데이터가 4개가 있으므로 총 12개가 검색됨 (총 결괏값: N * M) <br>
<img src="https://user-images.githubusercontent.com/30151642/96211350-1327c900-0faf-11eb-9ace-f5966b44216b.png" width="30%"></img>
#### CROSS JOIN 구현 방식 1
```
SELECT
      테이블별칭.조회할칼럼,
      테이블별칭.조회할칼럼
FROM 기준테이블 별칭
CROSS JOIN 조인테이블 별칭; 
```
#### CROSS JOIN 구현 방식 2
```
SELECT
      테이블별칭.조회할칼럼,
      테이블별칭.조회할칼럼
FROM 기준테이블 별칭,조인테이블 별칭; 
```
###  SELF JOIN
- 자기 자신 테이블과 자기 자신 테이블을 JOIN한다는 의미
- 동일 테이블 간의 JOIN을 의미 <b>(따라서 FROM 절에 동일한 테이블이 2번 이상 나타남)</b>
- 이는 자신이 가지고 있는 칼럼을 다양하게 변형시켜 활용할 경우에 자주 사용 <br>
- <b> 동일 테이블 사이의 조인을 수행하기 위해선, 테이블의 칼럼과 이름이 모두 동일하기 때문에!!!! 식별을 위해 반드시 테이블 별칭을 사용해야 함!! </b><br>
<img src="https://user-images.githubusercontent.com/30151642/96212172-1623b900-0fb1-11eb-8118-3f6fc7a591de.png" width="30%"></img>
```
SELECT ALIAS명1.컬럼명,
       ALIAS명2.컬럼명
FROM 테이블1 ALIAS명1, 테이블1 ALIAS명2
WEHRE ALIAS명1.컬럼명2 = ALIAS명2.컬럼명1;    
```
#### SELF JOIN 예시
- <b>SELF JOIN을 할 땐, OUTER JOIN을 사용하여 조인할 대상이 존재하지 않아 데이터가 결과에서 누락되는 것을 방지하기 위해 JOIN을 잘 해야함</b>
- 내부 조인(Inner Join)을 사용할 경우 자신의 관리자가 존재하지 않는 경우에는 관리자(E2) 테이블에서 조인할 대상이 존재하지 않기 때문에 해당 데이터는 결과에서 누락됨
- 이를 방지하기 위해서는 아우터 조인(Outer Join)을 사용해서 구현하고 있음.
```
SELECT E1.EMPNO AS 사원
     , E1.MGR AS 관리자
     , E2.MGR AS 차상위_관리자
  FROM EMP E1 LEFT OUTER JOIN EMP E2
    ON E1.MGR = E2.EMPNO
 ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;   
```

# 기타 함수
### TIMEDIFF(날짜1, 날짜2); 
```
SELECT DATEDIFF('2018-03-28 23:59:59', '2017-03-01 00:00:00');
```
[TIMEDIFF 사용 코드](https://github.com/Zeusl/SQL/blob/main/%EC%98%A4%EB%9E%9C%20%EA%B8%B0%EA%B0%84%20%EB%B3%B4%ED%98%B8%ED%95%9C%20%EB%8F%99%EB%AC%BC(2).sql)

### TIMESTAMPDIFF(단위, 날짜1, 날짜2);
- 단위( SECOND : 초, MINUTE : 분, HOUR : 시, DAY : 일, WEEK : 주, MONTH : 월, QUARTER : 분기, YEAR : 년)
```
SELECT TIMESTAMPDIFF(SECOND, '2017-03-01 00:00:00', '2018-03-28 00:00:00');
```
