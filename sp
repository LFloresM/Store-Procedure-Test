ALTER PROCEDURE csp_DailyTimeLog_Save
@IdentityUserId INT,
@TheDay DATETIME,
@DataToProcess XML
AS
SELECT @DataToProcess=
N'<ArrayOfTimeEntry_Dto xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <TimeEntry_Dto>
    <LogEntryId>2447</LogEntryId>
    <Code1>CP</Code1>
    <Code2>ASSET</Code2>
    <Code3>ER-2</Code3>
    <CodeInputs>.CP.ASSET.ER-2...</CodeInputs>
    <EntryNotes>22 - aaaaaaaaaaaaaaa</EntryNotes>
    <TimeStart>2017-11-24T22:05:09-08:00</TimeStart>
    <DurationHours>1.16</DurationHours>
  </TimeEntry_Dto>
  <TimeEntry_Dto>
    <LogEntryId>2448</LogEntryId>
    <Code1>WCN</Code1>
    <Code2>ER</Code2>
    <Code3>ER-1</Code3>
    <CodeInputs>.WCN.ER.ER-1...</CodeInputs>
    <EntryNotes />
    <TimeStart>2017-11-24T23:15:00-08:00</TimeStart>
    <DurationHours>0.5</DurationHours>
  </TimeEntry_Dto>
  <TimeEntry_Dto>
    <LogEntryId>2449</LogEntryId>
    <Code1>WCN</Code1>
    <Code2>ER</Code2>
    <Code3>ER-1</Code3>
    <CodeInputs>.WCN.ER.ER-1...</CodeInputs>
    <EntryNotes>fgthfsdrghdfgh</EntryNotes>
    <TimeStart>2017-11-24T23:45:00-08:00</TimeStart>
    <DurationHours>0</DurationHours>
  </TimeEntry_Dto>
    <TimeEntry_Dto>
    <LogEntryId>2447</LogEntryId>
    <Code1>CP</Code1>
    <Code2>ASSET</Code2>
    <Code3>ER-2</Code3>
    <CodeInputs>.CP.ASSET.ER-2...</CodeInputs>
    <EntryNotes>22 - aaaaaaaaaaaaaaa</EntryNotes>
    <TimeStart>2017-11-24T22:05:09-08:00</TimeStart>
    <DurationHours>1.16</DurationHours>
  </TimeEntry_Dto>
  <TimeEntry_Dto>
    <LogEntryId>2448</LogEntryId>
    <Code1>WCN</Code1>
    <Code2>ER</Code2>
    <Code3>ER-1</Code3>
    <CodeInputs>.WCN.ER.ER-1...</CodeInputs>
    <EntryNotes />
    <TimeStart>2017-11-24T23:15:00-08:00</TimeStart>
    <DurationHours>0.5</DurationHours>
  </TimeEntry_Dto>
  <TimeEntry_Dto>
    <LogEntryId>2449</LogEntryId>
    <Code1>WCN</Code1>
    <Code2>ER</Code2>
    <Code3>ER-1</Code3>
    <CodeInputs>.WCN.ER.ER-1...</CodeInputs>
    <EntryNotes>fgthfsdrghdfgh</EntryNotes>
    <TimeStart>2017-11-24T23:45:00-08:00</TimeStart>
    <DurationHours>0</DurationHours>
  </TimeEntry_Dto>
</ArrayOfTimeEntry_Dto>'
 SELECT	 
		 @IdentityUserId as CodUser
		,@TheDay as Day 			 
		,T.c.value('./CodeInputs[1]', 'varchar(100)') as CodeInputs
		,T.c.value('./EntryNotes[1]', 'varchar(300)') as EntryNotes
		,T.c.value('./TimeStart[1]', 'DATETIME') as TimeStart
		,T.c.value('./Code1[1]', 'varchar(20)') as Code1
		,T.c.value('./Code2[1]', 'varchar(20)') as Code2
		,T.c.value('./Code3[1]', 'varchar(20)') as Code3
FROM @DataToProcess.nodes('ArrayOfTimeEntry_Dto/TimeEntry_Dto') T(c)
   
exec [dbo].[csp_DailyTimeLog_Save] 
	 @TheDay='2017-11-26'
	,@IdentityUserId=8
	,@DataToProcess=''
