# Day 4
# I can't wait!

# Challenge :
# Write a program that will display the number of hours until christmas day

# Language -> Bash

echo $(( ($(date +%s -d "20201225") - $( date +%s )) / 3600 )) hours until Christmas!
