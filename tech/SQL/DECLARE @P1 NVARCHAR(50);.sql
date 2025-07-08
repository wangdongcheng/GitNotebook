DECLARE @P1 NVARCHAR(50);
set @P1 = '30ACE001';

SELECT CU_ON_STOP,
cuused,
*
FROM [VJSCL].[dbo].[SL_ACCOUNTS] 
where  CU_ON_STOP = 1
and CUUSED = 0
;

select 
acc.CUCODE,
acc.CU_CUSTOM_TERMS_TEMPLATE,
acc.CU_TERMS_LINK,
trm.*
from
vjscl.dbo.SL_ACCOUNTS as acc
inner JOIN
vjscl.dbo.SL_TERMS as trm ON acc.CU_TERMS_LINK = trm.SLT_PRIMARY
where
acc.CUCODE = @P1
;


select *
from vjscl.dbo.SL_ACC_TEMP
where 
SL_ACC_USER_ID = @P1
;


SELECT *
from vjscl.dbo.SL_ACCOUNTS2 where cucode2 = @P1;

SELECT *
from vjscl.dbo.SL_ADDRESSES
where 
AD_ACC_CODE = @P1
;

SELECT
acc.cucode,
acc.CU_ACC_CODE,
acc
acc.CU_BUYING_GROUP_FLAG,
acc2.CU_HEAD_OFFICE,                
acc2.CU_HEAD_OFFICE_CODE,
acc2.CU_HEAD_OFFICE_DEFDELADDR,
acc2.CU_HEAD_OFFICE_DEFINVADDR,
acc.CU_BUYING_GROUP_FLAG,
acc2.CU_USRFLAG1,
acc2.CU_USRFLAG2,
acc2.CU_EDI_FLAG,
acc2.CU_USRFLAG3,
acc2.CU_USRFLAG4,
acc2.CU_USRFLAG5,
acc2.CU_USRFLAG6,
acc2.CU_USRFLAG7,
acc2.CU_USRFLAG8,
acc2.CU_USRFLAG9,
acc2.CU_USRFLAG10
FROM
vjscl.dbo.SL_ACCOUNTS as acc
INNER JOIN vjscltest.dbo.SL_ACCOUNTS2 AS acc2 ON acc.CUCODE = acc2.CUCODE2
WHERE
acc.cucode = '30AAB001'
-- acc.CU_BUYING_GROUP_FLAG = 1
;

SELECT
count(*) as cnt
FROM
vjscl.dbo.SL_ACCOUNTS as acc
INNER JOIN vjscl.dbo.SL_ACCOUNTS2 AS acc2 ON acc.CUCODE = acc2.CUCODE2
WHERE
-- acc.cucode = @P1
acc2.cu_usrflag1 = 1
;