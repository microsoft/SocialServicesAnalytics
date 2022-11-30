# Introduction



# Data file used 






# Data Model population logic expressed in SQL 


## Populate the Document Type with the Assestment Type Reference Data
```SQL
INSERT INTO [dbo].[TBL_DOC_TYP] (
				DOC_TYP_FRM
				,DOC_TYP_GRP
				,DOC_TYP_CREATOR
				,DOC_TYP_DEL
				,DOC_TYP_DESC
				,DOC_TYP_FILENAM
				,DOC_TYP_SRC_ID
				,DOC_TYP_SRC_KEY
				,DOC_TYP_TRNS_STR_DT
				,DOC_TYP_TRNS_END_DT
				,DOC_TYP_VLD
				,DOC_TYP_VLD_STR_DT
				,DOC_TYP_VLD_END_DT )
		  SELECT DISTINCT  
		        asm.formtype
				,'ASSESTMENT_TYPE'
				,asm.FormCreator
				,CONVERT(datetime2, '31-12-9999 23:59:59.9999', 103) 
				,asm.[Description]
				,asm.[Filename]
				,3
   				,CONVERT(BIGINT,asm.TemplateID)
				,CURRENT_TIMESTAMP
				,CONVERT(datetime2, '31-12-9999 23:59:59.9999', 103) 
				,CASE WHEN asm.Valid ='NULL' THEN 1
					  WHEN asm.Valid ='Y' THEN 1
					  ELSE 0
				END
				,CAST(CASE WHEN CAST(CONVERT(char(25),asm.ReleaseDate,103) AS datetime2) IS NULL THEN CAST('31-12-9999 23:59:59.9999' AS datetime2)
					  ELSE CAST(CONVERT(char(25),asm.ReleaseDate,103) AS datetime2)
				 END AS datetime2)
				 ,CONVERT(datetime2, '31-12-9999 23:59:59.9999', 103) 
		  FROM [dbo].[wfassessmenttype] as asm;
```


## Populate the Event Statys Type with the Assestment Status Reference Data 
```SQL
INSERT INTO  [dbo].[TBL_EV_STS_TYP] (
			  [EV_STS_TYP_TRNS_STR_DT]
			  ,[EV_STS_TYP_TRNS_END_DT]
			  ,[EV_STS_TYP_DESC]
			  ,[EV_STS_TYP_DEL]
			  ,[EV_STS_TYP_GRP]
			  ,[EV_STS_TYP_SRC_ID]
			  ,[EV_STS_TYP_ROW_INST_DT]
			  ,[EV_STS_TYP_SUB_GRP]
			  ,[EV_STS_TYP_INTRN_CD]
			  ,[EV_STS_TYP_EXTRN_CD]

			)
			SELECT DISTINCT
					CURRENT_TIMESTAMP
					,CONVERT(datetime2, '31-12-9999 23:59:59.9999', 103) 
					,[description]
					,CONVERT(datetime2, '31-12-9999 23:59:59.9999', 103) 
					,'PUPIL_ASSESTMENT'
					,3
					,CURRENT_TIMESTAMP
					,'ASSESTMENT_STATUS'
					,[code]
					,[code]
			FROM [dbo].[wfpicklistitem]
			WHERE PICKID = 'STEPSUBSTATUS';
```
