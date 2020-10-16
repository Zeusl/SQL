-- ANSWER CODE
SELECT A.NAME,A.DATETIME
FROM ANIMAL_INS A
LEFT OUTER JOIN ANIMAL_OUTS AS B ON B.ANIMAL_ID = A.ANIMAL_ID 
WHERE B.DATETIME IS NULL
ORDER BY A.DATETIME ASC
LIMIT 3;

-- 입양을 못 간 동물이다. 즉, LEFT OUTER JOIN의 결과에서 입양 간 시간이 NULL로 되어 있는 동물들이 대상이 된다.
-- 입양을 가지 못한 동물들은 NAME정보도 테이블 B에 존재하지 않기 때문에, 기준 테이블은 A가 된다.

-- 아직 입양을 못 간 동물 중  "WHERE B.DATETIME IS NULL"
-- 가장 오래 보호소에 있었던(결과는 보호 시작일 순으로 조회) "ORDER BY A.DATETIME ASC"
-- 동물 3마리의 이름과 보호 시작일을 조회   "LIMIT 3;"
