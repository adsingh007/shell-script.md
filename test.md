  # OBJECTIVE
  
   **To create a TestScript to analyse reliability of the Evaluation script .**
  
  # SUMMARY OF EVALUATION SCRIPT WHICH WILL BE TESTED
  
 **Create a script to download both CSV file (Self/ others Evaluation & MD Evaluation) Two output files should be saved as desired 3 contents(Name,Sum & Average). The output should appear for the both files are followed.**
  - Intern Name :-
  - Sum:-
  - Average:-

# UNDERSTANDING
**To create a new script which will test the previous script according to different test cases,So that we can test the reliability of our script.The script will test the script form every parameter as per test cases.the final result will shown as pass or fail.**

# CHECK PARAMETERS

|Sno|Checkpoints|Condition|
   |:----:|:----:|:----:|
   |1|To Check script is running form another computer or not|Pass or Fail|
   |2|To Check if the two downloaded files are in CSV format or not| Pass or Fail|
   |3|To verify the Generated output is in the desired name, product and sum or not|Pass or fail|
   |4|If adding the Extra columns or rows will make the script to run and generate desired output|Pass or Fail|
   |5|If Config file is linked to the Script and logs are generated for the script|Pass or Fail|

# IMPLIMENTATION
>To check all test parameters we have to create a new test script. In the first step we have downloaded the google sheet & added some content from previos evaluation script so that the test script can generate same kind of data formate to test or compair the output of both scripts. After that the generated output data will store in Result data named folder. Now after that we will compair Script data file and Test data file using **diff** command.

# CONCLUTION
We have successfully test the output of evaluation script.
