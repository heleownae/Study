-- 오프라인/온라인 판매 데이터 통합하기

WITH SALE AS (
    SELECT SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
    FROM ONLINE_SALE
    UNION ALL
    SELECT SALES_DATE, PRODUCT_ID, NULL USER_ID, SALES_AMOUNT
    FROM OFFLINE_SALE
)

SELECT DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID, 
    SALES_AMOUNT 
FROM SALE
WHERE SALES_DATE LIKE '2022-03%'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID