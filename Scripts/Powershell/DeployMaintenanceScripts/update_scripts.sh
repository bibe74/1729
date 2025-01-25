#!/bin/sh
#
# update_scripts.sh - Updates SQL Server scripts
#
export SOURCE_DIR=/mnt/c/Work/_misc
export DESTINATION_DIR=.

cp -a $SOURCE_DIR/DarlingData/sp_HumanEvents/sp_HumanEvents.sql $DESTINATION_DIR/scripts/
cp -a $SOURCE_DIR/DarlingData/sp_PressureDetector/sp_PressureDetector.sql $DESTINATION_DIR/scripts/
cp -a $SOURCE_DIR/DarlingData/sp_QuickieStore/sp_QuickieStore.sql $DESTINATION_DIR/scripts/
cp -a $SOURCE_DIR/SQL-Server-First-Responder-Kit/Install-All-Scripts.sql $DESTINATION_DIR/scripts/

cp -a $SOURCE_DIR/sp_CheckSecurity/sp_CheckSecurity.sql $DESTINATION_DIR/scripts_common/
cp -a $SOURCE_DIR/sp_whoisactive/sp_WhoIsActive.sql $DESTINATION_DIR/scripts_common/
cp -a $SOURCE_DIR/sql-server-maintenance-solution/MaintenanceSolution.sql $DESTINATION_DIR/scripts_common/
