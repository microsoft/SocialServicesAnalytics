# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioDocument.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioDocument.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioDocument.md#data-model-table-columns-and-taxonomies)
    * [Table Document To Event (TblDocumentumentToEvent)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioDocument.md#the-table-linking-the-document-to-the-event-technical-name-tbldocumentumenttoevent)
    * [Table Document Type (TblDocumentType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioDocument.md#the-table-specifing-the-type-of-document-technical-name-tbldocumenttype)
# Introduction
This section describes all the tables comprising the Document Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.

# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Document Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Document_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">

# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Document Data Domain tables.
## The table linking the Document to the Event, technical name TblDocumentumentToEvent
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the event table.</td><tr>
<tr><td>DocumentTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social Service schema.</td><tr>
<tr><td>DocumentToEventSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td><tr>
<tr><td>DocumentToEventMarkerID</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the marker of the document.</td><tr>
<tr><td>DocumentToEventPathReference</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the information regarding the path reference (digital physical location) for the document.</td><tr>
<tr><td>DocumentToEventRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the point in time of loading the tuple into the table.</td><tr>
<tr><td>DocumentToEventDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td><tr>
<tr><td>DocumentToEventFormDueDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the date and time of the when the form completion is due.</td><tr>
<tr><td>DocumentToEventFormCompleteDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the form completion date.</td><tr>
<tr><td>DocumentAuthorisedStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's historical transaction started time and date when a document authorization started.</td><tr>
<tr><td>DocumentAuthorisedEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's historical transaction end time of the authorized date of completion of the document.</td><tr>
<tr><td>DocumentToEventFormAuthorisedEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the date and time of the form completion.</td><tr>
<tr><td>DocumentToEventFormStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's historical transaction started time and date when the form started.</td><tr>
<tr><td>DocumentToEventFormEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's historical transaction end time and date of completion of the form.</td><tr>
<tr><td>DocumentToEventValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td><tr>
<tr><td>DocumentToEventValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td><tr>
<tr><td>DocumentToEventTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td><tr>  
<tr><td>DocumentToEventTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td><tr>
<tr><td>DocumentToEventCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td><tr>
</table>
<br>

## The table specifing the type of document, technical name TblDocumentType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
<tr><td>DocumentTypeId</td><td>BIGINT</td><td>Primary key / IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td><tr>
<tr><td>DocumentTypeFileName</td><td>VARCHAR (70)</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the document's name.</td><tr>
<tr><td>DocumentTypeForm</td><td>VARCHAR (70)</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains information on the document type code.</td><tr>
<tr><td>DocumentTypeDescription</td><td>VARCHAR (MAX)</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains the description for the document type.</td><tr>
<tr><td>DocumentTypeGroup</td><td>VARCHAR (70)</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains information regarding the document classifications.</td><tr>
<tr><td>DocumentTypeCreator</td><td>VARCHAR (70)</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains information about the document creator.</td><tr>
<tr><td>DocumentTypeSourceId</td><td>INT</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td><tr>
<tr><td>DocumentTypeSourceKey</td><td>BIGINT</td><td></td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's natural key for source.</td><tr>
<tr><td>DocumentTypeValid</td><td>SMALLINT</td><td></td><td>NULL</td><td>&nbsp;</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td><tr>
<tr><td>DocumentTypeRowInsertedDate</td><td>DATETIME</td><td></td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td><tr>
<tr><td>DocumentTypeDeleted</td><td>DATETIME</td><td></td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td><tr>
<tr><td>DocumentTypeValidStartDate</td><td>DATETIME</td><td></td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td><tr>
<tr><td>DocumentTypeValidEndDate</td><td>DATETIME</td><td></td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td><tr>
<tr><td>DocumentTypeTransactionStartDate</td><td>DATETIME</td><td></td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td><tr>
<tr><td>DocumentTypeTransactionEndDate</td><td>DATETIME</td><td></td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td><tr>
</table>