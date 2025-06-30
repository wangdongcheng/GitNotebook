# Setting SQL Server Field Descriptions
https://nolongerset.com/setting-sql-server-field-descriptions/

[SQL Server](https://nolongerset.com/tag/sql-server/)

There are two basic ways to set field descriptions in SQL Server: via SSMS and T-SQL. Let's explore both.

*    [![](../../img/imghost/30-06-2025,%2010-45-57/104cfb01-1e9f-4fd8-9b12-0cba68dc8e00.jpeg?raw=true)](https://nolongerset.com/author/mike/) 

![](../../img/imghost/30-06-2025,%2010-45-57/a6e12b3f-6bde-4101-b690-6d7f001fdd2f.jpeg?raw=true)

_This is Part 2 in a [series of articles](https://nolongerset.com/field-comments-on-linked-tables/) discussing field comments on linked tables._

### 

Linked SQL Server Tables

[](#linked-sql-server-tables)

Like linked MS Access tables, you can add (or overwrite) column descriptions in the front-end database.  Of course, the same limitation applies.  If you re-link the table, the descriptions you modified in the front-end are lost.

As with tables linked to back-end MS Access files, the best approach is to enter your field descriptions in the source tables themselves.  

Doing this in a SQL Server back-end is both easier and harder than in an Access back-end.  It's easier in SQL Server because the changes can be made without having to get all the users out of the affected table(s).  But it's harder because the descriptions do not automatically get imported into Access as part of the table linking process.  (_Stay tuned...I'll show you how to do that in a later article in this series._)

### 

Setting the description via the GUI

[](#setting-the-description-via-the-gui)

In SQL Server Management Studio (SSMS), you can right-click on an existing table and choose "Design."  Then, in the table designer, place your cursor in the row of the column whose description you want to set.  The "Column Properties" tab will appear below the table designer.  Simply set the "Description" value to whatever you want.  Be sure to hit the save button to apply the changes to the table:

![](../../img/imghost/30-06-2025,%2010-45-57/ad434a5d-50a4-4587-9233-ecb59c5af94a.png?raw=true)

Don't forget step 3: save your changes!

### 

Setting the description via T-SQL

[](#setting-the-description-via-t-sql)

To set the field description in T-SQL, you need to use an SQL Server extended property named "MS\_Description."  This extended property is similar to Microsoft Access database properties in that you will need to create the property if it does not already exist.

#### 

T-SQL to Add a New Field Description

[](#t-sql-to-add-a-new-field-description)

The following T-SQL will add a field description to the `PhoneNum` field in the `Contact` table within the default `dbo` schema using the built-in stored procedure [sp\_AddExtendedProperty](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addextendedproperty-transact-sql?view=sql-server-ver15&ref=nolongerset.com):

```SQL
exec sp_AddExtendedProperty 
      'MS_Description'
    , 'The phone number (e.g., "(555) 253-5970 x1150"'
    , 'SCHEMA', 'dbo'
    , 'TABLE', 'Contact'
    , 'COLUMN', 'PhoneNum'
```

#### 

T-SQL to Update an Existing Field Description

[](#t-sql-to-update-an-existing-field-description)

The above T-SQL will fail if the _MS\_Description_ extended property already exists on the table.  In that case, we would need to use the [sp\_UpdateExtendedProperty](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-updateextendedproperty-transact-sql?view=sql-server-ver15&ref=nolongerset.com) stored procedure instead.  For example:

```SQL
exec sp_UpdateExtendedProperty 
      'MS_Description'
    , 'The phone number (e.g., "555-253-5970"'
    , 'SCHEMA', 'dbo'
    , 'TABLE', 'Contact'
    , 'COLUMN', 'PhoneNum'
```

### 

Required permissions

[](#required-permissions)

Please note that you will need one of the following permissions to set field Description values in SQL Server:

**Be a member of one of these database roles:**

*   db\_owner
*   db\_ddladmin

**Or, be granted one of the following table-level permissions:**

*   ALTER
*   CONTROL

_Image by [Pexels](https://pixabay.com/users/pexels-2286921/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1866559) from [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1866559)_