#!/bin/bash

source $VARIABLES_FILE

prefixes=`cat prefixes.txt`

# cmd="python run-framework.py
# 	--step_remote simple
# 	--exps_file experiments-phase2.json
# 	--step_sync
# 	--step_sync_s3_prefix \$prefix
# 	--step_compute
# 	--step_export_compute
# 	--step_upload
#     --user incubator
# 	--host 192.168.1.100
# 	--port 8491
#     --ssh_keypath ~/.ssh/inc-box
# 	--remote_variables_file /home/incubator/agief-project/variables/variables-incbox.sh"

cmd="python run-framework.py
	--step_remote simple
	--exps_file experiments-phase2.json
	--step_sync
	--step_sync_s3_prefix $prefixes
	--step_compute
    --user incubator
	--host box.x.agi.io
	--port 8492
    --ssh_keypath ~/.ssh/minsky
    --ssh_port 4912
	--remote_variables_file /Users/incubator/agief-project/variables/variables-minsky.sh"

./runexp.sh $AGI_EXP_HOME "/Users/gideon/Development/ProjectAGI/AGIEF/run-framework/scripts/run-framework" "$cmd" $prefixes # ${prefixes[*]}


exit


# example of expanding a variable in a string

var=5
cmd="blah and \$var"
c=`eval echo $cmd`
echo $c
