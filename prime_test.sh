#!/bin/bash

#test preparation
echo "input_1_argument" > /tmp/$$-arg         #preparation:number of arguments
echo "input_natural_number" > /tmp/$$-natu    #preparation:natural number
echo "input_2_or_more_number" > /tmp/$$-num   #preparation:input number
echo "prime_number" > /tmp/$$-pri             #preparation:prime number
echo "not_prime_number" > /tmp/$$-not         #preparation:not prime number

#test start
#test1:argument shotage
./prime.sh > /tmp/$$-ans && exit 1            #success:error
diff /tmp/$$-ans /tmp/$$-arg || exit 1        #different message:eorror

#test2:not natural number
./prime.sh a > /tmp/$$-ans && exit 1          #success:error
diff /tmp/$$-ans /tmp/$$-natu || 1            #different message:error

#test3:not 2 or more number
./prime.sh 1 > /tmp/$$-ans && exit 1          #success:error
diff /tmp/$$-ans /tmp/$$-num || exit 1        #different message:error

#test4_1:2 is prime number
./prime.sh 2 > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-pri || exit 1        #different message:error

#test4_2:3 is prime number
./prime.sh 3 > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-pri || exit 1        #different message:error

#test5:prime number check
while read COL1
do
./prime.sh $COL1 > /tmp/$$-ans
if [ $(cat /tmp/$$-ans) != $(cat /tmp/$$-pri) ]; then
 echo "NG"
 exit 1                                       #different message:error
fi
done < prime_file

#test6:not prime number check
while read COL1
do
./prime.sh $COL1 > /tmp/$$-ans
if [ $(cat /tmp/$$-ans) != $(cat /tmp/$$-not) ]; then
 echo "NG"
 exit 1                                       #different message:error
fi
done < notprime_file

rm -f /tmp/$$-*                               #clearnup
