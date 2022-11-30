# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#introduction)
* [Data model visual detail](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#data-model-visual-detail)
* [Data Model Table, columns and taxonomies](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#data-model-table-columns-and-taxonomies)
    * [Table Pupil (TblPupil)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-main-pupil-table-technical-name-tblpupil)
    * [Table Pupil To Metric (TblPupilToMetric)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-linking-the-metric-to-the-pupil-technical-name-tblpupiltometric)
    * [Table Pupil Metric Type (TblPupilMetricType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-containing-the-metrics-for-the-pupil-technical-name-tblpupilmetrictype)
    * [Table Pupil To Status (TblPupilToStatus)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-linking-the-status-to-the-pupil-technical-name-tblpupiltostatus)
    * [Table Pupil Attendance (TblPupilAttendance)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-capturing-the-pupil-attendance-technical-name-tblpupilattendance)
    * [Table Pupil Attendance Type (TblPupilAttendanceType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-capturing-the-type-of-attendance-for-a-pupil-technical-name-tblpupilattendancetype)
    * [Table Pupil Attendance Summary Type (TblAttendanceSummaryType)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-capturing-the-attendance-for-a-pupil-technical-name-tblattendancesummarytype)
    * [Table Pupil History (TblPupilHistory)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/DataModelLowLevelDocumentatioPupil.md#the-table-holding-the-full-history-of-the-pupil-main-table-technical-name-tblpupilhistory)

# Introduction
This section describes all the tables comprising the Pupil Data Domain of the Social Service IP data model. Not all the tables listed below are part of the current data pipelines. However, during delivery, these tables and relationships have been functionally tested manually, by SQL Scripts, on actual customer data.

# Data model visual detail
This section contains the pictorial detailing the columns and the relationship between the Pupil Data Domain tables and the tables of the other Data Domains of the Social Services Data model.
<img src="https://github.com/microsoft/SocialServicesIP/blob/42190909fcc4e48afa997511b5fd7c9bf3f117b7/DeliveryGuidance/SWIS/DataModels/img/SSIP_Data%20Model_Pupil_Category_V_0_1.jpg" width="90%" height="60%" target = "_self">

# Data Model Table, columns and taxonomies
This section contains all the low-level details of the Pupil Data Domain tables.

## The main Pupil table, technical name TblPupil
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field which contains a unique identifier for the pupil table.</td>
    <tr><td>PupilUPN</td><td>VARCHAR (13)</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains the unique pupil number (UPN). This is a 13-character code. It identifies pupils in the local authority maintained school system.</td>
    <tr><td>PupilCurrent</td><td>BIT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains the boolean value (1: true or 0: false) defining if the record is of a current pupil.</td>
    <tr><td>PupilActive</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the boolean value (1: true or 0: false) defining if the pupil's tuple is active.</td>
    <tr><td>PupilSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td>
    <tr><td>PupilSourceKey</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's natural key for source.</td>
    <tr><td>PupilRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td>
    <tr><td>PupilDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td>
    <tr><td>PupilTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td>
    <tr><td>PupilTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td>
    <tr><td>PupilToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's current situation within the temporality of the schema.Below are the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires deletion and subsequentially to be moved in the History table</li></ul></td>
</table>
<br>

## The table linking the Metric to the Pupil, technical name TblPupilToMetric
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the pupil table.</td></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the institution table.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the event table.</td></tr>
    <tr><td>PupilMetricTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social Service IP Data Model.</td></tr>
    <tr><td>PupilToMetricValue</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the numeric information for the metric.</td></tr>
    <tr><td>PupilToMetricSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PupilToMetricRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PupilToMetricDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PupilToMetricValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PupilToMetricValidEndDate</td><td>  DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PupilToMetricTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>PupilToMetricTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PupilToMetricCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical column enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table containing the metrics for the Pupil, technical name TblPupilMetricType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilMetricTypeId</td><td>BIGINT</td><td>IDENTITY (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td></tr>
    <tr><td>PupilMetricTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the description of tuple's type code.</td></tr>
    <tr><td>PupilMetricTypeGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the tuple's type code classifications.</td></tr>
    <tr><td>PupilMetricTypeSubGroup</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>PupilMetricTypeSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PupilMetricTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>PupilMetricTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>PupilMetricTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PupilMetricTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PupilMetricTypeTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PupilMetricTypeTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table linking the Status to the Pupil, technical name TblPupilToStatus
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the pupil table.</td></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the institution table.</td></tr>
    <tr><td>EventId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the event table.</td></tr>
    <tr><td>PersonStatusTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the identifier for the classification table. This column holds the relationship between the facts and his classification within the Social Services Data Model.</td></tr>
    <tr><td>PupilToStatusFlag</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the numeric information indicating the status of the tuple.</td></tr>
    <tr><td>PupilToStatusSourceId</td><td>INT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PupilToStatusRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PupilToStatusDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PupilToStatusValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PupilToStatusValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PupilToStatusTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact. </td></tr>
    <tr><td>PupilToStatusTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PupilToStatusCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical column enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table capturing the Pupil attendance, technical name TblPupilAttendance
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the pupil table.</td></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the institution table.</td></tr>
    <tr><td>PupilAttendanceTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td></tr>
    <tr><td>AttendanceSummaryTypeId</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td></tr>
    <tr><td>PupilAttendanceMarkDescription</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the description of tuple's type code.</td></tr>
    <tr><td>PupilAttendanceSummarySourceId</td><td>CHAR (18)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PupilAttendanceRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the point in time of loading the tuple into the table.</td></tr>
    <tr><td>PupilAttendanceDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PupilAttendanceValidStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the beginning of the period during which the tuple started been valid in the real world.</td></tr>
    <tr><td>PupilAttendanceValidEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains date and time details concerning the end of the period during which the tuple stoped been valid in the real world.</td></tr>
    <tr><td>PupilAttendanceTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr>
    <tr><td>PupilAttendanceTransactionEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
    <tr><td>PupilAttendanceCounter</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This technical column enables loading tuples on which the primary key fields may be null ( -1 ) or empty ( 0 ).</td></tr>
</table>
<br>

## The table capturing the type of attendance for a Pupil, technical name TblPupilAttendanceType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilAttendanceTypeId</td><td>BIGINT</td><td>IDtable (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td></tr>
    <tr><td>PupilAttendanceTypeDescription</td><td>VARCHAR (70)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the description of tuple's type code.</td></tr>
    <tr><td>PupilAttendanceTypeGroup</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This column contains the tuple's type code classifications.</td></tr>
    <tr><td>PupilAttendanceTypeSubGroup</td><td>VARCHAR (60)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This column contains the tuple's type code classifications subcategory.</td></tr>
    <tr><td>PupilAttendanceTypeSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>
    <tr><td>PupilAttendanceTypeInternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the internal code of tuple's type code. Internal codes reflect code coming raw from the source, and is not usually explicitly tailored for business users. Technical users usually leverage these codes.</td></tr>
    <tr><td>PupilAttendanceTypeExternalCode</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the external code of tuple's type code. The external code is a code tailored explicitly to data products specifically for business users.</td></tr>
    <tr><td>PupilAttendanceTypeRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the SWiS table.</td></tr>     
    <tr><td>PupilAttendanceTypeDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>
    <tr><td>PupilAttendanceTypeTransactionStartDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.</td></tr>
    <tr><td>PupilAttendanceTypeTransactionEndDate</td><td> DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table capturing the attendance for a Pupil, technical name TblAttendanceSummaryType
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Identity</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>InstitutionId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the institution table.</td></tr>   
    <tr><td>AttendanceSummaryTypeId</td><td>BIGINT</td><td>IDtable (1, 1)</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is a technical field that contains the unique identifier for the table.</td></tr>   
    <tr><td>InstitutionSourceKey</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's natural key for source.</td></tr>   
    <tr><td>Code</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the code used to mark the pupil's attendance or absence in schools.</td></tr>   
    <tr><td>Meaning</td><td>VARCHAR (60)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains the global detail on the meaning of the summary attendance code.</td></tr>   
    <tr><td>StatutoryMeaning</td><td>VARCHAR (70)</td><td>&nbsp;</td><td> NULL</td><td>&nbsp;</td><td>This technical column contains details on the summary attendance code's meaning from the statutory point of view. </td></tr>   
    <tr><td>SchoolMeaning</td><td>VARCHAR (MAX)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the summary attendance code's meaning from the school point of view. School's have a different definition for each code.</td></tr>   
    <tr><td>TransactionalStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains historical details on the tuple's transaction start time and date, which is when a fact was recorded in the database.</td></tr>   
    <tr><td>TransactionalEndDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr>
</table>
<br>

## The table holding the full history of the pupil main table, technical name TblPupilHistory
<table align="center" width="90%">
<tr><th align="center">Column</th><th align="center">Data Type</th><th align="center">Idtable</th><th align="center">Nullable</th><th align="center">Default Value</th><th align="center">Column Definition</th></tr>
    <tr><td>PupilID</td><td>BIGINT</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column is technical fields holding the relationship toward the pupil table.</td></tr>  
    <tr><td>PupilUPN</td><td>VARCHAR (20)</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the unique pupil number (UPN). This is a 13-character code. It identifies pupils in the local authority maintained school system.</td></tr>  
    <tr><td>PupilCurrent</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the boolean value (1: true or 0: false) defining if the record is of a current pupil.</td></tr>  
    <tr><td>PupilActive</td><td>BIT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains the boolean value (1: true or 0: false) defining if the pupil's tuple is active. </td></tr>  
    <tr><td>PupilSourceId</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the unique technical key for source system origination tuple's data.</td></tr>  
    <tr><td>PupilSourceKey</td><td>BIGINT</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's natural key for source.</td></tr>  
    <tr><td>PupilRowInsertedDate</td><td>DATETIME</td><td>&nbsp;</td><td>NULL</td><td>&nbsp;</td><td>This column contains details on the point in time of loading the tuple into the table.</td></tr>  
    <tr><td>PupilDeleted</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>&nbsp;</td><td>This column defines if a tuple has been deleted. The tuple is deleted if the column contains a value different from '31-12-9999 23:59:59.9999' (Until-End-Of-Time).</td></tr>  
    <tr><td>PupilTransactionStartDate</td><td>DATETIME</td><td>&nbsp;</td><td>NOT NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction started date and time when, the source database, recorder the fact.  </td></tr> 
    <tr><td>PupilTransactionEndDate</td><td>DATETIME</td><td>
    &nbsp;</td><td>NULL</td><td>DEFAULT ('31-12-9999 00:00:00.000')</td><td>This column contains details on the tuple's transaction end time and date when the source database's recorded the fact that the tuple wasn't valid anymore.</td></tr> 
    <tr><td>PupilToHistory</td><td>SMALLINT</td><td>&nbsp;</td><td></td>NULL</td><td>&nbsp;</td><td>This technical column contains details on the tuple's current situation within the temporality of the schema.Below the codes defining if a record needs to transient to the historical table or stay in the currently valid temporality of the schema:<br><ul><li>-1 = Not in the History Table</li><li>0 = Requires Moving in the History Table</li><li>1 = Requires to deletion and subsequentially to be moved in the History table.</li></ul></td></tr> 
</table>