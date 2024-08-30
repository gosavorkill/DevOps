#!/bin/bash
start_time=$(date +%s.%N)
. "$(dirname "$0")/helper.sh"
end_time=$(date +%s.%N)
execution_time=$(echo "$end_time - $start_time" | bc -l)
rounded_time=$(printf "%.1f" "$execution_time")
echo "Script execution time (in seconds) = $rounded_time"
