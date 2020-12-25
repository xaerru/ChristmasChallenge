# Day 5
# You can't have Christmas without a tree!
#
# Challenge :
# Write a program that prints an ascii Christmas tree to the console - up to you what it looks like! The user must be prompted to enter the height of the tree.

# Language -> Perl

print q{What should be the height of your Christmas tree?
};
($x=4**$_)=~y/1-9/"/,printf"%22s%s\n",($x)x2for 1..<>,0,0
# Height between 10 and 20 is preferred
