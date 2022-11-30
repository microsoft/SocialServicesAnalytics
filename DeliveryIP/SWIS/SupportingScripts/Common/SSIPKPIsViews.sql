CREATE VIEW [dbo].[VW_SWiSActualsPupilsChildrenInNeedPLans] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.ChildrenInNeedStartDate
	,PresentData.ChildrenInNeedEndDate
	,PresentData.ChildrenInNeedCaseStatus
	,PresentData.ActiveSpecialEducationNeedSEN
	,PresentData.EducationHealtCarePlan
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.ChildrenInNeedStartDate
				,CollectData.ChildrenInNeedEndDate
				,CollectData.ChildrenInNeedCaseStatus
				,CollectData.ActiveSpecialEducationNeedSEN
				,CollectData.EducationHealtCarePlan

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,ChildrenInNeedEvent.EventValidStartDate AS ChildrenInNeedStartDate
				,ChildrenInNeedEvent.EventValidEndDate AS ChildrenInNeedEndDate
				,'Child in need plan' AS ChildrenInNeedCaseStatus
				,COALESCE(ActiveSpecialEducationNeedStatus.PupilToStatusFlag,0) AS ActiveSpecialEducationNeedSEN
				,COALESCE(EducationHealtCarePlanStatus.PupilToStatusFlag,0) AS EducationHealtCarePlan
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

	  FROM dbo.TblEvent AS ChildrenInNeedEvent
  
	  INNER JOIN dbo.TblEventType as EventType
		ON EventType.EventTypeId = ChildrenInNeedEvent.EventTypeId
		AND EventType.EventTypeGroup = 'CHILDREN_IN_NEED'
	
	  INNER JOIN dbo.TblEventToPupil AS EventToPupil
		ON EventToPupil.EventId = ChildrenInNeedEvent.EventId
		AND CONVERT(DATE,ChildrenInNeedEvent.EventTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPupil AS Pupil
		ON Pupil.PupilId = EventToPupil.PupilId

	  INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId

	  INNER JOIN dbo.TblEventToInstitution AS EventToInstitution
		ON EventToInstitution.EventId = ChildrenInNeedEvent.EventId
		AND EventToInstitution.EventTypeId = EventType.EventTypeId 
		AND CONVERT(DATE,EventToInstitution.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = EventToInstitution.InstitutionId
		AND Institution.InstitutionId != -1

	  INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPersonStatusType AS ActiveSpecialEducationNeed
		ON ActiveSpecialEducationNeed.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSpecialEducationNeed.PersonStatusTypeInternalCode ='ACTIVE_SEN'

	  INNER JOIN dbo.TblPersonStatusType AS ActiveEducationHealtCarePlan
		ON ActiveEducationHealtCarePlan.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveEducationHealtCarePlan.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND ActiveEducationHealtCarePlan.PersonStatusTypeInternalCode = 'E'

	  LEFT JOIN dbo.TblPupilToStatus AS ActiveSpecialEducationNeedStatus
		ON ActiveSpecialEducationNeedStatus.PupilId = EventToPupil.PupilId
		AND ActiveSpecialEducationNeedStatus.PersonStatusTypeId = ActiveSpecialEducationNeed.PersonStatusTypeId
		AND CONVERT(DATE,ActiveSpecialEducationNeedStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ActiveSpecialEducationNeedStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	  LEFT JOIN dbo.TblPupilToStatus AS EducationHealtCarePlanStatus
		ON EducationHealtCarePlanStatus.PupilId = EventToPupil.PupilId
		AND EducationHealtCarePlanStatus.PersonStatusTypeId = ActiveSpecialEducationNeed.PersonStatusTypeId
		AND CONVERT(DATE,EducationHealtCarePlanStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,EducationHealtCarePlanStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')
	
	  WHERE Pupil.PupilId !=-1
	  AND Pupil.PupilActive = 1
	  AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_CLA] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.PUPIL
	,PresentData.CLAStartDate
	,PresentData.CLAEndDate
	,PresentData.CLAStatus
	,PresentData.ActiveSEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.CLAStartDate
				,CollectData.CLAEndDate
				,CollectData.CLAStatus
				,CollectData.ActiveSEN
				,CollectData.EHCP

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,CLAEvent.EventValidStartDate AS CLAStartDate
				,CLAEvent.EventValidEndDate AS CLAEndDate
				,CLAEventStatusType.EventStatusTypeDescription AS CLAStatus
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

	  FROM dbo.TblEvent AS CLAEvent
  
	  INNER JOIN dbo.TblEventType as EventType --EV_TYP
		ON EventType.EventTypeId = CLAEvent.EventTypeId
		AND EventType.EventTypeGroup = 'CHILDREN_IN_CARE'
		
	  INNER JOIN dbo.TblEventToStatus AS CLAEventToStatus 
		ON CLAEventToStatus.EventId = CLAEvent.EventId
		AND CONVERT(DATE,CLAEventToStatus.EventToStatusDeleted) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,CLAEventToStatus.EventToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN [dbo].TblEventStatusType AS CLAEventStatusType 
		ON CLAEventStatusType.EventStatusTypeId = CLAEventToStatus.EventStatusTypeId
	
	  INNER JOIN dbo.TblEventToPupil AS EventToPupil
		ON EventToPupil.EventId = CLAEvent.EventId
		AND CONVERT(DATE,CLAEvent.EventTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPupil AS Pupil
		ON Pupil.PupilId = EventToPupil.PupilId

	  INNER JOIN dbo.TblPersonToPupil AS PersonToPupil 
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId

	  INNER JOIN dbo.TblEventToInstitution AS EventToInstitute 
		ON EventToInstitute.EventId = CLAEvent.EventId
		AND EventToInstitute.EventTypeId = EventType.EventTypeId
		AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = EventToInstitute.InstitutionId
		AND Institution.InstitutionId != -1

	  INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPersonStatusType AS ActiveSen 
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

	  INNER JOIN dbo.TblPersonStatusType AS ActiveEHCP 
		ON ActiveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND ActiveEHCP.PersonStatusTypeInternalCode = 'E'

	  LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
		ON ActiveSENStatus.PupilId = EventToPupil.PupilId
		AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	  LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = EventToPupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,EHCPStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,EHCPStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')
	
	  WHERE Pupil.PupilId !=-1
	  AND Pupil.PupilActive = 1
	  AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_EXCLUSIONS] AS

SELECT DISTINCT

        CollectData.InstitutionName
        ,CollectData.SWISSchoolType
        ,CollectData.PersonDateOfBirth
       
        ,CASE 

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-3, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-4, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-5, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-6, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-7, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-8, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-9, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-10, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-11, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-12, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-13, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-14, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-15, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-16, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-17, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-18, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

                WHEN CollectData.PersonDateOfBirth BETWEEN 
                        CAST(CONCAT(YEAR(GETDATE())-19, CollectData.Startdate) AS DATE)
                    AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
                ELSE 'OUT_OF_AGE_RANGE'
            END AS YEAR_GROUP 

            ,CollectData.PUPIL
            ,CollectData.StartDateOfExclusion
            ,CollectData.EndDateOfexclusion
            ,CollectData.ExclusionReason
            ,CollectData.ExclusionDays
            ,CollectData.ExclusionDaysDescription
            ,CollectData.ExclusionCategory
            ,CollectData.ActiveSEN
            ,CollectData.EHCP

FROM (       
    SELECT Institution.InstitutionName AS InstitutionName
        ,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
        ,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
        ,Pupil.PupilId AS PUPIL
        ,Event_.EventValidStartDate AS StartDateOfExclusion
        ,Event_.EventValidEndDate AS EndDateOfexclusion
        ,EventReasonType.EventReasonTypeDescription AS ExclusionReason
        ,COALESCE(EventToMetric.EventToMetricValue,0) AS ExclusionDays
        ,EventMetricType.EventMetricTypeExternalCode AS ExclusionDaysDescription
        ,EventCategoryType.EventCategoryTypeDescription AS ExclusionCategory
        ,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
        ,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
        ,'-09-01' AS Startdate
        ,'-08-31' AS EndDate

    FROM dbo.TblPupil AS Pupil

    INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
        ON PersonToPupil.PupilId = Pupil.PupilId
        AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(date, '9999-12-31')
        AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblPerson AS Person
        ON Person.PersonId = PersonToPupil.PersonId

    INNER JOIN dbo.TblEventType AS EventType 
    ON EventType.EventTypeInternalCode = 'STUDENT_EXCLUSION'
    AND CONVERT(DATE,EventType.EventTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,EventType.EventTypeDeleted) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblEventToPupil AS EventToPupil
    ON EventToPupil.PupilId = Pupil.PupilId
    AND EventToPupil.EventTypeId = EventType.EventTypeId
    AND CONVERT(DATE,EventToPupil.EventToPupilDeleted) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
    ON EventToInstitute.EventTypeId = EventType.EventTypeId
    AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblInstitution AS Institution
    ON Institution.InstitutionId = EventToInstitute.InstitutionId
    AND Institution.InstitutionId = EventToInstitute.InstitutionId  --> to check with th eold query
    AND Institution.InstitutionId != -1

    INNER JOIN dbo.TblEvent AS Event_
    ON Event_.EventTypeId = EventType.EventTypeId
    AND Event_.EventId = EventToInstitute.EventId
    AND Event_.EventId = EventToPupil.EventId
    AND CONVERT(DATE,Event_.EventDeleted) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblEventReasonType AS EventReasonType 
    ON EventReasonType.EventReasonTypeId = Event_.EventReasonTypeId
    AND CONVERT(DATE,EventReasonType.EventReasonTypeTransactionEndDate) =  CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,EventReasonType.EventReasonTypeDeleted) =  CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblEventCategoryType AS EventCategoryType
    ON EventCategoryType.EventCategoryTypeId = Event_.EventCategoryTypeId
    AND CONVERT(DATE,EventCategoryType.EventCategoryTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,EventCategoryType.EventCategoryTypeDeleted) =  CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblEventMetricType AS EventMetricType
    ON EventMetricType.EventMetricTypeExternalCode = 'STUDENT_EXCLUSION_DAYS'
    AND CONVERT(DATE,EventMetricType.EventMetricTypeTransactionEndDate) =  CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,EventMetricType.EventMetricTypeDeleted) =  CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
    ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
    AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblInstitutionType AS InstitutionType
    ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
    AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
    AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
    AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')

    INNER JOIN dbo.TblPersonStatusType AS ActiveSen
    ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
    AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

    INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
    ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
    AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
    AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

	LEFT JOIN dbo.TblEventToMetric AS EventToMetric
    ON EventToMetric.EventId = Event_.EventId
    AND EventToMetric.EventMetricTypeId = EventMetricType.EventMetricTypeId
    AND CONVERT(DATE,EventToMetric.EventToMetricTransactionEndDate) =  CONVERT(date, '9999-12-31')
    AND CONVERT(DATE,EventToMetric.EventToMetricDeleted) =  CONVERT(date, '9999-12-31')

    LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus 
    ON ActiveSENStatus.PupilId = Pupil.PupilId
    AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId

    LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
    ON EHCPStatus.PupilId = Pupil.PupilId
    AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId --> to check with old logic

    WHERE Pupil.PupilId !=-1
    AND Pupil.PupilActive = 1
    AND Pupil.PupilToHistory = -1
) AS CollectData

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_ICIP] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.ICPCStartDate
	,PresentData.ICPCEndDate
	,PresentData.ICPCStatus
	,PresentData.ActiveSEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.ICPCStartDate
				,CollectData.ICPCEndDate
				,CollectData.ICPCStatus
				,CollectData.ActiveSEN
				,CollectData.EHCP

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,ICPCEvent.EventValidStartDate AS ICPCStartDate
				,ICPCEvent.EventValidEndDate AS ICPCEndDate
				,ICPCEventStatusType.EventStatusTypeDescription AS ICPCStatus
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate
		
	
	  FROM dbo.TblEvent AS ICPCEvent
  
	  INNER JOIN dbo.TblEventType as EventType
		ON EventType.EventTypeId = ICPCEvent.EventTypeId
		AND EventType.EventTypeGroup = 'CHILD_PROTECTION_CONFERENCE'
		AND EventType.EventTypeSubGroup is null
	
	  INNER JOIN dbo.TblDocumentType AS ICPCDocumentType
	    ON   ICPCDocumentType.DocumentTypeDescription = 'CP Conference Outcomes and Outline Plan'
        AND  ICPCDocumentType.DocumentTypeForm NOT LIKE 'XX%'

      INNER JOIN dbo.TblDocumentToEvent AS DocumentToEvent 
		ON DocumentToEvent.EventId = ICPCEvent.EventId
		AND DocumentToEvent.DocumentTypeId = ICPCDocumentType.DocumentTypeId
		AND CONVERT(DATE,DocumentToEvent.DocumentToEventDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblEventToStatus AS ICPCEventToStatus
		ON ICPCEventToStatus.EventId = ICPCEvent.EventId
		AND CONVERT(DATE,ICPCEventToStatus.EventToStatusDeleted) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ICPCEventToStatus.EventToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN [dbo].TblEventStatusType AS ICPCEventStatusType 
		ON ICPCEventStatusType.EventStatusTypeId = ICPCEventToStatus.EventStatusTypeId

	  INNER JOIN dbo.TblEventToPupil AS EventToPupil
		ON EventToPupil.EventId = ICPCEvent.EventId
		AND CONVERT(DATE,ICPCEvent.EventTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPupil AS Pupil
		ON Pupil.PupilId = EventToPupil.PupilId

	  INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId

	  INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
		ON EventToInstitute.EventId = ICPCEvent.EventId
		AND EventToInstitute.EventTypeId = ICPCEvent.EventTypeId
		AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = EventToInstitute.InstitutionId
		AND Institution.InstitutionId != -1

	  INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPersonStatusType AS ActiveSen
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

	  INNER JOIN dbo.TblPersonStatusType AS ActiveEHCP
		ON ActiveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND ActiveEHCP.PersonStatusTypeInternalCode = 'E'

	  LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus 
		ON ActiveSENStatus.PupilId = EventToPupil.PupilId
		AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	  LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = EventToPupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId --to chec on the origibal query
		AND CONVERT(DATE,EHCPStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,EHCPStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')
	
	  WHERE Pupil.PupilId !=-1
	  AND Pupil.PupilActive = 1
	  AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_NUMBER_OF_CONTACTS] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.StartDateOfContact
	,PresentData.EndDateOfContact
	,PresentData.ContactReason
	,PresentData.ActiveSEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT
		CollectData.InstitutionName
		,CollectData.SWISSchoolType
		,CollectData.PersonDateOfBirth

		,CASE 

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
        
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
             
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
        
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
  
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
  
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
  
			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

			WHEN CollectData.PersonDateOfBirth BETWEEN 
					 CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
				AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
			ELSE 'OUT_OF_AGE_RANGE'
		END AS YearGroup 

		,CollectData.Pupil
		,CollectData.StartDateOfContact
		,CollectData.EndDateOfContact
		,CollectData.ContactReason
		,CollectData.ActiveSEN
		,CollectData.EHCP

	FROM (
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,Event_.EventValidStartDate AS StartDateOfContact
				,Event_.EventValidEndDate AS EndDateOfContact
				,EventReasonType.EventReasonTypeDescription AS ContactReason
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

		FROM dbo.TblEvent AS Event_ 
		
		INNER JOIN dbo.TblEventType AS EventType
		  ON EventType.EventTypeId = Event_.EventTypeId  
		  AND EventType.EventTypeGroup IN ('ICS_CONTACT', 'ECAF_CONTACT')
		  AND CONVERT(DATE,EventType.EventTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
		  AND CONVERT(DATE,EventType.EventTypeDeleted) = CONVERT(date, '9999-12-31')
		  AND YEAR(Event_.EventValidStartDate) >= 2020

		INNER JOIN dbo.TblEventToPupil AS EventToPupil
		  ON EventToPupil.EventTypeId = EventType.EventTypeId
 		  AND EventToPupil.EventId = Event_.EventId 
		  AND CONVERT(DATE,EventToPupil.EventToPupilDeleted) = CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		  ON PersonToPupil.PupilId = EventToPupil.PupilId
		  AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(date, '9999-12-31')
		  AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(date, '9999-12-31')

		INNER JOIN [dbo].TblPupil AS Pupil
		    ON Pupil.PupilId = PersonToPupil.PupilId

		INNER JOIN dbo.TblPerson AS Person
			ON Person.PersonId = PersonToPupil.PersonId
		
		INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
			ON EventToInstitute.EventTypeId = EventType.EventTypeId
			AND EventToInstitute.EventId = Event_.EventId
			AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblInstitution AS Institution
			ON Institution.InstitutionId = EventToInstitute.InstitutionId
			AND Institution.InstitutionId = EventToInstitute.InstitutionId  --to check on the old query
			AND Institution.InstitutionId != -1

		INNER JOIN dbo.TblEventReasonType AS EventReasonType
			ON EventReasonType.EventReasonTypeId = Event_.EventReasonTypeId
			AND CONVERT(DATE,EventReasonType.EventReasonTypeTransactionEndDate) =  CONVERT(date, '9999-12-31')
			AND CONVERT(DATE,EventReasonType.EventReasonTypeDeleted) =  CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblEventCategoryType AS EventCategoryType
			ON EventCategoryType.EventCategoryTypeId = Event_.EventCategoryTypeId
			AND CONVERT(DATE,EventCategoryType.EventCategoryTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
			AND CONVERT(DATE,EventCategoryType.EventCategoryTypeDeleted) =  CONVERT(date, '9999-12-31')
 
		INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
			ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
			AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
			AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) = CONVERT(date, '9999-12-31')

			INNER JOIN dbo.TblInstitutionType AS InstitutionType
			ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
			AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
			AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
			AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')

			INNER JOIN dbo.TblPersonStatusType AS ActiveSen
			ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
			AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

			INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
			ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
			AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
			AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

			LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
			ON ActiveSENStatus.PupilId = Pupil.PupilId
			AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId

			LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
			ON EHCPStatus.PupilId = Pupil.PupilId
			AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId

			WHERE Pupil.PupilId !=-1
			AND Pupil.PupilActive = 1
			AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_OVERALL_ASSESSMENT_TIMELINES] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.EventValidStartDate
	,PresentData.EventValidEndDate
	,CONVERT(DATE,COALESCE(PresentData.ASMFormStartDate,'9999-12-31')) AS ASMFormStartDate
	,CONVERT(DATE,COALESCE(PresentData.ASMFormAuthorisationEndDate,'9999-12-31')) AS ASMFormAuthorisationEndDate
	,CONVERT(DATE,COALESCE(PresentData.ASMFormDueEndDate,'9999-12-31')) AS ASMFormDueEndDate
	,CONVERT(DATE,COALESCE(PresentData.ASMFormCompletedEndDate,'9999-12-31')) AS ASMFormCompletedEndDate
	,PresentData.ActiveSEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.EventValidStartDate
				,CollectData.EventValidEndDate
				,CollectData.ASMFormStartDate
				,CollectData.ASMFormAuthorisationEndDate
				,CollectData.ASMFormDueEndDate
				,CollectData.ASMFormCompletedEndDate
				,CollectData.ActiveSEN
				,CollectData.EHCP

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,ASMEvent.EventValidStartDate AS EventValidStartDate
				,ASMEvent.EventValidEndDate AS EventValidEndDate
				,Pupil.PupilId AS Pupil
				,DocumentToEvent.DocumentToEventFormStartDate AS ASMFormStartDate
				,DocumentToEvent.DocumentToEventFormAuthorisedEndDate AS ASMFormAuthorisationEndDate
				,DocumentToEvent.DocumentToEventFormDueDate AS ASMFormDueEndDate
				,DocumentToEvent.DocumentToEventFormCompleteDate AS ASMFormCompletedEndDate
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

		FROM dbo.TblEvent AS ASMEvent 
  
	  	INNER JOIN dbo.TblEventType as EventType
			ON EventType.EventTypeId = ASMEvent.EventTypeId
			AND EventType.EventTypeGroup = 'PUPIL_ASSESSMENT'

	  	INNER JOIN [dbo].TblEventRelationshipType AS EventRelationshipType
	   	 	ON EventRelationshipType.EventRelationshipTypeGroup = 'REFERRAL_ASSESTMENT'
      
	  	INNER JOIN [dbo].TblEventRelationship AS EventRelationship
	    	ON EventRelationship.EventRelationshipTypeId = EventRelationshipType.EventRelationshipTypeId
			AND EventRelationship.EventRelatedId = ASMEvent.EventId
        	AND CONVERT(DATE,EventRelationship.EventRelationshipDeleted) = CONVERT(DATE, '9999-12-31')

		INNER JOIN [dbo].TblEventType AS ReferenceEventType
			ON ReferenceEventType.EventTypeGroup = 'PUPIL_REFERRAL'

		INNER JOIN dbo.TblEvent AS ReferenceEvent
			ON ReferenceEvent.EventId = EventRelationship.EventId
			AND ReferenceEvent.EventTypeId = ReferenceEventType.EventTypeId
			AND CONVERT(DATE,ReferenceEvent.EventDeleted) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblDocumentToEvent AS DocumentToEvent 
			ON DocumentToEvent.EventId = ASMEvent.EventId
			AND DocumentToEvent.DocumentToEventMarkerID in  ('ICSInitAssess','ICSCFAssess')
			AND SUBSTRING(DocumentToEvent.DocumentToEventPathReference, LEN(LEFT(DocumentToEvent.DocumentToEventPathReference, CHARINDEX ('/', DocumentToEvent.DocumentToEventPathReference))) + 1, LEN(DocumentToEvent.DocumentToEventPathReference)) = 'com.ics.ICSReferral'
			AND CONCAT(ReferenceEvent.EventSourceKey,'/com.ics.ICSReferral') = DocumentToEvent.DocumentToEventPathReference 
			AND CONVERT(DATE,DocumentToEvent.DocumentToEventDeleted) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblEventToStatus AS ASMEventToStatus
			ON ASMEventToStatus.EventId = ASMEvent.EventId
			AND CONVERT(DATE,ASMEventToStatus.EventToStatusDeleted) = CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,ASMEventToStatus.EventToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')

		INNER JOIN [dbo].TblEventStatusType AS ASMEventStatusType
			ON ASMEventStatusType.EventStatusTypeId = ASMEventToStatus.EventStatusTypeId

		INNER JOIN dbo.TblEventToPupil AS EventToPupil
			ON EventToPupil.EventId = ASMEvent.EventId
			AND EventToPupil.EventTypeId = EventType.EventTypeId
			AND CONVERT(DATE,ASMEvent.EventTransactionEndDate) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
			ON EventToInstitute.EventId = ASMEvent.EventId
			AND EventToInstitute.EventTypeId = EventType.EventTypeId
			AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPupil AS Pupil
			ON Pupil.PupilId = EventToPupil.PupilId

		INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
			ON PersonToPupil.PupilId = Pupil.PupilId
			AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPerson AS Person
			ON Person.PersonId = PersonToPupil.PersonId

		INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
			ON InstitutionToInstitutionType.InstitutionId = EventToInstitute.InstitutionId
			AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblInstitutionType AS InstitutionType
			ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
			AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
			AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
			AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPersonStatusType AS ActiveSen
			ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
			AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

		INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
			ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
			AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
			AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

		LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
			ON ActiveSENStatus.PupilId = Pupil.PupilId
			AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
			AND CONVERT(DATE,ActiveSENStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,ActiveSENStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

		LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
			ON EHCPStatus.PupilId = Pupil.PupilId
			AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
			AND CONVERT(DATE,EHCPStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,EHCPStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblInstitution AS Institution
			ON Institution.InstitutionId = EventToInstitute.InstitutionId
			AND Institution.InstitutionId != -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO


CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_REFERRALS] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.ReferralStartDate
	,PresentData.ReferralEndDate
	,PresentData.ActiveSEN
	,PresentData.EHCP

FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.ReferralStartDate
				,CollectData.ReferralEndDate
				,CollectData.ActiveSEN
				,CollectData.EHCP

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,ReferenceEvent.EventValidStartDate AS ReferralStartDate
				,ReferenceEvent.EventValidEndDate AS ReferralEndDate
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

	  FROM dbo.TblEvent AS ReferenceEvent
  
	  INNER JOIN dbo.TblEventType as ReferenceEventType
		ON ReferenceEventType.EventTypeId = ReferenceEvent.EventTypeId
		AND ReferenceEventType.EventTypeGroup = 'PUPIL_REFERRAL'

	  INNER JOIN dbo.TblEventToPupil AS EventToPupil
		ON EventToPupil.EventId = ReferenceEvent.EventId
		AND CONVERT(DATE,ReferenceEvent.EventTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPupil AS Pupil
		ON Pupil.PupilId = EventToPupil.PupilId

	  INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId

	  INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
		ON EventToInstitute.EventId = ReferenceEvent.EventId
		AND EventToInstitute.EventTypeId = ReferenceEventType.EventTypeId
		AND CONVERT(DATE,EventToInstitute.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = EventToInstitute.InstitutionId
		AND Institution.InstitutionId != -1

	  INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPersonStatusType AS ActiveSen
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

	  INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
		ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

	  LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
		ON ActiveSENStatus.PupilId = EventToPupil.PupilId
		AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	  LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = EventToPupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId  --> to check on the main query
		AND CONVERT(DATE,EHCPStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,EHCPStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')
	
	  WHERE Pupil.PupilId !=-1
	  AND Pupil.PupilActive = 1
	  AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_S47] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.S47StartDate
	,PresentData.S47EndDate
	,PresentData.S47Status
	,PresentData.ACTIVE_SEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.S47StartDate
				,CollectData.S47EndDate
				,CollectData.S47Status
				,CollectData.ACTIVE_SEN
				,CollectData.EHCP

	FROM (    
		SELECT Institution.InstitutionName AS InstitutionName
				,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
				,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
				,Pupil.PupilId AS Pupil
				,S47Event.EventValidStartDate AS S47StartDate
				,S47Event.EventValidEndDate AS S47EndDate
				,S47EventStatusType.EventStatusTypeDescription AS S47Status
				,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ACTIVE_SEN
				,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate

	  FROM dbo.TblEvent AS S47Event
  

	  LEFT JOIN [dbo].TblEventType AS S47EventType
		ON  S47EventType.EventTypeGroup = 'PUPIL_ASSESSMENT'
		AND S47EventType.EventTypeDescription IN ('ICS/S47', 'XXICS/S47')  
		AND S47EventType.EventTypeId = S47Event.EventTypeId

      INNER JOIN [dbo].TblEventRelationshipType AS EventRelationshipType
	    ON EventRelationshipType.EventRelationshipTypeGroup = 'REFERRAL_ASSESTMENT'
      
	  INNER JOIN [dbo].TblEventRelationship AS EventRelationship
	    ON EventRelationship.EventRelationshipTypeId = EventRelationshipType.EventRelationshipTypeId
		AND EventRelationship.EventRelatedId = S47Event.EventId
        AND CONVERT(DATE,EventRelationship.EventRelationshipDeleted) = CONVERT(DATE, '9999-12-31')

      INNER JOIN [dbo].TblEventType AS ReferenceEventType
	    ON ReferenceEventType.EventTypeGroup = 'PUPIL_REFERRAL'

	  INNER JOIN dbo.TblEvent AS ReferenceEvent  
	    ON ReferenceEvent.EventId = EventRelationship.EventId
		AND ReferenceEvent.EventTypeId = ReferenceEventType.EventTypeId
		AND CONVERT(DATE,ReferenceEvent.EventDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblDocumentToEvent AS DocumentToEvent
		ON DocumentToEvent.EventId = S47Event.EventId
		AND DocumentToEvent.DocumentToEventMarkerID = 'S47'
		AND SUBSTRING(DocumentToEvent.DocumentToEventPathReference, LEN(LEFT(DocumentToEvent.DocumentToEventPathReference, CHARINDEX ('/', DocumentToEvent.DocumentToEventPathReference))) + 1, LEN(DocumentToEvent.DocumentToEventPathReference)) = 'com.ics.ICSReferral'
		AND CONCAT(ReferenceEvent.EventSourceKey,'/com.ics.ICSReferral') = DocumentToEvent.DocumentToEventPathReference 
		AND CONVERT(DATE,DocumentToEvent.DocumentToEventDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblEventToStatus AS S47EventToStatus
		ON S47EventToStatus.EventId = S47Event.EventId
		AND CONVERT(DATE,S47EventToStatus.EventToStatusDeleted) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,S47EventToStatus.EventToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN [dbo].TblEventStatusType AS S47EventStatusType
		ON S47EventStatusType.EventStatusTypeId = S47EventToStatus.EventStatusTypeId

	  INNER JOIN dbo.TblEventToPupil AS S47EventToPupil
		ON S47EventToPupil.EventId = S47Event.EventId
		AND S47EventToPupil.EventTypeId = S47EventType.EventTypeId
		AND CONVERT(DATE,S47EventToPupil.EventToPupilDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblEventToInstitution AS S47EventToInstitute
		ON S47EventToInstitute.EventId = S47Event.EventId
		AND S47EventToInstitute.EventTypeId = S47EventType.EventTypeId
		AND CONVERT(DATE,S47EventToInstitute.EventToInstitutionDeleted) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPupil AS Pupil
		ON Pupil.PupilId = S47EventToPupil.PupilId

	  INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId

	  INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = S47EventToInstitute.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) =  CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(DATE, '9999-12-31')

	  INNER JOIN dbo.TblPersonStatusType AS ActiveSen
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

	  INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
		ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

	  LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
		ON ActiveSENStatus.PupilId = S47EventToPupil.PupilId
		AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,ActiveSENStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	  LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = S47EventToPupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId --> to check on the original query
		AND CONVERT(DATE,EHCPStatus.PupilToStatusTransactionEndDate) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,EHCPStatus.PupilToStatusDeleted) = CONVERT(DATE, '9999-12-31')

	 INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = S47EventToInstitute.InstitutionId
		AND Institution.InstitutionId != -1
	
	  WHERE Pupil.PupilId !=-1
	  AND Pupil.PupilActive = 1
	  AND Pupil.PupilToHistory = -1
	) AS CollectData
) AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_SCHOOL_MOVES_V_2] AS
SELECT 
	PresentData.InstitutionName
	,PresentData.SWISSchoolType
	,PresentData.PersonDateOfBirth
	,PresentData.YearGroup
	,PresentData.Pupil
	,PresentData.CapitaSourceKeyStudentId  
	,PresentData.SchoolStartDate
	,PresentData.SchoolEndDate
	,PresentData.SchoolTransferCategory
	,PresentData.ActiveSEN
	,PresentData.EHCP
FROM (
	SELECT DISTINCT

			CollectData.InstitutionName
			,CollectData.SWISSchoolType
			,CollectData.PersonDateOfBirth
       
			,CASE 

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
                    
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
                
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
        
					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

					WHEN CollectData.PersonDateOfBirth BETWEEN 
							CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
						AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
					ELSE 'OUT_OF_AGE_RANGE'
				END AS YearGroup 

				,CollectData.Pupil
				,CollectData.CapitaSourceKeyStudentId
				,CollectData.SchoolStartDate
				,CollectData.SchoolEndDate
				,CollectData.SchoolTransferCategory
				,CollectData.ActiveSEN
				,CollectData.EHCP

	FROM (       
		SELECT Institution.InstitutionName AS InstitutionName
			,InstitutionType.InstitutionTypeInternalCode AS SWISSchoolType
			,CAST(Person.PersonDateOfBirth AS DATE) AS PersonDateOfBirth
			,Pupil.PupilId AS Pupil
			,Pupil.PupilSourceId AS CapitaSourceKeyStudentId 
			,Event_.EventValidStartDate AS SchoolStartDate
			,Event_.EventValidEndDate AS SchoolEndDate 
			,EventCategoryType.EventCategoryTypeDescription AS SchoolTransferCategory
			,COALESCE(ActiveSENStatus.PupilToStatusFlag,0) AS ActiveSEN
			,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
			,'-09-01' AS StartDate
			,'-08-31' AS EndDate


		FROM dbo.TblPupil AS Pupil

		INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
			ON PersonToPupil.PupilId = Pupil.PupilId
			AND CONVERT(DATE,COALESCE(PersonToPupil.PersonToPupilDeleted,'9999-12-31')) =  CONVERT(DATE, '9999-12-31')
			AND CONVERT(DATE,COALESCE(PersonToPupil.PersonToPupilTransactionEndDate,'9999-12-31')) =   CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPerson AS Person
			ON Person.PersonId = PersonToPupil.PersonId

		INNER JOIN dbo.TblEventType AS EventType
		ON EventType.EventTypeInternalCode = 'SCHOOL_TRANSFER'
		AND CONVERT(DATE,COALESCE(EventType.EventTypeTransactionEndDate,'9999-12-31')) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,COALESCE(EventType.EventTypeDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblEvent AS Event_
		ON Event_.EventTypeId = EventType.EventTypeId
		AND CONVERT(DATE,COALESCE(Event_.EventDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblEventToPupil AS EventToPupil
		ON EventToPupil.PupilId = Pupil.PupilId
		AND EventToPupil.EventTypeId = EventType.EventTypeId
		AND EventToPupil.EventId = Event_.EventId
		AND CONVERT(DATE,COALESCE(EventToPupil.EventToPupilDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')
		
		INNER JOIN dbo.TblEventToInstitution AS EventToInstitute
		ON EventToInstitute.EventTypeId = EventType.EventTypeId
		AND EventToInstitute.EventId = Event_.EventId
		AND CONVERT(DATE,COALESCE(EventToInstitute.EventToInstitutionDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblInstitution AS Institution
		ON Institution.InstitutionId = EventToInstitute.InstitutionId
		AND Institution.InstitutionId != -1

		INNER JOIN dbo.TblEventCategoryType AS EventCategoryType
		ON EventCategoryType.EventCategoryTypeId = Event_.EventCategoryTypeId
		AND EventCategoryType.EventCategoryTypeDescription = 'SCHOOL_TRANSFER'
		AND CONVERT(DATE,COALESCE(EventCategoryType.EventCategoryTypeTransactionEndDate,'9999-12-31')) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,COALESCE(EventCategoryType.EventCategoryTypeDeleted,'9999-12-31')) =  CONVERT(DATE, '9999-12-31')
 
		INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,COALESCE(InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate,'9999-12-31')) =  CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,COALESCE(InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted,'9999-12-31')) =  CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,COALESCE(InstitutionType.InstitutionTypeTransactionEndDate,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPersonStatusType AS ActiveSen
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

		INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
		ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

		LEFT JOIN dbo.TblPupilToStatus AS ActiveSENStatus
		ON ActiveSENStatus.PupilId = Pupil.PupilId
		AND ActiveSENStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId
		AND CONVERT(DATE,COALESCE(ActiveSENStatus.PupilToStatusTransactionEndDate,'9999-12-31')) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,COALESCE(ActiveSENStatus.PupilToStatusDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = Pupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = AcitveEHCP.PersonStatusTypeId
		AND CONVERT(DATE,COALESCE(EHCPStatus.PupilToStatusTransactionEndDate,'9999-12-31')) = CONVERT(DATE, '9999-12-31')
		AND CONVERT(DATE,COALESCE(EHCPStatus.PupilToStatusDeleted,'9999-12-31')) = CONVERT(DATE, '9999-12-31')

		WHERE Pupil.PupilId !=-1
		AND Pupil.PupilActive = 1
		AND Pupil.PupilToHistory = -1
		AND EventType.EventTypeDescription = 'SCHOOL_TRANSFER'
	) AS CollectData
)AS PresentData

WHERE PresentData.YearGroup != 'OUT_OF_AGE_RANGE'

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_SCHOOL_ATTENDANCE_LEVEL] AS
SELECT 
    DateFilter.InstitutionName
    ,DateFilter.InstitutionTypeInternalCode as SWISSchoolType
    ,DateFilter.PersonDateOfBirth
	,DateFilter.YearGroup 
    ,DateFilter.Pupil
    ,DateFilter.StartDay
    ,DateFilter.EndDay
    ,DateFilter.ActiveSEN
    ,DateFilter.EHCP
    ,CASE 
	       WHEN DateFilter.MorningMark = 'A' THEN 1
	       WHEN DateFilter.MorningMark = 'U' THEN 0
		   WHEN DateFilter.MorningMark = 'R' THEN 0
		   WHEN DateFilter.MorningMark = 'E' THEN 1
		   WHEN DateFilter.MorningMark = 'P' THEN 1
		   WHEN DateFilter.MorningMark = 'N' THEN 0
		   WHEN DateFilter.MorningMark = 'Z' THEN 0
     END AS MorningMark
	 ,CASE 
	       WHEN DateFilter.MorningMark = 'A' THEN  'Authorised Absence' 
	       WHEN DateFilter.MorningMark = 'U' THEN 'Unauthorised Absence' 
		   WHEN DateFilter.MorningMark = 'R' THEN 'DO NOT USE' 
		   WHEN DateFilter.MorningMark = 'E' THEN 'Authorised Activity' 
		   WHEN DateFilter.MorningMark = 'P' THEN 'Present'
		   WHEN DateFilter.MorningMark = 'N' THEN 'No Mark Recorded (all should attend)' 
		   WHEN DateFilter.MorningMark = 'Z' THEN 'School Closed' 
     END AS MorningMarkDescription
	 ,CASE 
	       WHEN DateFilter.AfternoonMark = 'A' THEN 1
	       WHEN DateFilter.AfternoonMark = 'U' THEN 0
		   WHEN DateFilter.AfternoonMark = 'R' THEN 0
		   WHEN DateFilter.AfternoonMark = 'E' THEN 1
		   WHEN DateFilter.AfternoonMark = 'P' THEN 1
		   WHEN DateFilter.AfternoonMark = 'N' THEN 0
		   WHEN DateFilter.AfternoonMark = 'Z' THEN 0
     END AS AfternoonMark
	 ,CASE 
	       WHEN DateFilter.AfternoonMark = 'A' THEN 'Authorised Absence' 
	       WHEN DateFilter.AfternoonMark = 'U' THEN 'Unauthorised Absence' 
		   WHEN DateFilter.AfternoonMark = 'R' THEN 'DO NOT USE' 
		   WHEN DateFilter.AfternoonMark = 'E' THEN 'Authorised Activity' 
		   WHEN DateFilter.AfternoonMark = 'P' THEN 'Present'
		   WHEN DateFilter.AfternoonMark = 'N' THEN 'No Mark Recorded (all should attend)'
		   WHEN DateFilter.AfternoonMark = 'Z' THEN 'School Closed' 
     END AS AfternoonMarkDescription

FROM (
SELECT 
    PresentData.InstitutionName
    ,PresentData.InstitutionTypeInternalCode
    ,PresentData.PersonDateOfBirth
	,PresentData.YearGroup 
    ,PresentData.Pupil
    ,PresentData.StartDay
    ,PresentData.EndDay
    ,PresentData.ActiveSEN
    ,PresentData.EHCP
    ,MAX(PresentData.MorningMark) AS MorningMark
    ,MAX(PresentData.AfternoonMark) AS AfternoonMark
FROM (
SELECT DISTINCT
    CollectData.InstitutionName
    ,CollectData.InstitutionTypeInternalCode
    ,CollectData.PersonDateOfBirth

    ,CASE 

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-3, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE()), CollectData.EndDate) AS DATE) THEN 'E2'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-4, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-3, CollectData.EndDate) AS DATE) THEN 'N1'
        
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-5, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-4, CollectData.EndDate) AS DATE) THEN 'N2'             
             
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-6, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-5, CollectData.EndDate) AS DATE) THEN 'R'
        
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-7, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-6, CollectData.EndDate) AS DATE) THEN '1'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-8, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-7, CollectData.EndDate) AS DATE) THEN '2'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-9, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-8, CollectData.EndDate) AS DATE) THEN '3'
  
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-10, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-9, CollectData.EndDate) AS DATE) THEN '4'
  
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-11, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-10, CollectData.EndDate) AS DATE) THEN '5'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-12, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-11, CollectData.EndDate) AS DATE) THEN '6'
  
        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-13, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-12, CollectData.EndDate) AS DATE) THEN '7'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-14, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-13, CollectData.EndDate) AS DATE) THEN '8'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-15, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-14, CollectData.EndDate) AS DATE) THEN '9'

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-16, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-15, CollectData.EndDate) AS DATE) THEN '10'          

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-17, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-16, CollectData.EndDate) AS DATE) THEN '11'   

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-18, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-17, CollectData.EndDate) AS DATE) THEN '12'      

        WHEN CollectData.PersonDateOfBirth BETWEEN 
                 CAST(CONCAT(YEAR(GETDATE())-19, CollectData.StartDate) AS DATE)
            AND CAST(CONCAT(YEAR(GETDATE())-18, CollectData.EndDate) AS DATE) THEN '13'     
        ELSE 'OUT_OF_AGE_RANGE'
    END AS YearGroup 

    ,CollectData.Pupil
    ,CollectData.StartDay
    ,CollectData.EndDay
    ,CollectData.ActiveSEN
    ,CollectData.EHCP
    ,CollectData.MorningMark
    ,CollectData.AfternoonMark

