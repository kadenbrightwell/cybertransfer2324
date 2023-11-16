#!/bin/bash

total=$((256 * 256))
processed=0

# Function to ping an IP address
ping_ip() {
    ip="$1"
    if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
        echo "Host $ip is reachable."
    fi

    # Increment the processed count
    ((processed++))

    # Calculate the progress percentage
    progress=$((processed * 100 / total))

    # Update the status bar
    printf "Progress: %d%%\r" "$progress"
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

# Print a new line after the status bar to separate it from the following output
echo ""
