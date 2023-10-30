#!/bin/bash
cd ~
cd sites/ran/bre01-ran-j11/ex_shell/
mkdir exercice5
cd exercice5
mkdir marvel && mkdir dc
cd marvel
touch iron_man.txt && touch captain_america.txt
echo "Tony Stark" >> iron_man.txt
echo "Steve Rogers" >> captain_america.txt
cd ..
cd dc
touch batman.txt && touch superman.txt
echo "Clark Kent" >> superman.txt
echo "Bruce Wayne" >> batman.txt