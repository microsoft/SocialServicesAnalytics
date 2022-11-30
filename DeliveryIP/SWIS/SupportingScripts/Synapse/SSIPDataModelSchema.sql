CREATE TABLE [dbo].[TblInstitution] (
    [InstitutionId]                                      VARBINARY(8000)                              NOT NULL    
    ,[InstitutionURN]                                    INT                                          NULL
    ,[InstitutionPhase]                                  VARCHAR (60)                                 NULL
    ,[InstitutionName]                                   VARCHAR (70)                                 NULL
    ,[InstitutionSourceKey]                              INT                                          NULL
    ,[InstitutionDeleted]                                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTransactionStartDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTransactionEndDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionAgeRange]                               VARCHAR (60)                                 NULL
    ,[InstitutionDFE]                                    INT                                          NULL
    ,[InstitutionSourceId]                               BIGINT                                       NULL
    ,[InstitutionRowInstitutionDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToHistory]                              SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([InstitutionId])
)
GO
CREATE TABLE [dbo].[TblPerson] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[PersonMdmId]                                       NUMERIC (18)                                 NULL
    ,[PersonMiddleName]                                  VARCHAR (70)                                 NULL
    ,[PersonSurname]                                     VARCHAR (70)                                 NOT NULL
    ,[PersonDateOfBirth]                                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonDateOfDeath]                                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonGender]                                      VARCHAR (60)                                 NOT NULL
    ,[PersonTransactionStartDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonTransactionEndDate]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonForename]                                    VARCHAR (70)                                 NULL
    ,[PersonTitle]                                       VARCHAR (60)                                 NULL
    ,[PersonActive]                                      BIT                                          NULL
    ,[PersonKnownBy]                                     VARCHAR (70)                                 NULL
    ,[PersonLegalSurname]                                VARCHAR (70)                                 NULL
    ,[PersonLegalForename]                               VARCHAR (70)                                 NULL
    ,[PersonSourceKey]                                   NUMERIC (18)                                 NULL
    ,[PersonChecksum]                                    VARBINARY(8000)                              NULL
    ,[PersonDeleted]                                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonSourceId]                                    BIGINT                                       NULL
    ,[PersonRowInsertedDate]                             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToHistory]                                   SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PersonId])
)
GO
CREATE TABLE [dbo].[TblPupil] (
    [PupilId]                                            VARBINARY(8000)                              NOT NULL
    ,[PupilUPN]                                          VARCHAR (13)                                 NOT NULL
    ,[PupilCurrent]                                      BIT                                          NOT NULL
    ,[PupilTransactionStartDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilTransactionEndDate]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilActive]                                       BIT                                          NULL
    ,[PupilSourceKey]                                    INT                                          NULL
    ,[PupilSourceId]                                     BIGINT                                       NULL
    ,[PupilDeleted]                                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilRowInsertedDate]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToHistory]                                    SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PupilId])
)
GO
CREATE TABLE [dbo].[TblAddress] (
    [AddressId]                                          VARBINARY(8000)                              NOT NULL
    ,[AddresUprn]                                        VARCHAR (12)                                 NULL
    ,[AddressHouseNumber]                                VARCHAR (12)                                 NULL
    ,[AddressUnitNumber]                                 INT                                          NULL
    ,[AddressUnitName]                                   VARCHAR (20)                                 NULL
    ,[AddressStreet]                                     VARCHAR (70)                                 NULL
    ,[AddressDistrict]                                   VARCHAR (20)                                 NULL
    ,[AddressTown]                                       VARCHAR (20)                                 NULL
    ,[AddressCounty]                                     VARCHAR (20)                                 NULL
    ,[AddressPostcode]                                   VARCHAR (7)                                  NULL
    ,[AddressCountry]                                    VARCHAR (20)                                 NULL
    ,[AddressSourceId]                                   BIGINT                                       NULL
    ,[AddressDeleted]                                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTransactionEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTransactionStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressSourceKey]                                  VARCHAR (8000)                                NULL
    ,[AddressRowInsertedDate]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressToHistory]                                  SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([AddressId])
)
GO
CREATE TABLE [dbo].[TblAddressHistory] (
    [AddressId]                                          VARBINARY(8000)                              NOT NULL
    ,[AddresUprn]                                        VARCHAR (20)                                 NULL
    ,[AddressHouseNumber]                                VARCHAR (20)                                 NULL
    ,[AddressUnitNumber]                                 VARCHAR (20)                                 NULL
    ,[AddressUnitName]                                   VARCHAR (20)                                 NULL
    ,[AddressStreet]                                     VARCHAR (70)                                 NULL
    ,[AddressDistrict]                                   VARCHAR (20)                                 NULL
    ,[AddressTown]                                       VARCHAR (20)                                 NULL
    ,[AddressCounty]                                     VARCHAR (20)                                 NULL
    ,[AddressPostcode]                                   VARCHAR (10)                                 NULL
    ,[AddressCountry]                                    VARCHAR (20)                                 NULL
    ,[AddressSourceId]                                   BIGINT                                       NULL
    ,[AddressDeleted]                                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[AddressTransactionEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTransactionStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[AddressSourceKey]                                  VARCHAR (8000)                                NULL
    ,[AddressRowInsertedDate]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressToHistory]                                  SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([AddressId])
)
GO
CREATE TABLE [dbo].[TblAddressType] (
    [AddressTypeId]                                      VARBINARY(8000)                              NOT NULL
    ,[AddressTypeDescription]                            VARCHAR (70)                                 NULL
    ,[AddressTypeTransactionStartDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTypeTransactionEndDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTypeDeleted]                                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTypeSourceCodeId]                           INT                                          NULL
    ,[AddressTypeGroup]                                  VARCHAR (70)                                 NULL
    ,[AddressTypeRowInsertedDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTypeSubGroup]                               VARCHAR (70)                                 NULL
    ,[AddressTypeInternalCode]                           VARCHAR (60)                                 NULL
    ,[AddressTypeExternalCode]                           VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblDocumentType] (
    [DocumentTypeForm]                                   VARCHAR (70)                                 NULL
    ,[DocumentTypeGroup]                                 VARCHAR (70)                                 NULL
    ,[DocumentTypeId]                                    VARBINARY(8000)                              NOT NULL
    ,[DocumentTypeCreator]                               VARCHAR (70)                                 NULL
    ,[DocumentTypeDeleted]                               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentTypeDescription]                           VARCHAR (8000)                               NULL
    ,[DocumentTypeSourceId]                              BIGINT                                       NULL
    ,[DocumentTypeSourceKey]                             BIGINT                                       NULL
    ,[DocumentTypeTransactionStartDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentTypeTransactionEndDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentTypeValid]                                 SMALLINT                                     NULL
    ,[DocumentTypeValidStartDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentTypeValidEndDate]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentTypeFileName]                              VARCHAR (70)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventCategoryType] (
    [EventCategoryTypeId]                                VARBINARY(8000)                              NOT NULL
    ,[EventCategoryTypeDescription]                      VARCHAR (70)                                 NULL
    ,[EventCategoryTypeGroup]                            VARCHAR (70)                                 NULL
    ,[EventCategoryTypeTransactionStartDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventCategoryTypeTransactionEndDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventCategoryTypeDeleted]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventCategoryTypeSourceId]                         BIGINT                                       NULL
    ,[EventCategoryTypeRowInsertedDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventCategoryTypeSubGroup]                         VARCHAR (70)                                 NULL
    ,[EventCategoryTypeInternalCode]                     VARCHAR (60)                                 NULL
    ,[EventCategoryTypeExternalCode]                     VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventType] (
    [EventTypeId]                                        VARBINARY(8000)                              NOT NULL
    ,[EventTypeDescription]                              VARCHAR (70)                                 NULL
    ,[EventTypeGroup]                                    VARCHAR (70)                                 NULL
    ,[EventTypeTransactionStartDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTypeTransactionEndDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTypeDeleted]                                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTypeSourceId]                                 BIGINT                                       NULL
    ,[EventTypeRowInsertedDate]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTypeSubGroup]                                 VARCHAR (70)                                 NULL
    ,[EventTypeInternalCode]                             VARCHAR (60)                                 NULL
    ,[EventTypeExternalCode]                             VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventReasonType] (
    [EventReasonTypeId]                                  VARBINARY(8000)                              NOT NULL
    ,[EventReasonTypeDescription]                        VARCHAR (70)                                 NULL
    ,[EventReasonTypeGroup]                              VARCHAR (70)                                 NULL
    ,[EventReasonTypeTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventReasonTypeTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventReasonTypeDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventReasonTypeSourceId]                           BIGINT                                       NULL
    ,[EventReasonTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventReasonTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[EventReasonTypeInternalCode]                       VARCHAR (60)                                 NULL
    ,[EventReasonTypeExternalCode]                       VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEvent] (
    [EventId]                                            VARBINARY(8000)                              NOT NULL
    ,[EventTypeId]                                       VARBINARY(8000)                              NOT NULL
    ,[EventReasonTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[EventTransactionStartDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTransactionEndDate]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventCategoryTypeId]                               VARBINARY(8000)                              NOT NULL
    ,[EventSourceId]                                     BIGINT                                       NULL
    ,[EventSourceKey]                                    VARCHAR (70)                                 NULL
    ,[EventValidStartDate]                               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventValidEndDate]                                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventAcademicYear]                                 VARCHAR (60)                                 NULL
    ,[EventDeleted]                                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRowInsertedDate]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventValidCreationDate]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([EventId])
)
GO
CREATE TABLE [dbo].[TblDocumentToEvent] (
    [EventId]                                            VARBINARY(8000)                              NOT NULL
    ,[DocumentToEventValidStartDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventValidEndDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[DocumentToEventCounter]                            BIGINT                                       NULL
    ,[DocumentTypeId]                                    VARBINARY(8000)                              NOT NULL
    ,[DocumentToEventDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventSourceId]                           BIGINT                                       NULL
    ,[DocumentToEventMarkerID]                           VARCHAR (70)                                 NULL
    ,[DocumentToEventPathReference]                      VARCHAR (70)                                 NULL
    ,[DocumentToEventFormEndDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventFormStartDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventFormDueDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventFormCompleteDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentToEventFormAuthorisedEndDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentAuthorisedStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[DocumentAuthorisedEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblEthnoLinguisticType] (
    [EthnoLinguisticTypeId]                              VARBINARY(8000)                              NOT NULL
    ,[EthnoLinguisticTypeDescription]                    VARCHAR (70)                                 NULL
    ,[EthnoLinguisticTypeGroup]                          VARCHAR (70)                                 NULL
    ,[EthnoLinguisticTypeTransactionStartDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EthnoLinguisticTypeTransactionEndDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EthnoLinguisticTypeDeleted]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EthnoLinguisticTypeSourceId]                       BIGINT                                       NULL
    ,[EthnoLinguisticTypeRowInsertedDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EthnoLinguisticTypeSubGroup]                       VARCHAR (70)                                 NULL
    ,[EthnoLinguisticTypeInternalCode]                   VARCHAR (60)                                 NULL
    ,[EthnoLinguisticTypeExternalCode]                   VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventMetricType] (
    [EventMetricTypeId]                                  VARBINARY(8000)                              NOT NULL
    ,[EventMetricTypeDescription]                        VARCHAR (70)                                 NULL
    ,[EventMetricTypeGroup]                              VARCHAR (70)                                 NULL
    ,[EventMetricTypeTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventMetricTypeTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventMetricTypeDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventMetricTypeSourceId]                           BIGINT                                       NULL
    ,[EventMetricTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventMetricTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[EventMetricTypeInternalCode]                       VARCHAR (60)                                 NULL
    ,[EventMetricTypeExternalCode]                       VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventRelationshipType] (
    [EventRelationshipTypeId]                            VARBINARY(8000)                              NOT NULL
    ,[EventRelationshipTypeGroup]                        VARCHAR (70)                                 NULL
    ,[EventRelationshipTypeDescription]                  VARCHAR (70)                                 NULL
    ,[EventRelationshipTypeExternalCode]                 VARCHAR (60)                                 NULL
    ,[EventRelationshipTypeDeleted]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipTypeInternalCode]                 VARCHAR (60)                                 NULL
    ,[EventRelationshipTypeTransactionStartDate]         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipTypeTransactionEndDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipTypeSourceCode]                   VARCHAR (60)                                 NULL
    ,[EventRelationshipTypeRowInsertedDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipTypeSubGroup]                     VARCHAR (70)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventRelationship] (
    [EventRelationshipTransactionStartDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventRelationshipTransactionEndDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[EventRELATEDId]                                    VARBINARY(8000)                              NOT NULL
    ,[EventRelationshipValidStartDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventRelationshipValidEndDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipRowInsertedDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipDeleted]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventRelationshipTypeId]                           VARBINARY(8000)                              NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventStatusType] (
    [EventStatusTypeTransactionStartDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventStatusTypeTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventStatusTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[EventStatusTypeDescription]                        VARCHAR (70)                                 NULL
    ,[EventStatusTypeDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventStatusTypeGroup]                              VARCHAR (70)                                 NULL
    ,[EventStatusTypeSourceId]                           BIGINT                                       NULL
    ,[EventStatusTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventStatusTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[EventStatusTypeInternalCode]                       VARCHAR (60)                                 NULL
    ,[EventStatusTypeExternalCode]                       VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventToInstitution] (
    [InstitutionId]                                      VARBINARY(8000)                              NOT NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[EventTypeId]                                       VARBINARY(8000)                              NOT NULL
    ,[EventToInstitutionTransactionEndDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToInstitutionTransactionStartDate]            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToInstitutionSourceId]                        BIGINT                                       NULL
    ,[EventToInstitutionDeleted]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToInstitutionValidStartDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToInstitutionValidEndDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToInstitutionRowInsertedDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToInstitutionCounter]                         BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([InstitutionId])
)
GO
CREATE TABLE [dbo].[TblAttendanceSummaryType] (
    [InstitutionSourceKey]                               BIGINT                                       NULL
    ,[Code]                                              VARCHAR (60)                                 NULL
    ,[Meaning]                                           VARCHAR (60)                                 NULL
    ,[StatutoryMeaning]                                  VARCHAR (70)                                 NULL
    ,[SchoolMeaning]                                     VARCHAR (8000)                               NULL
    ,[TransactionalStartDate]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[TransactionalEndDate]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NULL
    ,[AttendanceSummaryTypeId]                           VARBINARY(8000)                              NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventToMetric] (
    [EventToMetricTransactionEndDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToMetricValue]                                DECIMAL (12, 9)                              NULL
    ,[EventMetricTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[EventToMetricTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToMetricValidEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToMetricValidStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToMetricSourceId]                             BIGINT                                       NULL
    ,[EventToMetricDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToMetricRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[EventToMetricCounter]                              BIGINT                                       NOT NULL
)    
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonRoleType] (
    [PersonRoleTypeId]                                   VARBINARY(8000)                              NOT NULL
    ,[PersonRoleType_Description]                        VARCHAR (70)                                 NULL
    ,[PersonRoleTypeGroup]                               VARCHAR (70)                                 NULL
    ,[PersonRoleTypeTransactionStartDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonRoleTypeTransactionEndDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonRoleTypeDeleted]                             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonRoleTypeSourceId]                            BIGINT                                       NULL
    ,[PersonRoleTypeRowInsertedDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonRoleTypeSubGroup]                            VARCHAR (70)                                 NULL
    ,[PersonRoleTypeInternalCode]                        VARCHAR (60)                                 NULL
    ,[PersonRoleTypeExternalCode]                        VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblEventToPerson] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[PersonRoleTypeId]                                  VARBINARY(8000)                              NOT NULL
    ,[EventToPersonTransactionEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToPersonSourceId]                             BIGINT                                       NULL
    ,[EventToPersonTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToPersonDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToPersonValidStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToPersonValidEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToPersonRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[EventToPersonCounter]                              BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblEventToPupil] (
    [PupilId]                                            VARBINARY(8000)                              NOT NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[EventToPupilTransactionEndDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventTypeId]                                       VARBINARY(8000)                              NOT NULL
    ,[EventToPupilSourceId]                              BIGINT                                       NULL
    ,[EventToPupilTransactionStartDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToPupilDeleted]                               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToPupilValidStartDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToPupilValidEndDate]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToPupilRowInsertedDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToPupilCounter]                               BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblEventToStatus] (
    [EventId]                                            VARBINARY(8000)                              NOT NULL
    ,[EventStatusTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[EventToStatusTransactionEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToStatusFlag]                                 BIT                                          NULL
    ,[EventToStatusSourceId]                             BIGINT                                       NULL
    ,[EventToStatusTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToStatusValidStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[EventToStatusValidEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToStatusDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToStatusRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventToStatusCounter]                              BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblInstitutionHistory] (
    [InstitutionId]                                      VARBINARY(8000)                              NOT NULL
    ,[InstitutionURN]                                    INT                                          NULL
    ,[InstitutionPhase]                                  VARCHAR (60)                                 NULL
    ,[InstitutionName]                                   VARCHAR (70)                                 NULL
    ,[InstitutionSourceKey]                              INT                                          NULL
    ,[InstitutionDeleted]                                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionTransactionStartDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionTransactionEndDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionAgeRange]                               VARCHAR (60)                                 NULL
    ,[InstitutionDFE]                                    INT                                          NULL
    ,[InstitutionSourceId]                               BIGINT                                       NULL
    ,[InstitutionRowInsertedDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToHistory]                              SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([InstitutionId])
)
GO
CREATE TABLE [dbo].[TblInstitutionMetricType] (
    [InstitutionMetricTypeId]                            VARBINARY(8000)                              NOT NULL
    ,[InstitutionMetricTypeDescription]                  VARCHAR (70)                                 NULL
    ,[InstitutionMetricTypeGroup]                        VARCHAR (70)                                 NULL
    ,[InstitutionMetricTypeTransactionStartDate]         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionMetricTypeTransactionEndDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionMetricTypeDeleted]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionMetricTypeSourceId]                     BIGINT                                       NULL
    ,[InstitutionMetricTypeRowInsertedDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionMetricTypeSubGroup]                     VARCHAR (70)                                 NULL
    ,[InstitutionMetricTypeInternalCode]                 VARCHAR (60)                                 NULL
    ,[InstitutionMetricTypeExternalCode]                 VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblInstitutionStatusType] (
    [InstitutionStatusTypeDeleted]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionStatusTypeDescription]                  VARCHAR (70)                                 NULL
    ,[InstitutionStatusTypeGroup]                        VARCHAR (70)                                 NULL
    ,[InstitutionStatusTypeTransactionStartDate]         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionStatusTypeTransactionEndDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionStatusTypeId]                           VARBINARY(8000)                              NOT NULL
    ,[InstitutionStatusTypeTransactionSourceId]          BIGINT                                       NULL
    ,[InstitutionTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[InstitutionStatusTypeExternalCode]                 VARCHAR (60)                                 NULL
    ,[InstitutionStatusTypeInternalCode]                 VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblInstitutionToAddress] (
    [AddressId]                                          VARBINARY(8000)                              NOT NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[InstitutionToAddressTransactionEndDate]            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[AddressTypeId]                                     VARBINARY(8000)                              NOT NULL
    ,[InstitutionToAddressSourceId]                      BIGINT                                       NULL
    ,[InstitutionToAddressTransactionStartDate]          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToAddressDeleted]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToAddressRowInsertedDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[InstitutionToAddressCounter]                       BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblInstitutionType] (
    [InstitutionTypeDeleted]                             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeSourceId]                           BIGINT                                       NULL
    ,[InstitutionTypeDescription]                        VARCHAR (70)                                 NULL
    ,[InstitutionTypeGroup]                              VARCHAR (70)                                 NULL
    ,[InstitutionTypeTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[InstitutionTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[InstitutionTypeExternalCode]                       VARCHAR (60)                                 NULL
    ,[InstitutionTypeInternalCode]                       VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblInstitutionToInstitutionType] (
    [InstitutionId]                                      VARBINARY(8000)                              NOT NULL
    ,[InstitutionToInstitutionTypeTransactionEndDate]    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToInstitutionTypeTransactionStartDate]  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToInstitutionTypeSourceId]              BIGINT                                       NULL
    ,[InstitutionToInstitutionTypeDeleted]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[InstitutionToInstitutionTypeValidStartDate]        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToInstitutionTypeValidEndDate]          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToInstitutionTypeRowInsertedDate]       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[InstitutionToInstitutionTypeCounter]               BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblInstitutionToMetric] (
    [InstitutionToMetricTransactionEndDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[InstitutionToMetricValue]                          INT                                          NOT NULL
    ,[InstitutionMetricTypeId]                           INT                                          NOT NULL
    ,[InstitutionToMetricValidStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToMetricValidEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToMetricTransactionStartDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToMetricDeleted]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToMetricSourceId]                       BIGINT                                       NULL
    ,[InstitutionToMetricRowInsertedDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[InstitutionToMetricCounter]                        BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblInstitutionToStatus] (
    [InstitutionToStatusFlag]                            BIT                                          NULL
    ,[InstitutionToStatusTransactionStartDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToStatusTransactionEndDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToStatusValidStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[InstitutionToStatusValidEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionStatusTypeId]                           VARBINARY(8000)                              NOT NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[InstitutionToStatusDeleted]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionToStatusSourceId]                       BIGINT                                       NULL
    ,[InstitutionToStatusRowInsertedDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[InstitutionToStatusCounter]                        BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonHistory] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[PersonMdmId]                                       BIGINT                                       NULL
    ,[PersonMiddleName]                                  VARCHAR (70)                                 NULL
    ,[PersonSurname]                                     VARCHAR (70)                                 NULL
    ,[PersonDateOfBirth]                                 DATE                                         NULL
    ,[PersonDateOfDeath]                                 DATE DEFAULT ('31-12-9999')                  NULL
    ,[PersonGender]                                      VARCHAR (50)                                 NULL
    ,[PersonTransactionStartDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonTransactionEndDate]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonForename]                                    VARCHAR (70)                                 NULL
    ,[PersonTitle]                                       VARCHAR (50)                                 NULL
    ,[PersonActive]                                      BIT                                          NULL
    ,[PersonKnownBy]                                     VARCHAR (70)                                 NULL
    ,[PersonLegalSurname]                                VARCHAR (70)                                 NULL
    ,[PersonLegalForename]                               VARCHAR (70)                                 NULL
    ,[PersonSourceKey]                                   BIGINT                                       NULL
    ,[PersonChecksum]                                    VARBINARY(8000)                              NULL
    ,[PersonDeleted]                                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonSourceId]                                    BIGINT                                       NULL
    ,[PersonRowInsertedDate]                             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToHistory]                                   SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PersonId])
)
GO
CREATE TABLE [dbo].[TblPersonNameChange] (
    [PersonNameChangeForename]                           VARCHAR (70)                                 NULL
    ,[PersonNameChangeSurname]                           VARCHAR (70)                                 NULL
    ,[PersonNameChangeLegalForename]                     VARCHAR (70)                                 NULL
    ,[PersonNameChangeLegalSurname]                      VARCHAR (70)                                 NULL
    ,[PersonNameChangeMiddleName]                        VARCHAR (70)                                 NULL
    ,[PersonNameChangeChecksum]                          VARBINARY(8000)                              NULL
    ,[PersonNameChangeTitle]                             VARCHAR (50)                                 NULL
    ,[PersonNameChangeSourceKey]                         INT                                          NULL
    ,[PersonNameChangeTransactionEndDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeId]                                VARBINARY(8000)                              NOT NULL
    ,[PersonNameChangeTransactionStartDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeDeleted]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeTransactionSourceId]               BIGINT                                       NULL
    ,[PersonNameChangeRowInsertedDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeSourceChangeId]                    BIGINT                                       NULL
    ,[PersonNameChangeValidStartdate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeValidEndDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeToHistory]                         SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PersonNameChangeId])
)
GO
CREATE TABLE [dbo].[TblPersonNameChangeHistory] (
    [PersonNameChangeChecksum]                           VARBINARY(8000)                              NULL
    ,[PersonNameChangeDeleted]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonNameChangeForename]                          VARCHAR (70)                                 NULL
    ,[PersonNameChangeId]                                VARBINARY(8000)                              NOT NULL
    ,[PersonNameChangeLegalForename]                     VARCHAR (70)                                 NULL
    ,[PersonNameChangeLegalSurname]                      VARCHAR (70)                                 NULL
    ,[PersonNameChangeMiddleName]                        VARCHAR (70)                                 NULL
    ,[PersonNameChangeRowInsertedDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeSourceKey]                         INT                                          NULL
    ,[PersonNameChangeSurname]                           VARCHAR (70)                                 NULL
    ,[PersonNameChangeTitle]                             VARCHAR (50)                                 NULL
    ,[PersonNameChangeTransactionEndDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeTransactionSourceId]               BIGINT                                       NULL
    ,[PersonNameChangeTransactionStartDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonNameChangeSourceChangeId]                    BIGINT                                       NULL
    ,[PersonNameChangeValidStartDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeValidEndDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeToHistory]                         SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PersonNameChangeId])
)
GO
CREATE TABLE [dbo].[TblPersonStatusType] (
    [PersonStatusTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[PersonStatusTypeDescription]                       VARCHAR (70)                                 NULL
    ,[PersonStatusTypeGroup]                             VARCHAR (70)                                 NULL
    ,[PersonStatusTypeTransactionStartDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeTransactionEndDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeDeleted]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeSourceId]                          BIGINT                                       NULL
    ,[PersonStatusTypeRowInsertedDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeSubGroup]                          VARCHAR (70)                                 NULL
    ,[PersonStatusTypeInternalCode]                      VARCHAR (60)                                 NULL
    ,[PersonStatusTypeExternalCode]                      VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblPersonToEthnoLinguistic] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[EthnoLinguisticTypeId]                             VARBINARY(8000)                              NOT NULL
    ,[PersonToEthnoLinguisticTransactionEndDate]         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToEthnoLinguisticTransactionStartDate]       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonToEthnoLinguisticSourceId]                   BIGINT                                       NULL
    ,[PersonToEthnoLinguisticDeleted]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToEthnoLinguisticValidStartDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToEthnoLinguisticValidEndDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToEthnoLinguisticRowInsertedDate]            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[PersonToEthnoLinguisticCounter]                    BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonToInstitution] (
    [PersonToInstitutionDeleted]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToInstitutionTransactionStartDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToInstitutionTransactionEndDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToInstitutionSourceId]                       BIGINT                                       NULL
    ,[PersonToInstitutionValidStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToInstitutionValidEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[PersonId]                                          VARBINARY(8000)                              NOT NULL
    ,[PersonRoleTypeId]                                  VARBINARY(8000)                              NOT NULL
    ,[PersonToInstitutionCounter]                        BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonToNameChange] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[PersonToNameChangeTransactionEndDate]              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToNameChangeDeleted]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToNameChangeTransactionStartDate]            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonToNameChangeSourceId]                        BIGINT                                       NULL
    ,[PersonToNameChangeRowInsertedDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonNameChangeId]                                VARBINARY(8000)                              NOT NULL
    ,[PersonToNameChangeValidStartDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToNameChangeValidEndDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[PersonToNameChangeCounter]                         BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonToPupil] (
    [PupilId]                                            VARBINARY(8000)                              NOT NULL
    ,[PersonId]                                          VARBINARY(8000)                              NOT NULL
    ,[PersonToPupilTransactionEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToPupilSourceId]                             BIGINT                                       NULL
    ,[PersonToPupilTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonToPupilDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToPupilRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[PersonToPupilCounter]                              BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPersonToStatus] (
    [PersonId]                                           VARBINARY(8000)                              NOT NULL
    ,[PersonToStatusStatusFlag]                          BIT                                          NULL
    ,[PersonToStatusTransactionEndDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeId]                                VARBINARY(8000)                              NOT NULL
    ,[PersonToStatusTransactionStartDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonToStatusValidStartDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PersonToStatusValidEndDate]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToStatusDeleted]                             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonToStatusSourceId]                            BIGINT                                       NULL
    ,[PersonToStatusRowInsertedDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[PersonToStatusCounter]                             BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPupilAttendanceType] (
    [PupilAttendanceTypeDescription]                     VARCHAR (70)                                 NULL
    ,[PupilAttendanceTypeGroup]                          VARCHAR (60)                                 NULL
    ,[PupilAttendanceTypeDeleted]                        DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceTypeTransactionStartDate]           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceTypeTransactionEndDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceTypeId]                             VARBINARY(8000)                              NOT NULL
    ,[PupilAttendanceTypeSourceId]                       BIGINT                                       NULL
    ,[PupilAttendanceTypeInternalCode]                   VARCHAR (60)                                 NULL
    ,[PupilAttendanceTypeExternalCode]                   VARCHAR (60)                                 NULL
    ,[PupilAttendanceTypeSubGroup]                       VARCHAR (60)                                 NULL
    ,[PupilAttendanceTypeRowInsertedDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblPupilAttendance] (
    [PupilAttendanceTransactionStartDate]                DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilAttendanceTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceValidStartDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilAttendanceValidEndDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceCounter]                            BIGINT                                       NOT NULL
    ,[PupilId]                                           VARBINARY(8000)                              NOT NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[PupilAttendanceDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilAttendanceMarkDescription]                    VARCHAR (8000)                               NULL
    ,[PupilAttendanceTypeId]                             VARBINARY(8000)                              NOT NULL
    ,[PupilAttendanceSummarySourceId]                    BIGINT                                       NULL
    ,[AttendanceSummaryTypeId]                           VARBINARY(8000)                              NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPupilHistory] (
    [PupilID]                                            VARBINARY(8000)                              NOT NULL
    ,[PupilUPN]                                          VARCHAR (20)                                 NULL
    ,[PupilCurrent]                                      BIT                                          NULL
    ,[PupilTransactionStartDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilTransactionEndDate]                           DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilActive]                                       BIT                                          NULL
    ,[PupilSourceKey]                                    BIGINT                                       NULL
    ,[PupilSourceId]                                     BIGINT                                       NULL
    ,[PupilDeleted]                                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilRowInsertedDate]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToHistory]                                    SMALLINT                                     NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = HASH([PupilID])
)
GO
CREATE TABLE [dbo].[TblPupilMetricType] (
    [PupilMetricTypeId]                                  VARBINARY(8000)                              NOT NULL
    ,[PupilMetricTypeDescription]                        VARCHAR (70)                                 NULL
    ,[PupilMetricTypeGroup]                              VARCHAR (70)                                 NULL
    ,[PupilMetricTypeTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilMetricTypeTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilMetricTypeDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilMetricTypeSourceId]                           BIGINT                                       NULL
    ,[PupilMetricTypeRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilMetricTypeSubGroup]                           VARCHAR (70)                                 NULL
    ,[PupilMetricTypeExternalCode]                       VARCHAR (60)                                 NULL
    ,[PupilMetricTypeInternalCode]                       VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblPupilToMetric] (
    [PupilId]                                            VARBINARY(8000)                              NOT NULL
    ,[PupilToMetricValue]                                INT                                          NULL
    ,[PupilToMetricTransactionEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToMetricSourceId]                             BIGINT                                       NULL
    ,[PupilMetricTypeId]                                 VARBINARY(8000)                              NOT NULL
    ,[PupilToMetricTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilToMetricValidEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToMetricValidStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilToMetricDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToMetricRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NOT NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[PupilToMetricCounter]                              BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblPupilToStatus] (
    [PupilId]                                            VARBINARY(8000)                              NOT NULL
    ,[PupilToStatusFlag]                                 BIT                                          NULL
    ,[PupilToStatusTransactionEndDate]                   DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToStatusSourceId]                             BIGINT                                       NULL
    ,[PupilToStatusValidStartDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilToStatusValidEndDate]                         DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PersonStatusTypeId]                                VARBINARY(8000)                              NOT NULL
    ,[PupilToStatusTransactionStartDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[PupilToStatusDeleted]                              DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[PupilToStatusRowInsertedDate]                      DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[InstitutionId]                                     VARBINARY(8000)                              NOT NULL
    ,[PupilToStatusCounter]                              BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
GO
CREATE TABLE [dbo].[TblSchoolSponsorType] (
    [SchoolSponsorTypeId]                                VARBINARY(8000)                              NOT NULL
    ,[SchoolSponsorTypeDescription]                      VARCHAR (70)                                 NULL
    ,[SchoolSponsorTypeTransactionStartDate]             DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolSponsorTypeTransactionEndDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolSponsorTypeSourceId]                         BIGINT                                       NULL
    ,[SchoolSponsorTypeRowInsertedDate]                  DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolSponsorTypeGroup]                            VARCHAR (70)                                 NULL
    ,[SchoolSponsorTypeDeleted]                          DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolSponsorTypeSubGroup]                         VARCHAR (60)                                 NULL
    ,[SchoolSponsorTypeExternalCode]                     VARCHAR (60)                                 NULL
    ,[SchoolSponsorTypeInternalCode]                     VARCHAR (60)                                 NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX 
    , DISTRIBUTION = REPLICATE
)
GO
CREATE TABLE [dbo].[TblSchoolToSponsor] (
    [InstitutionId]                                      VARBINARY(8000)                              NOT NULL
    ,[SchoolToSponsorTransactionEndDate]                 DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolToSponsorSourceId]                           BIGINT                                       NULL
    ,[SchoolToSponsorTransactionStartDate]               DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[SchoolToSponsorDeleted]                            DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolToSponsorRowInsertedDate]                    DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolToSponsorValidStartDate]                     DATETIME DEFAULT ('31-12-9999 00:00:00.000') NOT NULL
    ,[SchoolToSponsorValidEndDate]                       DATETIME DEFAULT ('31-12-9999 00:00:00.000') NULL
    ,[SchoolSponsorTypeId]                               VARBINARY(8000)                              NOT NULL
    ,[EventId]                                           VARBINARY(8000)                              NULL
    ,[SchoolToSponsorCounter]                            BIGINT                                       NOT NULL
)
WITH ( 
    CLUSTERED COLUMNSTORE INDEX
    , DISTRIBUTION = ROUND_ROBIN
)
--**************************************************************************************
-- END of SQL Script
--**************************************************************************************