select B.ANIMAL_ID,B.NAME
from ANIMAL_OUTS as B -- 기준이 되는 테이블
left outer join ANIMAL_INS as A on A.ANIMAL_ID=B.ANIMAL_ID
where A.ANIMAL_ID is null; -- A에는 존재하지 않는 것 보여줌 

-- left outer join은 null인 부분까지도 다 포함해서 결과값을 보여준다.
-- 따라서 A 테이블에 존재하지 않을지라도 null 값을 넣어서 컬럼값을 보여줄 것이다.
-- 그러므로 where A.ANIMAL_ID is null; 를 통해서 null인 부분만 보여주는 알고리즘이다.

-- 또 다른 방법으론, MINUS 연산자를 사용하는 것이지만, 이는 MySQL에선 제공되지 않고 Oracle에서만 제공되고 있으니 유의해서 사용하면 좋겠다
-- select ANIMAL_ID, NAME
-- from ANIMAL_OUTS
-- MINUS
-- select ANIMAL_ID, NAME
-- from ANIMAL_INS;
