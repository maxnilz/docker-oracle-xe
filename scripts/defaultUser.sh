#!/bin/bash

. oraenv 

DEFAULT_USER="oracle"
DEFAULT_PASSWORD="oracle"

echo "Create default user $DEFAULT_USER with password: $DEFAULT_PASSWORD"
sqlplus / as sysdba << EOF
  alter session set container=XEPDB1;
  create user ${DEFAULT_USER} identified by ${DEFAULT_PASSWORD};
  grant dba to ${DEFAULT_USER};
  grant create session to ${DEFAULT_USER};
  grant connect, resource to ${DEFAULT_USER};
  grant all privileges to ${DEFAULT_USER};
EOF