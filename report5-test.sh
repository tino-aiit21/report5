#!/bin/bash

# tmp
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

#1 変数の数
## 0
echo "input 2 argments" > ${ans}
./report5.sh > ${result}
diff ${ans} ${result} || echo "error in 1-0" >> ${err}

## 1
echo "input 2 argments" > ${ans}
./report5.sh 300 > ${result}
diff ${ans} ${result} || echo "error in 1-1" >> ${err}

## 2

## 3
echo "input 2 argments" > ${ans}
./report5.sh 300 400 500 > ${result}
diff ${ans} ${result} || echo "error in 1-3" >> ${err}

#2 変数
##1 文字1
echo "input natural number" > ${ans}
./report5.sh a 100 > ${result}
diff ${ans} ${result} || echo "error in 2-1" >> ${err}

##2 文字2
echo "input natural number" > ${ans}
./report5.sh a bc > ${result}
diff ${ans} ${result} || echo "error in 2-2" >> ${err}

##3 少数1
echo "input natural number" > ${ans}
./report5.sh 1.5 100 > ${result}
diff ${ans} ${result} || echo "error in 2-3" >> ${err}

##4 少数2
echo "input natural number" > ${ans}
./report5.sh 1.5 2.5 > ${result}
diff ${ans} ${result} || echo "error in 2-4" >> ${err}

##5 空白0
echo "input natural number" > ${ans}
./report5.sh "" 100 > ${result}
diff ${ans} ${result} || echo "error in 2-5" >> ${err}

##6 空白1
echo "input natural number" > ${ans}
./report5.sh " " 100 > ${result}
diff ${ans} ${result} || echo "error in 2-6" >> ${err}

##7 負1
echo "input positive number" > ${ans}
./report5.sh 100 -200 > ${result}
diff ${ans} ${result} || echo "error in 2-7" >> ${err}

##8 負2
echo "input positive number" > ${ans}
./report5.sh -100 -200 > ${result}
diff ${ans} ${result} || echo "error in 2-8" >> ${err}

#3 出力
##1 630 300
echo 30 > ${ans}
./report5.sh 630 300 > ${result}
diff ${ans} ${result} || echo "error in 3-1" >> ${err}

##2 300 630
echo 30 > ${ans}
./report5.sh 300 630 > ${result}
diff ${ans} ${result} || echo "error in 3-2" >> ${err}

##3 0*1
echo 300 > ${ans}
./report5.sh 0 300 > ${result}
diff ${ans} ${result} || echo "error in 3-3" >> ${err}

##4 0*2
echo 0 > ${ans}
./report5.sh 0 0 > ${result}
diff ${ans} ${result} || echo "error in 3-4" >> ${err}

#Error log
if [ -f ${err} ];
then
    cat ${err}
    rm /tmp/$$-*
    exit 1
else
    echo "succeeded"
fi
