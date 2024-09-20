#!/bin/bash

# Set the image path
image_path="main.png"

# Set the custom heading and information
heading="WALCHAND LINUX USERS' GROUP"
spaced_heading=$(echo "$heading" | sed 's/./& /g')  # Add space between each character
info="\nGreetings Open Source Enthusiasts!!!🙋🏻‍♀️🙋🏻‍♂️
\n\033[1mEstablished:\033[0m 2003
\n\033[1mAffiliation:\033[0m Walchand College of Engineering, Sangli
\n\033[1mFocus:\033[0m Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.....
\n\033[1mTagline:\033[0m \e[1;32mCommunity | Knowledge | Share\e[0m
"

# Clear the screen
clear

# Get the terminal width
term_width=$(tput cols)

# Calculate the padding needed to center the heading
heading_length=${#spaced_heading}
padding=$(( (term_width - heading_length) / 2 ))

# Print a larger, bold heading with increased spacing (white color) centered
printf "%${padding}s" ""
echo -e "\e[1;37m$spaced_heading\e[0m\n"  # \e[1;37m for bold white text

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

# char="."
#
# printf "%0.s$char" $(seq 1 $term_width)
#
# # Center the table by calculating terminal width and table width
# table_width=69  # Wider table width
# # padding=$(( (term_width - table_width) / 2 ))
# padding=7
#
# # Print the larger table with spacing between rows
# printf "%${padding}s" ""
# echo "+--------------------------+-------------+---------------------------+"
# printf "%${padding}s" ""
# echo "|       Event Name         |    Month    |         Nature            |"
# printf "%${padding}s" ""
# echo "+--------------------------+-------------+---------------------------+"
# printf "%${padding}s" ""
# echo "|      Linux Diary         |   August    |   Bootcamp + Wargames     |"
# printf "%${padding}s" ""
# echo "|                          |             |                           |"  # Add space between rows
# printf "%${padding}s" ""
# echo "|     Metamorphosis        |  November   |        Bootcamp           |"
# printf "%${padding}s" ""
# echo "|                          |             |                           |"  # Add space between rows
# printf "%${padding}s" ""
# echo "|    Open Source Day       |   January   |          Talks            |"
# printf "%${padding}s" ""
# echo "|                          |             |                           |"  # Add space between rows
# printf "%${padding}s" ""
# echo "|        Spandan           |  February   |      CSR Activity         |"
# printf "%${padding}s" ""
# echo "|                          |             |                           |"  # Add space between rows
# printf "%${padding}s" ""
# echo "|      Technotweet         |     May     |        Bootcamp           |"
# printf "%${padding}s" ""
# echo "+--------------------------+-------------+---------------------------+"
#
