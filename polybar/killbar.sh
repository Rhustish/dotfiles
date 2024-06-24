# kill script is updated to Version 2.0 with the help of pietryszak(github) idea
# script by phon31x & pietryszak
#! /bin/bash

kill $(ps aux | grep tray | awk '{print $2}')
