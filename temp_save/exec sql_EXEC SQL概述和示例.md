# exec sql_EXEC SQL概述和示例
https://blog.csdn.net/culuo4781/article/details/107617482

exec sql

In this article, we will review on EXEC SQL statement in SQL Server and explore a few examples.

在本文中，我们将回顾SQL Server中的EXEC SQL语句并探索一些示例。

The EXEC command is used to execute a stored procedure, or a SQL string passed to it. You can also use full command EXECUTE which is the same as EXEC.

EXEC命令用于执行存储过程或传递给它SQL字符串。 您也可以使用与EXEC相同的完整命令EXECUTE。

### SQL Server中EXEC命令的语法 (Syntax of EXEC command in SQL Server)

Following is the basic syntax of EXEC command in SQL Server.

以下是SQL Server中EXEC命令的基本语法。

```null
--Executing stored procedureEXECUTE | EXEC <stored  procedure name>EXECUTE | EXEC ('sql string')
```

To illustrate the examples, I will create a sample stored procedure and table.

为了说明示例，我将创建一个示例存储过程和表。

```null
IF EXISTS (SELECT 1 FROM SYS.TABLES where name ='Locations')CREATE TABLE [dbo].[Locations](  [LocationName] [varchar](100) NULLINSERT INTO Locations values (1,'Richmond Road'),(2,'Brigade Road') ,(3,'Houston Street')IF EXISTS (SELECT 1 FROM SYS.procedures where name ='GetLocations')DROP PROCEDURE GetLocationsCREATE PROCEDURE [GetLocations]select LocationID,LocationName from Locations where LocationID =@LocID
```

### 执行存储过程 (Executing a stored procedure)

To execute a stored procedure using EXEC pass the procedure name and parameters if any. Please refer to the below T-SQL script to execute a stored procedure.

要使用EXEC执行存储过程，请传递过程名称和参数（如果有）。 请参考下面的T-SQL脚本执行存储过程。

```null
EXEC GetLocations @LocID = 1

```

