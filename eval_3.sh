#!/bin/bash
DIRECT="`/usr/bin/pwd`"
source $DIRECT/evaluation.cfg

##################################################################################################################################
########################################################  EVALUATION SCRIPT  #####################################################
##################################################################################################################################
function  checkCMD() 
{ if [[ $? -ne 0 ]];									#HERE FUCTIONS IS USED TO CHECK THE WORKING OF COMMANDS IF 
	then 										#ANY COMMAND GOT ANY ERROR OR SOMETHING THE FUNTION WILL 
  $ECHO "COMMAND ERROR $1" >>$LOG							#STOP THE SCRIPT IMMEDIATELY AND AFTER THAT THE LOG 
 exit 1											#FOR THAT PERTICULAR COMMAND WILL BE SAVED IN
else $ECHO $DATE $1									#LOG FILE

fi }
#############################################################################################################################

$ECHO "$DATE""CREATING DIRECTORY">>$LOG
$MKDIR -p $DIR										##TO MAKE A DIRECTORY FOR DATA STORAGE
 
											##HERE IF COMMAND IS USED TO CHECK COMMAND WORKING 
checkCMD							     			##OR NOT & TO GENERATE LOG FOR THE THE SAME
$ECHO "$DATE""DIRECTORY CREATED SUCCESSFULLY">>$LOG

####################################################################
###################################################################
        ##### DOWNLOADING BOTH SHEET ONE AND TWO#####
###################################################################

$ECHO "$DATE" "DOWNLOADING" "$SHEET_1" >> $LOG						 ###ACKOWLEDGEMENT ABOUT COMMAND GOING TO DOWNLOAD THE
											 ###FILE
				
$WGET -nv "$LINK_FOR_SHEET_1" -O "$DIR/data_1.csv"			   		 ###HERE THE FILE IS DOWNLOAD BY THE LINK WHICH IS
							     	  			 ###INSERTED BY USER INTO CONFIG FILE 
checkCMD					       					 ###FILE WILL BE DOWNLOADED WITH THE HELP OF WGET COMMAND AND -nv IS USED FOR 
$ECHO $DATE "$SHEET_1""DOWNLOADED SUCCESSFULLY" >>$LOG					 ###MINIMIZE THE DOWNLOADING PROSESS
											 ###CHECKING THE COMMAND STATUS AND GENERATION LOGS

####################################################################
####################################################################

$ECHO "$DATE" "DOWNLOADING" "$SHEET_2" >>$LOG		       			 	 ###ACKNOWLEDGMENT ABOUT THE 2ND SHEET GOING TO DOWNLOAD

$WGET -nv "$LINK_FOR_SHEET_2" -O "$DIR/data_2.csv"					 ###HERE THE FILE IS DOWNLOAD BY THE LINK: WHICH IS
                                                                			 ###INSERTED BY USER INTO CONFIG FILE & THE DOWNLOADING PROCESS IS SAME AS ABOVE
checkCMD                                           		                 	 ###CHECKING THE COMMAND STATUS AND GENERATION LOGS
$ECHO $DATE "$SHEET_2""DOWNLOADED SUCCESSFULLY" >>$LOG


#######################################################################
#######################################################################
		####NOW EXECUTING SHEET ONE USING AWK COMMAND########


$ECHO "$DATE" "$SHEET_1" >>$LOG					##ACKNOWLEDGMENT ABOUT SHEET ONE IS GOING TO
								##EXCECUTE
												 	   	 # USING AKW , GREP ,TR & WC COMMANDS TO FIND 
													  	 # EXACT POSITION OF THE INTERN NAME
