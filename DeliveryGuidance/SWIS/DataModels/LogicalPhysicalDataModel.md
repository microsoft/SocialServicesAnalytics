# Introduction
This section provides an overview of the Social Services IP logical/physical data model. The data model positions the data into the context necessary to generate information out of data. The built data model falls within the bounded context of the Social Services and School domains.

# The data model pictorial
This section contains the Social Service Data Model pictorial showing the data domain, tables and keys (e.g., primary and foreign keys). By clicking on the data model image, a new window will open, giving the possibility to zoom in and out of the picture for better readability.
<img src="https://github.com/microsoft/SocialServicesIP/blob/6558d86bd81ddf6dd66b7974faf859ea5d149e7f/DeliveryGuidance/SWIS/DataModels/img/SSIP%20Data%20Model%20(Tables)%20V%200%201.jpg" width="80%" height="80%">

Has shown in the pictorial above, the data model in his physical incarnation has been clustered by the six (6) Data Domains. These areas are described in the table below.
| Subject Area | Domain        | Description         | Link to the tables low-level documentation |
| -------------- | -------------- |---------------------|:-----:|
|PARTY| Pupil   |This domain contains information regarding a pupil. A pupil is a child or young person in school or in charge of a tutor or instructor.| [Link](DataModelLowLevelDocumentatioPupil.md)|
|PARTY| Person   | This domain contains information regarding a person. A person is human being as defined by an institution | [Link](DataModelLowLevelDocumentatioPerson.md)|
|PARTY| Institution   | This domain contains information regarding an institution. An institution is an established organization or corporation (such as City Governments, Education Systems, Financial Systems, universities etc.), especially of a public character.| [Link](DataModelLowLevelDocumentatioInstitution.md)|
|DOCUMENT| Document   | This domain contains information regarding the document. A document is written or printed paper furnishing information, evidence, or a computer data file, especially with formatted text.| [Link](DataModelLowLevelDocumentatioDocument.md)|| Data Domain   | Documentation listing the Data Domains and tables together with their individual purpose.| [Link](TablesDetails.md)|
|EVENT| Event   |  This domain contains information regarding events. An event is anything which is an interest to the organization.| [Link](DataModelLowLevelDocumentatioEvent.md)|
|LOCATION| Address   |This domain contains information regarding addresses. An address is a particular location where someone lives or an organization is situated. | [Link](DataModelLowLevelDocumentatioAddress.md)|

# Tables and Definitions of the Pupil data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupil</td><td>This table contains current demographic information about pupils.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilToStatus</td><td>This table holds the relationship between the pupil and his status at a particular point in time.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilToMetric</td><td>This table contains information concerning a pupil event that can be leveraged as numbers, leading to calculations gathered for a specific metric. Metric examples are the number of exclusion dates for a pupil in a particular school.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilMetricType</td><td>This table contains information regarding a division within a system of classification for information that, concerning an pupil event, can be leveraged as numbers, leading to calculations gathered for a specific metric.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilAttendance</td><td>This table contains information about a pupil's school attendance at a particular point in time.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilAttendanceType</td><td>This table contains the school attendance classification. Classifications examples are morning mark and afternoon mark.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblAttendanceSummaryType</td><td>This table contains the definitions outlined at the school entity level granularity on the codes, and their meanings used to track the pupil's presence and absence at school.</td></tr>
<tr><td>PARTY</td><td>Pupil</td><td>TblPupilHistory</td><td>This table contains historical demographic information about pupils.</td></tr>
</table>

# Tables and Definitions of the Institution data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitution</td><td>This table contains current information regarding an institution. Institutions are a social structure in which people cooperate and influence people's behaviour and how they live. An institution has a purpose. Institutions are permanent, which means that they do not end when one person is gone. An institution has rules and can enforce rules of human behaviour. An example of an institution is a school.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionToInstitutionType</td><td>This table contains information concerning the category of the institution.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionType</td><td>This table contains an institution's classification. Institutions are a social structure in which people cooperate and influence people's behaviour and how they live. An institution has a purpose. Institutions are permanent, which means that they do not end when one person is gone. An institution has rules and can enforce rules of human behaviour. An example of an institution is a school.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionToMetric</td><td>This table contains information concerning an event that can be leveraged as numbers, leading to calculations gathered for a specific metric. Metric examples are the number of pupils attending a school within a particular year or the grades given by OFSTED regarding a school for one particular year.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionMetricType</td><td>This table contains information regarding a division within a system of classification for information that, concerning an institution event, can be leveraged as numbers, leading to calculations gathered for a specific metric.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionToAddress</td><td>This table connects the institution to its relevant address.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionStatusType</td><td>This table contains the situation for an institution at a particular time.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionToStatus</td><td>This table contains the situation for an institution at a particular time.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblSchoolSponsorType</td><td>This table contains the school sponsors classification.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblSchoolToSponsor</td><td>This table holds the relationship between the school his sponsor.</td></tr>
<tr><td>PARTY</td><td>Institution</td><td>TblInstitutionHistory</td><td>This table contains historical information regarding an institution. Institutions are a social structure in which people cooperate and influence people's behaviour and how they live. An institution has a purpose. Institutions are permanent, which means that they do not end when one person is gone. An institution has rules and can enforce rules of human behaviour. An example of an institution is a school.</td></tr>
</table>

# Tables and Definitions of the Person data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>

