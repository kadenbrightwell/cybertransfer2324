google.com
facebook.com
amazon.com
apple.com
microsoft.com
youtube.com
wikipedia.org
twitter.com
linkedin.com
netflix.com
instagram.com
reddit.com
pinterest.com
ebay.com
yahoo.com
baidu.com
adobe.com
tumblr.com
vimeo.com
github.com

+++++

#!/bin/bash

# Function to perform nslookup and convert output to ASCII art
nslookup_to_ascii() {
    local domain=$1

    # Perform nslookup and get ASCII values
    ascii_values=$(nslookup $domain | od -A n -t d1)

    # Define a set of characters for ASCII art
    local chars=('. ' ':' '-' '=' '+' '*' '#' '%')

    # Convert ASCII values to characters
    for value in $ascii_values; do
        # Map the ASCII value to a character
        local char_index=$((value % ${#chars[@]}))
        echo -n "${chars[char_index]}"
        
        # Newline for formatting (adjust this for different patterns)
        if (( RANDOM % 10 == 0 )); then
            echo
        fi
    done
}

# Check if domain list file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain_list_file>"
    exit 1
fi

# Read domains from file and call the function
while IFS= read -r domain; do
    echo "Processing $domain"
    nslookup_to_ascii "$domain"
    echo
    echo "----------------------------------"
done < "$1"

+++++

Save it as a file (e.g., nslookup_art.sh).
Make it executable: chmod +x nslookup_art.sh
Run the script with a domain name: ./nslookupart.sh domains.txt