namecount1=$($CAT "$DIR/data_1.csv" |$GREP -i Name |$AWK -F"Intern Name" '{print $1}' |$TR -cd ,|$WC -c)	 # COLUMN ON SHEET ONE.
avgcount1=$($CAT "$DIR/data_1.csv" |$GREP -i Average |$AWK -F"Average" '{print $1}' |$TR -cd ,|$WC -c)		 #*GREP -i IS USED FOR IGNORE CASE
value1=1										    			 #*AWK -F IS USED FOR FIELD SEPARATER		
finalName1=$((namecount1+value1))								   		 #*TR -CD IS USED TO DELETE ALL CHARACTER EXCEPT COMMAS
finalAvg1=$((avgcount1+value1))											 #*WC -C IS USED TO COUNT COMMAS
finalSum1=$((avgcount1-finalName1))


$AWK -v "column1=$finalName1" -v "sumcolumn=$finalSum1" -v "line_start=$FIRSTLINE" -v "line_end=$LASTLINE" 'BEGIN{print "#####EXECUTING SHEET SELF EVALUATION AND OTHER TEAM MEMBERS EVALUATION #####"} {FS=","} NR==line_start ,NR==line_end {print "INTERN NAME :"$column1"\n","TOTAL SUM :"$NF*sumcolumn"\n","TOTAL AVERAGE:"$NF"\n","************************" }' "$DIR/data_1.csv">"$DIR/output_1.csv"

$CAT "$DIR/output_1.csv"
														##USING AWK COMMAND TO MANIPULATE DATA TO GET DESIRE
														##OUTPUT USING MULTIPLE VARIABLES
            		                        					                        ###CHECKING THE COMMAND STATUS AND GENERATION LOGS 

checkCMD
$ECHO "$DATE""$SHEET_1""RUN SUCCESSFULLY" >>$LOG			 					###ACKNOWLEDGEMENT OF COMMMAND RUN



################################################################################################################
################################################################################################################
   		####NOW EXECUTING SHEET TWO USING AWK COMMAND#########
$ECHO "$DATE" "$SHEET_2" >>$LOG											##ACKNOWLEDGMENT ABOUT SHEET TWO IS GOING TO
								  						##EXCECUTE

														 #USING AKW & GREP COMMAND TO FIND
namecount2=$($CAT "$DIR/data_2.csv"|$GREP -i Name|$AWK -F"Intern Name" '{print $1}'|$TR -cd , |$WC -c) 		 #EXACT POSITION OF THE INTERN NAME
avgcount2=$($CAT "$DIR/data_2.csv"|$GREP -i Average|$AWK -F"Average" '{print $1}'|$TR -cd , |$WC -c)
value2=1													 #COLUMN ON SHEET TWO.
finalName2=$((namecount2+value2))										 #
finalAvg2=$((avgcount2+value2))
finalSum2=$((avgcount2-finalName2))

$AWK -v "namecolumn=$finalName2" -v "sumcolumn2=$finalSum2" -v "line_start=$FIRSTLINE2" -v "line_end=$LASTLINE2" ' BEGIN{print "##########EXECUTING SHEET CREATION OF MD FILE BASED OF SELF & TEAM MEMBERS EVALUATION########"} {FS=","} NR==line_start,NR==line_end {print "INTERN NAME :"$namecolumn"\n","TOTAL SUM :"$NF*sumcolumn2"\n","TOTAL AVERAGE:"$NF"\n","************************" }' "$DIR/data_2.csv">"$DIR/output_2.csv"

$CAT "$DIR/output_2.csv"	
														 ##USING AWK COMMAND TO MANIPULATE DATA TO GET DESIRE
	                                                                					 ##OUTPUT USING MULTIPLE VARIABLES

          		                                                					 ###CHECKING THE COMMAND STATUS AND GENERATING LOGS
checkCMD
$ECHO "$DATE" "$SHEET_1""RUN SUCCESSFULLY" >>$LOG   	              					         ###ACKNOWLEDGEMENT OF COMMMAND RUN SUCCESSFULLY				

$ECHO "###############################################################################################################
########################    SCRIPT RUN SUCCESSFULLY  ###########################################
###############################################################################################################"
### NOTE:- IF ANY ERROR COMES SCRIPT CAN SHOW WRONG OUTPUT OR SHOW SOME ERROR ######################################################################################
