# How to Mass Update Records with Generic Inquiry | Community
https://community.acumatica.com/reports-and-generic-inquires-115/how-to-mass-update-records-with-generic-inquiry-19503

*   Do you have a new Cash Account, and need to add the new Cash Account to a large number of Open AP Bills?
*   Are you adding Sales Tax module, and you need to apply a new Tax Zone to Customers based on their Zip Codes?
*   Are you changing Salespeople to different zones or products, and you need to update existing Default Salesperson for your Customers or existing Product Manager on your Inventory Items?

**Mass Update Records** may help you!

In this example, a company opened a new bank account and needs to update the Cash Account on 3000 open AP Bills. Mass Update is one way to update open bills. (Import Scenario is another way that is not covered in this post.)

1.  Add the Cash Account field that needs to be changed to the Results tab of Generic Inquiry:

![](../../img/imghost/18-11-2025,%2008-59-05/1c643603-acce-4f74-aa9d-2e4b45693339.webp?raw=true)

Add Cash Account to AP Bills Inquiry

2.  On **Entry Point** tab of Generic Inquiry screen, Enable Mass Record Updates.

![](../../img/imghost/18-11-2025,%2008-59-05/4aa6165d-feff-45ef-9609-b3a57cbc7cd4.webp?raw=true)

3.  On **Mass Update Fields** tab of Generic Inquiry, add the field to be updated; in this case, Cash Account.

![](../../img/imghost/18-11-2025,%2008-59-05/a55e57e7-a5d3-461c-a289-ceba5e984fc5.webp?raw=true)

4.  Return to your newly updated Generic Inquiry. Shown below is Bills & Adjustments Preview List generic inquiry. Use **Column Configurator** to add the “Selected’ button to the left side of Bills & Adjustments PL.

![](../../img/imghost/18-11-2025,%2008-59-05/4c969a0a-88f3-41a6-a6b5-4717aee30990.webp?raw=true)

5.  Optional: Filter the generic inquiry as needed, to identify fields to be updated. In this example, I filtered Type = Bill, Cash Account = old Cash Account to be replaced, and Status = Open (only open documents can be updated in my example).

![](../../img/imghost/18-11-2025,%2008-59-05/850cae44-32e1-4d57-a61b-e8f09e7f47f4.webp?raw=true)

Use Filters to focus on exact records to be updated

6.  Select rows to be updated.  Click **\[...\]** (Menu formerly known as Actions Menu 😉) and select appropriate Update action based on your situation.

![](../../img/imghost/18-11-2025,%2008-59-05/3f38a960-d312-4648-8886-ea8be537b15f.webp?raw=true)

7.  Enter New Value when prompted by **Values for Update** pop-up:

![](../../img/imghost/18-11-2025,%2008-59-05/237935bf-8c18-4677-8842-4c28095ed5c3.webp?raw=true)

Enter New Value for Cash Account

8.  **Results**: 4 lines updated to new Cash Account:

![](../../img/imghost/18-11-2025,%2008-59-05/dbceb7b7-b1d0-47ae-b9a8-8e4c0ef058cb.webp?raw=true)

Results

**IMPORTANT NOTE:**  You may wish to return to Step 2 and **Disable Mass Update of Records** when your update task is completed.

_Every User_ with Edit or higher access rights in AP Bills & Adjustments screen will see the new Update option in the AP Bills Preview List, unless Roles are further updated to include/exclude the Mass Update option.

To your continued success….

Laura