FROM (
		SELECT DISTINCT
			Institution.InstitutionName AS InstitutionName
			,InstitutionType.InstitutionTypeInternalCode
			,CONVERT(DATE,Person.PersonDateOfBirth) AS PersonDateOfBirth
			,Pupil.PupilId AS Pupil
			,CONVERT(DATE,PupilAttendance.PupilAttendanceValidStartDate) AS StartDay
			,CONVERT(DATE,PupilAttendance.PupilAttendanceValidEndDate) AS EndDay
			,COALESCE(ActiveSenStatus.PupilToStatusFlag,0) AS ActiveSEN
			,COALESCE(EHCPStatus.PupilToStatusFlag,0) AS EHCP
			,CASE  
				WHEN PupilAttendanceType.PupilAttendanceTypeDescription = 'MORNING_MARK'
					THEN AttendanceSummaryType.StatutoryMeaning
				--ELSE NULL
				END AS MorningMark
			,CASE  
				WHEN PupilAttendanceType.PupilAttendanceTypeDescription = 'AFTERNOON_MARK'
					THEN AttendanceSummaryType.StatutoryMeaning
				--ELSE NULL
				END AS AfternoonMark
				,'-09-01' AS StartDate
				,'-08-31' AS EndDate
   
		FROM dbo.TblPupil AS Pupil

		INNER JOIN dbo.TblPersonToPupil AS PersonToPupil
		ON PersonToPupil.PupilId = Pupil.PupilId
		AND CONVERT(DATE,PersonToPupil.PersonToPupilDeleted) =  CONVERT(date,'9999-12-31')
		AND CONVERT(DATE,PersonToPupil.PersonToPupilTransactionEndDate) =   CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblPerson AS Person
		ON Person.PersonId = PersonToPupil.PersonId
    
		INNER JOIN dbo.TblPupilAttendance AS PupilAttendance
		ON Pupil.PupilId = PupilAttendance.PupilId
		AND CONVERT(DATE,PupilAttendance.PupilAttendanceDeleted) =  CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblAttendanceSummaryType AS AttendanceSummaryType
		ON AttendanceSummaryType.AttendanceSummaryTypeId = PupilAttendance.AttendanceSummaryTypeId
		AND CONVERT(DATE,AttendanceSummaryType.TransactionalEndDate) =  CONVERT(DATE, '9999-12-31')

		INNER JOIN dbo.TblPupilAttendanceType AS PupilAttendanceType
		ON PupilAttendanceType.PupilAttendanceTypeId = PupilAttendance.PupilAttendanceTypeId
		AND PupilAttendanceType.PupilAttendanceTypeGroup = 'PUPIL_SCHOOL_ATTENDANCE'
		AND CONVERT(DATE,PupilAttendanceType.PupilAttendanceTypeDeleted)  = CONVERT(date, '9999-12-31')
		AND CONVERT(DATE,PupilAttendanceType.PupilAttendanceTypeTransactionEndDate) = CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblInstitution AS Institution
		ON PupilAttendance.InstitutionId = Institution.InstitutionId
		AND Institution.InstitutionId != -1

		INNER JOIN dbo.TblInstitutionToInstitutionType AS InstitutionToInstitutionType
		ON InstitutionToInstitutionType.InstitutionId = Institution.InstitutionId
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')
		AND CONVERT(DATE,InstitutionToInstitutionType.InstitutionToInstitutionTypeDeleted) = CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblInstitutionType AS InstitutionType
		ON InstitutionType.InstitutionTypeId = InstitutionToInstitutionType.InstitutionTypeId
		AND InstitutionType.InstitutionTypeDescription IN ('SWiS','Comparator')
		AND InstitutionType.InstitutionTypeGroup = 'SCHOOL_ALLOCATION_TYPE'
		AND CONVERT(DATE,InstitutionType.InstitutionTypeTransactionEndDate) = CONVERT(date, '9999-12-31')

		INNER JOIN dbo.TblPersonStatusType AS ActiveSen
		ON ActiveSen.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND ActiveSen.PersonStatusTypeInternalCode ='ACTIVE_SEN'

		INNER JOIN dbo.TblPersonStatusType AS AcitveEHCP
		ON AcitveEHCP.PersonStatusTypeGroup = 'PUPIL_STATUS'
		AND AcitveEHCP.PersonStatusTypeSubGroup ='SEN_STAGE'
		AND AcitveEHCP.PersonStatusTypeInternalCode = 'E'

		LEFT JOIN dbo.TblPupilToStatus AS ActiveSenStatus
		ON ActiveSenStatus.PupilId = Pupil.PupilId
		AND ActiveSenStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId

		LEFT JOIN dbo.TblPupilToStatus AS EHCPStatus
		ON EHCPStatus.PupilId = Pupil.PupilId
		AND EHCPStatus.PersonStatusTypeId = ActiveSen.PersonStatusTypeId

		WHERE Pupil.PupilId !=-1
		AND Pupil.PupilActive = 1
		AND Pupil.PupilToHistory = -1
   

	) AS CollectData
	WHERE YEAR(CollectData.StartDay) >=2020
) AS PresentData
GROUP BY
PresentData.InstitutionName
    ,PresentData.InstitutionTypeInternalCode
    ,PresentData.PersonDateOfBirth
	,PresentData.YearGroup 
    ,PresentData.Pupil
    ,PresentData.StartDay
    ,PresentData.EndDay
    ,PresentData.ActiveSen
    ,PresentData.EHCP
) AS DateFilter

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_OVERALL_ENDED_ASSESSMENTS] AS
SELECT 
	ASM.InstitutionName
	,ASM.SWISSchoolType
	,ASM.PersonDateOfBirth
	,ASM.YearGroup
	,ASM.Pupil
	,ASM.EventValidStartDate
	,ASM.EventValidEndDate
	,ASM.ASMFormStartDate
	,ASM.ASMFormAuthorisationEndDate
	,ASM.ASMFormDueEndDate
	,ASM.ASMFormCompletedEndDate
	,ASM.ActiveSEN
	,ASM.EHCP
