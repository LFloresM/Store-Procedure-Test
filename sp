CREATE DATABASE TIMELOOK02
GO

USE TIMELOOK02
GO

CREATE TABLE TimeEntry_Dto(
LogEntryId INT PRIMARY KEY NOT NULL,
Code1 VARCHAR(20) NOT NULL,
Code2 VARCHAR(20) NOT NULL,
Code3 VARCHAR(20) NOT NULL,
CodeInputs VARCHAR(20) NOT NULL,
EntryNotes VARCHAR(20) NOT NULL,
TimeStart DATETIME NOT NULL,
DurationHours INT NOT NULL
)


ALTER PROC AddTimeEntry
@LogEntryId INT,
@Code1 VARCHAR(20),
@Code2 VARCHAR(20),
@Code3 VARCHAR(20),
@CodeInputs VARCHAR(20),
@EntryNotes VARCHAR(20),
@TimeStart DATETIME ,
@DurationHours DECIMAL(6,2)
AS
INSERT INTO TimeEntry_Dto VALUES(@LogEntryId,@Code1,@Code2,@Code3,@CodeInputs,@EntryNotes,@TimeStart,@DurationHours)


EXEC AddTimeEntry 2447,'CP','ASSET','ER-2','CP.ASSET.ER-2','22 - aaaaaaaaaaaaaaa','2017-11-24',1.16
ALTER TABLE TimeEntry_Dto
ALTER COLUMN DurationHours DECIMAL(6,2) NOT NULL


    
 
   





)
