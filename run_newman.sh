
#!/bin/bash
#exec > logfile.txt

echo "script to call Postman Collections"

#### CONSTANTS ####

#Global path
pathscenarios=APITestSuite
pathMain=/Users/karlin.kappala/Documents

timestamp=$(date +"%s")

#Global Environment path
global=globals.postman_globals.json

# Json Collection File path

GoogleCollection=Slalom_Postman_Projects.postman_collection.json

#Environment path json files

envTest=GoogleTestEnv.postman_environment.json

# make directory to store the output files

DATE_DIR=$(date +%d_%m_%Y)
mkdir -p "target/test-reports"

# create separate output for each files for each run

testOutputhtml=target/test-reports/OutPutAPIhtmlReport$timestamp.html
testOutputjson=target/test-reports/OutPutAPIjsonReport$timestamp.json
testOutputxml=target/test-reports/OutPutAPIxmlReport$timestamp.xml
testOutputjunit=target/test-reports/OutPutAPIxmlReport$timestamp.junit


# read user input
# read choice
# bash nested if/else

if [ "$1" = "CI" ] ; then
echo "you have chosen environment CI"
echo "script in CI begin execution"

command = "$(newman run $GoogleCollection -e $envTest --reporters cli,junit,html --reporter-html-export $testOutputhtml)"

echo "running: $command"

command = "$(newman run $GoogleCollection -e $envTest --reporters cli,junit,html --reporter-junit-export $testOutputjunit)"
echo "running: $command"


echo "Script in CI begin executing Google API scenarios"
echo "Script will take 2 to 3 mins to complete"

# sleep for 1 sec
sleep 1

else

  if [ "$1" = "STAGING" ] ; then

    echo "enter the code to run the collection in stanging environment"

  else

    echo "Please make a valid choice"
    echo "Usage of this script for CI is .\run_newman.sh CI"

    exit 1
fi
fi

echo "Completed Script"

# do not forget to give chmod 777 permissions to this script
