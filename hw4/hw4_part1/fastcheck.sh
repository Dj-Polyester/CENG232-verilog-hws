#!/bin/bash

echo "Hello $(whoami)"
echo -e "Now please choose what to do and enter the number:\n \e[1m0)\e[0m Clean\n \e[1m1)\e[0m AddParity\n \e[1m2)\e[0m CheckParity\n \e[1m3)\e[0m RAM\n \e[1m4)\e[0m SEC_MEM\n \e[1m5)\e[0m All of them"
read anicevariablename

if [ $anicevariablename -eq 0 ]
then
    rm -rf *.sinantoyazilimas
    echo -e "\e[1;33mCleaned all sinantoyazilimas softwares\e[0m"

elif [ $anicevariablename -eq 1 ]
then
    rm -rf AddParity.sinantoyazilimas
    iverilog -o AddParity.sinantoyazilimas addparity_tb.v lab4_1_copy.v
    echo -e "\n\e[1;33mAddParity control here!\e[0m"
    ./AddParity.sinantoyazilimas

elif [ $anicevariablename -eq 2 ]
then
    rm -rf CheckParity.sinantoyazilimas
    iverilog -o CheckParity.sinantoyazilimas checkparity_tb.v lab4_1_copy.v
    echo -e "\n\e[1;33mCheckParity control here!\e[0m"
    ./CheckParity.sinantoyazilimas

elif [ $anicevariablename -eq 3 ]
then
    rm -rf RAM.sinantoyazilimas
    iverilog -o RAM.sinantoyazilimas ram_tb.v lab4_1_copy.v
    echo -e "\n\e[1;33mRAM control here!\e[0m"
    ./RAM.sinantoyazilimas

elif [ $anicevariablename -eq 5 ]
then
    rm -rf *.sinantoyazilimas
    iverilog -o AddParity.sinantoyazilimas addparity_tb.v lab4_1_copy.v
    iverilog -o CheckParity.sinantoyazilimas checkparity_tb.v lab4_1_copy.v
    iverilog -o RAM.sinantoyazilimas ram_tb.v lab4_1_copy.v
    iverilog -o SEC_MEM.sinantoyazilimas sec_mem_tb.v lab4_1_copy.v

    echo -e "\n\e[1;33mFirst AddParity\e[0m"
    ./AddParity.sinantoyazilimas

    echo -e "\n\e[1;33mSecondly CheckParity\e[0m"
    ./CheckParity.sinantoyazilimas

    echo -e "\n\e[1;33mAnd finally RAM\e[0m"
    ./RAM.sinantoyazilimas

    echo -e "\n\e[1;33mBut there is no real final without SEC_MEM\e[0m"
    ./SEC_MEM.sinantoyazilimas

elif [ $anicevariablename -eq 4 ]
then
    rm -rf SEC_MEM.sinantoyazilimas
    iverilog -o SEC_MEM.sinantoyazilimas sec_mem_tb.v lab4_1_copy.v
    echo -e "\n\e[1;33mSEC_MEM control here!\e[0m"
    ./SEC_MEM.sinantoyazilimas

else
    while true
    do
        echo -e "\e[5;7m\e[41mYou think you are better than me hah"
    done
fi
