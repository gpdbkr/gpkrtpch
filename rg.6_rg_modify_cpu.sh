#!/bin/bash

###### query start
psql -U gpadmin -e <<-!

ALTER RESOURCE GROUP rgoltp SET cpu_rate_limit $1;

!
###### query end

