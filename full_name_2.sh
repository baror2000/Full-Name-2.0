#!/bin/bash
 # This program combines your first and last name. ENJOY!



function open(){
    echo "Please enter your first name"
    read first_name

    echo "Please enter your last name"
    read last_name

    full_name="$first_name $last_name"
    answer="$(grep -i "$full_name" "./names.csv" | cut  -d";" -f2)"
    real_name="$(grep -i "$full_name" "./names.csv" | cut  -d";" -f1)"

    if [ -n "$answer" ]; then
        echo "        "
        echo "        "
        echo "        Hello $real_name - $answer"
        echo "        "
        echo "        "
    else
        echo "        "
        echo "        "
        echo "        I Don't Know You Yet! Nice To Meet You :) You Are Bar's..."
        echo "        "
        echo "        "
	read new_info
        echo "        "
        echo "        "
        echo "        Great! I Shall Add You To The List $full_name Bar's $new_info"
        echo "        "
        echo "        "
	echo "$full_name;You Are My $new_info" >> "./names.csv"
    fi

    echo "Do you want to do it one more time? (y/n)"
    read yn

if [ "$yn" == "y" ]; then
open
else
   echo "Good Bye!"
   exit 0
fi
}

open
