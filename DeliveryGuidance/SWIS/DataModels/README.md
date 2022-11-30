# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels#introduction)
* [Subject Area Model](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels#subject-area-model)
* [Data Domains](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels#data-domains)
* [Logical / Physical Data Model](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels#logical--physical-data-model)
* [How to leverage the Social Service Data Model as designed](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels#how-to-leverage-the-social-service-data-model-as-designed)
# Introduction
The Social Service IP data model has been constructed following a top-down approach.
From a high-level perspective, the approach follows the steps described below.

- Collecting the requirements, user journeys and identifying the KPIs.
- Identify and design the Subject Area Model (SAM).
- Identify and design the Data Domain for each of the Subject Areas.
- Identify and design the Logical / Physical Data Model for each of the Data Domains
# Subject Area Model
The Subject Area Model (SAM) is a high-level classification of data representing a group of concepts about topics that are of interest to the Organization. The Subject Area Model provides the foundational structure for the data model. The model is developed by expanding the Subjects Area Model rather than approaching the business problem from an application or data systems perspective. 
To conclude, the approach taken leverages data which is an interest of the Organization to build the Data Model foundations to deliver the necessary analytics. 

The documentation of the Subject Area can be found at the [link](SubjectAreaModel.md)
# Data Domains
When compared with the Subject Area, the data domains represent the data context at a lower level of abstraction. This technique helps define the specific bounded context within the Subject Area hence allowing the definition of the tables and their relationship within the Social Services data model. The table below specifies the data domains identified for the Social Services data model.

| Domain        | Description         | Link to additional documentation |
| -------------- |---------------------|:-----:|
| Pupil   |This domain contains information regarding a pupil. A pupil is a child or young person in school or in charge of a tutor or instructor.| [Link](DataModelLowLevelDocumentatioPupil.md)|
| Person   | This domain contains information regarding a person. A person is human being as defined by an institution | [Link](DataModelLowLevelDocumentatioPerson.md)|
| Institution   | This domain contains information regarding an institution. An institution is an established organization or corporation (such as City Governments, Education Systems, Financial Systems, universities etc.), especially of a public character.| [Link](DataModelLowLevelDocumentatioInstitution.md)|
| Document   | This domain contains information regarding the document. A document is written or printed paper furnishing information, evidence, or a computer data file, especially with formatted text.| [Link](DataModelLowLevelDocumentatioDocument.md)|| Data Domain   | Documentation listing the Data Domains and tables together with their individual purpose.| [Link](TablesDetails.md)|
| Event   |  This domain contains information regarding events. An event is anything which is an interest to the organization.| [Link](DataModelLowLevelDocumentatioEvent.md)|
| Address   |This domain contains information regarding addresses. An address is a particular location where someone lives or an organization is situated. | [Link](DataModelLowLevelDocumentatioAddress.md)|
# Logical / Physical Data Model
The Logical / Physical Data Model (LDM / PDM) illustrates the Social Service IP low-level relational database objects implemented in the last productionised database incarnation. The data model includes all the database artefacts and relationships among them and other objects required for performance-related goals, such as indexes, constraint definitions, linking tables, partitioned tables or clusters. 

The pictorial showing the overall data model can be found at this [link](LogicalPhysicalDataModel.md) to obtain more detailed information on the Social Service IP Logical / Physical Data Model (LDM / PDM).

## How to leverage the Social Service Data Model as designed
The section at this [link](HowToUseThePhysicalDataModel.md) provides a detailed overview of the Social Sevice Data Model patterns and how to leverage them per design. The concepts covered on this page are the following:
- Data Model tables patterns
- Data Model Temporality pattern
- Data Model reference data usage and possible extensions of the model
- Slow Change Dimension (SCD2)
- Data Population logic for a new incarnation of the model