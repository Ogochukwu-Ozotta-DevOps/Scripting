#!/bin/bash
#
#Author: Ogochukwu Ozotta
#Date created: August 23, 2022
#lastly updated: August 23, 2022
#Purpose: To backup the home directory
#
*******************************MAIN SCRIPT************************
file=backup_home_$(date +%m%d%Y_%H:%M:%S).tar
#
echo "Archiving your home directory of ogoch......."
tar -cvf /home/archive/$file /home/ogoch
echo $?
