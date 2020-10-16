-- ANSWER CODE
SELECT 
	ANIMAL_ID,NAME,
	CASE
        WHEN (SEX_UPON_INTAKE LIKE '%Intact%')THEN 'X'
        ELSE 'O'
	END AS 중성화
FROM ANIMAL_INS;

-- select 문 내에 case 문을 사용하여 SEX_UPON_INTAKE 컬럼에 대해 중성화를 했는지 여부를 파악하였음
