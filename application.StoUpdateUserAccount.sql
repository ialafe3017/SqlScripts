USE [CAMP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [application].[StoUpdateUserAccount] @UserAccountId                      INT ,
                                                      @AdministrativeAssistantUserAccountId INT = NULL , 
                                                      @PhoneInterviewerUserAccountIds       VARCHAR(MAX) = NULL, 
                                                      @RoleTypeIds                          VARCHAR(MAX) = NULL, 
                                                      @StayInJobPosting                     BIT = NULL, 
                                                      @SendInviteToAttendee                 BIT = NULL,  
                                                      @ReceiveDailyEmailAlerts              BIT = NULL,  
                                                      @CanAutoEliminateApplicant            BIT = NULL,  
                                                      @IsActive                             BIT = NULL 
/************************************************************************************
Object Name: application.StoUpdateUserAccount
Created By:  Israel Alafe

Parameter List:
    @UserAccountId                        INT
	@AdministrativeAssistantUserAccountId INT     
	Defaults to an NULL.

	@PhoneInterviewerUserAccountIds       VARCHAR(MAX) 
		Defaults to an NULL. Comma separated string of INT's

	@RoleTypeIds                          VARCHAR(MAX) 
		Defaults to an NULL. Comma separated string of TINYINT's

	@StayInJobPosting                     BIT
	@SendInviteToAttendee                 BIT
	@ReceiveDailyEmailAlerts              BIT
	@CanAutoEliminateApplicant            BIT
	@IsActive                             BIT
	ALL defaults to NULL
Output List:
    N/A

Purpose: Updates columns in useraccount table and associated tables

------------------------------------------------------------------------------------
Change History: 
01/24/2021 - Initial creation.

************************************************************************************/
AS
SET NOCOUNT ON;

	 CREATE TABLE #PhoneInterviewerUserAccountIds(PhoneInterviewerUserAccountId INT NOT NULL);
     CREATE TABLE #UserAccountToRoleTypeIds(RoleTypeId INT NOT NULL)
      
	IF  ISNULL(@RoleTypeIds , '') <> ''
       BEGIN
	    INSERT INTO #UserAccountToRoleTypeIds(RoleTypeId)
        SELECT value
        FROM STRING_SPLIT(@PhoneInterviewerUserAccountIds, ',');
         
		DELETE TRT
        FROM #UserAccountToRoleTypeIds TRT
        WHERE EXISTS
                        (
                         SELECT  1
                         FROM [application].[UserAccountToRoleType] AS RT
                         WHERE RT.RoleTypeId = TRT.RoleTypeId
						 AND RT.UserAccountId = @UserAccountId 
                        );

        DELETE TRT
        FROM [application].[UserAccountToRoleType] TRT
        WHERE TRT.UserAccountId = @UserAccountId AND NOT EXISTS
                        (
                         SELECT  1
                         FROM #UserAccountToRoleTypeIds AS RT 
                         WHERE RT.RoleTypeId = TRT.RoleTypeId
                        );
		  
       INSERT INTO [application].[UserAccountToRoleType](UserAccountId
                                                , RoleTypeId)
       SELECT @UserAccountId
                      , RoleTypeId
              FROM #UserAccountToRoleTypeIds;
       END
		
    IF  ISNULL( @PhoneInterviewerUserAccountIds , '') <> ''
    BEGIN
        INSERT INTO #PhoneInterviewerUserAccountIds(PhoneInterviewerUserAccountId)
        SELECT value
        FROM STRING_SPLIT(@PhoneInterviewerUserAccountIds, ',');

        DELETE TPI
        FROM #PhoneInterviewerUserAccountIds TPI
        WHERE EXISTS
                        (
                         SELECT 1
                         FROM [application].[UserAccountToPhoneInterviewer] AS UA
                         WHERE UA.PhoneInterviewerUserAccountId = TPI.PhoneInterviewerUserAccountId
						 AND UA.UserAccountId = @UserAccountId 
                              
                         );            
        DELETE TPI
        FROM [application].[UserAccountToPhoneInterviewer] TPI
        WHERE TPI.UserAccountId = @UserAccountId AND NOT EXISTS
                        (
                         SELECT 1
                         FROM #PhoneInterviewerUserAccountIds AS UA
                         WHERE UA.PhoneInterviewerUserAccountId = TPI.PhoneInterviewerUserAccountId       
                         ); 
       INSERT INTO [application].[UserAccountToPhoneInterviewer](UserAccountId
                                                            , PhoneInterviewerUserAccountId)
       SELECT @UserAccountId
                 , PhoneInterviewerUserAccountId
       FROM #PhoneInterviewerUserAccountIds;
	END

 IF NOT EXISTS
                 (
                  SELECT TOP(1) 1 
                  FROM [application].[UserAccount]
                  WHERE ISNULL(AdministrativeAssistantUserAccountId,0) = ISNULL(@AdministrativeAssistantUserAccountId,0) 
				       AND UserAccountId = @UserAccountId
					   AND	StayInJobPosting = ISNULL(@StayInJobPosting,'') 
					   AND	SendInviteToAttendee = ISNULL(@SendInviteToAttendee,'') 
					   AND	ReceiveDailyEmailAlerts = ISNULL(@ReceiveDailyEmailAlerts,'')
					   AND	CanAutoEliminateApplicant = ISNULL(@CanAutoEliminateApplicant,'') 
					   AND	IsActive = ISNULL(@IsActive,'')
                 )
 
   BEGIN
       UPDATE [application].[UserAccount]
	   SET StayInJobPosting = CASE 
	                           WHEN @StayInJobPosting IS NULL
							     THEN StayInJobPosting
							   ELSE @StayInJobPosting
                               END
    ,AdministrativeAssistantUserAccountId = CASE 
											   WHEN @AdministrativeAssistantUserAccountId IS NULL
												 THEN NULL
											  ELSE @AdministrativeAssistantUserAccountId
											 END
      ,SendInviteToAttendee = CASE 
	                           WHEN @SendInviteToAttendee IS NULL
							     THEN SendInviteToAttendee
							   ELSE @SendInviteToAttendee 
                              END
   ,ReceiveDailyEmailAlerts = CASE 
	                           WHEN @ReceiveDailyEmailAlerts IS NULL
							     THEN ReceiveDailyEmailAlerts
						       ELSE @ReceiveDailyEmailAlerts
                               END
  ,CanAutoEliminateApplicant = CASE 
	                           WHEN @CanAutoEliminateApplicant IS NULL
							     THEN CanAutoEliminateApplicant
							   ELSE @CanAutoEliminateApplicant
                               END
	              ,IsActive = CASE 
	                           WHEN @IsActive IS NULL
							     THEN IsActive
							   ELSE @IsActive
							   END
          ,DateDeactivated = CASE
	                           WHEN @IsActive IS NULL
							     THEN DateDeactivated
							   WHEN @IsActive = CAST(1 AS BIT)
							     THEN NULL
							   ELSE GETDATE()
							   END
   WHERE [UserAccountId] = @UserAccountId
   END
   -----clean temp table
 DROP TABLE #PhoneInterviewerUserAccountIds
 DROP TABLE #UserAccountToRoleTypeIds
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updates columns in useraccount table and associated tables' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoUpdateUserAccount'
GO


