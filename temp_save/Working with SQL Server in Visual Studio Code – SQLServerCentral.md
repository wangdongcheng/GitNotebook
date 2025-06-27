# Working with SQL Server in Visual Studio Code – SQLServerCentral
Introduction
------------

Visual Studio Code (VSCode) is a free and light source code editor created by Microsoft. It can be installed in Windows, macOS, or Linux. Note that Visual Studio is not the same as Visual Studio Code. Visual Studio Code is a light software to create and it is free whereas Visual Studio is an Integrated Development Environment (IDE).

You can create HTML code, JavaScript, C#, Python, and SQL Server there. It is a popular tool to create code for developers. As a SQL Server expert, I prefer SSMS to handle my SQL Server databases. However, if you already work with Visual Studio Code, you may want to connect to SQL Server using the extension.

This tutorial will teach you how to work with the SQL Server using Visual Studio Code.

Download Visual Studio Code
---------------------------

Use this link to download Visual Studio Code: [Download Visual Studio Code.](https://code.visualstudio.com/download) There are versions for Windows, Mac, and Linux.

[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/f5534b6d-e966-4247-a580-afb918e46420.png?raw=true)
](https://www.sqlservercentral.com/wp-content/uploads/2024/04/visual-studio-code-download-option.png)

Once downloaded, run the installer and install VSCode.

Install the SQL Server Extension
--------------------------------

To install the SQL Server extension in **Visual Studio** code, click on the **Extensions** icon.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/f570e2ad-7be0-4231-9536-a080a9f877b5.png?raw=true)

In the search text box write SQL Server select **the SQL Server (mssql)** Extension from **Microsoft** and press the install button.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/c4344036-323f-4fde-beb2-391025e7e4c3.png?raw=true)

Connect to SQL Server
---------------------

Once installed, close and open again the **Visual Studio Code.**Press the SQL Server icon to connect to SQL Server.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/16f964ff-db80-4741-9812-4dcff4cd1c00.png?raw=true)

Press the **\+** icon to add a connection.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/a54d4632-2d00-4202-bac3-776d5d27bf76.png?raw=true)

Enter the SQL Server name.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/bf126915-81b4-41f6-98b8-8c3723ec53d5.png?raw=true)

Type the database name. In this example, we will use the Adventureworks2022. However, you can use any database of your preference. For more information about the adventureworks, refer to this [related article.](https://www.sqlservercentral.com/articles/sql-server-sample-databases-2)

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/164853b4-6a05-4483-acf3-c63988080f48.png?raw=true)

You can use a SQL login, which uses logins created inside SQL Server, or Integrated authentication which uses the operative system authentication. Microsoft Entra ID is like an Active Directory id in Azure. For more information about authentication Methods refer to these links.

*   [SQL Server authentication methods, logins, and database users](https://www.red-gate.com/simple-talk/databases/sql-server/learn/sql-server-authentication-methods/)
*   [What is Microsoft Entra ID?](https://learn.microsoft.com/en-us/entra/fundamentals/whatis)

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/20bbe403-e339-424a-89d1-c752bc431f3f.png?raw=true)

Finally, you can write a profile name for the connection.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/d0e543ac-1bfb-4e7b-bac1-2dfefe4fe398.png?raw=true)

Visual Studio Code options
--------------------------

When you right-click the connection you have the following options:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/bf49be4e-b950-480a-9d6d-6fe9f550b70d.png?raw=true)

*   **New query** is used to run a new query. For example, you could create tables, run a select, run system-stored procedures, or run any T-SQL sentence.
*   **Disconnect** will disconnect Visual Studio code from the database.
*   **Remove** will remove the connection in VSCode.
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.
*   **Create Project From Database** generates .sql scripts with the Database code as a project.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/83e0af84-cf86-4042-857a-4053a5482c23.png?raw=true)

Table options
-------------

When you right-click a table with VS Code, you have the following options:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/0179f7bb-4277-4395-b63a-caa91c8b5c9a.png?raw=true)

*   [Select top](https://www.sqlservercentral.com/articles/top-in-sql-server-2005) 1000 will show the first 1000 or less rows in the table.
*   **Script as Create** generates the T-SQL code to create a table.
*   **Script as Drop** generates the T-SQL code to drop a table.
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.
*   **Create Azure Functions with SQL binding** was an option when this article was written in the Preview version. Azure functions are solutions to write code in different languages using a serverless solution. Azure SQL bindings for Azure are used to integrate with your SQL data.

View Options
------------

You can also manipulate and handle your views. A view is like a virtual table. It is a query with a name. You have the following options to handle views in VS Code:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/c4119092-0336-40b9-ba91-3e2399641966.png?raw=true)

*   [Select top](https://www.sqlservercentral.com/articles/top-in-sql-server-2005) 1000 will show the first 1000 or fewer rows in the view.
*   **Script as Create** generates the T-SQL code to create the view.
*   **Also, Script as Drop** generates the T-SQL code to drop the view.
*   **Script as Alter** will generate the code to edit the view.
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.
*   **Create Azure Functions with SQL binding** was an option when this article was written in the Preview version. Azure functions are solutions to write code in different languages using a serverless solution. Azure SQL bindings for Azure are used to integrate with your SQL data.

For more information about views, refer to this link: [CREATE VIEW (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver16)

Programmability Options
-----------------------

Programmability contains Stored Procedures, Functions, Triggers, and other options.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/639bbb29-006a-4ab3-8b4f-4d4d6280ec50.png?raw=true)

In stored procedures, you have the following options:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/a0854dca-0123-4e8e-adf6-4e66d3c0d4b8.png?raw=true)

*   **Script as Create** generates the T-SQL code to create the stored procedure.
*   **Also, Script as Drop** generates the T-SQL code to drop the stored procedure.
*   **Script as Alter** will generate the code to edit the stored procedure
*   **Script as Execute** will generate the code to execute the stored procedure
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.

For more information about stored procedures, refer to this link: [Create a stored procedure](https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver16)

Functions
---------

In VSCode, you have 3 options:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/226094c9-f97d-45e7-9b9a-2a76a6760515.png?raw=true)

*   **Table-valued functions** return the set as a table.
*   **Scalar-valued functions** return a single value.
*   **Aggregate functions** summarize and condense data.

You have the following options to edit functions.

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/cbd1df60-8c66-41b1-9bda-ab3b8cae24e3.png?raw=true)

*   **Script as Create** generates the T-SQL code to create the functions.
*   **Also, Script as Drop** generates the T-SQL code to drop the functions.
*   **Script as Alter** will generate the code to edit the function.
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.

For more information about functions, refer to this link: [What are the SQL database functions?](https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16)

Triggers
--------

In addition, you have triggers. You can create the following scripts with triggers:

![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/27-06-2025,%2011-00-36/77c72a9c-e151-4d6e-8f01-3180ca3e1935.png?raw=true)

*   **Script as Create** generates the T-SQL code to create the trigger.
*   **Script as Drop** generates the T-SQL code to drop the trigger.
*   **Refresh** is commonly used when a new object is created or dropped. It will refresh the list of visible objects.

There are other objects like the assembles of user-defined data types, etc. You will be able to refresh them, but not modify the code.

Conclusion
----------

As you can see, VS Code provides a nice extension created by Microsoft to create and manipulate SQL Server tables. Compared with SSMS, it is a very simple environment and it lacks several basic features to handle data. However, if you only need to create tables add data, and stored procedures and you do not need to do DBA stuff, the VS Code can be useful, especially if you work on it daily.