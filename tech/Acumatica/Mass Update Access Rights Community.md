# Mass Update Access Rights | Community
https://community.acumatica.com/configuration-and-installation-114/mass-update-access-rights-27596#:~:text=Best%20answer%20by%20MichaelShirk,Set%E2%80%9D%20to%20%E2%80%9CRevoked%E2%80%9D

MichaelShirkCaptain II192 replies
> We just updated our production instance to 24R2 over the weekend.
I should have thought to check this, but we had a number of different Generic Inquires created by different users that didn’t have access rights set. Obviously, during the upgrade, all “Not Set” access rights were changed to “Delete”. 
There are about a dozen screens that I want to go through and set every role to “Revoked”,
but we have a lot of user roles in the system. (Afterwards, I’ll manually grant access for roles that require it.)
Is there any better way to do this than to manually go through every role for each screen?
 

> I would be very comfortable doing this via a database update, but I’ve tried finding the database table that stores this information with no success.

I figured it out.

It appears the “RolesInGraph” table contains a default record for each site map node, with an asterisk “\*” for the role name, which provides the default access for all roles, unless otherwise defined.   
If a new node is added to the site map, only that one record with the “\*” role name exists in the table. Then, additional records are created for each role that has the rights modified.  
In my situation, because the screens I originally mentioned had access rights set to “Not Set” for all roles, the upgrade process set the access rights value of the default record to “Delete” (4 is the db value).  _This behavior is mentioned in the upgrade docs as the default access rights for new screens was changed from “Not Set” to “Revoked”._

I just ran this script for the screens that I wanted to set to revoked as the default.  
Then I went in and granted permissions for the roles that required access. Note that for some odd reason, changing the value in the data base didn’t take effect until after I had also changed permissions for at least one other role. Meaning, even though access rights were set to “Revoked” for all roles after running the script, all roles still had access until I made additional changes to the rights for that page.

```sql
DECLARE @CompanyID INT = 2;
DECLARE @ScreenID VARCHAR(8) = 'GI990151';
DECLARE @TargetRole VARCHAR(15) = '*';

--SELECT * FROM RolesInGraph 
--Where RolesInGraph.CompanyID=@CompanyID 
--	AND RolesInGraph.ScreenID = @ScreenID;


UPDATE RolesInGraph
SET Accessrights = 0
Where RolesInGraph.CompanyID=@CompanyID 
	AND RolesInGraph.ScreenID = @ScreenID
	AND RolesInGraph.RoleName = @TargetRole;
```

Hopefully this is helpful if anyone else runs into this issue!