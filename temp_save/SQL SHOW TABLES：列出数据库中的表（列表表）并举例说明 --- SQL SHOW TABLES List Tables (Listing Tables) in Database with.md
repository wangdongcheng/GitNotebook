# SQL SHOW TABLES：列出数据库中的表（列表表）并举例说明 --- SQL SHOW TABLES: List Tables (Listing Tables) in Database with Examples
Database developers and administrators have to monitor the condition of databases, inclusive of all associated objects and processes. Often, routine tasks such as database design, performance tuning, and security maintenance require the ability to view the list of tables within a particular database. Hence, database professionals search for reliable and efficient ways to accomplish this task accurately.  
数据库开发人员和管理员必须监控数据库的运行状况，包括所有相关对象和进程。数据库设计、性能调优和安全维护等日常任务通常需要查看特定数据库中的表列表。因此，数据库专业人员需要寻找可靠且高效的方法来准确完成此任务。

All database systems offer methods to list database tables. SQL Server, unlike MySQL/MariaDB, does not directly support the SHOW TABLES function, but it offers a range of alternative ways to fulfill the same requirement. In this article, we examine the diverse methods of listing tables in SQL Server. Depending on the SQL Server version, these methods may slightly vary. Therefore, we'll delve into the syntax, scope, and respective advantages and disadvantages of each method.  
所有数据库系统都提供列出数据库表的方法。与 MySQL/MariaDB 不同，SQL Server 不直接支持 SHOW TABLES 函数，但它提供了一系列替代方法来满足相同的需求。在本文中，我们将探讨在 SQL Server 中列出表的各种方法。根据 SQL Server 版本的不同，这些方法可能会略有不同。因此，我们将深入探讨每种方法的语法、适用范围以及各自的优缺点。

The role of SQL Server system catalog views  
SQL Server 系统目录视图的作用
------------------------------------------------------------------

System catalog views are the default interface in SQL Server that provides access to the information about SQL Server metadata, both schema objects (such as tables, views, procedures) and instance objects (such as logins, settings, access privileges). Users can query catalog views similarly to querying any other database tables or views, but direct modifications of catalog views are not available.  
系统目录视图是 SQL Server 中的默认接口，用于访问 SQL Server 元数据，包括架构对象（例如表、视图、过程）和实例对象（例如登录名、设置、访问权限）。用户可以像查询任何其他数据库表或视图一样查询目录视图，但无法直接修改目录视图。

Introduced in SQL Server 2005, catalog views provide the most consistent information, regardless of changes in the system base tables. Furthermore, querying the system catalog view returns descriptive table column names, which is particularly helpful for newer users. Consequently, Microsoft recommends the usage of catalog views whenever accessing SQL Server metadata is necessary.  
目录视图于 SQL Server 2005 中引入，无论系统基表如何变化，它都能提供最一致的信息。此外，查询系统目录视图会返回描述性表列名，这对新用户尤其有用。因此，Microsoft 建议在需要访问 SQL Server 元数据时使用目录视图。

The catalog views hierarchy is structured in two "tiers." The upper tier comprises sys.objects — the view containing comprehensive information about all schema-scoped objects in a particular database. The lower tier includes views like sys.tables, sys.views, and sys.procedures, along with other custom database-specific views. It's important to note that these lower-tier views inherit all columns from sys.objects, in addition to their unique columns.  
目录视图的层次结构分为两层。上层包含 sys.objects，该视图包含特定数据库中所有架构范围内对象的综合信息。下层包含 sys.tables、sys.views 和 sys.procedures 等视图，以及其他自定义数据库特定视图。需要注意的是，这些下层视图除了继承其特有列外，还继承了 sys.objects 的所有列。

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/43d9396f-398e-48f3-b7b1-85652b8cbb7b.svg%2Bxml?raw=true)

As these system catalog views provide information about all schema objects, they can list the database tables for users in SQL Server provided that they have the sys.tables view permissions. The database owners have them by default, other users need such permissions assigned to them.  
由于这些系统目录视图提供了所有架构对象的信息，因此只要用户拥有 sys.tables 视图权限，它们就可以列出 SQL Server 中用户的数据库表。数据库所有者默认拥有这些权限，其他用户则需要分配此类权限。

