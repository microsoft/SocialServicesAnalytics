# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#data-model-table-columns-and-taxonomies)
    * [Table Institution (TblInstitution)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#this-is-the-main-table-of-the-institution-domain-technical-name-tblinstitution)
    * [Table Institution To Metric (TblInstitutionToMetric)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-linking-the-institution-to-metric-type-table-technical-name-tblinstitutiontometric)
    * [Table Institution To Metric Type (TblInstitutionMetricType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-contains-the-metadata-definig-the-type-of-metrics-technical-name-tblinstitutionmetrictype)
    * [Table School To Sponsor (TblSchoolToSponsor)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-linking-and-institution-of-type-school-to-sponsor-type-data-technical-name-tblschooltosponsor)
    * [Table School To Sponsor Type (TblSchoolSponsorType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-contain-th-possible-sponsor-for-an-institution-of-type-school-technical-name-tblschoolsponsortype)
    * [Table Institution To Institution Type (TblInstitutionToInstitutionType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-defining-the-type-of-institution-technical-name-tblinstitutiontoinstitutiontype)
    * [Table Institution Type (TblInstitutionType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-conatainin-the-metadata-defining-the-types-of-institutions-technical-name-tblinstitutiontype)
    * [Table Institution To Status (TblInstitutionToStatus)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-defining-the-status-for-an-institution-technical-name-tblinstitutiontostatus)
    * [Table Institution To Status Type (TblInstitutionStatusType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-containing-the-possible-statuses-for-an-institution-technical-name-tblinstitutionstatustype)
    * [Table DocInstitution To Address (TblInstitutionToAddress)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-linking-the-institution-to-address-table-technical-name-tblinstitutiontoaddress)
    * [Table Institution History (TblInstitutionHistory)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioInstitution.md#the-table-holding-the-full-history-of-the-institution-table-technical-name-tblinstitutionhistory)
# Introduction
This section describes all the tables comprising the Institution Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.

# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Institution Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Institution_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">

# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Institution Data Domain tables.

## This is the main table of the Institution Domain, technical name TblInstitution 
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field which contains a unique identifier for the institution entity.</td></tr>
    <tr><td>InstitutionURN</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>Schools Unique Reference Number (URN) This is the unique reference number allocated to all schools by Edubase. It can be found, for example, at the top of the school's OfSTED report or in the DCSF Edubase database. This is a 6 digit field starting with a 1 for English establishments or a 4 for Welsh establishments.</td></tr>
    <tr><td>InstitutionDFE</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the Department for education unique numeric identifier for the school. The DfE number is a seven-digit
number made up of two numbers, the three-digit Local Authority (LA) number and the four-digit establishment number.</td></tr>
    <tr><td>InstitutionName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>Name of the institution</td></tr>
    <tr><td>InstitutionPhase</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>Across the UK there are five stages of education: early years, primary, secondary, Further Education (FE) and Higher Education (HE). Education is compulsory for all children between the ages of 5 (4 in Northern Ireland) and 16.</td></tr>
    <tr><td>InstitutionAgeRange</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information on the school age range.</td></tr>
    <tr><td>InstitutionSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the Department for education unique numeric identifier for the school. The DfE number is a seven-digit</td></tr>
    <tr><td>InstitutionSourceKey</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's natural key for source.</td></tr>
    <tr><td>InstitutionRowInsertionDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td></tr>
    <tr><td>InstitutionDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>InstitutionTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>InstitutionToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
</table>
<br>

## The table linking the Institution to metric type table, technical name TblInstitutionToMetric
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>InstitutionMetricTypeId</td><td>INT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service Data Model.</td></tr>
    <tr><td>InstitutionToMetricValue</td><td>INT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains the numeric information for the metric.</td></tr>
    <tr><td>InstitutionToMetricSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionToMetricRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionToMetricDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionToMetricValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>InstitutionToMetricValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>InstitutionToMetricTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>InstitutionToMetricTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>InstitutionToMetricCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table contains the metadata definig the type of metrics, technical name TblInstitutionMetricType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionMetricTypeId</td><td>INT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>InstitutionMetricTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>InstitutionMetricTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>InstitutionMetricTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>InstitutionMetricTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionMetricTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>InstitutionMetricTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>InstitutionMetricTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionMetricTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionMetricTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>InstitutionMetricTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table linking and Institution of type school to sponsor type data, technical name TblSchoolToSponsor
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>SchoolSponsorTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service Data Model.</td></tr>
    <tr><td>SchoolToSponsorSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>SchoolToSponsorRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td></tr>
    <tr><td>SchoolToSponsorDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>SchoolToSponsorValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>SchoolToSponsorValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>SchoolToSponsorTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>SchoolToSponsorTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>SchoolToSponsorCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table contain th possible sponsor for an Institution of type school, technical name TblSchoolSponsorType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>SchoolSponsorTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>SchoolSponsorTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>SchoolSponsorTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>SchoolSponsorTypeSubGroup</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>SchoolSponsorTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>SchoolSponsorTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>SchoolSponsorTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>SchoolSponsorTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>SchoolSponsorTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>SchoolSponsorTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact</td></tr>
    <tr><td>SchoolSponsorTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table defining the type of Institution, technical name TblInstitutionToInstitutionType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>InstitutionTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service Data Model.</td></tr>
    <tr><td>InstitutionToInstitutionTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionToInstitutionTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionToInstitutionTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionToInstitutionTypeValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>InstitutionToInstitutionTypeValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>InstitutionToInstitutionTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>InstitutionToInstitutionTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>InstitutionToInstitutionTypeCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table conatainin the metadata defining the types of Institutions, technical name TblInstitutionType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>InstitutionTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>InstitutionTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>InstitutionTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>InstitutionTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>InstitutionTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>InstitutionTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>InstitutionTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table defining the status for an Institution, technical name TblInstitutionToStatus
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>InstitutionStatusTypeId</td><td>INT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Services Data Model.</td></tr>
    <tr><td>InstitutionToStatusFlag</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the numeric information indicating the status of the tuple.</td></tr>
    <tr><td>InstitutionToStatusSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionToStatusRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the Social Services Data Model.</td></tr>
    <tr><td>InstitutionToStatusDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionToStatusValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>InstitutionToStatusValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>InstitutionToStatusTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>InstitutionToStatusTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>InstitutionToStatusCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table containing the possible statuses for an Institution, technical name TblInstitutionStatusType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionStatusTypeId</td><td>INT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>InstitutionStatusTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>InstitutionStatusTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>InstitutionTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>InstitutionStatusTypeTransactionSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionStatusTypeInternalCode</td><td> VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>InstitutionStatusTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>InstitutionTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionStatusTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionStatusTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>InstitutionStatusTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table linking the Institution to Address table, technical name TblInstitutionToAddress
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>AddressId</td><td>BIGINT</td><td>Foreign Key</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the address entity.</td><tr>            
<tr><td>InstitutionId</td><td>BIGINT</td><td>Foreign Key</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td><tr>
<tr><td>EventId</td><td>BIGINT</td><td>Foreign Key</td><td>NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td><tr>
<tr><td>AddressTypeId</td><td>BIGINT</td><td>Foreign Key</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service schema.</td><tr>
<tr><td>InstitutionToAddressSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td><tr>
<tr><td>InstitutionToAddressRowInsertedDate/td><td>DATETIME</td><td>Foreign Key</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td><tr>
<tr><td>InstitutionToAddressDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td><tr>
<tr><td>InstitutionToAddressTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td><tr>  
<tr><td>InstitutionToAddressTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td><tr>
<tr><td>InstitutionToAddressCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td><tr>
</table>
<br>

## The table holding the full history of the Institution table, technical name TblInstitutionHistory
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>InstitutionURN</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>Schools Unique Reference Number (URN) This is the unique reference number allocated to all schools by Edubase. It can be found, for example, at the top of the school's OfSTED report or in the DCSF Edubase database. This is a 6 digit field starting with a 1 for English establishments or a 4 for Welsh establishments</td></tr>
    <tr><td>InstitutionDFE</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the Department for education unique numeric identifier for the school. The DfE number is a seven-digit
number made up of two numbers, the three-digit Local Authority (LA) number and the four-digit establishment numbe</td></tr>
    <tr><td>InstitutionName</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the institution name.</td></tr>
    <tr><td>InstitutionPhase</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>Across the UK there are five stages of education: early years, primary, secondary, Further Education (FE) and Higher Education (HE). Education is compulsory for all children between the ages of 5 (4 in Northern Ireland) and 16.</td></tr>
    <tr><td>InstitutionAgeRange</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains information on the school age range.</td></tr>
    <tr><td>InstitutionSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>InstitutionSourceKey</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's natural key for source.</td></tr>
    <tr><td>InstitutionRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>InstitutionDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>InstitutionTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>InstitutionTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>InstitutionToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical attribute contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table</li></ul></td></tr>
    </td><tr>
</table>
<br>