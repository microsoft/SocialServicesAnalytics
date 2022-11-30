# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioAddress.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioAddress.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioAddress.md#data-model-table-columns-and-taxonomies)
  * [Table Address (TblAddress)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioAddress.md#the-main-address-table-technical-name-tbladdress)
  * [Table Address Type (TblAddressType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioAddress.md#the-table-specifing-the-type-of-address-technical-name-tbladdresstype)

# Introduction
This section describes all the tables comprising the Address Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.

# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Address Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Address_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">

# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Address Data Domain tables.
## The main Address table, technical name TblAddress
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Column Definition</th></tr>
<tr><td>AddressId</td><td>BIGINT</td><td>Primary Key  / IDENTITY (1, 1)</td><td>NOT NULL</td><td>This attribute contains the primary key value of the address table.</td><tr>,             
<tr><td>AddresUprn</td><td>VARCHAR (12)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains the UPRN number. UPRN stands for Unique Property Reference Number. UPRN Was created by the Ordnance Survey (OS). It consists of numbers of up to 12 digits in length. Local governments in the UK have allocated a unique number for each land or property.</td><tr>
<tr><td>AddressHouseNumber</td><td>VARCHAR (12)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the address house number.</td><tr>
<tr><td>AddressUnitNumber</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the unit number of the address.</td><tr>
<tr><td>AddressUnitName</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the unit name of the address.</td><tr>
<tr><td>AddressStreet</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the address street name.</td><tr>
<tr><td>AddressDistrict</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the district. The districts of England (also known as local authority districts or local government districts to distinguish from unofficial city districts) are a level of subnational division of England used for local government purposes. (Ref. https://en.wikipedia.org/wiki/Districts_of_England).</td><tr>
<tr><td>AddressTown</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the address town.</td><tr>
<tr><td>AddressCounty</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the county name of the address.</td><tr>
<tr><td>AddressPostcode</td><td>VARCHAR (7)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the address postcode.</td><tr>
<tr><td>AddressCountry</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the country name of the address.</td><tr>
<tr><td>AddressSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td><tr>
<tr><td>AddressSourceKey</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>This technical attribute contains details on the tuple's natural key for source.</td><tr>
<tr><td>AddressRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td><tr>
<tr><td>AddressDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td><tr>
<tr><td>AddressTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td><tr>
<tr><td>AddressTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td><tr>
<tr><td>AddressToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.
Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:
  <ul><li>-1 = Not in the History Table</li>
      <li>0 = Requires Moving in the History Table</li>
      <li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td><tr>
</table>
<br>

## The table specifing the type of address, technical name TblAddressType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Index Type</th><th align="center">Nullable</th><th align="center">Column Definition</th></tr>
<tr><td>AddressTypeId</td><td>BIGINT</td><td>Primary Key  / IDENTITY (1, 1)</td><td>NOT NULL</td><td>This attribute is a technical field that contains the unique identifier for the table.</td><tr>
<tr><td>AddressTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>This attribute contains the description of tuple's type code.</td><tr>
<tr><td>AddressTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains the tuple's type code classifications.</td><tr>
<tr><td>AddressTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains the tuple's type code classifications subcategory.</td><tr>
<tr><td>AddressTypeSourceCodeId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td><tr>
<tr><td>AddressTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td><tr>
<tr><td>AddressTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td><tr>
<tr><td>AddressTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td><tr>
<tr><td>AddressTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td><tr>
<tr><td>AddressTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td><tr>  
<tr><td>AddressTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td><tr>
</table>