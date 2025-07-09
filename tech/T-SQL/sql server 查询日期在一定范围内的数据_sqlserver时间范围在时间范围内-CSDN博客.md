# sql server 查询日期在一定范围内的数据_sqlserver时间范围在时间范围内-CSDN博客
`sql语句`

```
`select * from 表 
where 日期字段>='开始日期' and 日期字段<='截止日期'  
and convert(char(8),日期字段,108)>='开始时间' and convert(char(8),日期字段,108)<='截止时间'` 

*   1
*   2
*   3


```

说明：以上模板精确到秒

`实用例子`

```
`select * from EV_InStock_h 
where dModifyDate >= '2020-01-01' and dModifyDate <= '2021-01-01' ORDER BY dModifyDate DESC` 

*   1
*   2


```

说明：以上例子精确到日，其中ORDER BY dModifyDate DESC为时间倒序显示

`时间知识延伸`

convert(varchar(10),字段名,转换格式)

CONVERT(nvarchar(10),count\_time,121)  
CONVERT为日期转换函数，一般就是在时间类型(datetime,smalldatetime)与字符串类型(nchar,nvarchar,char,varchar)  
相互转换的时候才用到的函数的3个参数，第1个参数为，转换后的大小，第2个为转换日期的字段或函数，第3个为转换的格式.

具体如下：  
0 | 0 or 100 | mon dd yyyy hh:miAM(或PM)  
1 | 101 | mm/dd/yy  
2 | 102 | yy-mm-dd  
3 | 103 | dd/mm/yy  
4 | 104 | dd-mm-yy  
5 | 105 | dd-mm-yy  
6 | 106 | dd mon yy  
7 | 107 | mon dd,yy  
8 | 108 | hh:mm:ss  
9 | 9 or 109 | mon dd yyyy hh:mi:ss:mmmmAM(或PM)  
10 | 110 | mm-dd-yy  
11 | 111 | yy/mm/dd  
12 | 112 | yymmdd  
11| 13 or 113 | dd mon yyyy hh:mi:ss:mmm(24小时制)  
14 | 114 | hh:mi:ss:mmm(24小时制)  
15 | 20 or 120 | yyyy-mm-dd hh:mi:ss(24小时制)  
16 | 21 or 121 | yyyy-mm-dd hh:mi:ss:mmm(24小时制)  
具体例子：  
SELECT CONVERT(varchar(100), GETDATE(), 0): 05 16 2011 10:57AM  
SELECT CONVERT(varchar(100), GETDATE(), 1): 05/16/11

SELECT CONVERT(varchar(100), GETDATE(), 2): 11.05.16  
SELECT CONVERT(varchar(100), GETDATE(), 3): 16/05/11

SELECT CONVERT(varchar(100), GETDATE(), 4): 16.05.11  
SELECT CONVERT(varchar(100), GETDATE(), 5): 16-05-11  
SELECT CONVERT(varchar(100), GETDATE(), 6): 16 05 11  
SELECT CONVERT(varchar(100), GETDATE(), 7): 05 16, 11  
SELECT CONVERT(varchar(100), GETDATE(), 8): 10:57:46  
SELECT CONVERT(varchar(100), GETDATE(), 9): 05 16 2011 10:57:46:827AM  
SELECT CONVERT(varchar(100), GETDATE(), 10): 05-16-11  
SELECT CONVERT(varchar(100), GETDATE(), 11): 11/05/16  
SELECT CONVERT(varchar(100), GETDATE(), 12): 110516  
SELECT CONVERT(varchar(100), GETDATE(), 13): 16 05 2011 10:57:46:937  
SELECT CONVERT(varchar(100), GETDATE(), 14): 10:57:46:967  
SELECT CONVERT(varchar(100), GETDATE(), 20): 2011-05-16 10:57:47  
SELECT CONVERT(varchar(100), GETDATE(), 21): 2011-05-16 10:57:47.157  
SELECT CONVERT(varchar(100), GETDATE(), 22): 05/16/11 10:57:47 AM  
SELECT CONVERT(varchar(100), GETDATE(), 23): 2011-05-16  
SELECT CONVERT(varchar(100), GETDATE(), 24): 10:57:47  
SELECT CONVERT(varchar(100), GETDATE(), 25): 2011-05-16 10:57:47.250  
SELECT CONVERT(varchar(100), GETDATE(), 100): 05 16 2011 10:57AM  
SELECT CONVERT(varchar(100), GETDATE(), 101): 05/16/2011

