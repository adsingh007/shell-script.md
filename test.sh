#!/bin/bash

direct="`/usr/bin/pwd`"
source $direct/config.cfg

function  testing() 

{ if [[ $? -ne 0 ]];                                                                    #HERE FUCTIONS IS USED TO CHECK THE WORKING OF COMMANDS IF 
        then                                                                            #ANY COMMAND GOT ANY ERROR OR SOMETHING THE FUNTION WILL 
  $ECHO "Test Fail"                                                       #STOP THE SCRIPT IMMEDIATELY AND AFTER THAT THE LOG 
                                                                                 #FOR THAT PERTICULAR COMMAND WILL BE SAVED IN
else                                                                      #LOG FILE

	$ECHO "Test Pass"

fi }




$MKDIR -p $FETCH

#$CP -r $DIR/data* $FETCH

$WGET -q "$LINK_FOR_SHEET_1" -O "$FETCH/sample_1.csv"

namecount1=$($CAT "$FETCH/sample_1.csv" |$GREP -i Name |$AWK -F"Intern Name" '{print $1}' |$TR -cd ,|$WC -c)         # COLUMN ON SHEET ONE.
avgcount1=$($CAT "$FETCH/sample_1.csv" |$GREP -i Average |$AWK -F"Average" '{print $1}' |$TR -cd ,|$WC -c)           #*GREP -i IS USED FOR IGNORE CASE
value1=1                                                                                                         #*AWK -F IS USED FOR FIELD SEPARATER           
finalName1=$((namecount1+value1))                                                                                #*TR -CD IS USED TO DELETE ALL CHARACTER EXCEPT COMMAS
finalAvg1=$((avgcount1+value1))                                                                                  #*WC -C IS USED TO COUNT COMMAS
finalSum1=$((avgcount1-finalName1))


$AWK -v "column1=$finalName1" -v "sumcolumn=$finalSum1" -v "line_start=$FIRSTLINE" -v "line_end=$LASTLINE" 'BEGIN{print "#####EXECUTING SHEET SELF EVALUATION AND OTHER TEAM MEMBERS EVALUATION #####"} {FS=","} NR==line_start ,NR==line_end {print "INTERN NAME :"$column1"\n","TOTAL SUM :"$NF*sumcolumn"\n","TOTAL AVERAGE:"$NF"\n","************************" }' "$FETCH/sample_1.csv">"$FETCH/outsmpl_1.csv"

$ECHO "Testing Generated File Output form"
$DIFF $DIR/output_1.csv $FETCH/outsmpl_1.csv

testing
$ECHO

$ECHO "Re-run the script & press enter to check next test"
read 

$ECHO "Testing if column add in sheet"
$DIFF $DIR/output_1.csv $FETCH/outsmpl_1.csv

testing
$ECHO

$ECHO "Re-run the script & press enter to check next test"
read 

$ECHO "Testing if column delete in sheet"
$DIFF $DIR/output_1.csv $FETCH/outsmpl_1.csv

testing
$ECHO





