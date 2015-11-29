#!/bin/bash

function sms_scheduler(){
ssh 10.253.1.140 "cd /etc/init.d/ ; ./$1 $2 "
}
function yeepay_withdraw_scheduler(){
ssh 10.253.1.140 "cd /etc/init.d/ ; ./$1 $2 "
}
function chinapay_deposit_scheduler(){
ssh 10.253.16.37 "cd /etc/init.d/ ; ./$1 $2 "
}
function chinapay_withdraw_scheduler(){
ssh 10.253.1.140 "cd /etc/init.d/ ; ./$1 $2"
}
function contract_settle_scheduler(){
ssh 10.139.110.69 "cd /etc/init.d/ ;./$1 $2 "
}
function contract_delivery_scheduler(){
ssh 10.139.96.97 "cd /etc/init.d/ ;./$1 $2 "
}
function subject_pass_scheduler(){
ssh 10.139.110.69 "cd /etc/init.d/ ; ./$1 $2 "
}
function subject_shelf_scheduler(){
ssh 10.139.96.97 "cd /etc/init.d/ ; ./$1 $2"
}

if [ $# == 2  ] 
then
$1 $1 $2
elif [  $# == 0 ]
then 
echo -e "USAGE:\n 
		\t argb-1=..
		\t sms_scheduler
		\t yeepay_withdraw_scheduler 
		\t chinapay_deposit_scheduler 
		\t chinapay_withdraw_scheduler 
		\t contract_settle_scheduler
		\t contract_delivery_scheduler
		\t subject_pass_scheduler
		\t subject_shelf_scheduler

		\t argv 2:stop /start /restart /status
		\n"
fi


#case "$1" in
#esac
