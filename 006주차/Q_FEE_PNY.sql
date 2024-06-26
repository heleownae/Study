SELECT c.CAR_ID, c.CAR_TYPE, ROUND(c.DAILY_FEE * 30 * ((100 - d.DISCOUNT_RATE)/100)) AS FEE
FROM CAR_RENTAL_COMPANY_CAR c JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h ON c.CAR_ID = h.CAR_ID
                              JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN d ON c.CAR_TYPE = d.CAR_TYPE
WHERE c.CAR_TYPE IN ('세단', 'SUV') AND h.START_DATE = '2022-11-01' AND h.END_DATE = '2022-11-30'
HAVING FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, c.CAR_TYPE ASC, c.CAR_ID DESC;
