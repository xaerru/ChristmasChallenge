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

