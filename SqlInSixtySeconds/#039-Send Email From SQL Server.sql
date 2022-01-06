--#039-Send Email From SQL Server

--Go and watch the video. i.e. https://www.youtube.com/watch?v=ZGDBB2uwNp8&list=PL4BD5C24EDB584162&index=150
--Chances are there this link might be changed in future.

USE msdb
GO
EXEC sp_send_dbmail @profile_name = 'SQLAuthority', @recipients='books@sqlauthority.com', @subject='Test message', @body='This is a test message.
Congrats Database Mail Received by you successfully.'
