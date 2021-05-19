  # Objective
  
   To create a TestScript to analyse reliability of the Evaluation script .
  
  # Summary Of Evaluation Script Which Will Be Tested.
  
 Create a script to download both CSV file (Self/ others Evaluation & MD Evaluation) Two output files should be saved as desired 3 contents(Name,Sum & Average). The output should appear for the both files are followed.
  - Intern Name :-
  - Sum:-
  - Average:-

# Understanding
To create a new script which will test the previous script according to different test cases,So that we can test the reliability of our script.The script will test the script form every parameter as per test cases.the final result will shown as pass or fail.

# Check Parameters

|Sno|Checkpoints|Condition|
   |:----:|:----:|:----:|
   |1|To Check script is running form another computer or not|Pass or Fail|
   |2|To Check if the two downloaded files are in CSV format or not| Pass or Fail|
   |3|To verify the Generated output is in the desired name, product and sum or not|Pass or fail|
   |4|If adding the Extra columns or rows will make the script to run and generate desired output|Pass or Fail|
   |5|If Config file is linked to the Script and logs are generated for the script|Pass or Fail|

# Implimentation
>To check all test parameters we have to create a new test script. In the first step we have downloaded the google sheet & added some content from previos evaluation script so that the test script can generate same kind of data formate to test or compair the output of both scripts. After that the generated output data will store in Result data named folder. Now after that we will compair Script data file and Test data file using **diff** command.


# Test Cases

<details>

  |Sno|Task|Test steps|Expected output|Actual Result|Status|
   |:----:|:----:|:----:|:----:|:----:|:----:|
| TEST1 | Declare variable into the config file so that the script can get data from config file and work from any path and system | <ul> <li>Declaired config file path into script</li><li> Declaired all variables into config file</li></ul> | Script should run without any error | All variable passed script run successfully | Pass |
| TEST 2 | Dowlnload both file using **wget** command | The command will run two time to download both files.<br/>$WGET -nv "URL" -O "data.csv" | Acknowledgement of file download shoud be displayed | Fle downloaded message display | Pass |
| TEST 3| Script should get the column no. automatically | using CAT,AWK,TR,WC commands to get column no. of required data field.|Script automatically calculate the column number using the column name|Column number for Name and Average it is calculated automatically |pass|
| TEST 4 | Manipulating and save the data as per user requirement | Using **awk** command to manipulate data.& using different options NR ,FS<br/>NR is used to select range to be display and FS is useed to separated comma separated fields| Fileds shoud be seprated by ","<br/> All team member names should be displayed<br/> The Sum value automatic calculated.<br/>average filed should be displayed<br/>All data should also save as per user desired criteria | All data displayed and stored as expected | Pass |
|TEST 5| Compair test script output with evaluation sheet output.|Using **diff** command to compair both file to get test result|Result should show in TEST PASS or TEST FAIL output|Output result shown as expected|Pass|
</details>

# Conclution

We have successfully test the output of evaluation script.