Use sys.tables to list tables  
使用 sys.tables 列出表
-------------------------------------------------

The sys.tables system catalog view is the default method for listing tables in SQL Server databases — it provides a comprehensive list of all user tables stored in the current database (you can switch to another database by specifying its name in the query).  
sys.tables 系统目录视图是列出 SQL Server 数据库中表的默认方法 - 它提供了存储在当前数据库中的所有用户表的综合列表（您可以通过在查询中指定其名称来切换到另一个数据库）。

```
SELECT 
  name 
FROM sys.tables;
```

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/a4fd9a40-cc31-44bd-9854-841d1734798b.png?raw=true)

  

Note笔记

While sys.tables is the most convenient option, you may require the appropriate privileges to view sys.tables if you are not the database owner. Additionally, it's important to keep in mind that querying sys.tables is specific to SQL Server and is not supported by other relational database management systems (RDBMSs).  
虽然 sys.tables 是最便捷的选项，但如果您不是数据库所有者，则可能需要适当的权限才能查看 sys.tables。此外，请务必记住，查询 sys.tables 仅适用于 SQL Server，其他关系数据库管理系统 (RDBMS) 不支持。

Use sys.objects to list tables  
使用 sys.objects 列出表
---------------------------------------------------

As mentioned previously, sys.objects is the primary system catalog view in SQL Server where you can access the information about all schema objects, not limited to tables alone. If you specifically require a list of particular objects, such as tables, you can apply a filter using the WHERE clause:  
如前所述，sys.objects 是 SQL Server 中的主要系统目录视图，您可以在其中访问有关所有架构对象的信息，而不仅限于表。如果您特别需要特定对象（例如表）的列表，则可以使用 WHERE 子句应用过滤器：

```
SELECT 
  name  
FROM sys.objects  
WHERE type = 'U';
```

In this query, U stands for the user table. The output is:  
在此查询中，U 代表用户表。输出为：

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/14174b7b-2cb6-45ed-b359-210988b82895.png?raw=true)

  
While sys.objects is a valuable resource for retrieving a comprehensive list of database objects, including tables. However, if your task exclusively involves tables, you should always modify the command as demonstrated above (or refer to sys.tables).  
虽然 sys.objects 是检索数据库对象（包括表）完整列表的宝贵资源。但是，如果您的任务仅涉及表，则应始终按照上述示例修改命令（或参考 sys.tables）。

Use INFORMATION\_SCHEMA.TABLES to list tables  
使用 INFORMATION\_SCHEMA.TABLES 列出表
---------------------------------------------------------------------------------

INFORMATION\_SCHEMA.TABLES is a commonly used method to retrieve a list of tables from the current database. The syntax to return all tables and views with one query is as follows:  
INFORMATION\_SCHEMA.TABLES 是一种常用的方法，用于从当前数据库中检索表的列表。使用一个查询返回所有表和视图的语法如下：

```
SELECT 
  \* 
FROM INFORMATION\_SCHEMA.TABLES;
```

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/cc2b8013-0351-4eee-805c-90b5f7ada6ff.png?raw=true)

  
If you require a list of actual tables excluding views, you can modify the command as follows:

```
SELECT 
  TABLE\_NAME
FROM INFORMATION\_SCHEMA.TABLES 
WHERE TABLE\_TYPE = 'BASE TABLE';
```

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/7ed38dc5-77c0-4eea-9e0a-948d200192e3.png?raw=true)

  

Note

The usage of INFORMATION\_SCHEMA.TABLES is applicable to newer SQL Server versions (2005 and above), as older versions do not support this method. Additionally, querying this view tends to be slower compared to the system catalogs mentioned earlier. Therefore, it may not be the optimal and most efficient approach when working with large databases.

Use dbo.sysobjects to list tables
---------------------------------

dbo.sysobjects is an outdated version of the sys.objects view that was in use prior to the release of SQL Server 2005. If you are working with SQL Server 2000 or an earlier version and need to list tables in your databases. You should utilize dbo.sysobjects.

It provides the same results as sys.objects: the list of all objects in the database, including tables. When you need it listing the database tables exclusively, you can modify the query in the same manner as in the modern version by adding the WHERE clause to filter object types:

