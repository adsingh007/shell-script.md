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
| 1 | Publishing google spreadsheet to get the download link | <ol> Steps To Be Followed <li>Publishd my sheet to the web </li><li>selected embed format as a CSV</li><li>Now Start Publishing and copy the link </li></ol> | Shoud get desired link in CSV format | Got the link successfully | Pass |

| 2 | Declare variable into the script so that it can work for any user or form any path |  WGET="/usr/bin/wget" <br> ECHO="/usr/bin/echo" <br> AWK="/usr/bin/awk" <br>  CAT="/usr/bin/cat" | Script should run without any error | All variable passed script run successfully | Pass |

 
 
 
 
 
 
 
 
 
 