![](https://www.sqlshack.com/wp-content/uploads/2019/06/exec-sql-example-of-stored-procedure.png)

We can also assign the value returned by a stored procedure to a variable. Please refer to the following example T-SQL script.

我们还可以将存储过程返回的值分配给变量。 请参考以下示例T-SQL脚本。

```null
IF EXISTS (SELECT 1 FROM SYS.procedures where name ='GetLocations')DROP PROCEDURE GetLocationsCREATE PROCEDURE [GetLocations]select LocationID,LocationName from Locations where LocationID =@LocIDDECLARE @retunr_status intEXEC @retunr_status = GetLocations @LocID = 1SELECT @retunr_status AS ReturnStatus
```

![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2Fzc2lnbmluZy12YWx1ZS1yZXR1cm5lZC1mcm9tLXByb2NlZHVyZS10by1hLXZhcmlhLnBuZw?x-oss-process=image/format,png)

### 执行字符串 (Executing string)

To execute a string, construct the string and pass it to the EXEC SQL command. Please refer to the below example which executes a string.

要执行字符串，请构造字符串并将其传递给EXEC SQL命令。 请参考以下示例，该示例执行一个字符串。

```null
EXEC ('select LocationID,LocationName from locations')

```

![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWN1dGUtc3RhdGVtZW50LXdpdGgtc3RyaW5nLWV4YW1wbGUucG5n?x-oss-process=image/format,png)

Following is the example of using EXEC with string constructed from a variable. You always need to enclose the string in the brackets else execute statement consider it as a stored procedure and throws an error as shown in the below image.

以下是将EXEC与从变量构造的字符串一起使用的示例。 您始终需要将字符串括在方括号中，否则execute语句会将其视为存储过程并引发错误，如下图所示。

[![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWMtc3FsLXdpdGgtdmFyaWFibGUtZXhhbXBsZS5wbmc?x-oss-process=image/format,png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/exec-sql-with-variable-example.png)

Constructing a string from the variable and executing it using EXEC SQL command may inject unwanted code. There are some techniques to avoid SQL injection. We will review those techniques in another article.

从变量构造字符串并使用EXEC SQL命令执行它可能会注入不需要的代码。 有一些技术可以避免SQL注入。 我们将在另一篇文章中回顾这些技术。

```null
declare @sql varchar(max),@i intSET @sql ='select LocationID,LocationName from locations where LocationID = ' + cast(@i as varchar(10))
```

[![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWN1dGUtc3RyaW5nLXVzaW5nLXZhcmlhYmxlLWV4YW1wbGUucG5n?x-oss-process=image/format,png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/execute-string-using-variable-example.png)

### 在远程服务器上执行查询 (Executing queries on a remote server)

AT linked\_server\_name clause along with EXEC command is used to execute queries on a remote server. A linked server must be configured and **RPC Out** option must be enabled on the linked server to execute queries on a remote server.

ATlinked\_server\_name子句与EXEC命令一起用于在远程服务器上执行查询。 必须配置链接服务器，并且必须在链接服务器上启用**RPC Out**选项，才能在远程服务器上执行查询。

Please refer to the following example of executing a query on a remote server. Replace the linked server name with your linked server name.

请参考以下在远程服务器上执行查询的示例。 用链接服务器名称替换链接服务器名称。

```null
EXEC ('select name,database_id,db_name() as CurrentDB from sys.databases where database_id <=4') at [TEST01V]

```

[![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWMtc3FsLXF1ZXJ5LW9uLWxpbmtlZC1zZXJ2ZXIucG5n?x-oss-process=image/format,png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/exec-sql-query-on-linked-server.png)

If we do not specify the database name, EXEC SQL statement will execute the query on the default database of the login used in the linked server.

如果未指定数据库名称，则EXEC SQL语句将在链接服务器中使用的登录名的默认数据库上执行查询。

If you want to execute query in a specific database use “USE databasename” in the query. Please refer to the below example.

如果要在特定数据库中执行查询，请在查询中使用“ USE databasename”。 请参考以下示例。

```null
 EXEC ('use msdb; select name,database_id,db_name() as CurrentDB from sys.databases where database_id <=4') at [TEST01V]
```

[![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWMtcXVlcnktb24tbGlua2VkLXNlcnZlci5wbmc?x-oss-process=image/format,png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/exec-query-on-linked-server.png)

We can also issue a select query against the remote server using four-part notation. We must enable the **Data Access** option on the linked server. Please refer to the below example.

我们还可以使用四部分符号对远程服务器发出选择查询。 我们必须在链接服务器上启用“ **数据访问”**选项。 请参考以下示例。

```null
select name,database_id from [TEST01V].master.sys.databases where database_id <=4
```

To execute a stored procedure on a remote server, use below T-SQL script by replacing the linked server name, database name, and the stored procedure name.

要在远程服务器上执行存储过程，请使用以下T-SQL脚本替换链接的服务器名称，数据库名称和存储过程名称。

```null
EXEC ('use testdb; EXEC TestProcedure') at [TEST01V]

```

Following is the example of executing a stored procedure on the linked server using four-part notation. Here “**TEST01V”** is the server name, “**test**” is the database name, and “**dbo**” is the schema name.

以下是使用四部分符号在链接服务器上执行存储过程的示例。 这里“ **TEST01V”**是服务器名称，“ **test** ”是数据库名称，“ **dbo** ”是架构名称。

```null
EXEC [TEST01V].test.dbo.testProc

```

### 执行与建议 (EXEC WITH RECOMPILE)

This execution option in EXEC SQL statement creates a new plan and discards it after using it. If there is an existing plan for the procedure it remains the same in the cache. If there is no existing plan for the procedure and using with recompile option will not store the plan in cache.

EXEC SQL语句中的此执行选项将创建一个新计划，并在使用后将其丢弃。 如果该过程已有计划，则它在高速缓存中保持不变。 如果该过程没有现有计划，并且与recompile选项一起使用，则不会将该计划存储在缓存中。

Please refer to the below example for executing the procedure with recompile option. Before executing this I have cleared the plan cache using DBCC FREEPROCCACHE().

请参考以下示例，执行带有recompile选项的过程。 在执行此操作之前，我已经使用DBCC FREEPROCCACHE（）清除了计划缓存。

```null
exec GetLocations 1 with recompile

```

After executing the above T-SQL script, I executed the below script to check for the cached plan.

执行完上面的T-SQL脚本后，我执行了下面的脚本来检查缓存的计划。

```null
SELECT plan_handle,usecounts, cacheobjtype, objtype, size_in_bytes, text, query_planFROM sys.dm_exec_cached_plans CROSS APPLY sys.dm_exec_sql_text(plan_handle) CROSS APPLY sys.dm_exec_query_plan(plan_handle)WHERE text LIKE '%GetLocations%'
```

Please refer to the below image. Executing procedure with recompile option did not store the plan in the cache.

请参考下图。 使用recompile选项执行的过程未将计划存储在缓存中。

[![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWMtc3FsLWV4YW1wbGUtd2l0aC1yZWNvbXBpbGUucG5n?x-oss-process=image/format,png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/exec-sql-example-with-recompile.png)

Now, we will execute procedure without recompile which will save the execution plan in cache and after that, we will execute the procedure with recompile option to see if the existing plan is changed or not.

现在，我们将执行不重新编译的过程，这会将执行计划保存在缓存中，然后，我们将使用recompile选项执行该过程，以查看现有计划是否被更改。

```null
SELECT plan_handle,usecounts, cacheobjtype, objtype, size_in_bytes, text, query_planFROM sys.dm_exec_cached_plans CROSS APPLY sys.dm_exec_sql_text(plan_handle) CROSS APPLY sys.dm_exec_query_plan(plan_handle)WHERE text LIKE '%GetLocations%'exec GetLocations 1 WITH RECOMPILESELECT plan_handle,usecounts, cacheobjtype, objtype, size_in_bytes, text, query_planFROM sys.dm_exec_cached_plans CROSS APPLY sys.dm_exec_sql_text(plan_handle) CROSS APPLY sys.dm_exec_query_plan(plan_handle)WHERE text LIKE '%GetLocations%'
```

Please refer to the below image for the result set of the above query. We can see the plan identifier and use counts are the same and the existing plan did not change. EXEC WITH RECOMPILE did not use the existing plan in the cache and created a new plan, used it and discarded it.

请参阅下图以获取上述查询的结果集。 我们可以看到计划标识符和使用次数相同，并且现有计划未更改。 EXEC WITH RECOMPILE没有使用高速缓存中的现有计划，而是创建了一个新计划，使用了该计划并将其丢弃。

![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L3BsYW4taGFuZGxlLXdpdGgtcmVjb21waWxlLnBuZw?x-oss-process=image/format,png)

### 用结果集执行 (EXECUTE WITH RESULT SETS )

This option is used to modify the result set of a stored procedure or the string executed as per the definition specified in the WITH RESULT SETS clause.

此选项用于修改存储过程的结果集或根据WITH RESULT SETS子句中指定的定义执行的字符串。

Please refer to the following example of executing a stored procedure with RESULT SETS

请参考以下使用RESULT SETS执行存储过程的示例

```null
(ID NUMERIC(24,6),LocName varchar(50))
```

![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWMtc3FsLWV4YW1wbGUtd2l0aC1yZXN1bHQtc2V0cy5wbmc?x-oss-process=image/format,png)

We can modify the result set headers and the data type of the column return by executing the stored procedure. This is like using convert (), cast () and column aliases in the normal T-SQL script.

我们可以通过执行存储过程来修改结果集标题和列返回的数据类型。 这就像在普通的T-SQL脚本中使用convert（），cast（）和列别名一样。

If the procedure or T-SQL string returns more than one result set we must define multiple results sets in the WITH RESULTS SETS clause as well else it will throw following error “EXECUTE statement failed because it’s WITH RESULT SETS clause specified 1 result set(s), and the statement tried to send more result sets than this.”

如果过程或T-SQL字符串返回多个结果集，则我们还必须在WITH RESULTS SETS子句中定义多个结果集，否则它将引发以下错误：“ EXECUTE语句失败，因为它的WITH RESULT SETS子句指定了1个结果集），该语句尝试发送的结果集要比此多。”

[![](https://www.sqlshack.com/wp-content/uploads/2019/06/multiple-result-set-in-execute-statement.png)
](https://www.sqlshack.com/wp-content/uploads/2019/06/multiple-result-set-in-execute-statement.png)

Please refer to the following example to use WITH RESULTS SETS clause in EXEC SQL statement for multiple results sets returned by stored procedure or string. In this example, the stored procedure returns two result sets which are the same. I have defined two results in WITH RESULTS SETS clause by changing the datatype and result set headers in both result sets.

请参考以下示例，以在EXEC SQL语句中将WITH RESULTS SETS子句用于存储过程或字符串返回的多个结果集。 在此示例中，存储过程返回两个相同的结果集。 我通过更改两个结果集中的数据类型和结果集标头在WITH RESULTS SETS子句中定义了两个结果。

```null
IF EXISTS (SELECT 1 FROM SYS.procedures where name ='GetLocations')DROP PROCEDURE GetLocationsCREATE PROCEDURE [dbo].[GetLocations]select LocationID,LocationName from Locations where LocationID =@LocIDselect LocationID,LocationName from Locations where LocationID =@LocID(LocID int,LocName varchar(50)),(ID NUMERIC(24,6),LocName varchar(50))
```

![](http://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuc3Fsc2hhY2suY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzA2L2V4ZWN1dGUtc3RhdGVtZW50LXdpdGgtbXVsdGlwbGUtcmVzdWx0LXNldC1pbi5wbmc?x-oss-process=image/format,png)

### 结论 (Conclusion)

We explored different aspects of EXEC SQL Statement with several examples in this article. In case you have any questions, please feel free to ask in the comment section below.

我们通过本文中的几个示例探索了EXEC SQL语句的不同方面。 如果您有任何疑问，请随时在下面的评论部分中提问。

> 翻译自: [https://www.sqlshack.com/exec-sql-overview-and-examples/](https://www.sqlshack.com/exec-sql-overview-and-examples/)

exec sql