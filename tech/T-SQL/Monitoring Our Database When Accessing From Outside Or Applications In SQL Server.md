# Monitoring Our Database When Accessing From Outside Or Applications In SQL Server
https://www.c-sharpcorner.com/article/monitoring-our-database-when-access-from-out-side-or-application-in-sql-server/

**Introduction**

This article explains how to monitor our database when accessing from outside or by any other applications, in an easy way. We normally use SQL Server as a database, so we want to monitor our database or what happens in our database from the application call. We can find what SQL Server object is executed and when it is executed in our SQL server. We can monitor our database using SQL Profiler in SQL Server.

![](../../img/imghost/30-06-2025,%2013-32-36/af6fce9e-4e3d-48f6-b4bb-54fd73d4cbe1.gif?raw=true)

Using SQL Server Profiler, we can find what stored procedures and views are executed, and what other processes happened or are happening.

**Steps for monitoring database in SQL Server**

**Step 1**

Open SQL Server and select server name, authentication type, then enter SQL server username, password and connect to the Server.

![](../../img/imghost/30-06-2025,%2013-32-36/5fff3f77-96d1-4846-afe7-512f4847233e.jpeg?raw=true)

**Step 2**

Here, we are using Sample database. In samples, the database contains many tables and has one user-defined procedure and views.

**![](../../img/imghost/30-06-2025,%2013-32-36/53dcccd9-207e-439d-a934-7a549bb4addc.jpeg?raw=true)**

**Step 3**

We need to monitor our sample database, so we are going to open SQL Server Profiler. Select Tools >> SQL Server Profiler.

![](../../img/imghost/30-06-2025,%2013-32-36/dec44657-66d6-4ffb-ba0c-6f7ee711b19e.jpeg?raw=true)

Now, SQL Server Profiler window will be opened. Select Server name, authentication type, then enter SQL server username, password and now Connect to the Server

![](../../img/imghost/30-06-2025,%2013-32-36/85fa04e1-dd72-43c2-903f-9dea34ce6d1f.jpeg?raw=true)

**Step 4**

"Trace Properties" window will open. Enter the Trace name in general tab.

![](../../img/imghost/30-06-2025,%2013-32-36/b5113abc-264e-44b7-b0ed-6d99f09f6c46.jpeg?raw=true)

Select "Event Selection" tab to select the “Show all events" and "Show all columns” checkbox. We can see what events there are in the event selection tab.

![](../../img/imghost/30-06-2025,%2013-32-36/d29fc2f3-2207-4177-9e17-aa6a16832817.jpeg?raw=true)

There are many databases on our Server, so we can monitor either specific or all databases.

Here, we monitor sample database only, so filter for sample database.

*   Click “Column Filters”. "Edit Filter" window will open.
*   Select “DatabaseName” then expand "Like".
*   Enter your database name, that looka like the below screenshot.
*   Click Ok followed by click on Run button.

![](../../img/imghost/30-06-2025,%2013-32-36/32f1908d-53a2-4580-b287-ecc4fab1b03d.jpeg?raw=true)

**Step 5**

Our SQL Profile has started, if anything executes in the sample database, we can see in our SQL Server Profiler window. Before executing anything in our database, we can see the status, which looks like the below screenshot.

![](../../img/imghost/30-06-2025,%2013-32-36/e2b8e1ed-8123-4c01-a4de-bc6eefca6a26.jpeg?raw=true)

Now, let's run the stored procedure manually.

![](../../img/imghost/30-06-2025,%2013-32-36/2d3a2876-f380-49af-abb5-fae7935afa75.jpeg?raw=true)

After running the stored procedure, we can see in profiler which stored procedure ran and when it started and when it ended and all other information. If any events are executed in our database all events will be monitored by SQL Profiler.

![](../../img/imghost/30-06-2025,%2013-32-36/9b0e0c16-ee9a-4351-a7c3-fc2ff20ac572.jpeg?raw=true)

Now we execute one view in our database. After executing view we get all details of view by profiler, which looks like below screenshot.

![](../../img/imghost/30-06-2025,%2013-32-36/96356fe1-3346-4739-b8e9-b27bf924cd71.jpeg?raw=true)
  
![](../../img/imghost/30-06-2025,%2013-32-36/c1934b47-f15d-460f-b84d-adad6c7285aa.jpeg?raw=true)

In the same way as mentioned above we can monitor all the events in the database. We can monitor all databases at the same time using mentioned same steps but no need to select column filter do not select anything and do not give anything in Like option.

![](../../img/imghost/30-06-2025,%2013-32-36/0fb2754f-d0b6-4a01-b399-7feae878e2c7.jpeg?raw=true)

**Note**

SQL profiler should be running in SQL server otherwise we cannot monitor it. If we stop profiler we can not monitor it.

**Conclusion**

This article explained how to monitor our database when accessed from outside or any other applications in an easy way. I hope this is helpful to new SQL Server learners.