FROM dbo.VW_SWiS_ACTL_PUPILS_OVERALL_ASSESSMENT_TIMELINES as ASM

WHERE CONVERT(DATE,ASM.EventValidEndDate) != CONVERT(DATE, '9999-12-31')

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_OVERALL_STARTED_ASSESSMENTS] AS
SELECT 
	ASM.InstitutionName
	,ASM.SWISSchoolType
	,ASM.PersonDateOfBirth
	,ASM.YearGroup
	,ASM.Pupil
	,ASM.EventValidStartDate
	,ASM.EventValidEndDate
	,ASM.ASMFormStartDate
	,ASM.ASMFormAuthorisationEndDate
	,ASM.ASMFormDueEndDate
	,ASM.ASMFormCompletedEndDate
	,ASM.ActiveSEN
	,ASM.EHCP
FROM dbo.VW_SWiS_ACTL_PUPILS_OVERALL_ASSESSMENT_TIMELINES as ASM
WHERE CONVERT(DATE,ASM.EventValidEndDate) != CONVERT(DATE, '9999-12-31')

GO

CREATE VIEW [dbo].[VW_SWiS_ACTL_PUPILS_OVERALL_TIMESCALES_ASSESSMENTS] AS
SELECT 
	ASM.InstitutionName
	,ASM.SWISSchoolType
	,ASM.PersonDateOfBirth
	,ASM.YearGroup
	,ASM.Pupil
	,ASM.ASMFormStartDate
	,ASM.ASMFormAuthorisationEndDate
	,(DATEDIFF(dd, ASM.ASMFormStartDate, ASM.ASMFormAuthorisationEndDate) + 1)
		-(DATEDIFF(wk, ASM.ASMFormStartDate, ASM.ASMFormAuthorisationEndDate) * 2)
		-(CASE WHEN DATENAME(dw, ASM.ASMFormStartDate) = 'Sunday' THEN 1 ELSE 0 END)
		-(CASE WHEN DATENAME(dw, ASM.ASMFormAuthorisationEndDate) = 'Saturday' THEN 1 ELSE 0 END) AS NUMBER_OF_DAYS
	,ASM.ActiveSEN
	,ASM.EHCP
FROM dbo.VW_SWiS_ACTL_PUPILS_OVERALL_ASSESSMENT_TIMELINES as ASM
WHERE CONVERT(DATE,ASM.ASMFormAuthorisationEndDate) != CONVERT(DATE, '9999-12-31')

GO

