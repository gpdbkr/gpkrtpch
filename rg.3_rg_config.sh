#!/bin/bash

###### query start
psql -U gpadmin  <<-!

SELECT groupid ,   groupname   , concurrency , proposed_concurrency , cpu_rate_limit  
FROM gp_toolkit.gp_resgroup_config
where groupname in ('rgoltp', 'rgadhoc');

!
###### query end

