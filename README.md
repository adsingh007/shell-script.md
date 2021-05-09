#  Assignment Objective.

Create a script to download both CSV file (Self/ others Evaluation & MD Evaluation) 
Two output files should be saved as desired 3 contents(Name,Sum & Average).
The output should appear for the both files are followed.
- Person name:-
- Sum:-
- Average:-

## Implimentaion.
>First step i have web published my goodle spread sheet so that i can get a static link to download the sheet in CSV format. Then with the help of **WGET** command i download the sheet into my system but it is not in a desired format so i have used **AWK** command to manipulated data to get output data in desired format.All these commands are wrote in **bin/bash** script and all the input data to be written in configuration file .so that we can do all these work in a single command.  


## Test Case

 <details>
  
 |**SNo.** | **Test Case Description** |**Test Steps** | **Expected Result** | **Actual Result** | **Status** |
|:-----: | :-----: | :------: | :-----: | :-----: | :-----: |
| TEST 1 | Publishing google spreadsheet to get the download link | <ul> Steps To Be Followed <li>Publishd my sheet to the web </li><li>selected embed format as a CSV</li><li>Now Start Publishing and copy the link </li></ul> | Shoud get desired link in CSV format | Got the link successfully | Pass |
| TEST 2 | Declare variable into the config file so that the script can get data from config file and work from any path and system | <ul><li>Declaired config file path into script</li><li> Declaired all variables into config file</li></ul> | Script should run without any error | All variable passed script run successfully | Pass |
| TEST 3 | Dowlnload both file using **wget** command | The command will run two time to download both files.<br/>$WGET -nv "URL" -O "data.csv" | Acknowledgement of file download shoud be displayed | Fle downloaded message display | Pass |
| TEST 4|Script should get the column no. automatically | using CAT,AWK,TR,WC commands to get column no. of required data field.|Script automatically calculate the column number using the column name|Column number for Name and Average it is calculated automatically |pass|
| TEST 5 | Manipulating and save the data as per user requirement | Using **awk** command to manipulate data.& using different options NR ,FS<br/>NR is used to select range to be display and FS is useed to separated comma separated fields| Fileds shoud be seprated by ","<br/> All team member names should be displayed<br/> The Sum value automatic calculated.<br/>average filed should be displayed<br/>All data should also save as per user desired criteria | All data displayed and stored as expected | Pass |
| TEST 6 | Storing and Displaying the data | After manipulating data the data will display using **CAT** command and store in output data into the file using redirectional operator " > "| The output data should displayed and stored | Task done successfully | Pass |
</details>

## Test Case References
<details>
 
 | **S No** | **Description** | **TesT Snaps** |
 | :-----: | :----: | :----: | :----: |
 </details>
 
## Test result
<br/>

Test result of script is shown as below.
<details>
<img src="https://github.com/adsingh007/shell-script.md/blob/main/result.png" alt="Test result">
</details>

 
 ## Conclution
 
 I have tested that the script is working and generating output as desired .
 
 
 
 
 
 
 
 
