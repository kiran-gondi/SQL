--#126 - Varchar vs Nvarchar - Storing Non-English Characters

-- Creating a table
CREATE TABLE MultiLang 
    (Lang VARCHAR(100),
    Strings VARCHAR(1000),
    NStrings NVARCHAR(1000))
GO
-- Inserting the data
INSERT INTO MultiLang (Lang, Strings, NStrings)
    VALUES ('English', 'How are you?', N'How are you?');
INSERT INTO MultiLang (Lang, Strings, NStrings)
    VALUES ('Gujarati', 'તમે કેમ છો?', N'તમે કેમ છો?');
INSERT INTO MultiLang (Lang, Strings, NStrings)
    VALUES ('Hindi', 'आप कैसे हो?', N'आप कैसे हो?');
GO
-- Retrieve data
SELECT *
FROM MultiLang
GO
-- Clean up
DROP TABLE MultiLang
GO