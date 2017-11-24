#!/bin/bash
# update oracle listener param
BASE_NAME=/database/app/oracle/product/11.2.0/dbhome_1/network/admin
LISTENER_FILE=$BASE_NAME/listener.ora
TNSNAMES_FILE=$BASE_NAME/tnsnames.ora

source /home/oracle/.bash_profile

sed -i "s/hostname/`hostname`/g" $LISTENER_FILE
sed -i "s/hostname/`hostname`/g" $TNSNAMES_FILE

sqlplus / as sysdba <<EOF
shutdown immediate;
startup;
quit;
EOF

lsnrctl stop

lsnrctl start

