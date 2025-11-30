#!/usr/bin/env bash
# $1 is the first argument passed to the script
ACTION="$1"

if [[ -z "$ACTION"  ]]; then
	echo "ERROR: no action provided"
	echo "Usage: $0 [start|stop|restart]"
	exit 1
fi

case $ACTION in 
	start)
		echo "Starting the service ..."
		;;
	stop)
		echo "Stoping the service ..."
		;;
	restart)
		echo "Restarting the service ..."

		;;
	*)
		echo "ERROR: unknown action '$ACTION'."
		echo "Usage: $0 [start|stop|restart]"
		exit 1
		;;	
esac
echo "Done."
