# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#data-model-table-columns-and-taxonomies)
    * [Table Event (TblEvent)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-main-event-table-technical-name-tblevent)
    * [Table Event Type (TblEventType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifing-the-type-of-event-technical-name-tbleventtype)
    * [Table Event Reason Type (TblEventReasonType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifing-the-reason-type-of-the-event-technical-name-tbleventreasontype)
    * [Table Event Category Type (TblEventCategoryType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifing-the-category-type-of-event-technical-name-tbleventcategorytype)
    * [Table Event To Status (TblEventToStatus)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-linking-the-status-type-to-the-event-technical-name-tbleventtostatus)
    * [Table Event Status Type (TblEventStatusType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifing-the-status-type-of-the-event-technical-name-tbleventstatustype)
    * [Table Event Relationship (TblEventRelationship)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-inner-relationship-between-events-technical-name-tbleventrelationship)
    * [Table Event Relationship Type (TblEventRelationshipType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-type-of-possible-relationship-between-events-technical-name-tbleventrelationshiptype)
    * [Table Event To Metric (TblEventToMetric)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-link-between-the-type-of-metric-and-the-event-technical-name-tbleventtometric)
    * [Table Event Metric Type (TblEventMetricType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-types-of-metric-an-events-can-hold-technical-name-tbleventmetrictype)
    * [Table Event To Pupil (TblEventToPupil)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-relationship-between-a-pupil-and-an-events-what-occurred-to-the-pupil-technical-name-tbleventtopupil)
    * [Table Event To Person (TblEventToPerson)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-relationship-between-a-person-and-an-events-what-occurred-to-the-person-technical-name-tbleventtoperson)
    * [Table Event To Institution (TblEventToInstitution)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioEvent.md#the-table-specifying-the-relationship-between-an-institution-and-an-events-what-occurred-at-that-institution-technical-name-tbleventtoinstitution)

# Introduction
This section describes all the tables comprising the Event Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.


# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Event Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Event_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">


# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Event Data Domain tables.
## The main Event table, technical name TblEvent
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>EventId</td><td>BIGINT</td><td>Primary key / IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field which contains a unique identifier for the event table.</td></tr>
<tr><td>EventTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
<tr><td>EventReasonTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social service schema.</td></tr>
<tr><td>EventCategoryTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
<tr><td>EventSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
<tr><td>EventSourceKey</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's natural key for source.</td></tr>
<tr><td>EventAcademicYear</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains information on the academic year when the event did happen. This column is leveraged directly from the source system.</td></tr>
<tr><td>EventRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the SWiS table.</td></tr>
<tr><td>EventDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
<tr><td>EventValidCreationDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
<tr><td>EventValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
<tr><td>EventValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
<tr><td>EventTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
<tr><td>EventTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifing the type of event, technical name TblEventType

<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>EventTypeId</td><td>BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.
<tr><td>EventTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
<tr><td>EventTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
<tr><td>EventTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
<tr><td>EventTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
<tr><td>EventTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
<tr><td>EventTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
<tr><td>EventTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
<tr><td>EventTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
<tr><td>EventTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
<tr><td>EventTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifing the reason type of the event, technical name TblEventReasonType

<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>EventReasonTypeId</td><td>BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventReasonTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>EventReasonTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EventReasonTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EventReasonTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventReasonTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EventReasonTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EventReasonTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventReasonTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventReasonTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventReasonTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifing the category type of event, technical name TblEventCategoryType

<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventCategoryTypeId</td><td>BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td> NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventCategoryTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>EventCategoryTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EventCategoryTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EventCategoryTypeSourceId</td><td>INT</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventCategoryTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EventCategoryTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EventCategoryTypeRowInsertedDate</td><td>DATETIME</td><td> NULL </td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventCategoryTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventCategoryTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventCategoryTypeTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table linking the status type to the event, technical name TblEventToStatus
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>EventStatusTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
    <tr><td>EventToStatusFlag</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the numeric information indicating the status of the tuple.</td></tr>
    <tr><td>EventToStatusSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventToStatusRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventToStatusDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventToStatusValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventToStatusValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventToStatusTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td> NOT NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventToStatusTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>EventToStatusCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table specifing the status type of the event, technical name TblEventStatusType

<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventStatusTypeId</td><td>  BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventStatusTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>EventStatusTypeGroup</td><td> VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EventStatusTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EventStatusTypeSourceId</td><td> BIGINT</td><td>&nbsp;</td><td>  NULL<td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventStatusTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EventStatusTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EventStatusTypeRowInsertedDate</td><td> DATETIME</td><td>&nbsp;</td><td> NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventStatusTypeDeleted</td><td> DATETIME</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventStatusTypeTransactionStartDate</td><td> DATETIME</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventStatusTypeTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifying the inner relationship between events, technical name TblEventRelationship

<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>EventRelatedId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute contains the reference to the unique numeric identifier of the event participating in the relationship.</td></tr>
    <tr><td>EventRelationshipTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventRelationshipRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventRelationshipDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventRelationshipValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventRelationshipValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventRelationshipTransactionStartDate</td><td> DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventRelationshipTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifying the type of possible relationship between events, technical name TblEventRelationshipType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventRelationshipTypeId</td><td>BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td> NOT NULL<td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventRelationshipTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the description of tuple's type code for the relationship.</td></tr>
    <tr><td>EventRelationshipTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EventRelationshipTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EventRelationshipTypeSourceCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventRelationshipTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code.Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EventRelationshipTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EventRelationshipTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventRelationshipTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventRelationshipTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventRelationshipTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table specifying the link between the type of metric and the event, technical name TblEventToMetric
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>EventMetricTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
    <tr><td>EventToMetricValue</td><td>DECIMAL (12, 9)</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains the numeric information for the metric.</td></tr>
    <tr><td>EventToMetricSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL<td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventToMetricRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL<td>&nbsp;</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventToMetricDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL<td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventToMetricValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventToMetricValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT ULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventToMetricTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventToMetricTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>EventToMetricCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
  </table>
<br>

## The table specifying the types of metric an events can hold, technical name TblEventMetricType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventMetricTypeId</td><td>BIGINT</td><td>Primary Key / IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the unique identifier for the entity.</td></tr>
    <tr><td>EventMetricTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the description of tuple's type code.</td></tr>
    <tr><td>EventMetricTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications.</td></tr>
    <tr><td>EventMetricTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>EventMetricTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventMetricTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>EventMetricTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>EventMetricTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventMetricTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventMetricTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventMetricTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</tdt><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
  </table>
<br>

## The table specifying the relationship between a pupil and an events (what occurred to the pupil), technical name TblEventToPupil
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the pupil entity.</td></tr>
    <tr><td>EventTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
    <tr><td>EventToPupilSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL<td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventToPupilRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventToPupilDeleted</td><td>DATETIME</td><td>&nbsp;</td><td> NOT NULL<td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventToPupilValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventToPupilValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventToPupilTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td> NOT NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventToPupilTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td> NULL<td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>EventToPupilCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
 </table>
<br>

## The table specifying the relationship between a person and an events (what occurred to the person), technical name TblEventToPerson
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>PersonId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the person entity.</td></tr>
    <tr><td>PersonRoleTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Services schema.</td></tr>
    <tr><td>EventToPersonSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventToPersonRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventToPersonDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventToPersonValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventToPersonValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventToPersonTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventToPersonTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>EventToPersonCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table specifying the relationship between an institution and an events (what occurred at that institution), technical name TblEventToInstitution
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the event entity.</td></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is technical fields holding the relationship toward the institution entity.</td></tr>
    <tr><td>EventTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute is a technical field that contains the identifier for the classification entity. This attribute holds the relationship between the facts and his classification within the Social Service schema.</td></tr>
    <tr><td>EventToInstitutionSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>EventToInstitutionRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>EventToInstitutionDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute defines if a tuple has been deleted. The tuple is deleted if the attribute contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>EventToInstitutionValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>EventToInstitutionValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This attribute contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>EventToInstitutionTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>EventToInstitutionTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This attribute contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>EventToInstitutionCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL<td>&nbsp;</td><td>This technical attribute enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>