#!/bin/bash

# TODO : instead of concat a CMD string, run every step of the command by argument
# -> easier to debug, 
# https://github.com/kkos/oniguruma/blob/master/doc/RE

############################################################
# Help                                                     #
############################################################

###
# -h --help					print this help
# -i --image				search by image name
# -d --container-id			search by container id
# -f --container-full-id	search by container full id
# -c --command				search by container command
# -s --satuts				search by container status
# -t --created-at			search by container 'created at ...'
# -p --port					search by container port
# -n --names				search by container names
# TODO: -o --output			TODO : output as a table instead of json (arguments : t,table)
###

Help()
{
   # Display Help
   echo "Command to display running containers in a json format with jq."
   echo "Options are used to filter what the list of containers contains the argument passed."
   # printf '|%4.4s|\n' a ab abc abcd abcde
   echo
   # echo "Syntax: dps -[h|i|d|f|c|s|t|p|n] (long options such as '--image' are not available yet)"
   echo "options:"
   echo "-h --help				Print this Help."
   echo "-c --command [COMMAND]			Search by container [COMMAND]"
   echo "-d --container-id [ID]			Search by container [ID]"
   echo "-f --container-full-id [FULL_ID]	Search by [FULL_ID]"
   echo "-F --format [FORMAT]			TODO: specify which keys to keep (IMAGE, COMMAND...)"
   echo "-i --image [IMAGE]			Search by container [IMAGE] name."
   echo "-n --names [NAMES]			Search by container [NAMES]"
   echo "-o --output [FORMAT]			TODO : Output format : json, table (default : table)"
   echo "-p --ports [PORTS]			Search by container [PORTS]"
   echo "-q --query [QUERY]			TODO: jq select query"
   echo "-s --satuts [STATUS]			Search by container [STATUS]"
   echo "-t --created-at [CREATED_AT]		Search by container [CREATED_AT]"
   echo "-v --verbose				Show invidious running containers"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Command concatenated to be executed at the end
CMD='docker ps --no-trunc'

# Select what do display about a container
CMD+=' --format '"'"'{
	"IMAGE":"{{ .Image }}",
	"CONTAINER_ID": "{{ .ID }}",
	"CONTAINER_FULL_ID": "{{ .ID }}",
	"COMMAND": {{ .Command }},
	"STATUS": "{{ .Status }}",
	"CREATED_AT": "{{ .CreatedAt }}",
	"PORTS": "{{ .Ports }}",
	"NAMES":"{{ .Names }}"
}
'"'"''

# Shorten .CONTAINER_ID to 12 characters
CMD+=' | jq ".CONTAINER_ID=.CONTAINER_ID[0:12]"'

# Parse options. Note that options may be followed by one colon to indicate they have a required argument
options=$(getopt -o hc:d:f:i:n:o:p:q:s:t:v -l help,command:,container-id:,container-full-id:,image:,names:,verbose,status:,query: -- "$@")

if [ $? != 0 ]
then
    # Error, getopt will put out a message for us
    exit 1
fi

set -- $options

VERBOSE_OPT=0 # By default, verbose is not set

while [ $# -gt 0 ]
do
	# Consume next (1st) argument
	case $1 in
		-h|--help) # display Help
			Help
			exit 0;;
		-i|--image)
			# image="$2";
			# CMD+=' | jq -c '"'"'. | select ( .IMAGE | contains("'"$2"'") )'"'"''
			IMAGE_OPT="$2";
			shift;;
		-d|--container-id)
			CONTAINER_ID_OPT="$2";
			shift;;
		-f|--container-full-id)
			CONTAINER_FULL_ID_OPT="$2";
			shift;;
		-c|--command)
			COMMAND_OPT="$2";
			shift;;
		-s|--satus)
			STATUS_OPT="$2";
			shift;;
		-t|--created-at)
			CREATED_AT_OPT="$2";
			shift;;
		-p|--ports)
			PORTS_OPT="$2";
			shift;;
		-n|--names)
			NAMES_OPT="$2";
			shift;;
		-q|--query)
			# TODO: need to support strings
			CMD+=" | jq --arg query $2 -c '. | select (\$ARGS.named.query)'"
			shift;;
		-v|--verbose)
			VERBOSE_OPT=1;
			;;
		(--)
			shift; break;;
		(-*)
			echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
		(*)
			# echo "arg 1 not supported : $1"
			# echo "arg 2 not supported : $2"
			break;;
	esac
	shift # FETCH NEXT ARGUMENT AS 1ST
done

# Handling options

if [ $VERBOSE_OPT -eq 0 ]; then # If --verbose isn't set
	CMD+=' | jq -c '"'"'. | select ( .NAMES | contains("'"invidious"'") | not )'"'"''
fi

if [ -n "$IMAGE_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .IMAGE | contains("'"$IMAGE_OPT"'") )'"'"''
fi

if [ -n "$CONTAINER_ID_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .CONTAINER_ID | contains("'"$CONTAINER_ID_OPT"'") )'"'"''
fi

if [ -n "$CONTAINER_FULL_ID_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .CONTAINER_FULL_ID | contains("'"$CONTAINER_FULL_ID_OPT"'") )'"'"''
fi

if [ -n "$COMMAND_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .COMMAND | contains("'"$COMMAND_OPT"'") )'"'"''
fi

if [ -n "$STATUS_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .STATUS | contains("'"$STATUS_OPT"'") )'"'"''
fi

if [ -n "$CREATED_AT_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .CREATED_AT | contains("'"$CREATED_AT_OPT"'") )'"'"''
fi

if [ -n "$PORTS_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .PORTS | contains("'"$PORTS_OPT"'") )'"'"''
fi

if [ -n "$NAMES_OPT" ]; then
	CMD+=' | jq -c '"'"'. | select ( .NAMES | contains("'"$NAMES_OPT"'") )'"'"''
fi
# Execute command with clean jq at the end
bash -c "$CMD" | jq -s
# echo "CMD :"
# echo "$CMD"


## OLD script : dps alias

# alias dps='docker ps --no-trunc --format \
# 	"{\"IMAGE\":\"{{ .Image }}\",\
# 	\"CONTAINER_ID\": \"{{ .ID }}\",\
# 	\"CONTAINER_FULL_ID\":\"{{ .ID }}\",\
# 	\"COMMAND\": {{ .Command }},\
# 	\"STATUS\": \"{{ .Status }}\",\
# 	\"CREATED\": \"{{ .CreatedAt }}\",\
# 	\"PORTS\": \"{{ .Ports }}\",\
# 	\"NAMES\":\"{{ .Names }}\"}" | jq ".CONTAINER_ID=.CONTAINER_ID[0:12]"'
# alias dps='docker ps --no-trunc --format "{\"CONTAINER_ID\":\"{{ .ID }}\", \"CONTAINER_FULL_ID\":\"{{ .ID }}\", \"IMAGE\": \"{{ .Image }}\", \"COMMAND\": {{ .Command }}, \"CREATED\": \"{{ .CreatedAt }}\", \"STATUS\": \"{{ .Status }}\", \"PORTS\": \"{{ .Ports }}\", \"NAMES\":\"{{ .Names }}\"}" | jq ".CONTAINER_ID=.CONTAINER_ID[0:12]"'
# utils command :
# dps | jq -c '. | select( .IMAGE | contains("-wordpress"))' | jq
