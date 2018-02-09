CREATE DATABASE IF NOT EXISTS test;
USE test;

CREATE TABLE IF NOT EXISTS test_table_daily(
name string,
client string,
project string,
day timestamp
)
PARTITIONED BY (dt string,source string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE test_table_daily PARTITION(dt='${DATE}',source='client')
SELECT
'Venkat', 'MY-Client', 'Test Project', '2016-06-01 00:00:00';

