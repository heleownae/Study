# 재귀 CTE
WITH RECURSIVE hh AS
(
# 0으로 시작하는 HOUR 칼럼 만들기
    SELECT 0 HOUR
    UNION ALL
    SELECT HOUR + 1
    FROM hh
    # HOUR 가 22인 경우까지 제한
    WHERE HOUR < 23
)
SELECT hh.HOUR,
       COUNT(a.ANIMAL_ID) COUNT
FROM hh 
LEFT JOIN ANIMAL_OUTS a ON hh.HOUR = HOUR(a.DATETIME)
GROUP BY hh.HOUR
ORDER BY hh.HOUR