```
SELECT 
  name  
FROM dbo.sysobjects 
WHERE xtype = 'U';
```

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/43910d95-1e8c-4bf7-bd40-f2b4875808fe.png?raw=true)

  

Note

This command has been deprecated in SQL Server 2005. It is still active in higher versions of SQL Server, but Microsoft recommends using more up-to-date options like querying sys.tables or sys.objects.

Use the sp\_tables stored procedure to list tables
--------------------------------------------------

The stored procedure sp\_tables can be used to fetch a list of database objects, excluding synonym objects. The simplest way to query this stored procedure is:

However, this approach may not be the most convenient option as it retrieves the entire list of database objects. For more precise results, you can modify the command to filter the output based on the table type, table name, table owner, and table qualifier.

```
EXEC sp\_tables @table\_owner = 'dbo'  
              ,@table\_qualifier = 'sakila'  
              ,@table\_type = "'TABLE'";
```

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/575d0b56-fd61-4b73-9316-1aeedb162e74.png?raw=true)

  
While the sp\_tables stored procedure can be useful, many SQL Server experts find it more limited and complex to use in larger queries compared to querying sys.tables and sys.objects.

Show all tables in SQL Server database with dbForge Studio  
for SQL Server
---------------------------------------------------------------------------

Database specialists often use T-SQL commands as their primary option. An alternative approach is to utilize GUI tools like Microsoft's SQL Server Management Studio (SSMS) or dbForge Studio for SQL Server, which we used while preparing this material. These GUI tools offer a more user-friendly interface and allow users to perform actions with a simple click instead of writing scripts.

To view tables in [dbForge Studio for SQL Server](https://www.devart.com/dbforge/sql/studio/), you can use Database Explorer. Follow these steps:

1.  Select the desired database in the left pane.
2.  Expand the selected database to reveal its contents.
3.  Expand the Tables folder to display all tables within the database. You can explore any specific table further to access information about its columns, triggers, indexes, constraints, and more.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/30-06-2025,%2009-55-51/504dec05-5543-488b-af74-9ab0f7cc674d.png?raw=true)

  
The Database Explorer not only enables you to view table details but also provides the ability to edit tables directly. To do this, simply right-click on the desired table and choose the appropriate option from the menu.

Pros & Cons
-----------

| Method | Advantages | Disadvantages | Advantages |
| --- | --- | --- | --- |
| INFORMATION\_SCHEMA.TABLES | Standardized and works across multiple SQL databases | Limited metadata and may not include all table types | SELECT \* FROM INFORMATION\_SCHEMA.TABLES; |
| sys.tables | Provides detailed metadata specific to SQL Server | SQL Server-specific and not portable to other systems | SELECT \* FROM sys.tables; |
| sp\_tables system stored procedure | Quick and easy to execute for listing tables | Output can be verbose and less customizable | EXEC sp\_tables; |
| Object Explorer in SSMS | User-friendly and requires no SQL knowledge | Not scriptable and slower for large databases | Navigate through Object Explorer in SQL Server Management Studio |

Conclusion
----------

Both T-SQL commands and GUI tools are widely used by database experts. GUI tools are particularly beneficial for beginners and non-technical users, but they are also favored by database experts due to their ability to accelerate tasks and reduce effort. For example, when working with databases, you can use GUI tools to show all tables in [MySQL](https://www.devart.com/dbforge/mysql/studio/show-tables-list-in-mysql.html), [PostgreSQL](https://www.devart.com/dbforge/postgresql/studio/postgres-list-all-tables.html), or [Oracle](https://www.devart.com/dbforge/oracle/studio/show-tables-in-oracle-database.html) quickly and efficiently. In practice, you will most likely see the combination of T-SQL and GUI used by the same specialists when appropriate.

dbForge Studio for SQL Server stands out as an all-in-one solution for performing various tasks related to managing, designing, developing, and administering databases in SQL Server. It offers comprehensive functionality and can be experienced to its fullest extent through a fully functional free trial. Feel free to [download the tool](https://www.devart.com/dbforge/sql/studio/download.html) give it a try.