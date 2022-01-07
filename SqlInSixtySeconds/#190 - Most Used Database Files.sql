--#190 - Most Used Database Files

SELECT
   DB_NAME(dbid) 'Database Name',
   physical_name 'File Location',
   NumberReads 'Number of Reads',
   BytesRead 'Bytes Read',
   NumberWrites 'Number of Writes',
   BytesWritten 'Bytes Written',   
   IoStallReadMS 'IO Stall Read',
   IoStallWriteMS 'IO Stall Write',
   IoStallMS as 'Total IO Stall (ms)'
FROM
   fn_virtualfilestats(NULL,NULL) fs INNER JOIN
    sys.master_files mf ON fs.dbid = mf.database_id 
    AND fs.fileid = mf.file_id
ORDER BY
   DB_NAME(dbid)