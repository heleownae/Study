SELECT DISTINCT
    CASE
        WHEN (GROUP_CONCAT(NAME) LIKE '%Python%') AND (MAX(CATEGORY) = 'Front End') THEN 'A'
        WHEN (GROUP_CONCAT(NAME) LIKE '%C#%') THEN 'B'
        WHEN (MAX(CATEGORY) = 'Front End') AND NOT (GROUP_CONCAT(NAME) LIKE '%Python%') THEN 'C'
    ELSE NULL
    END "GRADE", ID, EMAIL
FROM SKILLCODES AS SK, DEVELOPERS AS DE
WHERE SK.CODE & DE.SKILL_CODE
GROUP BY ID, EMAIL
HAVING GRADE IS NOT NULL
ORDER BY GRADE, ID
