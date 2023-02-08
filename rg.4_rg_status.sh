#!/bin/bash

###### query start
psql -U gpadmin -e <<-!

SELECT * FROM gp_toolkit.gp_resgroup_status;

!
###### query end

