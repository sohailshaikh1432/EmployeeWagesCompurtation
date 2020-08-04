#!/bin/bash -x

isPartTime=1
isFullTime=2

randomCheck=$(( RANDOM%3 ))
empRatePerHour=20

if [ $isFullTime -eq $randomCheck ]
then
        empHours=8
elif [ $isPartTime -eq $randomCheck ]
then
        empHours=4
else
        empHours=0
fi
empWagesPerDay=$(( $empRatePerHour*$empHours ))


