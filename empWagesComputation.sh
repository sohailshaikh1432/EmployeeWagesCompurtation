#!/bin/bash -x

#CONSTATNT
IS_PART_TIME=1
IS_FULL_TIME=2
MAX_HOUR_IN_MONTH=100
EMP_RATE_PER_HOUR=20
NUM_WORKING_DAYS=20

#VARIABLES
totalWorkHours=0
totalWorkingDays=0

function getWorkingHours() {
        case $1 in
                $IS_PART_TIME)
                        workingHours=4
                        ;;
                $IS_FULL_TIME)
                        workingHours=8
                        ;;
                *)
                        workingHours=0
                        ;;
        esac
        echo $workingHours
}

while [[ $totalWorkHours -lt $MAX_HOUR_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]

do
        ((totalWorkingDays++))
        workHours="$( getWorkingHours $(( RANDOM%3 )) )"
        totalWorkHours=$(( $totalWorkHours+$workHours ))

done
totalSalary=$(($totalWorkHours*$EMP_RATE_PER_HOUR))
