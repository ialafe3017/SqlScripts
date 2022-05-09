USE [CAMP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[StoCreateTable] @Schema             NVARCHAR(255), 
                                    @Table              NVARCHAR(255), 
                                    @IdentityDataType   NVARCHAR(10), 
                                    @TableMSDescription NVARCHAR(500), 
                                    @CreatedBy          NVARCHAR(50) 
/************************************************************************************
Object Name: dbo.StoCreateTable
Created By:  Israel Alafe

Parameter List:
    @param1 datatype
    @param2 datatype

Output List:
    ColumnA
    ColumnB

Purpose: This procedure will print out a table to .NET standards

------------------------------------------------------------------------------------
Change History: 
04/04/2019 - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SELECT @SQL = CONCAT('
CREATE TABLE ', @Schema, '.', @Table, '( ', @Table, 'Id ', @IdentityDataType, ' IDENTITY(1,1) NOT NULL
 ,DateCreated  DATETIME2(2) NOT NULL CONSTRAINT DF_', @Schema, '_', @Table, '_DateCreated DEFAULT (GETDATE()) 
 ,DateUpdated  DATETIME2(2) NOT NULL CONSTRAINT DF_', @Schema, '_', @Table, '_DateUpdated DEFAULT (GETDATE())
 ,CONSTRAINT PK_', @Schema, '_', @Table, ' PRIMARY KEY CLUSTERED 
(
	', @Table, 'Id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TRIGGER ', @Schema, '.', 'Tr', @Table, '_DateUpdated
/************************************************************************************
Object Name: ', @Schema, '.', 'Tr', @Table, '_DateUpdated
Created By:  ', @CreatedBy, '

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
',
   (
    SELECT CONVERT(VARCHAR(10), GETDATE(), 101)
   ), ' - Initial Creation

************************************************************************************/
ON ', @Schema, '.', @Table, '
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE ', @Schema, '.', @Table, '
SET DateUpdated = GETDATE() 
WHERE ', @Table, 'Id IN (	
    SELECT i.', @Table, 'Id
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.', @Table, 'Id = d.', @Table, 'Id );


GO

EXEC sys.sp_addextendedproperty 
    @name=N''MS_Description'', 
    @value=N''', @TableMSDescription, ''' , 
    @level0type=N''SCHEMA'',
    @level0name=N''', @schema, ''', 
    @level1type=N''TABLE'',
    @level1name=N''', @Table, '''
GO
');

    PRINT @SQL;

END;
GO


