#!/bin/bash

# Function to ping an IP address
ping_ip() {
    ip="$1"
    if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
        echo "Host $ip is reachable."
    else
        echo "Host $ip is unreachable."
    fi
}

# Loop through all possible IP addresses in the 10.15.*.* range using GNU Parallel
for i in {0..255}; do
    for j in {0..255}; do
        ip="10.15.$i.$j"
        ping_ip "$ip" &  # Run the function in the background
    done
done

# Wait for all background processes to finish
wait
