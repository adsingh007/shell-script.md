#  Assignment Objective.

Create a script to download both CSV file (Self/ others Evaluation & MD Evaluation) 
Two output files should be saved as desired 3 contents(Name,Sum & Average).
The output should appear for the both files are followed.
- Person name:-
- Sum:-
- Average:-

## Implimentaion.
>First im publishing my google spreadsheed to the public in the form of CSV format then after that the public link will be genrated.Now with the help of that link i'll direcly download the file into my system using **Wget** ,After that i'am using **awk** command to manipulate data to get desired output.All these commands are wrote in **bin/bash** script so that we can do all these work in a single command.  


## Test Case

 <details>
  
|**SNo.** | **Test Case Description** |**Test Steps** | **Expected Result** | **Actual Result** | **Status** |
|:-----: | :-----: | :------: | :-----: | :-----: | :-----: |
| 1 | Publishing google spreadsheet to get the download link | <ul> Steps To Be Followed <li>Publishd my sheet to the web </li><li>selected embed format as a CSV</li><li>Now Start Publishing and copy the link </li></ul> | Shoud get desired link in CSV format | Got the link successfully | Pass |
| 2 | Declare variable into the script so that it can work for any user or form any path | <ul><li> WGET="/usr/bin/wget"</li><li>ECHO=/usr/bin/echo </li><li> AWK=/usr/bin/awk </li><li> CAT=/usr/bin/cat</li></ul> | Script should run without any error | All variable passed script run successfully | Pass |
| 3 | Dowlnload both file using **wget** command | The command will run two time to download both files.<br/>$WGET -nv "https://docs.google.com/spreadsheets/d/DOCID/export?format=csv" -O "data2.csv" | Acknowledgement of file download shoud be displayed | Fle downloaded message display | Pass |
| 4 | Manipulating and save the data as per user requirement | Using **awk** command to manipulate data.<br/>using different arguments like NR ,FS<br/> $AWK '{FS=","}  NR==4, NR==24 {print NR ")","NAME : "$2,"\n", "SUM : ",$11*8 ,"\n" , "AVG : "$11 , "\n", "=====================" }' data1.csv >result.txt | *- Fileds shoud be seprated by","<br/>*- All team member names should be displayed<br/>*- The Sum value automatic calculated using multipication 8 on average filed <br/>average filed should be display<br/>*-All data should also save as per user desired criteria | All data displayed and stored as expected | Pass |
| 5 | Storing and Displaying the data | After manipulating data the awk comman will save the output file at the directory<br/>after that we using pipe to run **CAT** command to dispaly the output.eg.<br/>$AWK '{evalution}' data2.csv > result2.txt `|`$CAT result2 | The output data displayed and stored successfully | Pass |


 
 
 
 
 
 
 
 
 
 
