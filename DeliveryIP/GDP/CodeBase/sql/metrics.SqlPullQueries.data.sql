INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.people', N'SELECT�*�FROM�dbo.people;', N'people', N'LAST_UPDT', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.wfassessmenttype', N'SELECT�*�FROM�dbo.wfassessmenttype', N'wfassessmenttype', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.attendance_summary', N'SELECT * FROM dbo.attendance_summary', N'attendance_summary', NULL, N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.wfassessment', N'SELECT�*�FROM�dbo.wfassessment', N'wfassessment', N'ModDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.ecafcontact', N'SELECT�*�FROM�dbo.ecafcontact', N'ecafcontact', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.ppmark', N'SELECT�*�FROM�dbo.ppmark', N'ppmark', N'', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.cpcareplan', N'SELECT�*�FROM�dbo.cpcareplan', N'cpcareplan', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.icscpreg', N'SELECT�*�FROM�dbo.icscpreg', N'icscpreg', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.icsrefer', N'SELECT�*�FROM�dbo.icsrefer', N'icsrefer', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.icsperiodcare', N'SELECT�*�FROM�dbo.icsperiodcare', N'icsperiodcare', N'', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.isperson', N'SELECT�*�FROM�dbo.isperson', N'isperson', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.icsplacement', N'SELECT�*�FROM�dbo.icsplacement', N'icsplacement', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'liquidlogic', N'dbo.icscontact2 ', N'SELECT�*�FROM�dbo.icscontact2 ', N'icscontact2 ', N'AuditDate', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.lookups_full', N'SELECT�*�FROM�dbo.lookups_full', N'lookups_full', NULL, N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.education_details', N'SELECT�*�FROM�dbo.education_details', N'education_details', N'LAST_UPDT', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.people_name_change', N'SELECT�*�FROM�dbo.people_name_change', N'people_name_change', N'LAST_UPDT', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.exclusions', N'SELECT�*�FROM�dbo.exclusions', N'exclusions', N'LAST_UPDT', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.stud_hist', N'SELECT�*�FROM�dbo.stud_hist', N'stud_hist', N'LAST_UPDT', N'WHERE 1=1')
INSERT INTO [metrics].[SqlPullQueries] ([Source_Name], [Object_Name], [Extract_Query], [Target_Path], [Change_Date], [Where_Statement]) VALUES (N'capitaone', N'dbo.student_attendance', N'SELECT * FROM dbo.student_attendance', N'student_attendance', N'LAST_UPDT', N'WHERE COALESCE( ATT_DATE, START_DATE ) > CONVERT(DATETIME, ''2020-07-01'', 110 )')