SELECT TOP (10)
    name
FROM VJSCL.sys.tables
WHERE name LIKE 'ord\_______' ESCAPE '\'
-- this is the order table
;

SELECT TOP (10)
    OH_HEADER_REF, *
FROM VJSCL.[dbo].[ORD_HEADER]
WHERE OH_ORDER_NUMBER = '767658'
-- '767658' is the order number
;

SELECT TOP (10)
    *
FROM VJSCL.[dbo].[ORD_DETAIL]
WHERE OD_ORDER_NUMBER = '767658'
-- '767658' is the order number
;

SELECT TOP (10)
    *
FROM VJSCL.dbo.SL_TRANSACTIONS -- invoice table
WHERE ST_HEADER_REF = '651978'
-- '651978' is the transaction header reference, the invoice number
;

SELECT TOP (10)
    DET_STOCK_CODE,
    *
FROM VJSCL.dbo.SL_PL_NL_DETAIL
WHERE DET_HEADER_REF = '651978'
-- '651978' is the transaction header reference, the invoice number
-- DET_PRIMARY is the audit No.
;

-- Querying STK_STOCK to retrieve the main stock record for the given product code.
-- This table may contain the primary stock information, whereas STK_STOCK_2 could store supplementary or historical data.
SELECT TOP (10)
    *
FROM VJSCL.dbo.STK_STOCK
WHERE STKCODE = '30TMP_836945'
;

SELECT TOP (10)
    *
FROM VJSCL.dbo.STK_STOCK_2
WHERE STKCODE2 = '30TMP_836945'
-- '30TMP_836945' is the stock code, the product code
;


SELECT TOP (10)
    stk_usrchar5, -- this is the barcode
    *
FROM VJSCL.dbo.STK_STOCK3
WHERE STKCODE3 = '30TMP_836945' -- '30TMP_836945' is the stock code, the product code
    ;