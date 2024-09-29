create database learning_num;
use learning_num;

SHOW VARIABLES LIKE 'performance_schema';

use performance_schema;


select * from events_statements_summary_by_digest limit 100;

SELECT (100 * SUM_TIMER_WAIT / sum(SUM_TIMER_WAIT)
 OVER ()) percent,
 SUM_TIMER_WAIT AS total,
 COUNT_STAR AS calls,
 AVG_TIMER_WAIT AS mean,
 substring(DIGEST_TEXT, 1, 200)
FROM performance_schema.events_statements_summary_by_digest
 ORDER BY SUM_TIMER_WAIT DESC
 LIMIT 10;