SELECT CONVERT(varchar(100), GETDATE(), 102): 2011.05.16  
SELECT CONVERT(varchar(100), GETDATE(), 103): 16/05/2011

SELECT CONVERT(varchar(100), GETDATE(), 104): 16.05.2011  
SELECT CONVERT(varchar(100), GETDATE(), 105): 16-05-2011  
SELECT CONVERT(varchar(100), GETDATE(), 106): 16 05 2011  
SELECT CONVERT(varchar(100), GETDATE(), 107): 05 16, 2011  
SELECT CONVERT(varchar(100), GETDATE(), 108): 10:57:49  
SELECT CONVERT(varchar(100), GETDATE(), 109): 05 16 2011 10:57:49:437AM  
SELECT CONVERT(varchar(100), GETDATE(), 110): 05-16-2011

SELECT CONVERT(varchar(100), GETDATE(), 111): 2011/05/16  
SELECT CONVERT(varchar(100), GETDATE(), 112): 20110516  
SELECT CONVERT(varchar(100), GETDATE(), 113): 16 05 2011 10:57:49:513  
SELECT CONVERT(varchar(100), GETDATE(), 114): 10:57:49:547  
SELECT CONVERT(varchar(100), GETDATE(), 120): 2011-05-16 10:57:49  
SELECT CONVERT(varchar(100), GETDATE(), 121): 2011-05-16 10:57:49.700  
SELECT CONVERT(varchar(100), GETDATE(), 126): 2011-05-16T10:57:49.827  
SELECT CONVERT(varchar(100), GETDATE(), 130): 18 ??? ??? 1427 10:57:49:907AM  
SELECT CONVERT(varchar(100), GETDATE(), 131): 18/04/1427 10:57:49:920AM

常用：  
Select CONVERT(varchar(100), GETDATE(), 8): 10:57:46  
Select CONVERT(varchar(100), GETDATE(), 24): 10:57:47  
Select CONVERT(varchar(100), GETDATE(), 108): 10:57:49  
Select CONVERT(varchar(100), GETDATE(), 12): 110516  
Select CONVERT(varchar(100), GETDATE(), 23): 2011-05-16

—常用实例操作：

一、sql server日期时间函数  
Sql Server中的日期与时间函数

1.  当前系统日期、时间  
    select getdate()
    
2.  dateadd 在向指定日期加上一段时间的基础上，返回新的 datetime 值  
    例如：向日期加上2天  
    select dateadd(day,2,‘2010-10-15’) --返回：2010-10-17 00:00:00.000
    

以此类推：向日期倒推几天或几个月也是可以的。

select dateadd(day,-2,‘2010-10-15’) --返回：2010-10-13 00:00:00.000

select dateadd(month,-2,‘2010-10-15’) --返回：2010-08-1 00:00:00.000

3.  datediff 返回跨两个指定日期的日期和时间边界数。  
    select datediff(day,‘2004-09-01’,‘2004-09-18’) --返回：17
    
4.  datepart 返回代表指定日期的指定日期部分的整数。  
    select DATEPART(month, ‘2004-10-15’) --返回 10
    
5.  datename 返回代表指定日期的指定日期部分的字符串  
    select datename(weekday, ‘2004-10-15’) --返回：星期五
    
6.  day(), month(),year() --可以与datepart对照一下
    

