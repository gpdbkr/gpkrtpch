#!/bin/bash

function load_hba() {
  ## need to add the new roles to pg_hba.conf file before proceeding
  # to define $MASTER_DATA_DIRECTORY or $COORDINATE_DATA_DIRECTION, which is used in gp7
  GP_VERSION=$(psql -v ON_ERROR_STOP=1 -t -A -c "SELECT CASE WHEN POSITION ('Greenplum Database 4.3' IN version) > 0 THEN 'gpdb_4_3' WHEN POSITION ('Greenplum Database 5' IN version) > 0 THEN 'gpdb_5' WHEN POSITION ('Greenplum Database 6' IN version) > 0 THEN 'gpdb_6' WHEN POSITION ('Greenplum Database 7' IN version) > 0 THEN 'gpdb_7' ELSE 'postgresql' END FROM version();")
  if [ "${GP_VERSION}" == "gpdb_7" ]; then
      MASTER_DATA_DIRECTORY=$COORDINATOR_DATA_DIRECTORY
  else
      MASTER_DATA_DIRECTORY=$MASTER_DATA_DIRECTORY
  fi

  echo -e "" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "######### need to add the new roles for running gpkrtpch scripts " >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "local 	all	udba         trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "local 	all 	uadhoc       trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "local	all	uoltp        trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "local	all	uetl         trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf

  echo -e "host		all	gpadmin		0.0.0.0/0	trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "host		all	udba         0.0.0.0/0	trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "host		all 	uadhoc       0.0.0.0/0	trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "host		all	uoltp        0.0.0.0/0	trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
  echo -e "host		all	uetl         0.0.0.0/0	trust" >> $MASTER_DATA_DIRECTORY/pg_hba.conf

  ## reload the pg_hba.conf file
  psql -d template1 -c "select pg_reload_conf();"
}

load_hba

