# Day 15
# Countdown... 

# Challenge :
# Write a program that counts down to Christmas (midnight between the 24th and the 25) every second. 
# Your program should be designed to never be out of sync with the actual time (i.e if you leave it running forever it will still be consistent)

# Language -> Bash

while [[ $(( $(date +%s -d "12/25/2020") - $( date +%s ) )) > 0 ]] 
    do
        echo "$(( $(date +%s -d "12/25/2020") - $( date +%s ) )) seconds till Christmas" | figlet -c
    done

