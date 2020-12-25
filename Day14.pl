# Day 12
# Slowly...

# Challenge :
# Write a program that displays a candle on the screen that melts over time.

# Language -> Perl

use feature 'say';
for(my $i=20;$i>=1;$i--){
    print q{
  )
  ) \
 / ) (
 \(_)/
};
    for(my $x=0;$x<$i;$x++){
        say" |   |";
    }
    sleep(2);
    print"\033[2J";
}
say"Merry Christmas!"