<tr><td> PARTY</td><td>Person</td><td>TblPerson</td><td>This table contains current demographic information about persons. Persons can be one or more of the following types:<br>
  <ul><li>Social Worker</li>
  <li>School Pastoral Lead</li>
  <li>Parent or Carer</li>
  <li>Headteacher of the School</li></ul></td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonRoleType</td><td>This table contains a person's classification. Classifications examples are Social Worker, Headmaster, teacher etc.</td></tr>

<tr><td>PARTY</td><td>Person</td><td>TblPersonNameChange</td><td>This entity contains current information about a persons name change.Name change generally refers to a person's legal act of adopting a new name different from their current one.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonToNameChange</td><td>This table contains the relationship between a person their name change.Name change generally refers to a person's legal act of adopting a new name different from their current one.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonToStatus</td><td>This table holds the relationship between the person and his status at a particular point in time.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonStatusType</td><td>This table contains information regarding the cause, explanation, or justification for a situation at a particular time for a person and/or a pupil.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonToPupil</td><td>This table holds the relationship between the person and his pupil. The pupil subtype has the additional attributes required by the pupil entity.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonToEthnoLinguistic</td><td>This table contains the relationship between a person their relevant ethnicity and/or native language.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblEthnoLinguisticType</td><td>This table contains the information regarding an individual ethnicity or ethnic group and native language.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonToInstitution</td><td>This table contains the relationship between a person the institution (like a school) attend at a particular point in time.	This entity contains the relationship between a person the institution (like a school) attend at a particular point in time.</td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonHistory</td><td>This table contains historical demographic information about persons. Persons can be one or more of the following types:<br>
        <ul><li>Social Worker</li>
        <li>School Pastoral Lead</li>
        <li>Parent or Carer</li>
        <li>Headteacher of the School</li></ul></td></tr>
<tr><td>PARTY</td><td>Person</td><td>TblPersonNameChangeHistory</td><td>This table contains historical information about a persons name change. Name change generally refers to a person's legal act of adopting a new name different from their current one.</td></tr>
</table>

# Tables and Definitions of the Address data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>
<tr><td>LOCATION</td><td>Address</td><td>TblAddress</td><td>This table contains the current physical address concerning a party.</td></tr>
<tr><td>LOCATION</td><td>Address</td><td>TblAddressType</td><td>This table contains the definitions and codes defining the type of addresses. For example, postal address, physical postal address virtual postal address, electronic address, commercial address etc.</td></tr>
<tr><td>LOCATION</td><td>Address</td><td>TblAddressHistory</td><td>This table contains the full history of physical addresses concerning a party.</td></tr>
</table>

# Tables and Definitions of the Event data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEvent</td><td>This entity contains information regarding internal or external situations of business significance to the Social Worker in School initiative. Examples of events may be a student exclusion, student move to another school, a contact, an assessment etc. Events are used to measure the impact of Social Service Workers in schools.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventType</td><td>This table contains the classification for the events. An event is something that happens or is regarded as happening. An occurrence, especially one of some importance. The outcome, issue, or result of anything which is an interest within the Organization.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventStatusType</td><td>This table contains information regarding the cause, explanation, or justification for a situation at a particular time during an event (like an assessment status etc.).	This entity contains information regarding the cause, explanation, or justification for a situation at a particular time during an event (like an assessment status etc.).</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventReasonType</td><td>This table contains information regarding the cause, explanation, or justification for an event (like a contact, a referral etc.).</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventToPupil</td><td>This table contains the relationship between an event and the pupil directly involved in the event.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventToPerson</td><td>This table contains the relationship between an event and the person directly involved in the event.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventToMetric</td><td>This table contains information concerning an event that can be leveraged as numbers, leading to calculations gathered for a specific metric. Example of a metric for an event is the number of days pupils have excluded temporarily from school.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventCategoryType</td><td>This table contains information regarding a division within a system of classification for an event.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventMetricType</td><td>This table contains information regarding a division within a system of classification for information that, concerning an event, can be leveraged as numbers, leading to calculations gathered for a specific metric.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventToInstitution</td><td>This table contains the relationship between an event and the institution attended by the pupil or person directly involved in the event.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventToStatus</td><td>This table holds the relationship between the event and his status at a particular point in time.	This entity holds the relationship between the event and his status at a particular point in time.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventRelationship</td><td>This table contains the connection between events. As an example of this relationship can be the connection between a social service assessment and a referral.</td></tr>
<tr><td>EVENT</td><td>Event</td><td>TblEventRelationshipType</td><td>This table contains the definitions and codes defining the type of relationships between events.</td></tr>
</table>

# Tables and Definitions of the Document data domain
<table align="center" width="90%">
<tr><th align="center">Subject Area</th><th align="center">Domain</th><th align="center">Table Name</th><th align="center">Table Definition</th></tr>
<tr><td>DOCUMENT</td><td>Document</td><td>TblDocumentType</td><td>This table contains physical or electronic documentation submitted to or produced by the social service or other government-relevant institution of interest. It represents information being exchanged between parties and where that information is desired for the SWiS repository.</td></tr>
<tr><td>DOCUMENT</td><td>Document</td><td>TblDocumentumentToEvent</td><td>This table contains the information regarding documents generated as part of social service that event (like the form developed as part of an assessment or a document relevant to a referral).</td></tr>
</table>