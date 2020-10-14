-- 변수 선언해서 select문 이중 사용
SET @h := -1; -- 변수 선언
SELECT(@h:=@h+1) AS HOUR, (SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME)=@h) as COUNT
FROM ANIMAL_OUTS
WHERE @h<23;
