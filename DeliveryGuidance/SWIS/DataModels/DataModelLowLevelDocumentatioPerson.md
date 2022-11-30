# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#data-model-table-columns-and-taxonomies)
    * [Table Person (TblPerson)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-main-person-table-technical-name-tblperson)
    * [Table Person To Name Change (TblPersonToNameChange)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-linking-the-person-name-change-details-to-the-person-technical-name-tblpersontonamechange)
    * [Table Person Name Change (TblPersonNameChange)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-containing-the-name-change-details-for-the-person-technical-name-tblpersonnamechange)
    * [Table Person To Ethnicity and Linguistics (TblPersonToEthnoLinguistic)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-linking-the-person-ethicity-and-linguistice-details-to-the-person-technical-name-tblpersontoethnolinguistic)
    * [Table Person Ethnicity and Linguistics Type (TblEthnoLinguisticType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-containing-all-the-possible-linguistice-details-types-for-a-person-technical-name-tblethnolinguistictype)
    * [Table Person To Pupil (TblPersonToPupil)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-linking-the-person-related-details-for-the-pupil-details-technical-name-tblpersontopupil)
    * [Table Person To Institution (TblPersonToInstitution)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-linking-the-person-to-the-related-institution-where-it-operates-technical-name-tblpersontoinstitution)
    * [Table Person Role Type (TblPersonRoleType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-containing-possible-all-the-possible-roles-a-person-can-cover-within-an-institution-technical-name-tblpersonroletype)
    * [Table Person To Status (TblPersonToStatus)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-linking-the-person-to-the-related-status-technical-name-tblpersontostatus)
    * [Table Person Status Type (TblPersonStatusType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-containing-possible-all-the-possible-statutes-a-person-can-fall-under-technical-name-tblpersonstatustype)
    * [Table Person History (TblPersonHistory)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPerson.md#the-table-holding-the-full-history-of-the-person-main-table-technical-name-tblpersonhistory)
# Introduction
This section describes all the tables comprising the Person Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.

# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Person Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Person_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">

# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Person Data Domain tables.

## The main Person table, technical name TblPerson
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field which contains a unique identifier for the person entity.</td></tr>
    <tr><td>PersonMdmId</td><td>NUMERIC (18)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the Master Data Management (MDM), Unique Identifier (UID) and used when a person record is uniquely identifiable in different systems.</td></tr>
    <tr><td>PersonTitle</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person title.</td></tr>
    <tr><td>PersonForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person forename.</td></tr>
    <tr><td>PersonMiddleName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person middle name.</td></tr>
    <tr><td>PersonSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person surname.</td></tr>
    <tr><td>PersonKnownBy</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person nickname.</td></tr>
    <tr><td>PersonLegalForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal forename.</td></tr>
    <tr><td>PersonLegalSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal surname.</td></tr>
    <tr><td>PersonGender</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person gender.</td></tr>
    <tr><td>PersonDateOfBirth</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person date of birth.</td></tr>
    <tr><td>PersonDateOfDeath</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains information regarding the person date of death.</td></tr>
    <tr><td>PersonSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonSourceKey</td><td>NUMERIC (18)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's natural key for source.</td></tr>
    <tr><td>PersonChecksum</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains information utilised during the data loads to compare data sets and avoid storing duplicates.</td></tr>
    <tr><td>PersonActive</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the boolean value (1: true or 0: false) defining if the person's tuple is active. </td></tr>
    <tr><td>PersonRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>PersonTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
</table>
<br>

## The table linking the Person Name Change details to the Person, technical name TblPersonToNameChange
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>PersonNameChangeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person name change entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr
    <tr><td>PersonToNameChangeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonToNameChangeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>  
    <tr><td>PersonToNameChangeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonToNameChangeValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonToNameChangeValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world</td></tr>
    <tr><td>PersonToNameChangeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PersonToNameChangeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToNameChangeCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

# The table containing the Name Change details for the Person, technical name TblPersonNameChange
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonNameChangeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field which contains a unique identifier for the person name change entity.</td></tr>
    <tr><td>PersonNameChangeTitle</td><td>VARCHAR (50)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person title.</td></tr>
    <tr><td>PersonNameChangeForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person forename.</td></tr>
    <tr><td>PersonNameChangeMiddleName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person middle name.</td></tr>
    <tr><td>PersonNameChangeSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person surname.</td></tr>
    <tr><td>PersonNameChangeLegalForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal forename.</td></tr>
    <tr><td>PersonNameChangeLegalSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal surname.</td></tr>
    <tr><td>PersonNameChangeChecksum</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains information utilised during the data loads to compare data sets and avoid storing duplicates.</td></tr>
    <tr><td>PersonNameChangeSourceChangeId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonNameChangeSourceKey</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's natural key for source.</td></tr>
    <tr><td>PersonNameChangeTransactionSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonNameChangeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td></tr>
    <tr><td>PersonNameChangeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonNameChangeValidStartdate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonNameChangeValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PersonNameChangeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PersonNameChangeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonNameChangeToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
</table>
<br>

## The table linking the Person Ethicity and Linguistice details to the Person, technical name TblPersonToEthnoLinguistic
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>EthnoLinguisticTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Services Data Model.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>PersonToEthnoLinguisticSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonToEthnoLinguisticRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonToEthnoLinguisticDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonToEthnoLinguisticValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonToEthnoLinguisticValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PersonToEthnoLinguisticTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>PersonToEthnoLinguisticTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToEthnoLinguisticCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 </td></tr>
</table>
<br>

## The table containing all the possible Linguistice details types for a Person, technical name TblEthnoLinguisticType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EthnoLinguisticTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EthnoLinguisticTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>EthnoLinguisticTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EthnoLinguisticTypeSubGroup</td><td>VARCHAR (70) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EthnoLinguisticTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EthnoLinguisticTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EthnoLinguisticTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EthnoLinguisticTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EthnoLinguisticTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EthnoLinguisticTypeTransactionStartDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>EthnoLinguisticTypeTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>
    
## The table linking the Person related details for the Pupil details, technical name TblPersonToPupil
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the pupil entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is a technical field which contains a unique identifier for the event entity.</td></tr>
    <tr><td>PersonToPupilSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonToPupilRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonToPupilDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonToPupilTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>PersonToPupilTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToPupilCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table linking the Person to the related institution where it operates, technical name TblPersonToInstitution
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>PersonRoleTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service Data Model.</td></tr>
    <tr><td>PersonToInstitutionSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonToInstitutionRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td></td></tr>
    <tr><td>PersonToInstitutionDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonToInstitutionValidStartDate</td><td>DATETIME </td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonToInstitutionValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PersonToInstitutionTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PersonToInstitutionTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToInstitutionCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table containing possible all the possible roles a person can cover within an institution, technical name TblPersonRoleType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonRoleTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>PersonRoleType_Description</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>PersonRoleTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>PersonRoleTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>PersonRoleTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonRoleTypeInternalCode</td><td>VARCHAR (60) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>PersonRoleTypeExternalCode</td><td>VARCHAR (60) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>PersonRoleTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonRoleTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonRoleTypeTransactionStartDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>PersonRoleTypeTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
 </table>
<br>

## The table linking the Person to the related status, technical name TblPersonToStatus
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>PersonStatusTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Servces Data Model.</td></tr>
    <tr><td>PersonToStatusStatusFlag</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the numeric information indicating the status of the tuple.</td></tr>
    <tr><td>PersonToStatusSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonToStatusRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonToStatusDeleted</td><td>DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonToStatusValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonToStatusValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PersonToStatusTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td> NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>   
    <tr><td>PersonToStatusTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToStatusCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>    

## The table containing possible all the possible statutes a person can fall under, technical name TblPersonStatusType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonStatusTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td> This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>PersonStatusTypeDescription</td><td>VARCHAR (70) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>PersonStatusTypeGroup</td><td>VARCHAR (70) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>PersonStatusTypeSubGroup</td><td>VARCHAR (70) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>PersonStatusTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonStatusTypeInternalCode</td><td>VARCHAR (60) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>PersonStatusTypeExternalCode</td><td>VARCHAR (60) </td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>PersonStatusTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonStatusTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonStatusTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PersonStatusTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table holding the full history of the Person main table, technical name TblPersonHistory
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>PersonMdmId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the Master Data Management (MDM), Unique Identifier (UID) and used when a person record is uniquely identifiable in different systems.</td></tr>
    <tr><td>PersonTitle</td><td>VARCHAR (50)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person title.</td></tr>
    <tr><td>PersonForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person forename.</td></tr>
    <tr><td>PersonMiddleName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person middle name.</td></tr>
    <tr><td>PersonSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person surname.</td></tr>
    <tr><td>PersonKnownBy</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person nickname.</td></tr>
    <tr><td>PersonLegalForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal forename.</td></tr>
    <tr><td>PersonLegalSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal surname.</td></tr>
    <tr><td>PersonGender</td><td>VARCHAR (50)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person gender.</td></tr>
    <tr><td>PersonDateOfBirth</td><td>DATE</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person date of birth.</td></tr>
    <tr><td>PersonDateOfDeath</td><td>DATE</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person date of death.</td></tr>
    <tr><td>PersonSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonSourceKey</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's natural key for source.</td></tr>
    <tr><td>PersonChecksum</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains information utilised during the data loads to compare data sets and avoid storing duplicates.</td></tr>
    <tr><td>PersonActive</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the boolean value (1: true or 0: false) defining if the person's tuple is active. </td></tr>
    <tr><td>PersonRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>PersonTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PersonToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><il>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
</table>
<br>

## The table holding the full history of the Person Name Change table, technical name TblPersonNameChangeHistory
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PersonNameChangeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field which contains a unique identifier for the person name change entity.</td></tr>
    <tr><td>PersonNameChangeTitle</td><td>VARCHAR (50)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person title.</td></tr>
    <tr><td>PersonNameChangeForename</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person forename.</td></tr>
    <tr><td>PersonNameChangeMiddleName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person middle name.</td></tr>
    <tr><td>PersonNameChangeSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person surname.</td></tr>
    <tr><td>PersonNameChangeLegalForename</td><td> VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal forename.</td></tr>
    <tr><td>PersonNameChangeLegalSurname</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information regarding the person legal surname.</td></tr>
    <tr><td>PersonNameChangeChecksum</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains information utilised during the data loads to compare data sets and avoid storing duplicates.</td></tr>
    <tr><td>PersonNameChangeSourceChangeId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonNameChangeSourceKey</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td></tr>
    <tr><td>PersonNameChangeTransactionSourceId</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PersonNameChangeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PersonNameChangeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PersonNameChangeValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PersonNameChangeValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PersonNameChangeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PersonNameChangeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>    
    <tr><td>PersonNameChangeToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
</table>
<br>    