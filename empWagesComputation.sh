#!/bin/bash -x
#Constatnt
IS_PART_TIME=1
IS_FULL_TIME=2
RATE_PER_HOUR=125
NUMBER_OF_WORKING_DAY=2
MAX_HOURS=10
#Variable
totalEmpHour=0
totalWorkingDays=0

function getDailyWages(){
        local empHrs=$1
        empSalary=$(( $empHrs*$RATE_PER_HOUR ))
        echo $empSalary
}
function getEmpHours(){
        case $empCheck in
                $IS_PART_TIME)
                empHour=4
                ;;
                $IS_FULL_TIME)
                empHour=8
                ;;
                *)
                empHour=0
                ;;
                esac
                echo $empHour
}

while [[ $totalEmpHour -le $MAX_HOURS && $totalWorkingDays -le $NUMBER_OF_WORKING_DAY ]]
do
((totalWorkingDays++))
empCheck=$(( RANDOM%3 ));

empHour="$( getEmpHours $empCheck)"
totalEmpHour=$(( $totalEmpHour + $empHour ))
dailyWages[totalWorkingDays]="$( getDailyWages $empHour )"
totalSalary="$( getDailyWages $totalEmpHour)"
done
echo ${dailyWages[@]}
