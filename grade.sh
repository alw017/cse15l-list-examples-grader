CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ ! -f ./student-submission/ListExamples.java ]] # looks for ListExamples.java in student-submission
then 
	echo "file not found, grade is 0"
	exit
fi

cp -r student-submission grading-area
cp TestListExamples.java grading-area/student-submission

# path to folder ~/bash-scripts/cse15l-list-examples-grader/grading-area

javac -cp $CPATH grading-area/student-submission/*.java
if [[ $? -ne 0 ]]
then
	echo "Compile Error! grade is 0"
	exit
fi

# output=`java -cp '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar:grading-area/student-submission' org.junit.runner.JUnitCore TestListExamples` 
java -cp '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar:grading-area/student-submission' org.junit.runner.JUnitCore TestListExamples
# echo $output


