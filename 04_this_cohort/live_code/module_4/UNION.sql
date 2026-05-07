/* MODULE 4 */
/* UNION */

/* 1. Find the most and least expensive product by vendor with UNION (and row_number!) */

SELECT
vendor_id
,original_price
--,'Max' as Max_or_Min
,rn_max as [row_number]

FROM (
	SELECT 
	vendor_id
	,product_id
	,original_price
	,ROW_NUMBER() OVER(PARTITION BY vendor_id ORDER BY original_price DESC) as rn_max

	FROM vendor_inventory
)
WHERE rn_max = 1

UNION  --union returned 5 rows, UNION ALL return 6 rows because vendor #4 was duplicated

SELECT
vendor_id
,original_price
--,'Min'
,rn_min

FROM (
	SELECT 
	vendor_id
	,product_id
	,original_price
	,ROW_NUMBER() OVER(PARTITION BY vendor_id ORDER BY original_price ASC) as rn_min -- switching this to ASC from DESC

	FROM vendor_inventory
)
WHERE rn_min = 1

--------------------------------------------------------------------------------------------------------------------------------------------
