use feature 'say';my $icicle = q{ \      /
  \    /
   \  /
    \/};for(my $x=0;$x<10;$x++){say $icicle;sleep(2);print"\033[2J";}print "Icicle";
