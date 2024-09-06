#!/bin/bash

# Set the image path
image_path="main.png"

# Set the custom heading and information
heading="      WALCHAND LINUX USERS' GROUP"
spaced_heading=$(echo "$heading" | sed 's/./& /g')  # Add space between each character
info="\nOS: $(uname -o)\nKernel: $(uname -r)\nUptime: $(uptime -p)\nCustom Info: This is my own fetch tool."

# Clear the screen
clear

# Print a larger, bold heading with increased spacing
echo -e "\e[1;1m\e[1;34m$spaced_heading\e[0m\n"

# Display the image and store it in a variable
image_output=$(jp2a --invert --width=40 "$image_path")

# Split the image output by line and print it along with the info on the right side
IFS=$'\n' read -rd '' -a image_lines <<<"$image_output"
image_height=${#image_lines[@]}

# Calculate the maximum number of info lines
info_lines=$(echo -e "$info" | wc -l)

# Print the image and info side by side
for ((i=0; i<$image_height || i<$info_lines; i++)); do
    # Print image line if available
    if [[ $i -lt $image_height ]]; then
        printf "%-40s" "${image_lines[$i]}"
    else
        printf "%-40s" " "
    fi

    # Print corresponding info line if available
    if [[ $i -lt $info_lines ]]; then
        echo -e "$(echo -e "$info" | sed -n "$((i + 1))p")"
    else
        echo ""
    fi
done
