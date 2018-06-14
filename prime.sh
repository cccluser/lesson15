#!/bin/bash

if [ $# -ne 1 ]; then                #number of arguments is 1
 echo "input_1_argument"
 exit 1
fi

expr $1 + $1 > /dev/null 2>&1        #input natural number
if [ $? -ge 2 ]; then
 echo "input_natural_number"
 exit 1
fi

if [ $1 -eq 1 ]; then                #input 2 or more number
 echo "input_2_or_more_number"
 exit 1
fi

if [ $1 -eq 2 -o $1 -eq 3 ]; then    #2&3 is prime number
 echo "prime_number"
 exit 0
fi

a=$(($1 % 2))                        #even number is not prime number
if [ $a -eq 0 ];then
 echo "not_prime_number"
 exit 0
fi

for ((i=3; i<$1; i=i+2))             #prime number check
do
 b=$(($1 % $i))                      #if it can not be devided it is prime number
 if [ $b -eq 0 ]; then
 echo "not_prime_number"
 exit 0
fi
done

echo "prime_number"
