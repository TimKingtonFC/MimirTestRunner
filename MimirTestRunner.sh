#!/bin/bash
wget -q http://cs.franklin.edu/~whittakt/MimirTests/hamcrest-core-1.3.jar
wget -q http://cs.franklin.edu/~whittakt/MimirTests/junit-4.13.jar
wget -q http://cs.franklin.edu/~whittakt/MimirTests/MimirTestRunner.java

#export CLASSPATH=.:hamcrest-core-1.3.jar:junit-4.13.jar
export CLASSPATH=.
for filename in *.jar; do
  export CLASSPATH=${CLASSPATH}:${filename}
done

javac ./*.java;

if [ $? -ne 0 ]; then
  echo 0 > OUTPUT
  exit 1
fi

if [ -f "RunMe.class" ]; then
    java RunMe > DEBUG
fi

java MimirTestRunner >> DEBUG

echo "$?" > OUTPUT
