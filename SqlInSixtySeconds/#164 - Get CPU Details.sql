--#164 - Get CPU Details

EXEC sys.xp_readerrorlog 0, 1, N'detected', N'socket'

SELECT socket_count, cores_per_socket, cpu_count
FROM sys.dm_os_sys_info;