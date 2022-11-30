# Table of Context
* [Introduction](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/SubjectAreaModel.md#introduction)
* [Benefits of the Subject Area Model (SAM)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/SubjectAreaModel.md#benefits-of-the-subject-area-model-sam)
* [Overview of the Social Service IP Subject Area Model (SAM)](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/SubjectAreaModel.md#overview-of-the-social-service-ip-subject-area-model-sam)
* [Social Service IP Subject Area Model (SAM) logical Subtypes](https://github.com/microsoft/SocialServicesIP/blob/main/DeliveryGuidance/SWIS/DataModels/SubjectAreaModel.md#social-service-ip-subject-area-model-sam-logical-subtypes)
# Introduction
This section provides an overview of the Social Services IP Subject area. A subject area (SAM) is a
high-level classification (supertype) of data representing a group of concepts about an essential topic of interest to an
organization. The Subject Area Model provides the structure for organizing a Data Model (DM) by business
subjects rather than by applications or data systems.

# Benefits of the Subject Area Model (SAM)
The Subject Area Model can provide a basis for linking projects and systems to be developed and deployed.
Business leadership can help ensure that system planning and data activities are linked to provide a
common terminology that fits the nature of the business.
The SAM is used to communicate and validate with the business how the data needs of any effort fit into the
overall data architecture.
The SAM can also help with data governance by dividing up the stewardship of data by each subject area.

# Overview of the Social Service IP Subject Area Model (SAM)
This section provides a detailed view of the Social Services Subject Area model. This model has been designed based on Contoso's business requirements. The four(4) areas are listed and explained below.

| Subject Area   | Description         |
| -------------- |---------------------|
|Location        |The Location Area represents a physical area like, for example, a physical address.|
|Party           |The Party Area represents an individual (for example, a pupil, a social worker, a teacher etc.), a household or an organisation of interest to the public sector institution in relation to the Social Worker in School use case.|
|Document        |The Document Area represents any document related to an individual the organization is interested in monitoring. These can be social services related (e.g., Referal, Assessments, S47s etc.) or School-related (e.g., exclusions, school moves etc.).|
|Event           |The Event Area represents something that happened and references a party of interest to the public sector institution in relation to the Social Worker in School use case.|

<img src="https://github.com/microsoft/SocialServicesIP/blob/fb28fb6dc0fca8944cf9e6bb9b792ca671db4d28/DeliveryGuidance/SWIS/DataModels/img/SocialServiceIPGitHubPictorialsSAM.jpg" width="60%" height="60%">

The pictorial above shows the areas and the relationships among them, representing the following rules:
- One (1) Party can have many locations associated. For example, a home address, attending school address etc.
- One(1) Party can have many documents associated. For instance, Referral, Assessment etc.
- One (1) Party can have many Events associated. For example, student exclusion, school transfer, if in Special Education Needs (SEN)  etc.
- One(1) Event can happen in one Location. The reason is that the model considers physical Location, not Location like digital channels. However, the Social Service data model allows adding new address types Address and the Event can hold a one-to-many relationship with the address. Hence, any social service event related to a digital channel can be controlled by the Social Service data if configured adequately by an address type.
- One(1) Event can have many documents associated. The Social Services Data Model allow for related events and documents. For example, an Event triggering a Referral can be associated with an Assessment and all the related documents produced by this Event.

# Social Service IP Subject Area Model (SAM) logical Subtypes
The subtypes within a Subject Area Model define lower levels of abstraction within the model by representing subordinate tiers of data classifications within subject areas.
The supertype-subtype hierarchy is a central construct in the conceptual design of data.

The table below contains all the logical subtypes identified during the design of the Social Service data models.
| Subject Area   | Subtype             | Description         |
| -------------- |---------------------|---------------------|
|Party           |Pupil                |It is a subtype of the Party. It is a child or young person in school or in the charge of a tutor or instructor.|
|Party           |Social Worker        |It is a subtype of the Party. Social workers support individuals and their families through difficult times and ensure that vulnerable people, including children and adults, are safeguarded from harm. Their role is to help improve outcomes in people's lives, and they also work closely with other professionals in health and social care.|
|Party           |School pastoral lead |It is a subtype of the Party. The role of the Pastoral Lead is to assist in the provision of pupils' well-being and provide support in handling children's poor behaviour and lack of participation by working in partnership with staff, families/carers, professionals and pupils within the school context.|
|Party           |Parent /Carer        |It is a subtype of the Party. A Parent Carer is someone who provides or intends to provide care for a child with additional needs (under the age of 18), for whom the person has parental responsibility. A carer is anyone, including children and adults, who look after a family member, partner or friend who needs help because of their illness, frailty, disability, a mental health problem or an addiction and cannot cope without their support.|
|Party           |Organization         |It is a subtype of the Party representing a private business or institution.|
|Party           |Organization Government Type|It is a subtype of the Party.It reppresents a permanent or semi-permanent organization in the machinery of government that is responsible for the oversight and administration of specific functions|
|Party / Organization| Internal        |It is a subtype of the Organization. It reppresents an oragnization unit which is internal to the organization.|
|Party / Organization| External        |It is a subtype of the Organization. It reppresents an organization unit which is external to the organization.|
|Event               |Event Relationship|This reppresent the relationship between events (like for example the relationship between a referral and father / child relationships).|
|Event         |School Event|It is a subtype of the Event. Anything that happens, especially something important or unusual from the school perspective.|
|Event         |Social Worker Event|It is a subtype of the Event. Anything that happens, especially something important or unusual from the social worker perspective.|