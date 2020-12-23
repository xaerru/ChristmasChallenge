#!/usr/bin/perl

use Time::HiRes "sleep";$| = 1;

$m="❄";

($y,$x)=split(/ /,`stty size`); # gets the screen size

print "\033[2J"; # clears the screen

# makes it snow until killed
while(true){
    push @snows,{y=>1,x=>int(rand($x))};
    for(@snows){
        print "\e[".($_->{y}-1).";$_->{x}H \e[$_->{y};$_->{x}H$m\e[1;1H";$_->{y}++;
        shift(@snows) if $_->{y} > $y
    }
    print q{
                _.--"""-,
                .'         `\
               /             \
               |  /.-.--.-.--.)
               .\|(_._.__._.__)
              (   )   0 _ 0   \
     \  /_     `-|     (_)     |       _\  /
     \\/       /`|             |`\       \//
   '-.\\ \/   |  \   \     /   /  |   \/ //.-'
     __\\|    \   '.  '._.'  .'   /    |//__
        \\   .-'.   `'-----'`   .'-.   //
         \\.'    '-._        .-'\   './/
         /`          `'''''')    )    `\
        /                  (    (      ,\
       ;                O  /\    '-..-'/ ;
       |                  (  '.       /  |
       |                O  )   `;---'`   |
       ;                  /__.-'         ;
        \               O `             /  
         `.                           .'
           '-._                   _.-'
               `"  '  - - -  ' "``

    
    };
    sleep(0.1);
}



