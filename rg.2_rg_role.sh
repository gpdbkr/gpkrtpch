#!/bin/bash

###### query start
psql -U gpadmin -e <<-!

SELECT rolname, rsgname 
FROM   pg_roles, pg_resgroup
WHERE pg_roles.rolresgroup=pg_resgroup.oid;

!
###### query end

