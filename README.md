# Social Services IP
>This repository contains the accelerator delivering analytics within the Social Services context. The accelerators generated from an engagement successfully delivered for a UK City Council (Public Sector). The 'Social Worker in School' (ref. [link](https://www.gov.uk/government/news/social-workers-to-work-with-teachers-in-schools)) initiative instituted by the UK Department for Education (DfE) primarily drove the main scope for the delivery engagement. The accelerator KPIs focus on metrics concerning social services events related to children and children/pupils events within schools. The accelerator provides a finite number of  KPIs. However, the flexibility of the data model, provided with the IP, allows the intuitive generation of additional KPIs without the need of extending the data model.
## Social Services IP High-Level Solution Architecture
As shown in the pictorial below, the Social Service IP solution comprises two (2) main components these being:
- Global Data Platform (GDP)
- Social Service Analytics Platform (SSAP)

<img src="https://github.com/microsoft/SocialServicesIP/blob/main/img/Social%20Services%20High%20Level%20Architecture1.jpg" width="60%" height="60%">

The _*Global Data Platform (GDP)*_ solution responds to the need for a centralized data store, including a standard set of services, tools, and governance, all analysis and analytics use cases within Constoso. With this pattern, the data needed for data initiatives is extracted only once from the source system and then disseminated multiple times to consumers. 

The _*Social Service Analytics Platform (SSAP)*_ solution responds to the need for a centralized, scalable data store in which data gets contextualized into a form valuable for extracting measures and insights needed by Contoso on Social Service and Children matters.

The vision is that this approach helps accelerate the development of analytics and advanced analytics initiatives and data products within Constoso as data gets provided in a scalable, controlled, and secure manner. 
## Social Services IP KPIs
Metrics for social services concerning children been:
- Measure 'front-door' activity (service demand overall). Like for example Referrals, Assestments, S47, ICPC and Contacts. 
- Measure plans (a longer temporal visibility). Like for example Child Protection Plan, Child In Need Plan and Child Look After Plan - Children In Care ).
- Measure assessment time scales. 

Metrics for the children and school been:
- Measure levels of school attendance level of absence. 
- Measure the pupil's  exclusions. 
- Measure school moves (pupils changing schools frequential. 

Please refer to this [link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels/KeyPerformanceIndicators.md) for more detailed on these KPIs.
## Data Model 
The Data Model provides the context in which needs to be approached to deliver business value by enabling the successful implementation of Social Services KPIs.
The Logical / Physical Data Model has been built following the third normal form of database normalization. 
By adding metadata throughout type codes embedded into the data model tables (like, for example, a Party Type Code), this data modelling technique enables horizontally expansion of the data model. 
Hence, to extend this data model, the additions of new tables are not required. The data model extension gets achieved by adding new metadata in the form of type code within the data model context.
The Social Service data model has been designed following a top-down approach, starting from the Subject Area model, then moving to a lower-level subtype layer and finally physicalizing the low-level logical-physical data model. Please find below the link to the documentation for the various levels of abstraction of the data model.

| Section        | Description         | Link  |
| -------------- |---------------------|:-----:|
| Introduction   | Description of the Social Services Data Model layers| [Link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels/README.md)|
| Subject Area   | Documentation regarding the higher level of abstraction of the Social Service Data Model | [Link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels/SubjectAreaModel.md)|
| Data Domain   | Documentation listing the Data Domains and tables together with their individual purpose.| [Link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance/SWIS/DataModels/LogicalPhysicalDataModel.md)|

## Prerequisites
In order to successfully leverage the IP, you will need to have access to and or provisioned the following:
- Access to an Azure subscription
- Access to an Azure DevOps Services subscription
- Service Principals

## How to use the IP
The GitHub repo is divided into two distinct areas described below to facilitate the IP leveraging.

| Section        | Description         | Link  |
| -------------- |---------------------|:-----:|
|Delivery Guidance|This section contains instructions on how to successfully personalise and deploy the Social Services IP work products on Azure Cloud environments.|[link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryGuidance)|
|Delivery IP|This section contains the IP work products and their documentation expressed as Markdown markup language. For the intent of the IP, the documentation is generic and will need personalization to the specific customer and their technical and business characteristics.|[link](https://github.com/microsoft/SocialServicesIP/tree/main/DeliveryIP)| 
|Miscellaneous|This section is dedicated to the IP delivery team content.|[link](https://github.com/microsoft/SocialServicesIP/tree/main/Miscellaneous)| 

## Contributors
Kirill Ignatkov - project manager

Onno v/d Horst - technical implementation data and deployment

Nabil Ben Meriem - technical implementation infrastructure and deployment

Marco Scagliola - architecture and design
