--#188 - Data Compression for Performance
--https://blog.sqlauthority.com/2021/12/15/sql-server-script-to-estimate-compression/

--Page Compression Estimation
EXEC sp_estimate_data_compression_savings
@schema_name = 'Production',
@object_name = 'WorkOrder',
@index_id = NULL,
@partition_number = NULL,
@data_compression = 'PAGE';

--Row Compression Estimation
EXEC sp_estimate_data_compression_savings
@schema_name = 'Production',
@object_name = 'WorkOrder',
@index_id = NULL,
@partition_number = NULL,
@data_compression = 'ROW';

--Enable Page Compression
ALTER TABLE Production.WorkOrder REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = PAGE);
GO

--Enable Row Compression
ALTER TABLE Production.WorkOrder REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = ROW);
GO

--Disable Data Compression
ALTER TABLE Production.WorkOrder REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = NONE);
GO

