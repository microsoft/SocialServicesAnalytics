--**************************************************************************************
-- Start of SQL Script which creates the SSIP Database Schema for a SQL Server Databases
--**************************************************************************************
CREATE TABLE [dbo].[TblInstitution] (
    [InstitutionId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [InstitutionURN]         INT          NULL,
    [InstitutionPhase]        VARCHAR (60) NULL,
    [InstitutionName]         VARCHAR (70) NULL,
    [InstitutionSourceKey]     INT          NULL,
    [InstitutionDeleted]         DATETIME     NULL,
    [InstitutionTransactionStartDate] DATETIME     NULL,
    [InstitutionTransactionEndDate] DATETIME     NULL,
    [InstitutionAgeRange]     VARCHAR (60) NULL,
    [InstitutionDFE]         INT          NULL,
    [InstitutionSourceId]      INT          NULL,
    [InstitutionRowInstitutionDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_171129401] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionToHistory]     SMALLINT     NULL,
    CONSTRAINT [XPKInstitution] PRIMARY KEY CLUSTERED ([InstitutionId] ASC),
    CONSTRAINT [XAKUniqueInstitution] UNIQUE NONCLUSTERED ([InstitutionDFE] ASC, [InstitutionURN] ASC, [InstitutionTransactionStartDate] ASC, [InstitutionTransactionEndDate] ASC, [InstitutionDeleted] ASC, [InstitutionName] ASC)
)
GO
CREATE TABLE [dbo].[TblPerson] (
    [PersonId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [PersonMdmId]      NUMERIC (18)  NULL,
    [PersonMiddleName]     VARCHAR (70)  NULL,
    [PersonSurname]       VARCHAR (70)  NOT NULL,
    [PersonDateOfBirth]         DATETIME      NOT NULL,
    [PersonDateOfDeath]         DATETIME      CONSTRAINT [Default_Null_Date_Value_792220842] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonGender]        VARCHAR (60)  NOT NULL,
    [PersonTransactionStartDate] DATETIME      NULL,
    [PersonTransactionEndDate] DATETIME      NULL,
    [PersonForename]      VARCHAR (70)  NULL,
    [PersonTitle]          VARCHAR (60)  NULL,
    [PersonActive]        BIT           NULL,
    [PersonKnownBy]     VARCHAR (70)  NULL,
    [PersonLegalSurname]  VARCHAR (70)  NULL,
    [PersonLegalForename] VARCHAR (70)  NULL,
    [PersonSourceKey]     NUMERIC (18)  NULL,
    [PersonChecksum]      VARCHAR (MAX) NULL,
    [PersonDeleted]         DATETIME      NULL,
    [PersonSourceId]      BIGINT        NULL,
    [PersonRowInsertedDate] DATETIME      NULL,
    [PersonToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKPerson] PRIMARY KEY CLUSTERED ([PersonId] ASC),
    CONSTRAINT [XAKUniquePerson] UNIQUE NONCLUSTERED ([PersonTransactionStartDate] ASC, [PersonTransactionEndDate] ASC, [PersonSourceKey] ASC, [PersonDeleted] ASC, [PersonSourceId] ASC)
)
GO
CREATE TABLE [dbo].[TblPupil] (
    [PupilId]          BIGINT       NOT NULL,
    [PupilUPN]         VARCHAR (13) NOT NULL,
    [PupilCurrent]        BIT          NOT NULL,
    [PupilTransactionStartDate] DATETIME     NULL,
    [PupilTransactionEndDate] DATETIME     NULL,
    [PupilActive]        BIT          NULL,
    [PupilSourceKey]     INT          NULL,
    [PupilSourceId]      INT          NULL,
    [PupilDeleted]         DATETIME     NULL,
    [PupilRowInsertedDate] DATETIME     NULL,
    [PupilToHistory]     SMALLINT     NULL,
    CONSTRAINT [XPKPupil] PRIMARY KEY CLUSTERED ([PupilId] ASC),
    CONSTRAINT [XAKUniquePupil] UNIQUE NONCLUSTERED ([PupilSourceKey] ASC, [PupilSourceId] ASC, [PupilUPN] ASC, [PupilTransactionStartDate] ASC, [PupilTransactionEndDate] ASC, [PupilDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblAddress] (
    [AddressId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [AddresUprn]        VARCHAR (12)  NULL,
    [AddressHouseNumber]     VARCHAR (12)  NULL,
    [AddressUnitNumber]     INT           NULL,
    [AddressUnitName]     VARCHAR (20)  NULL,
    [AddressStreet]          VARCHAR (70)  NULL,
    [AddressDistrict]        VARCHAR (20)  NULL,
    [AddressTown]         VARCHAR (20)  NULL,
    [AddressCounty]        VARCHAR (20)  NULL,
    [AddressPostcode]       VARCHAR (7)   NULL,
    [AddressCountry]        VARCHAR (20)  NULL,
    [AddressSourceId]      INT           NULL,
    [AddressDeleted]         DATETIME      NULL,
    [AddressTransactionEndDate] DATETIME      NULL,
    [AddressTransactionStartDate] DATETIME      NULL,
    [AddressSourceKey]     VARCHAR (MAX) NULL,
    [AddressRowInsertedDate] DATETIME      NULL,
    [AddressToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKAddress] PRIMARY KEY CLUSTERED ([AddressId] ASC),
    CONSTRAINT [XAKUniqueAddress] UNIQUE NONCLUSTERED ([AddressPostcode] ASC, [AddressStreet] ASC, [AddressTown] ASC, [AddressTransactionStartDate] ASC, [AddressDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblAddressHistory] (
    [AddressId]          BIGINT        NOT NULL,
    [AddresUprn]        VARCHAR (20)  NULL,
    [AddressHouseNumber]     VARCHAR (20)  NULL,
    [AddressUnitNumber]     VARCHAR (20)  NULL,
    [AddressUnitName]     VARCHAR (20)  NULL,
    [AddressStreet]          VARCHAR (70)  NULL,
    [AddressDistrict]        VARCHAR (20)  NULL,
    [AddressTown]         VARCHAR (20)  NULL,
    [AddressCounty]        VARCHAR (20)  NULL,
    [AddressPostcode]       VARCHAR (10)  NULL,
    [AddressCountry]        VARCHAR (20)  NULL,
    [AddressSourceId]      INT           NULL,
    [AddressDeleted]         DATETIME      NOT NULL,
    [AddressTransactionEndDate] DATETIME      NULL,
    [AddressTransactionStartDate] DATETIME      NOT NULL,
    [AddressSourceKey]     VARCHAR (MAX) NULL,
    [AddressRowInsertedDate] DATETIME      NULL,
    [AddressToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKaddressHistory] PRIMARY KEY CLUSTERED ([AddressId] ASC, [AddressTransactionStartDate] ASC, [AddressDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblAddressType] (
    [AddressTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [AddressTypeDescription]        VARCHAR (70) NULL,
    [AddressTypeTransactionStartDate] DATETIME     NULL,
    [AddressTypeTransactionEndDate] DATETIME     NULL,
    [AddressTypeDeleted]         DATETIME     NULL,
    [AddressTypeSourceCodeId]      INT          NULL,
    [AddressTypeGroup]         VARCHAR (70) NULL,
    [AddressTypeRowInsertedDate] DATETIME     NULL,
    [AddressTypeSubGroup]     VARCHAR (70) NULL,
    [AddressTypeInternalCode]    VARCHAR (60) NULL,
    [AddressTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKAddressType] PRIMARY KEY CLUSTERED ([AddressTypeId] ASC),
    CONSTRAINT [XAKAddressTypeUniqueIndex] UNIQUE NONCLUSTERED ([AddressTypeDeleted] ASC, [AddressTypeTransactionEndDate] ASC, [AddressTypeTransactionStartDate] ASC, [AddressTypeInternalCode] ASC, [AddressTypeGroup] ASC)
)
GO
CREATE TABLE [dbo].[TblDocumentType] (
    [DocumentTypeForm]         VARCHAR (70)  NULL,
    [DocumentTypeGroup]         VARCHAR (70)  NULL,
    [DocumentTypeId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [DocumentTypeCreator]     VARCHAR (70)  NULL,
    [DocumentTypeDeleted]         DATETIME      CONSTRAINT [Default_Null_Date_Value_841483202] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentTypeDescription]        VARCHAR (MAX) NULL,
    [DocumentTypeSourceId]      INT           NULL,
    [DocumentTypeSourceKey]     BIGINT        NULL,
    [DocumentTypeTransactionStartDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_2021509859] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentTypeTransactionEndDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_1919929045] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentTypeValid]         SMALLINT      NULL,
    [DocumentTypeValidStartDate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_1924219479] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentTypeValidEndDate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_2025800293] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentTypeFileName]     VARCHAR (70)  NULL,
    CONSTRAINT [XPKDocumentType] PRIMARY KEY CLUSTERED ([DocumentTypeId] ASC)
)
GO
CREATE TABLE [dbo].[TblEventCategoryType] (
    [EventCategoryTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventCategoryTypeDescription]        VARCHAR (70) NULL,
    [EventCategoryTypeGroup]         VARCHAR (70) NULL,
    [EventCategoryTypeTransactionStartDate] DATETIME     NULL,
    [EventCategoryTypeTransactionEndDate] DATETIME     NULL,
    [EventCategoryTypeDeleted]         DATETIME     NULL,
    [EventCategoryTypeSourceId]      INT          NULL,
    [EventCategoryTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_197185488] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventCategoryTypeSubGroup]     VARCHAR (70) NULL,
    [EventCategoryTypeInternalCode]    VARCHAR (60) NULL,
    [EventCategoryTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKEventCategoryType] PRIMARY KEY CLUSTERED ([EventCategoryTypeId] ASC),
    CONSTRAINT [XAKEventCategoryTypeUniqueIndex] UNIQUE NONCLUSTERED ([EventCategoryTypeDeleted] ASC, [EventCategoryTypeTransactionEndDate] ASC, [EventCategoryTypeTransactionStartDate] ASC, [EventCategoryTypeGroup] ASC, [EventCategoryTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblEventType] (
    [EventTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventTypeDescription]        VARCHAR (70) NULL,
    [EventTypeGroup]         VARCHAR (70) NULL,
    [EventTypeTransactionStartDate] DATETIME     NULL,
    [EventTypeTransactionEndDate] DATETIME     NULL,
    [EventTypeDeleted]         DATETIME     NULL,
    [EventTypeSourceId]      INT          NULL,
    [EventTypeRowInsertedDate] DATETIME     NULL,
    [EventTypeSubGroup]     VARCHAR (70) NULL,
    [EventTypeInternalCode]    VARCHAR (60) NULL,
    [EventTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKEventType] PRIMARY KEY CLUSTERED ([EventTypeId] ASC),
    CONSTRAINT [XAKEventTypeUniqueIndex] UNIQUE NONCLUSTERED ([EventTypeDeleted] ASC, [EventTypeGroup] ASC, [EventTypeInternalCode] ASC, [EventTypeTransactionStartDate] ASC, [EventTypeTransactionEndDate] ASC)
)
GO
CREATE TABLE [dbo].[TblEventReasonType] (
    [EventReasonTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventReasonTypeDescription]        VARCHAR (70) NULL,
    [EventReasonTypeGroup]         VARCHAR (70) NULL,
    [EventReasonTypeTransactionStartDate] DATETIME     NULL,
    [EventReasonTypeTransactionEndDate] DATETIME     NULL,
    [EventReasonTypeDeleted]         DATETIME     NULL,
    [EventReasonTypeSourceId]      INT          NULL,
    [EventReasonTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_45008574] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventReasonTypeSubGroup]     VARCHAR (70) NULL,
    [EventReasonTypeInternalCode]    VARCHAR (60) NULL,
    [EventReasonTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKEventReasonType] PRIMARY KEY CLUSTERED ([EventReasonTypeId] ASC),
    CONSTRAINT [XAKEventReasonTypeUniqueIndex] UNIQUE NONCLUSTERED ([EventReasonTypeDeleted] ASC, [EventReasonTypeTransactionEndDate] ASC, [EventReasonTypeTransactionStartDate] ASC, [EventReasonTypeGroup] ASC, [EventReasonTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblEvent] (
    [EventId]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventTypeId]        BIGINT       NOT NULL,
    [EventReasonTypeId]    BIGINT       NOT NULL,
    [EventTransactionStartDate]   DATETIME     NULL,
    [EventTransactionEndDate]   DATETIME     NULL,
    [EventCategoryTypeId]    BIGINT       NOT NULL,
    [EventSourceId]        INT          NULL,
    [EventSourceKey]       VARCHAR (70) NULL,
    [EventValidStartDate]    DATETIME     NULL,
    [EventValidEndDate]    DATETIME     NULL,
    [EventAcademicYear]      VARCHAR (60) NULL,
    [EventDeleted]           DATETIME     NULL,
    [EventRowInsertedDate]   DATETIME     CONSTRAINT [Default_Null_Date_Value_1209666601] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventValidCreationDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_575144127] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    CONSTRAINT [XPKEvent] PRIMARY KEY CLUSTERED ([EventId] ASC),
    CONSTRAINT [R_118] FOREIGN KEY ([EventCategoryTypeId]) REFERENCES [dbo].[TblEventCategoryType] ([EventCategoryTypeId]),
    CONSTRAINT [R_44] FOREIGN KEY ([EventTypeId]) REFERENCES [dbo].[TblEventType] ([EventTypeId]),
    CONSTRAINT [R_45] FOREIGN KEY ([EventReasonTypeId]) REFERENCES [dbo].[TblEventReasonType] ([EventReasonTypeId])
)
GO
CREATE TABLE [dbo].[TblDocumentToEvent] (
    [EventId]                        BIGINT       NOT NULL,
    [DocumentToEventValidStartDate]         DATETIME     CONSTRAINT [Default_Null_Date_Value_543159304] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventValidEndDate]         DATETIME     CONSTRAINT [Default_Null_Date_Value_644740118] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventTransactionEndDate]        DATETIME     CONSTRAINT [Default_Null_Date_Value_1010951641] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventTransactionStartDate]        DATETIME     CONSTRAINT [Default_Null_Date_Value_909370827] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [DocumentToEventCounter]              BIGINT       NULL,
    [DocumentTypeId]                   BIGINT       NOT NULL,
    [DocumentToEventDeleted]                DATETIME     CONSTRAINT [Default_Null_Date_Value_522603409] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventRowInsertedDate]        DATETIME     CONSTRAINT [Default_Null_Date_Value_774241747] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventSourceId]             BIGINT       NULL,
    [DocumentToEventMarkerID]           VARCHAR (70) NULL,
    [DocumentToEventPathReference]           VARCHAR (70) NULL,
    [DocumentToEventFormEndDate]         DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventFormStartDate]         DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventFormDueDate]         DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventFormCompleteDate]       DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentToEventFormAuthorisedEndDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_2009877650] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentAuthorisedStartDate]           DATETIME     CONSTRAINT [Default_Null_Date_Value_1838413388] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [DocumentAuthorisedEndDate]           DATETIME     CONSTRAINT [Default_Null_Date_Value_1939994202] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    CONSTRAINT [XPKDocumentumentToEvent] PRIMARY KEY CLUSTERED ([EventId] ASC, [DocumentToEventTransactionStartDate] ASC, [DocumentTypeId] ASC),
    CONSTRAINT [R_175] FOREIGN KEY ([DocumentTypeId]) REFERENCES [dbo].[TblDocumentType] ([DocumentTypeId]),
    CONSTRAINT [R_176] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId])
)
GO
CREATE TABLE [dbo].[TblEthnoLinguisticType] (
    [EthnoLinguisticTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EthnoLinguisticTypeDescription]        VARCHAR (70) NULL,
    [EthnoLinguisticTypeGroup]         VARCHAR (70) NULL,
    [EthnoLinguisticTypeTransactionStartDate] DATETIME     NULL,
    [EthnoLinguisticTypeTransactionEndDate] DATETIME     NULL,
    [EthnoLinguisticTypeDeleted]         DATETIME     NULL,
    [EthnoLinguisticTypeSourceId]      INT          NULL,
    [EthnoLinguisticTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1731144510] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EthnoLinguisticTypeSubGroup]     VARCHAR (70) NULL,
    [EthnoLinguisticTypeInternalCode]    VARCHAR (60) NULL,
    [EthnoLinguisticTypeExternalCode]     VARCHAR (60) NULL,
    CONSTRAINT [XPKEthnoLinguisticType] PRIMARY KEY CLUSTERED ([EthnoLinguisticTypeId] ASC),
    CONSTRAINT [XAKEthnoLinguisticTypeUniqueIndex] UNIQUE NONCLUSTERED ([EthnoLinguisticTypeDeleted] ASC, [EthnoLinguisticTypeTransactionStartDate] ASC, [EthnoLinguisticTypeTransactionEndDate] ASC, [EthnoLinguisticTypeGroup] ASC, [EthnoLinguisticTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblEventMetricType] (
    [EventMetricTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventMetricTypeDescription]        VARCHAR (70) NULL,
    [EventMetricTypeGroup]         VARCHAR (70) NULL,
    [EventMetricTypeTransactionStartDate] DATETIME     NULL,
    [EventMetricTypeTransactionEndDate] DATETIME     NULL,
    [EventMetricTypeDeleted]         DATETIME     NULL,
    [EventMetricTypeSourceId]      INT          NULL,
    [EventMetricTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_61720509] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventMetricTypeSubGroup]     VARCHAR (70) NULL,
    [EventMetricTypeInternalCode]    VARCHAR (60) NULL,
    [EventMetricTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKEventMetricType] PRIMARY KEY CLUSTERED ([EventMetricTypeId] ASC),
    CONSTRAINT [XAKEventMetricTypeUniqueIndex] UNIQUE NONCLUSTERED ([EventMetricTypeDeleted] ASC, [EventMetricTypeTransactionEndDate] ASC, [EventMetricTypeTransactionStartDate] ASC, [EventMetricTypeGroup] ASC, [EventMetricTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblEventRelationshipType] (
    [EventRelationshipTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventRelationshipTypeGroup]         VARCHAR (70) NULL,
    [EventRelationshipTypeDescription]        VARCHAR (70) NULL,
    [EventRelationshipTypeExternalCode]    VARCHAR (60) NULL,
    [EventRelationshipTypeDeleted]         DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipTypeInternalCode]    VARCHAR (60) NULL,
    [EventRelationshipTypeTransactionStartDate] DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipTypeTransactionEndDate] DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipTypeSourceCode]      VARCHAR (60) NULL,
    [EventRelationshipTypeRowInsertedDate] DATETIME     DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipTypeSubGroup]     VARCHAR (70) NULL,
   	CONSTRAINT XPKEventRelationshipType PRIMARY KEY  CLUSTERED (EventRelationshipTypeId ASC)
)
GO
CREATE TABLE [dbo].[TblEventRelationship] (
    [EventRelationshipTransactionStartDate] DATETIME CONSTRAINT [Default_Null_Date_Value_1176494057] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventRelationshipTransactionEndDate] DATETIME CONSTRAINT [Default_Null_Date_Value_1278074871] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventId]                 BIGINT   NOT NULL,
    [EventRelatedId]         BIGINT   NOT NULL,
    [EventRelationshipValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_1047519234] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventRelationshipValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_1149100048] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_1041364977] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipDeleted]         DATETIME CONSTRAINT [Default_Null_Date_Value_255480179] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventRelationshipTypeId]      BIGINT   NOT NULL,
    CONSTRAINT [XPKEVENTRelationship] PRIMARY KEY CLUSTERED ([EventId] ASC, [EventRelatedId] ASC, [EventRelationshipTransactionStartDate] ASC, [EventRelationshipValidStartDate] ASC, [EventRelationshipTypeId] ASC),
    CONSTRAINT [R_177] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_180] FOREIGN KEY (EventRelationshipTypeId) REFERENCES TblEventRelationshipType(EventRelationshipTypeId)
)
GO
CREATE TABLE [dbo].[TblEventStatusType] (
    [EventStatusTypeTransactionStartDate] DATETIME     NULL,
    [EventStatusTypeTransactionEndDate] DATETIME     NULL,
    [EventStatusTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventStatusTypeDescription]        VARCHAR (70) NULL,
    [EventStatusTypeDeleted]         DATETIME     NULL,
    [EventStatusTypeGroup]         VARCHAR (70) NULL,
    [EventStatusTypeSourceId]      BIGINT       NULL,
    [EventStatusTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_55721796] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventStatusTypeSubGroup]     VARCHAR (70) NULL,
    [EventStatusTypeInternalCode]    VARCHAR (60) NULL,
    [EventStatusTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKEventStatusType] PRIMARY KEY CLUSTERED ([EventStatusTypeId] ASC),
    CONSTRAINT [XAKEventStatusTypeUniqueIndex] UNIQUE NONCLUSTERED ([EventStatusTypeDeleted] ASC, [EventStatusTypeGroup] ASC, [EventStatusTypeInternalCode] ASC, [EventStatusTypeTransactionStartDate] ASC, [EventStatusTypeTransactionEndDate] ASC)
)
GO
CREATE TABLE [dbo].[TblEventToInstitution] (
    [InstitutionId]                BIGINT   NOT NULL,
    [EventId]                  BIGINT   NOT NULL,
    [EventTypeId]              BIGINT   NOT NULL,
    [EventToInstitutionTransactionEndDate] DATETIME NULL,
    [EventToInstitutionTransactionStartDate] DATETIME NOT NULL,
    [EventToInstitutionSourceId]      INT      NULL,
    [EventToInstitutionDeleted]         DATETIME NULL,
    [EventToInstitutionValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_723754176] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventToInstitutionValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_165583850] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToInstitutionRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_238111267] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToInstitutionCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKEventToInstitution] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [EventId] ASC, [EventTypeId] ASC, [EventToInstitutionTransactionStartDate] ASC, [EventToInstitutionValidStartDate] ASC, [EventToInstitutionCounter] ASC),
    CONSTRAINT [R_122] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TBLInstitution] ([InstitutionId]),
    CONSTRAINT [R_123] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_124] FOREIGN KEY ([EventTypeId]) REFERENCES [dbo].[TblEventType] ([EventTypeId]),
    CONSTRAINT [XAKUniqueEventToInstitution] UNIQUE NONCLUSTERED ([EventId] ASC, [EventToInstitutionDeleted] ASC, [EventToInstitutionSourceId] ASC, [EventToInstitutionTransactionEndDate] ASC, [EventToInstitutionTransactionStartDate] ASC, [EventToInstitutionValidEndDate] ASC, [EventToInstitutionValidStartDate] ASC, [EventTypeId] ASC, [InstitutionId] ASC, [EventToInstitutionCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblAttendanceSummaryType] (
    [InstitutionSourceKey]       BIGINT        NULL,
    [Code]                 VARCHAR (60)  NULL,
    [Meaning]            VARCHAR (60)  NULL,
    [StatutoryMeaning]       VARCHAR (70)  NULL,
    [SchoolMeaning]      VARCHAR (MAX) NULL,
    [TransactionalStartDate]        DATETIME      CONSTRAINT [Default_Null_Date_Value_1686317623] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [TransactionalEndDate]        DATETIME      CONSTRAINT [Default_Null_Date_Value_1787898437] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionId]            BIGINT        NULL,
    [AttendanceSummaryTypeId] BIGINT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [XPKAttendanceSummary] PRIMARY KEY CLUSTERED ([AttendanceSummaryTypeId] ASC),
    CONSTRAINT [R_182] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId])
)
GO
CREATE TABLE [dbo].[TblEventToMetric] (
    [EventToMetricTransactionEndDate] DATETIME        NULL,
    [EventToMetricValue]         DECIMAL (12, 9) NULL,
    [EventMetricTypeId]         BIGINT          NOT NULL,
    [EventToMetricTransactionStartDate] DATETIME        NOT NULL,
    [EventToMetricValidEndDate]  DATETIME        CONSTRAINT [Default_Null_Date_Value_710857480] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventToMetricValidStartDate]  DATETIME        CONSTRAINT [Default_Null_Date_Value_609276666] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToMetricSourceId]      INT             NULL,
    [EventToMetricDeleted]         DATETIME        NULL,
    [EventToMetricRowInsertedDate] DATETIME        NULL,
    [EventId]                 BIGINT          NOT NULL,
    [EventToMetricCounter]         BIGINT          NOT NULL,
    CONSTRAINT [XPKEventToMetric] PRIMARY KEY CLUSTERED ([EventMetricTypeId] ASC, [EventToMetricTransactionStartDate] ASC, [EventId] ASC, [EventToMetricValidEndDate] ASC, [EventToMetricCounter] ASC),
    CONSTRAINT [R_120] FOREIGN KEY ([EventMetricTypeId]) REFERENCES [dbo].[TblEventMetricType] ([EventMetricTypeId]),
    CONSTRAINT [R_121] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [XAKUniqueEventToMetric] UNIQUE NONCLUSTERED ([EventMetricTypeId] ASC, [EventToMetricValidEndDate] ASC, [EventToMetricValue] ASC, [EventToMetricTransactionStartDate] ASC, [EventToMetricTransactionEndDate] ASC, [EventToMetricSourceId] ASC, [EventToMetricDeleted] ASC, [EventToMetricValidStartDate] ASC, [EventId] ASC, [EventToMetricCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonRoleType] (
    [PersonRoleTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PersonRoleType_Description]        VARCHAR (70) NULL,
    [PersonRoleTypeGroup]         VARCHAR (70) NULL,
    [PersonRoleTypeTransactionStartDate] DATETIME     NULL,
    [PersonRoleTypeTransactionEndDate] DATETIME     NULL,
    [PersonRoleTypeDeleted]         DATETIME     NULL,
    [PersonRoleTypeSourceId]      INT          NULL,
    [PersonRoleTypeRowInsertedDate] DATETIME     NULL,
    [PersonRoleTypeSubGroup]     VARCHAR (70) NULL,
    [PersonRoleTypeInternalCode]    VARCHAR (60) NULL,
    [PersonRoleTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKPersonEventRoleType] PRIMARY KEY CLUSTERED ([PersonRoleTypeId] ASC),
    CONSTRAINT [XAKPersonRoleTypeUniqueIndex] UNIQUE NONCLUSTERED ([PersonRoleTypeDeleted] ASC, [PersonRoleTypeGroup] ASC, [PersonRoleTypeInternalCode] ASC, [PersonRoleTypeTransactionStartDate] ASC, [PersonRoleTypeTransactionEndDate] ASC)
)
GO
CREATE TABLE [dbo].[TblEventToPerson] (
    [PersonId]                BIGINT   NOT NULL,
    [PersonRoleTypeId]       BIGINT   NOT NULL,
    [EventToPersonTransactionEndDate] DATETIME NULL,
    [EventToPersonSourceId]      INT      NULL,
    [EventToPersonTransactionStartDate] DATETIME CONSTRAINT [Default_Null_Date_Value_638572240] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventToPersonDeleted]         DATETIME NULL,
    [EventToPersonValidStartDate]  DATETIME NOT NULL,
    [EventToPersonValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_727568391] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToPersonRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_503443160] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventId]                 BIGINT   NOT NULL,
    [EventToPersonCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKEvententToPerson] PRIMARY KEY CLUSTERED ([PersonId] ASC, [PersonRoleTypeId] ASC, [EventToPersonTransactionStartDate] ASC, [EventId] ASC, [EventToPersonValidStartDate] ASC, [EventToPersonCounter] ASC),
    CONSTRAINT [R_55] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_59] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [R_67] FOREIGN KEY ([PersonRoleTypeId]) REFERENCES [dbo].[TblPersonRoleType] ([PersonRoleTypeId]),
    CONSTRAINT [XAKUniqueEventToPerson] UNIQUE NONCLUSTERED ([EventToPersonValidStartDate] ASC, [EventToPersonValidEndDate] ASC, [EventToPersonTransactionStartDate] ASC, [EventToPersonTransactionEndDate] ASC, [EventToPersonSourceId] ASC, [EventToPersonDeleted] ASC, [PersonId] ASC, [PersonRoleTypeId] ASC, [EventToPersonCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblEventToPupil] (
    [PupilId]                BIGINT   NOT NULL,
    [EventId]                 BIGINT   NOT NULL,
    [EventToPupilTransactionEndDate] DATETIME NULL,
    [EventTypeId]             BIGINT   NOT NULL,
    [EventToPupilSourceId]      INT      NULL,
    [EventToPupilTransactionStartDate] DATETIME NOT NULL,
    [EventToPupilDeleted]         DATETIME NOT NULL,
    [EventToPupilValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_626184182] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventToPupilValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_727764996] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToPupilRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_553774040] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToPupilCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKEventToPupil] PRIMARY KEY CLUSTERED ([PupilId] ASC, [EventId] ASC, [EventTypeId] ASC, [EventToPupilTransactionStartDate] ASC, [EventToPupilValidStartDate] ASC, [EventToPupilCounter] ASC, [EventToPupilDeleted] ASC),
    CONSTRAINT [R_126] FOREIGN KEY ([EventTypeId]) REFERENCES [dbo].[TblEventType] ([EventTypeId]),
    CONSTRAINT [R_54] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_56] FOREIGN KEY ([PupilId]) REFERENCES [dbo].[TblPupil] ([PupilID])
)
GO
CREATE TABLE [dbo].[TblEventToStatus] (
    [EventId]                 BIGINT   NOT NULL,
    [EventStatusTypeId]         BIGINT   NOT NULL,
    [EventToStatusTransactionEndDate] DATETIME NULL,
    [EventToStatusFlag]         BIT      NULL,
    [EventToStatusSourceId]      INT      NULL,
    [EventToStatusTransactionStartDate] DATETIME NOT NULL,
    [EventToStatusValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_592432372] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [EventToStatusValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_694013186] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToStatusDeleted]         DATETIME NULL,
    [EventToStatusRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_503245270] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventToStatusCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKEventToStatus] PRIMARY KEY CLUSTERED ([EventId] ASC, [EventStatusTypeId] ASC, [EventToStatusTransactionStartDate] ASC, [EventToStatusValidStartDate] ASC, [EventToStatusCounter] ASC),
    CONSTRAINT [R_38] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_41] FOREIGN KEY ([EventStatusTypeId]) REFERENCES [dbo].[TblEventStatusType] ([EventStatusTypeId])
)
GO
CREATE TABLE [dbo].[TblInstitutionHistory] (
    [InstitutionId]          BIGINT       NOT NULL,
    [InstitutionURN]         INT          NULL,
    [InstitutionPhase]        VARCHAR (60) NULL,
    [InstitutionName]         VARCHAR (70) NULL,
    [InstitutionSourceKey]     INT          NULL,
    [InstitutionDeleted]         DATETIME     CONSTRAINT [Default_Null_Date_Value_189080573] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [InstitutionTransactionStartDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1621054808] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [InstitutionTransactionEndDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1722635622] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionAgeRange]     VARCHAR (60) NULL,
    [InstitutionDFE]         INT          NULL,
    [InstitutionSourceId]      BIGINT       NULL,
    [InstitutionRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1485925728] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionToHistory]     SMALLINT     NULL,
    CONSTRAINT [XPKinstitutionHistory] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [InstitutionTransactionStartDate] ASC, [InstitutionDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblInstitutionMetricType] (
    [InstitutionMetricTypeId]          INT          IDENTITY (1, 1) NOT NULL,
    [InstitutionMetricTypeDescription]        VARCHAR (70) NULL,
    [InstitutionMetricTypeGroup]         VARCHAR (70) NULL,
    [InstitutionMetricTypeTransactionStartDate] DATETIME     NULL,
    [InstitutionMetricTypeTransactionEndDate] DATETIME     NULL,
    [InstitutionMetricTypeDeleted]         DATETIME     NULL,
    [InstitutionMetricTypeSourceId]      INT          NULL,
    [InstitutionMetricTypeRowInsertedDate] DATETIME     NULL,
    [InstitutionMetricTypeSubGroup]     VARCHAR (70) NULL,
    [InstitutionMetricTypeInternalCode]    VARCHAR (60) NULL,
    [InstitutionMetricTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKInstitutionMetricType] PRIMARY KEY CLUSTERED ([InstitutionMetricTypeId] ASC),
    CONSTRAINT [XAKInstitutionMetricUniqueIndex] UNIQUE NONCLUSTERED ([InstitutionMetricTypeTransactionStartDate] ASC, [InstitutionMetricTypeTransactionEndDate] ASC, [InstitutionMetricTypeDeleted] ASC, [InstitutionMetricTypeGroup] ASC, [InstitutionMetricTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblInstitutionStatusType] (
    [InstitutionStatusTypeDeleted]         DATETIME     NULL,
    [InstitutionStatusTypeDescription]        VARCHAR (70) NULL,
    [InstitutionStatusTypeGroup]         VARCHAR (70) NULL,
    [InstitutionStatusTypeTransactionStartDate] DATETIME     NULL,
    [InstitutionStatusTypeTransactionEndDate] DATETIME     NULL,
    [InstitutionStatusTypeId]          INT          IDENTITY (1, 1) NOT NULL,
    [InstitutionStatusTypeTransactionSourceId] INT          NULL,
    [InstitutionTypeRowInsertedDate]     DATETIME     NULL,
    [InstitutionTypeSubGroup]         VARCHAR (70) NULL,
    [InstitutionStatusTypeExternalCode]    VARCHAR (60) NULL,
    [InstitutionStatusTypeInternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKInstitutionStatusType] PRIMARY KEY CLUSTERED ([InstitutionStatusTypeId] ASC),
    CONSTRAINT [XAKInstitutionStatusTypeUniqueIndex] UNIQUE NONCLUSTERED ([InstitutionStatusTypeDeleted] ASC, [InstitutionStatusTypeTransactionEndDate] ASC, [InstitutionStatusTypeTransactionStartDate] ASC, [InstitutionStatusTypeGroup] ASC, [InstitutionStatusTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblInstitutionToAddress] (
    [AddressId]                  BIGINT   NOT NULL,
    [InstitutionId]                  BIGINT   NOT NULL,
    [InstitutionToAddressTransactionEndDate] DATETIME NULL,
    [AddressTypeId]              BIGINT   NOT NULL,
    [InstitutionToAddressSourceId]      INT      NULL,
    [InstitutionToAddressTransactionStartDate] DATETIME NOT NULL,
    [InstitutionToAddressDeleted]         DATETIME NULL,
    [InstitutionToAddressRowInsertedDate] DATETIME NULL,
    [EventId]                    BIGINT   NULL,
    [InstitutionToAddressCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKInstitutionToAddress] PRIMARY KEY CLUSTERED ([AddressId] ASC, [InstitutionId] ASC, [AddressTypeId] ASC, [InstitutionToAddressTransactionStartDate] ASC, [InstitutionToAddressCounter] ASC),
    CONSTRAINT [R_153] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_24] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_72] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[TblAddressType] ([AddressTypeId]),
    CONSTRAINT [R_74] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[TblAddress] ([AddressId])
)
GO
CREATE TABLE [dbo].[TblInstitutionType] (
    [InstitutionTypeDeleted]         DATETIME     NULL,
    [InstitutionTypeSourceId]      INT          NULL,
    [InstitutionTypeDescription]        VARCHAR (70) NULL,
    [InstitutionTypeGroup]         VARCHAR (70) NULL,
    [InstitutionTypeTransactionStartDate] DATETIME     NULL,
    [InstitutionTypeTransactionEndDate] DATETIME     NULL,
    [InstitutionTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [InstitutionTypeRowInsertedDate] DATETIME     NULL,
    [InstitutionTypeSubGroup]     VARCHAR (70) NULL,
    [InstitutionTypeExternalCode]    VARCHAR (60) NULL,
    [InstitutionTypeInternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKInstitutionType] PRIMARY KEY CLUSTERED ([InstitutionTypeId] ASC),
    CONSTRAINT [XAK_InstitutionTypeUniqueIndex] UNIQUE NONCLUSTERED ([InstitutionTypeTransactionEndDate] ASC, [InstitutionTypeTransactionStartDate] ASC, [InstitutionTypeDeleted] ASC, [InstitutionTypeInternalCode] ASC, [InstitutionTypeGroup] ASC),
)
GO
CREATE TABLE [dbo].[TblInstitutionToInstitutionType] (
    [InstitutionId]                      BIGINT   NOT NULL,
    [InstitutionToInstitutionTypeTransactionEndDate] DATETIME NULL,
    [InstitutionToInstitutionTypeTransactionStartDate] DATETIME NOT NULL,
    [InstitutionToInstitutionTypeSourceId]      INT      NULL,
    [InstitutionToInstitutionTypeDeleted]         DATETIME NULL,
    [InstitutionTypeId]                  BIGINT   NOT NULL,
    [InstitutionToInstitutionTypeValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_488606434] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [InstitutionToInstitutionTypeValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_590187248] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionToInstitutionTypeRowInsertedDate] DATETIME NULL,
    [EventId]                        BIGINT   NULL,
    [InstitutionToInstitutionTypeCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKInstitutionToInstitutionType] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [InstitutionTypeId] ASC, [InstitutionToInstitutionTypeTransactionStartDate] ASC, [InstitutionToInstitutionTypeValidStartDate] ASC, [InstitutionToInstitutionTypeCounter] ASC),
    CONSTRAINT [R_131] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_132] FOREIGN KEY ([InstitutionTypeId]) REFERENCES [dbo].[TblInstitutionType] ([InstitutionTypeId]),
    CONSTRAINT [R_154] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId])
)
GO
CREATE TABLE [dbo].[TblInstitutionToMetric] (
    [InstitutionToMetricTransactionEndDate] DATETIME NULL,
    [InstitutionId]                 BIGINT   NOT NULL,
    [InstitutionToMetricValue]         INT      NOT NULL,
    [InstitutionMetricTypeId]         INT      NOT NULL,
    [InstitutionToMetricValidStartDate]  DATETIME NOT NULL,
    [InstitutionToMetricValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_854618957] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionToMetricTransactionStartDate] DATETIME CONSTRAINT [Default_Null_Date_Value_674462863] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [InstitutionToMetricDeleted]         DATETIME NULL,
    [InstitutionToMetricSourceId]      INT      NULL,
    [InstitutionToMetricRowInsertedDate] DATETIME NULL,
    [EventId]                   BIGINT   NULL,
    [InstitutionToMetricCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKInstitutionToMetric] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [InstitutionMetricTypeId] ASC, [InstitutionToMetricTransactionStartDate] ASC, [InstitutionToMetricValidStartDate] ASC, [InstitutionToMetricCounter] ASC),
    CONSTRAINT [R_114] FOREIGN KEY ([InstitutionMetricTypeId]) REFERENCES [dbo].[TblInstitutionMetricType] ([InstitutionMetricTypeId]),
    CONSTRAINT [R_13] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_155] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId])
)
GO
CREATE TABLE [dbo].[TblInstitutionToStatus] (
    [InstitutionToStatusFlag]         BIT      NULL,
    [InstitutionToStatusTransactionStartDate] DATETIME NOT NULL,
    [InstitutionToStatusTransactionEndDate] DATETIME NULL,
    [InstitutionToStatusValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_1056928865] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [InstitutionToStatusValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_955348051] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionStatusTypeId]         INT      NOT NULL,
    [InstitutionId]                 BIGINT   NOT NULL,
    [InstitutionToStatusDeleted]         DATETIME NULL,
    [InstitutionToStatusSourceId]      INT      NULL,
    [InstitutionToStatusRowInsertedDate] DATETIME NULL,
    [EventId]                   BIGINT   NULL,
    [InstitutionToStatusCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKInstitutionToStatus] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [InstitutionStatusTypeId] ASC, [InstitutionToStatusTransactionStartDate] ASC, [InstitutionToStatusValidStartDate] ASC, [InstitutionToStatusCounter] ASC),
    CONSTRAINT [R_138] FOREIGN KEY ([InstitutionStatusTypeId]) REFERENCES [dbo].[TblInstitutionStatusType] ([InstitutionStatusTypeId]),
    CONSTRAINT [R_140] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_156] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId])
)
GO
CREATE TABLE [dbo].[TblPersonHistory] (
    [PersonId]          BIGINT        NOT NULL,
    [PersonMdmId]      BIGINT        NULL,
    [PersonMiddleName]     VARCHAR (70)  NULL,
    [PersonSurname]       VARCHAR (70)  NULL,
    [PersonDateOfBirth]         DATE          NULL,
    [PersonDateOfDeath]         DATE          NULL,
    [PersonGender]        VARCHAR (50)  NULL,
    [PersonTransactionStartDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_1079095422] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PersonTransactionEndDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_977514608] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonForename]      VARCHAR (70)  NULL,
    [PersonTitle]          VARCHAR (50)  NULL,
    [PersonActive]        BIT           NULL,
    [PersonKnownBy]     VARCHAR (70)  NULL,
    [PersonLegalSurname]  VARCHAR (70)  NULL,
    [PersonLegalForename] VARCHAR (70)  NULL,
    [PersonSourceKey]     BIGINT        NULL,
    [PersonChecksum]      VARCHAR (MAX) NULL,
    [PersonDeleted]         DATETIME      CONSTRAINT [Default_Null_Date_Value_1783897639] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PersonSourceId]      BIGINT        NULL,
    [PersonRowInsertedDate] DATETIME      NULL,
    [PersonToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKpersonhistory] PRIMARY KEY CLUSTERED ([PersonID] ASC, [PersonTransactionStartDate] ASC, [PersonDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonNameChange] (
    [PersonNameChangeForename]      VARCHAR (70)  NULL,
    [PersonNameChangeSurname]       VARCHAR (70)  NULL,
    [PersonNameChangeLegalForename] VARCHAR (70)  NULL,
    [PersonNameChangeLegalSurname]  VARCHAR (70)  NULL,
    [PersonNameChangeMiddleName]     VARCHAR (70)  NULL,
    [PersonNameChangeChecksum]      VARCHAR (MAX) NULL,
    [PersonNameChangeTitle]          VARCHAR (50)  NULL,
    [PersonNameChangeSourceKey]     INT           NULL,
    [PersonNameChangeTransactionEndDate] DATETIME      NULL,
    [PersonNameChangeId]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [PersonNameChangeTransactionStartDate] DATETIME      NULL,
    [PersonNameChangeDeleted]         DATETIME      NULL,
    [PersonNameChangeTransactionSourceId] INT           NULL,
    [PersonNameChangeRowInsertedDate] DATETIME      NULL,
    [PersonNameChangeSourceChangeId] BIGINT        NULL,
    [PersonNameChangeValidStartdate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_574330444] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeValidEndDate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_472749630] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKPersonNameeChange] PRIMARY KEY CLUSTERED ([PersonNameChangeId] ASC),
    CONSTRAINT [XAKUniquePersonNameeChange] UNIQUE NONCLUSTERED ([PersonNameChangeDeleted] ASC, [PersonNameChangeTransactionStartDate] ASC, [PersonNameChangeTransactionEndDate] ASC, [PersonNameChangeTransactionSourceId] ASC, [PersonNameChangeSourceKey] ASC, [PersonNameChangeSourceChangeId] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonNameChangeHistory] (
    [PersonNameChangeChecksum]      VARCHAR (MAX) NULL,
    [PersonNameChangeDeleted]         DATETIME      CONSTRAINT [Default_Null_Date_Value_1054934353] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PersonNameChangeForename]      VARCHAR (70)  NULL,
    [PersonNameChangeId]          BIGINT        NOT NULL,
    [PersonNameChangeLegalForename] VARCHAR (70)  NULL,
    [PersonNameChangeLegalSurname]  VARCHAR (70)  NULL,
    [PersonNameChangeMiddleName]     VARCHAR (70)  NULL,
    [PersonNameChangeRowInsertedDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_241910803] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeSourceKey]     INT           NULL,
    [PersonNameChangeSurname]       VARCHAR (70)  NULL,
    [PersonNameChangeTitle]          VARCHAR (50)  NULL,
    [PersonNameChangeTransactionEndDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_478620697] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeTransactionSourceId] DATETIME      CONSTRAINT [Default_Null_Date_Value_680012806] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeTransactionStartDate] DATETIME      CONSTRAINT [Default_Null_Date_Value_377039883] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PersonNameChangeSourceChangeId] BIGINT        NULL,
    [PersonNameChangeValidStartDate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_1614821710] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeValidEndDate]  DATETIME      CONSTRAINT [Default_Null_Date_Value_1716402524] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonNameChangeToHistory]     SMALLINT      NULL,
    CONSTRAINT [XPKPersonNameChangeHistory] PRIMARY KEY CLUSTERED ([PersonNameChangeId] ASC, [PersonNameChangeTransactionStartDate] ASC, [PersonNameChangeDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonStatusType] (
    [PersonStatusTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PersonStatusTypeDescription]        VARCHAR (70) NULL,
    [PersonStatusTypeGroup]         VARCHAR (70) NULL,
    [PersonStatusTypeTransactionStartDate] DATETIME     NULL,
    [PersonStatusTypeTransactionEndDate] DATETIME     NULL,
    [PersonStatusTypeDeleted]         DATETIME     NULL,
    [PersonStatusTypeSourceId]      INT          NULL,
    [PersonStatusTypeRowInsertedDate] DATETIME     NULL,
    [PersonStatusTypeSubGroup]     VARCHAR (70) NULL,
    [PersonStatusTypeInternalCode]    VARCHAR (60) NULL,
    [PersonStatusTypeExternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKPersonStatusType] PRIMARY KEY CLUSTERED ([PersonStatusTypeID] ASC),
    CONSTRAINT [XAKPersonStatusTypeUniqueIndex] UNIQUE NONCLUSTERED ([PersonStatusTypeTransactionEndDate] ASC, [PersonStatusTypeTransactionStartDate] ASC, [PersonStatusTypeDeleted] ASC, [PersonStatusTypeDescription] ASC, [PersonStatusTypeId] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonToEthnoLinguistic] (
    [PersonId]                        BIGINT   NOT NULL,
    [EthnoLinguisticTypeId]             BIGINT   NOT NULL,
    [PersonToEthnoLinguisticTransactionEndDate] DATETIME NULL,
    [PersonToEthnoLinguisticTransactionStartDate] DATETIME NOT NULL,
    [PersonToEthnoLinguisticSourceId]      INT      NULL,
    [PersonToEthnoLinguisticDeleted]         DATETIME NULL,
    [PersonToEthnoLinguisticValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_770198334] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToEthnoLinguisticValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_668617520] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToEthnoLinguisticRowInsertedDate] DATETIME NULL,
    [EventId]                         BIGINT   NULL,
    [PersonToEthnoLinguisticCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPersonToEthnoLinguistic] PRIMARY KEY CLUSTERED ([PersonId] ASC, [EthnoLinguisticTypeId] ASC, [PersonToEthnoLinguisticTransactionStartDate] ASC, [PersonToEthnoLinguisticCounter] ASC),
    CONSTRAINT [R_150] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_90] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [R_91] FOREIGN KEY ([EthnoLinguisticTypeId]) REFERENCES [dbo].[TblEthnoLinguisticType] ([EthnoLinguisticTypeId]),
    CONSTRAINT [XAKUniquePersonToEthnoLinguistic] UNIQUE NONCLUSTERED ([PersonToEthnoLinguisticValidEndDate] ASC, [PersonToEthnoLinguisticTransactionEndDate] ASC, [PersonToEthnoLinguisticTransactionStartDate] ASC, [PersonToEthnoLinguisticValidStartDate] ASC, [PersonToEthnoLinguisticDeleted] ASC, [PersonId] ASC, [EthnoLinguisticTypeId] ASC, [PersonToEthnoLinguisticSourceId] ASC, [PersonToEthnoLinguisticCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonToInstitution] (
    [PersonToInstitutionDeleted]         DATETIME CONSTRAINT [Default_Null_Date_Value_1919639579] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToInstitutionTransactionStartDate] DATETIME CONSTRAINT [Default_Null_Date_Value_943353482] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToInstitutionTransactionEndDate] DATETIME CONSTRAINT [Default_Null_Date_Value_841772668] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToInstitutionSourceId]      INT      NULL,
    [PersonToInstitutionValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_873364045] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToInstitutionValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_771783231] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [InstitutionId]                 BIGINT   NOT NULL,
    [PersonId]                  BIGINT   NOT NULL,
    [PersonRoleTypeId]         BIGINT   NOT NULL,
    [PersonToInstitutionCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPersonToInstitution] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [PersonId] ASC, [PersonRoleTypeId] ASC, [PersonToInstitutionCounter] ASC),
    CONSTRAINT [R_165] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_166] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [R_167] FOREIGN KEY ([PersonRoleTypeId]) REFERENCES [dbo].[TblPersonRoleType] ([PersonRoleTypeId])
)
GO
CREATE TABLE [dbo].[TblPersonToNameChange] (
    [PersonId]                      BIGINT   NOT NULL,
    [PersonToNameChangeTransactionEndDate] DATETIME NULL,
    [PersonToNameChangeDeleted]         DATETIME NULL,
    [PersonToNameChangeTransactionStartDate] DATETIME NOT NULL,
    [PersonToNameChangeSourceId]      INT      NULL,
    [PersonToNameChangeRowInsertedDate] DATETIME NULL,
    [PersonNameChangeId]             BIGINT   NOT NULL,
    [PersonToNameChangeValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_1213655856] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToNameChangeValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_1315236670] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [EventId]                       BIGINT   NULL,
    [PersonToNameChangeCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPersonToNameChange] PRIMARY KEY CLUSTERED ([PersonId] ASC, [PersonToNameChangeTransactionStartDate] ASC, [PersonNameChangeId] ASC, [PersonToNameChangeCounter] ASC),
    CONSTRAINT [R_134] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [R_135] FOREIGN KEY ([PersonNameChangeId]) REFERENCES [dbo].[TblPersonNameChange] ([PersonNameChangeId]),
    CONSTRAINT [R_151] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [XAKUniquePersonToNameChange] UNIQUE NONCLUSTERED ([PersonId] ASC, [PersonToNameChangeDeleted] ASC, [PersonToNameChangeSourceId] ASC, [PersonToNameChangeTransactionEndDate] ASC, [PersonToNameChangeTransactionStartDate] ASC, [PersonToNameChangeCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonToPupil] (
    [PupilId]                 BIGINT   NOT NULL,
    [PersonId]                 BIGINT   NOT NULL,
    [PersonToPupilTransactionEndDate] DATETIME NULL,
    [PersonToPupilSourceId]      INT      NULL,
    [PersonToPupilTransactionStartDate] DATETIME NOT NULL,
    [PersonToPupilDeleted]         DATETIME NULL,
    [PersonToPupilRowInsertedDate] DATETIME NULL,
    [EventId]                  BIGINT   NULL,
    [PersonToPupilCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPersonToPupil] PRIMARY KEY CLUSTERED ([PupilId] ASC, [PersonId] ASC, [PersonToPupilTransactionStartDate] ASC, [PersonToPupilCounter] ASC),
    CONSTRAINT [R_1] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [R_152] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_2] FOREIGN KEY ([PupilId]) REFERENCES [dbo].[TblPupil] ([PupilId]),
    CONSTRAINT [XAKUniquePersonToPupil] UNIQUE NONCLUSTERED ([PupilId] ASC, [PersonToPupilTransactionStartDate] ASC, [PersonToPupilTransactionEndDate] ASC, [PersonToPupilSourceId] ASC, [PersonToPupilDeleted] ASC, [PersonId] ASC, [PersonToPupilCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblPersonToStatus] (
    [PersonId]                 BIGINT   NOT NULL,
    [PersonToStatusStatusFlag]     BIT      NULL,
    [PersonToStatusTransactionEndDate] DATETIME NULL,
    [PersonStatusTypeId]         BIGINT   NOT NULL,
    [PersonToStatusTransactionStartDate] DATETIME NOT NULL,
    [PersonToStatusValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_271090117] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PersonToStatusValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_372670931] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonToStatusDeleted]         DATETIME NULL,
    [PersonToStatusSourceId]      INT      NULL,
    [PersonToStatusRowInsertedDate] DATETIME NULL,
    [EventId]                  BIGINT   NULL,
    [PersonToStatusCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPersonToStatus] PRIMARY KEY CLUSTERED ([PersonId] ASC, [PersonStatusTypeId] ASC, [PersonToStatusTransactionStartDate] ASC, [PersonToStatusValidStartDate] ASC, [PersonToStatusCounter] ASC),
    CONSTRAINT [R_129] FOREIGN KEY ([PersonStatusTypeId]) REFERENCES [dbo].[TblPersonStatusType] ([PersonStatusTypeId]),
    CONSTRAINT [R_157] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_82] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[TblPerson] ([PersonId]),
    CONSTRAINT [XAKUniquePersonToStatus] UNIQUE NONCLUSTERED ([PersonToStatusValidEndDate] ASC, [PersonToStatusTransactionStartDate] ASC, [PersonToStatusTransactionEndDate] ASC, [PersonToStatusStatusFlag] ASC, [PersonToStatusSourceId] ASC, [PersonToStatusDeleted] ASC, [PersonStatusTypeId] ASC, [PersonToStatusValidStartDate] ASC, [PersonId] ASC, [PersonToStatusCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblPupilAttendanceType] (
    [PupilAttendanceTypeDescription]        VARCHAR (70) NULL,
    [PupilAttendanceTypeGroup]         VARCHAR (60) NULL,
    [PupilAttendanceTypeDeleted]         DATETIME     CONSTRAINT [Default_Null_Date_Value_1058601942] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceTypeTransactionStartDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1804391119] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceTypeTransactionEndDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1702810305] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PupilAttendanceTypeSourceId]      BIGINT       NULL,
    [PupilAttendanceTypeInternalCode]    VARCHAR (60) NULL,
    [PupilAttendanceTypeExternalCode]    VARCHAR (60) NULL,
    [PupilAttendanceTypeSubGroup]     VARCHAR (60) NULL,
    [PupilAttendanceTypeRowInsertedDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_1939520199] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    CONSTRAINT [XPKPupilAttendanceType] PRIMARY KEY CLUSTERED ([PupilAttendanceTypeId] ASC)
)
GO
CREATE TABLE [dbo].[TblPupilAttendance] (
    [PupilAttendanceTransactionStartDate]  DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PupilAttendanceTransactionEndDate]  DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceValidStartDate]   DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PupilAttendanceValidEndDate]   DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceCounter]          BIGINT        NOT NULL,
    [PupilId]                 BIGINT        NOT NULL,
    [InstitutionId]                BIGINT        NOT NULL,
    [PupilAttendanceDeleted]          DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceRowInsertedDate]  DATETIME      DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilAttendanceMarkDescription]     VARCHAR (MAX) NULL,
    [PupilAttendanceTypeId]       BIGINT        NOT NULL,
    [PupilAttendanceSummarySourceId] CHAR (18)     NULL,
    [AttendanceSummaryTypeId]     BIGINT           NOT NULL,
    CONSTRAINT XPKPupilAttendance PRIMARY KEY CLUSTERED ([PupilId] ASC, [InstitutionId] ASC, [PupilAttendanceTypeId] ASC, [PupilAttendanceCounter] ASC, [PupilAttendanceTransactionStartDate] ASC, [AttendanceSummaryTypeId] ASC, [PupilAttendanceValidStartDate] ASC),
    CONSTRAINT R_168 FOREIGN KEY (PupilId) REFERENCES TblPupil(PupilId),
    CONSTRAINT R_169 FOREIGN KEY (InstitutionId) REFERENCES TblInstitution(InstitutionId),
    CONSTRAINT R_173 FOREIGN KEY (AttendanceSummaryTypeId) REFERENCES TblAttendanceSummaryType(AttendanceSummaryTypeId),
    CONSTRAINT R_174 FOREIGN KEY (PupilAttendanceTypeId) REFERENCES TblPupilAttendanceType(PupilAttendanceTypeId)
)
GO
CREATE TABLE [dbo].[TblPupilHistory] (
    [PupilID]          BIGINT       NOT NULL,
    [PupilUPN]         VARCHAR (20) NULL,
    [PupilCurrent]        BIT          NULL,
    [PupilTransactionStartDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_978432132] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PupilTransactionEndDate] DATETIME     CONSTRAINT [Default_Null_Date_Value_876851318] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilActive]        BIT          NULL,
    [PupilSourceKey]     BIGINT       NULL,
    [PupilSourceId]      BIGINT       NULL,
    [PupilDeleted]         DATETIME     NOT NULL,
    [PupilRowInsertedDate] DATETIME     NULL,
    [PupilToHistory]     SMALLINT     NULL,
    CONSTRAINT [XPKPupilHistory] PRIMARY KEY CLUSTERED ([PupilId] ASC, [PupilTransactionStartDate] ASC, [PupilDeleted] ASC)
)
GO
CREATE TABLE [dbo].[TblPupilMetricType] (
    [PupilMetricTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PupilMetricTypeDescription]        VARCHAR (70) NULL,
    [PupilMetricTypeGroup]         VARCHAR (70) NULL,
    [PupilMetricTypeTransactionStartDate] DATETIME     NULL,
    [PupilMetricTypeTransactionEndDate] DATETIME     NULL,
    [PupilMetricTypeDeleted]         DATETIME     NULL,
    [PupilMetricTypeSourceId]      INT          NULL,
    [PupilMetricTypeRowInsertedDate] DATETIME     NULL,
    [PupilMetricTypeSubGroup]     VARCHAR (70) NULL,
    [PupilMetricTypeExternalCode]    VARCHAR (60) NULL,
    [PupilMetricTypeInternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKMetricType] PRIMARY KEY CLUSTERED ([PupilMetricTypeId] ASC),
    CONSTRAINT [XAKPupilMetricTypeUniqueIndex] UNIQUE NONCLUSTERED ([PupilMetricTypeDeleted] ASC, [PupilMetricTypeTransactionEndDate] ASC, [PupilMetricTypeTransactionStartDate] ASC, [PupilMetricTypeGroup] ASC, [PupilMetricTypeInternalCode] ASC)
)
GO
CREATE TABLE [dbo].[TblPupilToMetric] (
    [PupilId]                 BIGINT   NOT NULL,
    [PupilToMetricValue]         INT      NULL,
    [PupilToMetricTransactionEndDate] DATETIME NULL,
    [PupilToMetricSourceId]      INT      NULL,
    [PupilMetricTypeId]         BIGINT   NOT NULL,
    [PupilToMetricTransactionStartDate] DATETIME NOT NULL,
    [PupilToMetricValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_423265495] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PupilToMetricValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_321684681] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PupilToMetricDeleted]         DATETIME NULL,
    [PupilToMetricRowInsertedDate] DATETIME NULL,
    [EventId]                  BIGINT   NOT NULL,
    [InstitutionId]                BIGINT   NOT NULL,
    [PupilToMetricCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPupilToMetric] PRIMARY KEY CLUSTERED ([PupilId] ASC, [PupilMetricTypeId] ASC, [PupilToMetricTransactionStartDate] ASC, [PupilToMetricValidStartDate] ASC, [InstitutionId] ASC, [PupilToMetricCounter] ASC),
    CONSTRAINT [XAKUniquePupilToMetric] UNIQUE (PupilMetricTypeId ASC,PupilToMetricValidEndDate ASC,PupilToMetricValue ASC,PupilToMetricTransactionStartDate ASC,PupilToMetricTransactionEndDate ASC,PupilToMetricSourceId ASC,PupilToMetricDeleted ASC,PupilId ASC,PupilToMetricValidStartDate ASC,PupilToMetricCounter ASC),
    CONSTRAINT [R_115] FOREIGN KEY ([PupilMetricTypeId]) REFERENCES [dbo].[TblPupilMetricType] ([PupilMetricTypeId]),
    CONSTRAINT [R_149] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_163] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [R_92] FOREIGN KEY ([PupilId]) REFERENCES [dbo].[TblPupil] ([PupilId])
)
GO
CREATE TABLE [dbo].[TblPupilToStatus] (
    [PupilId]                 BIGINT   NOT NULL,
    [PupilToStatusFlag]         BIT      NULL,
    [PupilToStatusTransactionEndDate] DATETIME NULL,
    [PupilToStatusSourceId]      INT      NULL,
    [PupilToStatusValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_321225922] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [PupilToStatusValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_422806736] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [PersonStatusTypeId]         BIGINT   NOT NULL,
    [PupilToStatusTransactionStartDate] DATETIME NOT NULL,
    [PupilToStatusDeleted]         DATETIME NULL,
    [PupilToStatusRowInsertedDate] DATETIME NULL,
    [EventId]                  BIGINT   NULL,
    [InstitutionId]                BIGINT   NOT NULL,
    [PupilToStatusCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKPupilToStatus] PRIMARY KEY CLUSTERED ([PupilId] ASC, [PersonStatusTypeId] ASC, [PupilToStatusTransactionStartDate] ASC, [PupilToStatusValidStartDate] ASC, [InstitutionId] ASC, [PupilToStatusCounter] ASC),
    CONSTRAINT [R_100] FOREIGN KEY ([PupilId]) REFERENCES [dbo].[TblPupil] ([PupilId]),
    CONSTRAINT [R_137] FOREIGN KEY ([PersonStatusTypeId]) REFERENCES [dbo].[TblPersonStatusType] ([PersonStatusTypeId]),
    CONSTRAINT [R_158] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_164] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId]),
    CONSTRAINT [XAKUniquePupilToStatus] UNIQUE NONCLUSTERED ([PupilToStatusValidEndDate] ASC, [PupilToStatusTransactionStartDate] ASC, [PupilToStatusSourceId] ASC, [PupilToStatusFlag] ASC, [PupilToStatusDeleted] ASC, [PupilId] ASC, [PersonStatusTypeId] ASC, [PupilToStatusValidStartDate] ASC, [PupilToStatusTransactionEndDate] ASC, [PupilToStatusCounter] ASC)
)
GO
CREATE TABLE [dbo].[TblSchoolSponsorType] (
    [SchoolSponsorTypeId]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [SchoolSponsorTypeDescription]        VARCHAR (70) NULL,
    [SchoolSponsorTypeTransactionStartDate] DATETIME     NULL,
    [SchoolSponsorTypeTransactionEndDate] DATETIME     NULL,
    [SchoolSponsorTypeSourceId]      INT          NULL,
    [SchoolSponsorTypeRowInsertedDate] DATETIME     NULL,
    [SchoolSponsorTypeGroup]         VARCHAR (70) NULL,
    [SchoolSponsorTypeDeleted]         DATETIME     NULL,
    [SchoolSponsorTypeSubGroup]     VARCHAR (60) NULL,
    [SchoolSponsorTypeExternalCode]    VARCHAR (60) NULL,
    [SchoolSponsorTypeInternalCode]    VARCHAR (60) NULL,
    CONSTRAINT [XPKSchoolSponsorType] PRIMARY KEY CLUSTERED ([SchoolSponsorTypeId] ASC),
    CONSTRAINT [XAK_SchoolSponsorTypeUniqueIndex] UNIQUE NONCLUSTERED ([SchoolSponsorTypeDeleted] ASC, [SchoolSponsorTypeGroup] ASC, [SchoolSponsorTypeInternalCode] ASC, [SchoolSponsorTypeTransactionStartDate] ASC, [SchoolSponsorTypeTransactionEndDate] ASC)
)
GO
CREATE TABLE [dbo].[TblSchoolToSponsor] (
    [InstitutionId]                    BIGINT   NOT NULL,
    [SchoolToSponsorTransactionEndDate] DATETIME NULL,
    [SchoolToSponsorSourceId]      INT      NULL,
    [SchoolToSponsorTransactionStartDate] DATETIME NOT NULL,
    [SchoolToSponsorDeleted]         DATETIME NULL,
    [SchoolToSponsorRowInsertedDate] DATETIME CONSTRAINT [Default_Null_Date_Value_1763716399] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [SchoolToSponsorValidStartDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_2090528311] DEFAULT ('31-12-9999 00:00:00.000') NOT NULL,
    [SchoolToSponsorValidEndDate]  DATETIME CONSTRAINT [Default_Null_Date_Value_2102858171] DEFAULT ('31-12-9999 00:00:00.000') NULL,
    [SchoolSponsorTypeId]         BIGINT   NOT NULL,
    [EventId]                      BIGINT   NULL,
    [SchoolToSponsorCounter]         BIGINT   NOT NULL,
    CONSTRAINT [XPKSchoolSponsor] PRIMARY KEY CLUSTERED ([InstitutionId] ASC, [SchoolToSponsorTransactionStartDate] ASC, [SchoolSponsorTypeId] ASC, [SchoolToSponsorValidStartDate] ASC, [SchoolToSponsorCounter] ASC),
    CONSTRAINT [R_147] FOREIGN KEY ([SchoolSponsorTypeId]) REFERENCES [dbo].[TblSchoolSponsorType] ([SchoolSponsorTypeId]),
    CONSTRAINT [R_159] FOREIGN KEY ([EventId]) REFERENCES [dbo].[TblEvent] ([EventId]),
    CONSTRAINT [R_77] FOREIGN KEY ([InstitutionId]) REFERENCES [dbo].[TblInstitution] ([InstitutionId])
)
GO
CREATE NONCLUSTERED INDEX [NciWiTblEvent6960380FFCC22DB79511982489DD2695]
    ON [dbo].[TblEvent]([EventTypeId] ASC)
    INCLUDE([EventSourceKey], [EventTransactionEndDate], [EventTransactionStartDate], [EventValidEndDate], [EventValidStartDate]);
--**************************************************************************************
-- END of SQL Script
--**************************************************************************************