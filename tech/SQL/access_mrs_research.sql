SELECT TOP (10)
    OH_HEADER_REF, *
FROM [VJSCL].[dbo].[ORD_HEADER]
where OH_ORDER_NUMBER = '767658'
-- '767658' is the order number
;

SELECT TOP (10)
    *
FROM VJSCL.dbo.SL_TRANSACTIONS
where ST_HEADER_REF = '651978'
-- '651978' is the transaction header reference, the invoice number
;

SELECT TOP (10)
    DET_stock_CODE,
    *
from VJSCL.dbo.SL_PL_NL_DETAIL
where DET_HEADER_REF = '651978'
;

SELECT TOP (10)
    *
from VJSCL.dbo.STK_STOCK_2
where STKCODE2 = '30TMP_836945'
;


SELECT TOP (10)
    stk_usrchar5,
    *
from VJSCL.dbo.STK_STOCK3
where STKCODE3 = '30TMP_836945'
    ;