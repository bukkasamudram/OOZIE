CREATE database IF NOT EXISTS test;
USE test;

CREATE IF NOT EXISTS test_table_min(
name string,
client string,
project string,
day timestamp
)
PARTITIONED BY (dt string, hour string, min string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE test_table_min PARTITION(dt='${DATE}',hour='${HOUR}',min='${MIN}')
SELECT
'Venkat', 'MY-Client', 'Test Project', '2016-06-01 00:00:00';
