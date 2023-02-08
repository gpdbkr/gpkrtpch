#!/bin/bash

###### query start
psql -U gpadmin  <<-!

SELECT r.rsgname, s.groupid, s.num_running, s.num_queueing
	, s.num_queued
	, s.num_executed
--	, s.total_queue_duration
--	, s.cpu_usage
	, s.cpu_usage->'-1' cpu_master
    , s.cpu_usage->'0'  cpu_seg0
    , s.cpu_usage->'1'  cpu_seg1
    , s.cpu_usage->'2'  cpu_seg2
    , s.cpu_usage->'3'  cpu_seg3
	--, json_each_text(s.memory_usage) memory_usage
   FROM pg_resgroup_get_status(NULL::oid) 
         s(groupid, num_running, num_queueing, num_queued, num_executed, total_queue_duration, cpu_usage, memory_usage)
	  , pg_resgroup r
  WHERE s.groupid = r.oid
   AND  r.rsgname in ('rgadhoc', 'rgoltp');
!
###### query end

