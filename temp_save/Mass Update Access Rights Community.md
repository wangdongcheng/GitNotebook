# Mass Update Access Rights | Community
https://community.acumatica.com/configuration-and-installation-114/mass-update-access-rights-27596#:~:text=Best%20answer%20by%20MichaelShirk,Set%E2%80%9D%20to%20%E2%80%9CRevoked%E2%80%9D

I figured it out.

It appears the “RolesInGraph” table contains a default record for each site map node, with an asterisk “\*” for the role name, which provides the default access for all roles, unless otherwise defined.   
If a new node is added to the site map, only that one record with the “\*” role name exists in the table. Then, additional records are created for each role that has the rights modified.  
In my situation, because the screens I originally mentioned had access rights set to “Not Set” for all roles, the upgrade process set the access rights value of the default record to “Delete” (4 is the db value).  _This behavior is mentioned in the upgrade docs as the default access rights for new screens was changed from “Not Set” to “Revoked”._

I just ran this script for the screens that I wanted to set to revoked as the default.  
Then I went in and granted permissions for the roles that required access. Note that for some odd reason, changing the value in the data base didn’t take effect until after I had also changed permissions for at least one other role. Meaning, even though access rights were set to “Revoked” for all roles after running the script, all roles still had access until I made additional changes to the rights for that page.

```null
1DECLARE @CompanyID INT = 2;2DECLARE @ScreenID VARCHAR(8) = 'GI990151';3DECLARE @TargetRole VARCHAR(15) = '*';45678910UPDATE RolesInGraph11SET Accessrights = 012Where RolesInGraph.CompanyID=@CompanyID 13	AND RolesInGraph.ScreenID = @ScreenID14	AND RolesInGraph.RoleName = @TargetRole;
```

Hopefully this is helpful if anyone else runs into this issue!