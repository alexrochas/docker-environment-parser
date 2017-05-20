#!/bin/bash -l

usage() { { echo "Usage: $0 [-d <docker-file-path>] [-c <container>]" 1>&2; exit 1; } }

WORK_PATH=`dirname "$0"`

while getopts "d:c:-:" option; do
	case "${option}" in
		-) case "${OPTARG}" in
			docker=*)
				val=${OPTARG#*=}
				opt=${OPTARG%=$val}
				DOCKER_FILE=${val}
				;;
			container=*)
				val=${OPTARG#*=}
				opt=${OPTARG%=$val}
				CONTAINER=${val}
				;;
			*) usage;;
		esac;;
		d) DOCKER_FILE=${OPTARG};;
		c) CONTAINER=${OPTARG};;
		*) usage;;
	esac
done

function _search(){
	source /dev/stdin < <(echo "$(python $WORK_PATH/compose_to_environment.py -c $CONTAINER -d $DOCKER_FILE)")
}

_search

bash -i
