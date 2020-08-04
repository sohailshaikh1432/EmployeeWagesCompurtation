#!/bin/bash -x

isPartTime=1
isFullTime=2
randomCheck=$(( RANDOM%3 ))
ratePerHour=160

case $randomCheck in
        $isPartTime) empHour=4
        ;;
        $isFullTime) empHour=8
        ;;
        *) empHour=0
        ;;
esac

empWages=$(( $ratePerHour*$empHour))
