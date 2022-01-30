--#122 - Sleeping vs Suspended Process

--Script 1:https://blog.sqlauthority.com/2020/09/10/sleeping-vs-suspended-process-sql-in-sixty-seconds-122/
--Script 2:https://blog.sqlauthority.com/2019/05/06/sql-server-script-to-kill-all-inactive-sessions-kill-sleeping-sessions-from-sp_who2/


SELECT * 
FROM sys.sysprocesses;

EXEC sp_who2;

--Status Definitions
/*

RESOURCES: Thread, CPU & Disk/IO.

PENDING: When Process/Query have no thread & no CPU.
RUNNABLE: When Process/Query have a thread, but no CPU.
RUNNING: When Process/Query have a thread & CPU.
SUSPENDED: When Process/Query is waiting for IO to be available.
SLEEPING: When Process/Query is not doing anything and waiting for further commands.
DORMANT: When Process/Query is getting reset.
BACKGROUND: When Process/Query is running background jobs.
SPINLOCK: When Process/Query is busy waiting in CPU for My Turn*.

*/

/*Here is the script to kill all inactive sessions. People those who usually ask for the script to kill 
sleeping sessions from sp_who2 can also use this script.*/
DECLARE @user_spid INT
DECLARE CurSPID CURSOR FAST_FORWARD
FOR
SELECT SPID
FROM master.dbo.sysprocesses (NOLOCK)
WHERE spid>50 -- avoid system threads
AND status='sleeping' -- only sleeping threads
AND DATEDIFF(HOUR,last_batch,GETDATE())>=24 -- thread sleeping for 24 hours
AND spid<>@@spid -- ignore current spid
OPEN CurSPID
FETCH NEXT FROM CurSPID INTO @user_spid
WHILE (@@FETCH_STATUS=0)
BEGIN
PRINT 'Killing '+CONVERT(VARCHAR,@user_spid)
EXEC('KILL '+@user_spid)
FETCH NEXT FROM CurSPID INTO @user_spid
END
CLOSE CurSPID
DEALLOCATE CurSPID
GO