select 当前日期=convert(varchar(10),getdate(),120)  
,当前时间=convert(varchar(8),getdate(),114)

select datename(dw,‘2004-10-15’)

select 本年第多少周=datename(week,‘2004-10-15’)  
,今天是周几=datename(weekday,‘2004-10-15’)

二、日期格式转换  
select CONVERT(varchar, getdate(), 120 ) --2004-09-12 11:06:08  
select replace(replace(replace(CONVERT(varchar, getdate(), 120 ),’-’,’’),’ ‘,’’),’:’,’’) --20040912110608

select CONVERT(varchar(12) , getdate(), 111 )  
2004/09/12

select CONVERT(varchar(12) , getdate(), 112 )  
20040912

select CONVERT(varchar(12) , getdate(), 102 )  
2004.09.12

其它不常用的日期格式转换方法:

select CONVERT(varchar(12) , getdate(), 101 )  
09/12/2004

select CONVERT(varchar(12) , getdate(), 103 )  
12/09/2004

select CONVERT(varchar(12) , getdate(), 104 )  
12.09.2004

select CONVERT(varchar(12) , getdate(), 105 )  
12-09-2004

select CONVERT(varchar(12) , getdate(), 106 )  
12 09 2004

select CONVERT(varchar(12) , getdate(), 107 )  
09 12, 2004

select CONVERT(varchar(12) , getdate(), 108 )  
11:06:08

select CONVERT(varchar(12) , getdate(), 109 )  
09 12 2004 1

select CONVERT(varchar(12) , getdate(), 110 )  
09-12-2004

select CONVERT(varchar(12) , getdate(), 113 )  
12 09 2004 1

select CONVERT(varchar(12) , getdate(), 114 )  
11:06:08.177  
举例：  
1.GetDate() 用于sql server :select GetDate()

2.DateDiff(‘s’,‘2005-07-20’,‘2005-7-25 22:56:32’)返回值为 514592 秒  
DateDiff(‘d’,‘2005-07-20’,‘2005-7-25 22:56:32’)返回值为 5 天

3.DatePart(‘w’,‘2005-7-25 22:56:32’)返回值为 2 即星期一(周日为1，周六为7)  
DatePart(‘d’,‘2005-7-25 22:56:32’)返回值为 25即25号  
DatePart(‘y’,‘2005-7-25 22:56:32’)返回值为 206即这一年中第206天  
DatePart(‘yyyy’,‘2005-7-25 22:56:32’)返回值为 2005即2005年  
附图  
函数 参数/功能  
GetDate( ) 返回系统目前的日期与时间  
DateDiff (interval,date1,date2) 以interval 指定的方式，返回date2 与date1两个日期之间的差值 date2-date1  
DateAdd (interval,number,date) 以interval指定的方式，加上number之后的日期  
DatePart (interval,date) 返回日期date中，interval指定部分所对应的整数值  
DateName (interval,date) 返回日期date中，interval指定部分所对应的字符串名称

参数 interval的设定值如下：

值 缩 写（Sql Server） Access 和 ASP 说明  
Year Yy yyyy 年 1753 ~ 9999  
Quarter Qq q 季 1 ~ 4  
Month Mm m 月1 ~ 12  
Day of year Dy y 一年的日数,一年中的第几日 1-366  
Day Dd d 日，1-31  
Weekday Dw w 一周的日数，一周中的第几日 1-7  
Week Wk ww 周，一年中的第几周 0 ~ 51  
Hour Hh h 时0 ~ 23  
Minute Mi n 分钟0 ~ 59  
Second Ss s 秒 0 ~ 59  
Millisecond Ms - 毫秒 0 ~ 999

[时间知识延伸摘自](https://blog.csdn.net/jimlong/article/details/7346970?biz_id=102&utm_term=CONVERTchar8,dModifyDate,108&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-8-7346970&spm=1018.2118.3001.4187)