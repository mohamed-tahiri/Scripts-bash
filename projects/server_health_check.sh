#!/usr/bin/env bash
#
# server_health_check.sh
#
# A devops capstone project script to check the health
# of multiple remote servers via SSH 
#
# Usage: ./server_health_check .sh -f <server_list_file> -u <remote_user>
#
# --- Part 1 : "Strict Mode" ---
# set -e: exit immediately if any command fails
# set -u: exit if an undefined variable is used
# set -o pipefail: if any command in a pipeline fails, treat the whole pipeline as failed
set -euo pipefail

# --- Part 2 : Cleanup ---
# --- Global Constants ---
# we create a temporary log file to record everythings

# mktemp creates a secure temporary file that won't clash with existing files
LOG_FILE=$(mktemp /tmp/server_health.XXXXXX)
readonly LOG_FILE
# readonly means this value cannot be changed

# --- Functions Definitions ---

# Log an information message to both screen and log file
log_info() {
	echo "[INFO] $1" | tee -a "$LOG_FILE"
}

# Log an error message to stderr and the log file 
log_error() {
	# >&2 sends the output to stderr
	echo "[ERROR] $1" | tee -a "$LOG_FILE" >&2 
}

# Print usage script 
print_usage() {
	echo "Usage: $0 -f <server_list_file> -u <remote_user>"
	echo "	-f: Path to a file containing a list of servers (one per line)."
	echo "	-u: The remote SSH user to connect as."
	echo "	-h: Display this help message."
}

# This function will clean up after the script
cleanup() {
	echo "Cleaning up temporary log file: $LOG_FILE"
	rm -f "$LOG_FILE"
}

# This function performs  the actuel health check on a remote server
check_server() {
    local server="$1"
    local user="$2"

    # CRITICAL FIX: The log_info function is not defined in this script.
    # It must be replaced with a standard shell output command like `echo`
    # or you must define log_info elsewhere. Assuming `echo` is the intent.
    echo "--- Checking Server: $server ---"
    
    # Use an SSH here-document to send a batch of commands in one connection
    # FIX: The connect timeout needs to be inside the quotes or it will cause a syntax error
    # FIX: ConnectTimeout value is '5' in the original, I'm setting it to '5' here for safety
    ssh -n -o ConnectTimeout='5' "${user}@${server}" <<'EOF'
# 1. Uptime check
echo "--- System Uptime ---"
uptime
# 2. Disk check (Root partition)
echo "--- Disk Usage (ROOT /) ---"
# NR==2 means print only the second line of df output
df -h / | awk 'NR==2 {print "Used: " $5 " (" $3 "/" $2 ")"}'
# 3. Memory check
echo "--- Memory Usage ---"
# Calculate percentage from $3 (Used) and $2 (Total)
free -m | awk 'NR==2 { printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, ($3/$2)*100 }'
# 4. Security check (SSH brute-force failures)
echo "--- Security (SSH) ---"
# Use a more generic path for auth logs on *Nix systems
AUTH_LOG="/var/log/auth.log"
if [[ ! -f "$AUTH_LOG" ]]; then
    AUTH_LOG="/var/log/secure"
fi

if [[ -f "$AUTH_LOG" ]]; then
    # count failed attempts where the login attempt was not successful 
    # and not due to a bad username, often 'Failed password' or 'Invalid user'
    count=$(grep -c "Failed password" "$AUTH_LOG")
    echo "Failed SSH Password Attempts: $count"  
else
    echo "Failed SSH Attempts: auth log not found at /var/log/auth.log or /var/log/secure."
fi
EOF
    
    echo "--- Finished check: $server ---"
}

# Main function: core logic of the script 
main() {
	local server_file=""
	local user_remote=""
	while getopts ":f:u:h" opt; do
		case "$opt" in
			f) 
				server_file="$OPTARG"
				;;
			u)
				user_remote="$OPTARG"
				;;
			h)
				print_usage
				exit 0
				;;
			\?) 	#Invalid flag
				log_error "Invalid option: -$OPTARG"
				print_usage
				exit 1
				;;
			:)	# Missing value for a flag
				log_error "Option -$OPTARG requires an argument."
				print_usage
				exit 1
				;;
		esac 
	done

	# --- Input validation ---
	if [[ -z "$server_file" || -z "$user_remote" ]]; then
		log_error "Missing required arguments."
		print_usage
		exit 1
	fi

	if [[ ! -f "$server_file" ]]; then
		log_error "Server file not found: $server_file"
		exit 1
	fi

	# Define an empty array to hold the servers
	declare -a servers=()
	
	# Read the server file line by line (Safe method)
	while IFS= read -r line; do 
		# Skip empty lines and comment lines
		if [[ -z "$line" || "$line" == \#* ]]; then
			continue
		fi
		
		# Add the server to the array
		servers+=("$line")
	done < "$server_file"

	if [[ ${#servers[@]} -eq 0 ]]; then
		log_error "No servers found in $server_file. Exiting ..."
		exit 1
	fi

	log_info "Found ${#servers[@]} servers to check. Starting ..."
	
	log_info "Configuration valid. Starting health checks... "
	
	# TODO: add health check logic here
	for server_host in "${servers[@]}"; do 
		check_server "$server_host" "$user_remote"
	done

	log_info "All checks completed".
}

# --- Script Entry Point ---
# Call main with all script arguments
main "$@"

# trap is the "hook". we tell it: 
# "whenever this script exits for any reason (EXIT), 
# or receives INT/TERM signals, call the cleanup function."
trap cleanup EXIT INT TERM
echo "Script started. Log file created at: $LOG_FILE"

