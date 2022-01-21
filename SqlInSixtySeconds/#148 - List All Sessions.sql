--#148 - List All Sessions

--Script 1: https://blog.sqlauthority.com/2020/12/16/sql-server-representing-sp_who2-with-dmvs/
--Script 2: https://blog.sqlauthority.com/2020/12/17/sql-server-inserting-sp_who2-into-a-table/

EXEC sp_who2

--Below script customize as per your needs
SELECT  spid,
        sp.[status],
        loginame [Login],
        hostname, 
        blocked BlkBy,
        sd.name DBName, 
        cmd Command,
        cpu CPUTime,
        physical_io DiskIO,
        last_batch LastBatch,
        [program_name] ProgramName     
FROM master.sys.sysprocesses sp 
INNER JOIN master.sys.sysdatabases sd ON sp.dbid = sd.dbid
WHERE spid > 50 -- Filtering System spid
ORDER BY spid

--Inserting sp_who2 into a table
CREATE TABLE #sp_who2 (SPID INT, Status VARCHAR(255),
      Login  VARCHAR(255), HostName  VARCHAR(255),
      BlkBy  VARCHAR(255), DBName  VARCHAR(255),
      Command VARCHAR(255), CPUTime INT,
      DiskIO INT, LastBatch VARCHAR(255),
      ProgramName VARCHAR(255), SPID1 INT,
      REQUESTID INT);
INSERT INTO #sp_who2 
EXEC sp_who2
SELECT      *
FROM        #sp_who2
-- WHERE       DBName <> 'master' -- Add Filter
ORDER BY    SPID ASC;
DROP TABLE #sp_who2;
