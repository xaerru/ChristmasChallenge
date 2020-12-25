# Day 24
# Merry Christmas! 

# Challenge:
# Write a program that tells the user how long they have to wait until Santa comes! 
# You may not ask them to input their timezone and you should assume Santa comes at 0:00 on the 25th of december.

# Language -> Bash

S=$(( $(date +%s -d "12/25/2020") - $( date +%s ) ));printf '%dh:%dm:%ds Until Christmas!!\n' $(($S/3600)) $(($S%3600/60)) $(($S%60))
