use projects;
SELECT * FROM projects.call_center_data;
explain Projects.call_center_data;

SET SQL_SAFE_UPDATES= 0
UPDATE call_center_data SET Call_Timestamp = STR_TO_DATE(Call_Timestamp, '%d-%m-%Y');

SET SQL_SAFE_UPDATES= 1

alter table call_center_data
modify column Call_Timestamp date;

UPDATE call_center_data SET Csat_Score = NULL WHERE Csat_Score = '';

ALTER TABLE call_center_data MODIFY COLUMN Csat_Score INT DEFAULT 0;

-- Total number of rows in table
select count(*)as row_num
from call_center_data;

select count(distinct Id),count(distinct customer_name)
from call_center_data;



-- Total number of records in the dataset:
SELECT COUNT(*) AS total_records 
FROM call_center_data;

-- Average Call Duration:
SELECT AVG('Call_Duration_ In_Minutes') AS average_call_duration 
FROM call_center_data;

-- Total number of calls by channel:
SELECT Channel, COUNT(*) AS total_calls 
FROM call_center_data
 GROUP BY Channel;

-- Total number of calls by sentiment:
SELECT Sentiment, COUNT(*) AS total_calls 
FROM call_center_data 
GROUP BY Sentiment;


-- Average Response Time by City:
-- SELECT City, AVG(`Response_Time`) AS average_response_time 
FROM call_center_data
 GROUP BY City;

-- Total number of calls by State with a Csat Score less than or equal to 5:
SELECT State, COUNT(*) AS total_calls
 FROM call_center_data 
 WHERE `Csat_Score` <= 5 
 GROUP BY State;

-- Top 5 reasons for contacting the call center:
SELECT Reason, COUNT(*) AS total_calls
 FROM call_center_data 
 GROUP BY Reason 
 ORDER BY total_calls DESC 
 LIMIT 5;

-- Average Csat Score by Call-Centres City:
SELECT `Call_Centres_City`, AVG(`Csat_Score`) AS average_csat_score
 FROM call_center_data 
 GROUP BY `Call_Centres_City`;

-- Total number of calls by Call-Centres City and Channel:
SELECT `Call_Centres_City`, Channel, COUNT(*) AS total_calls 
FROM call_center_data 
GROUP BY `Call_Centres_City`, Channel;


-- Total number of calls with a duration greater than 30 minutes:
SELECT COUNT(*) AS total_calls 
FROM call_center_data 
WHERE `Call_Duration_ In_Minutes` > 30;


