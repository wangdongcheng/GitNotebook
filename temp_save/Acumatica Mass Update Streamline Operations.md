# Acumatica Mass Update: Streamline Operations
https://www.greytrix.com/blogs/acumatica/2022/08/02/acumatica-mass-update-with-generic-inquiry/

Acumatica ERP is adaptable and effective solution that keeps on improving by adding new features. Here we are going see one of the features of Acumatica which helps in updating records more efficiently and saves time as well. As working with the [Acumatica ERP](https://www.greytrix.com/acumatica-cloud-erp/), we are mostly familiar with the generic inquiries. Using generic inquiries, we can access data in Acumatica and all those data is available for Acumatica reporting, dashboards, Export Scenarios, etc.

There are always situations where a user must update the details of multiple records with same set of values. Navigating to each record and updating it individually is not an ideal way and its time consuming. Alternatively, a user will either use the standard import functionality or create a custom import that can run from external sources. Acumatica provides a MASS UPDATE option within generic inquiries.

In this blog, we will discuss about the about Mass update feature considering the Generic Inquiry screen of Customers (AR3030PL).

Suppose an organization is no longer maintaining multiple currencies and only uses “USD”. Here, we need to change all the customers to use “USD” as Currency ID where Mass Update is the best solution in such cases. Also, some of the customers need to be made inactive.

[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/18-11-2025,%2008-51-36/4c15d6bc-127c-43db-b3d0-9b1911ef0898.png?raw=true)
](https://www.greytrix.com/blogs/acumatica/wp-content/uploads/2022/08/01-Customize-Generic-Inquiry.png)Navigate to the Generic Inquiry screen of customers, expand Customization, and click on “Edit Generic Inquiry”.

The Generic Inquiry screen will be opened with “AR-Customers” as auto-selected.

Go to “Entry Point” tab and select “Enable Mass Record Update” checkbox. This will make the new “Mass Update Fields” tab available.[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/18-11-2025,%2008-51-36/ddea878a-f6c3-4ba5-8c42-cc451ef17f74.png?raw=true)
](https://www.greytrix.com/blogs/acumatica/wp-content/uploads/2022/08/02-Enable-Mass-Update-with-Fields.png)

Go to ‘Mass Update Fields’ tab, add the available fields from the list for which update is required and Save the Generic Inquiry.

Reload the Customer Generic Inquiry screen (AR3030PL).

After refreshing, you will see new Action buttons added as ‘Update’ (updates selected records only) and ‘Update All’ (updates all records).

**Update All**: Update Currency of all the customers to USD

[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/18-11-2025,%2008-51-36/565a0f5c-afe3-4299-9e4f-86c4a68751df.png?raw=true)
](https://www.greytrix.com/blogs/acumatica/wp-content/uploads/2022/08/03-Update-All.png)

Click on Update All, select the fields that needs to be updated and choose/enter the values as per the options available for the selected field control (Selector, Drop-down, Checkbox, …).

[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/18-11-2025,%2008-51-36/af745e25-54d0-4475-a9b9-05cc85e7d35f.png?raw=true)
](https://www.greytrix.com/blogs/acumatica/wp-content/uploads/2022/08/04-Updated-Currency.png)

On click of Finish button, processing starts for update operation. Once completed, user can see the records with updated Currency ID ‘USD’ for all customers.

**Update**: Update the customers to set it as Inactive

Click on Update, select the fields that needs to be updated and choose/enter the values as per the options available for the selected field control (Selector, Drop-down, Checkbox, …)

On click of Finish button, processing starts for update operation. Once completed, updated records are listed on the screen with Customer Status as Inactive.[![](https://github.com/wangdongcheng/GitNotebook/blob/main/img/imghost/18-11-2025,%2008-51-36/4e0119c7-39e5-48ea-a397-7ad6ed99e857.png?raw=true)
](https://www.greytrix.com/blogs/acumatica/wp-content/uploads/2022/08/05-Update-Customer-Status.png)

So, Generic Inquiry’s Mass Update feature makes it very simple to modify the data for multiple records with multiple fields. Depending on the field type, the available control for data selection ensures that one can use the system data which in-turn reduces the possibilities of errors.

Since, the update operation runs based on the standard [Acumatica](https://www.greytrix.com/acumatica-cloud-erp/) business logic, the data is modified only if it passes standard validations and throws error if the selected field is allowed for update.