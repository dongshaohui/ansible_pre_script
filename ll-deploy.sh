#!/bin/bash
clear
datestamp=`date +%Y-%m-%d-%H:%M:%S`
function deploy_chinapay_deposit_scheduler()
{   
	cp ./playbooks/config/chinapay_deposit_scheduler/jar/chinapay_deposit_scheduler-standalone.jar /alidata1/backup/chinapay_deposit_scheduler-standalone-$datestamp.jar
	cp /test_p2p_home/playbooks/config/chinapay_deposit_scheduler/jar/chinapay_deposit_scheduler-standalone.jar ./playbooks/config/chinapay_deposit_scheduler/jar/ 
	ansible-playbook -i hosts playbooks/chinapay_deposit_scheduler.yml -e "$(python var.py chinapay_deposit_scheduler)"

}

function deploy_contract_settle_scheduler()
{   
    cp ./playbooks/config/contract_settle_scheduler/jar/contract_settle_scheduler-standalone.jar /alidata1/backup/contract_settle_scheduler-standalone-$datestamp.jar
    cp /test_p2p_home/playbooks/config/contract_settle_scheduler/jar/contract_settle_scheduler-standalone.jar ./playbooks/config/contract_settle_scheduler/jar/ 
    ansible-playbook -i hosts playbooks/contract_settle_scheduler.yml -e "$(python var.py contract_settle_scheduler)"
}

function deploy_chinapay_withdraw_scheduler()
{   cp ./playbooks/config/chinapay_withdraw_scheduler/jar/chinapay_withdraw_scheduler-standalone.jar /alidata1/backup/chinapay_withdraw_scheduler-standalone-$datestamp.jar
    cp /test_p2p_home/playbooks/config/chinapay_withdraw_scheduler/jar/chinapay_withdraw_scheduler-standalone.jar ./playbooks/config/chinapay_withdraw_scheduler/jar/ 
    ansible-playbook -i hosts playbooks/chinapay_withdraw_scheduler.yml -e "$(python var.py chinapay_withdraw_scheduler)"
}

function deploy_chinapay_withdraw()
{   cp ./playbooks/config/chinapay_withdraw/jar/chinapay_withdraw-standalone.jar /alidata1/backup/chinapay_withdraw-standalone-$datestamp.jar
    cp /test_p2p_home/playbooks/config/chinapay_withdraw/jar/chinapay_withdraw-standalone.jar ./playbooks/config/chinapay_withdraw/jar/ 
    ansible-playbook -i hosts playbooks/chinapay_withdraw.yml -e "$(python var.py chinapay_withdraw)"
}

function deploy_ums()
{
   cp ./playbooks/config/ums/jar/ums-standalone.jar /alidata1/backup/ums_standalone-$datestamp.jar
   cp /test_p2p_home/playbooks/config/ums/jar/ums-standalone.jar ./playbooks/config/ums/jar/
   cp  /test_p2p_home/playbooks/config/ums/app/error.properties ./playbooks/config/ums/app/
   #scp root@10.139.105.230:/alidata1/jobs/jiashi_p2p_ums-dev/workspace/modules/mappers/src/main/resources/db/migration/mysql/*.sql ./playbooks/config/ums/sql/
   ansible-playbook -i hosts playbooks/ums.yml -e "$(python var.py ums)"
}

function deploy_midas()
{
   cp ./playbooks/config/midas/jar/midas-standalone.jar /alidata1/backup/midas-standalone-$datestamp.jar
  # scp root@10.139.105.230:/alidata1/jobs/jiashi_p2p_midas-dev/workspace/modules/persistence/src/main/resources/db/migration/mysql/*.sql ./playbooks/config/midas/sql
   cp /test_p2p_home/playbooks/config/midas/jar/midas-standalone.jar ./playbooks/config/midas/jar/
   ansible-playbook -i hosts playbooks/midas.yml -e "$(python var.py midas)"
}

function deploy_lb()
{
    ansible-playbook -i hosts playbooks/lb.yml
    ssh -i /root/.ssh/root 10.139.106.30 "rm -rf /var/cache/nginx/* && ls -lh /var/cache/nginx"
    ssh -i /root/.ssh/root 10.139.107.58 "rm -rf /var/cache/nginx/* && ls -lh /var/cache/nginx"
}

function deploy_front()
{
  cp ./playbooks/config/midas_front/war/midas_front.war /alidata1/backup/midas_front-$datestamp.war
  cp /test_p2p_home/playbooks/config/midas_front/war/midas_front.war ./playbooks/config/midas_front/war/
  ansible-playbook -i hosts playbooks/midas_front.yml -e "$(python var.py midas_front)"
}

function deploy_subject_pass_scheduler()
{
  # 判断jar是否存在
  myfile='./playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar'
  if [ -f "$myfile" ];then
  	cp ./playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar /alidata1/backup/subject_pass_scheduler-standalone-$datestamp.jar
  fi
  cp /test_p2p_home/playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar ./playbooks/config/subject_pass_scheduler/jar/
  ansible-playbook -i hosts playbooks/subject_pass_scheduler.yml -e "$(python var.py subject_pass_scheduler)"
  echo "subject pass deploy over!"
}

function deploy_subject_shelf_scheduler()
{
  # 判断jar是否存在
  myfile='./playbooks/config/subject_shelf_scheduler/jar/subject_shelf_scheduler-standalone.jar'
  if [ -f "$myfile" ];then
  	cp ./playbooks/config/subject_shelf_scheduler/jar/subject_shelf_scheduler-standalone.jar /alidata1/backup/subject_shelf_scheduler-standalone-$datestamp.jar
  fi
  cp /test_p2p_home/playbooks/config/subject_shelf_scheduler/jar/subject_shelf_scheduler-standalone.jar ./playbooks/config/subject_shelf_scheduler/jar/
  ansible-playbook -i hosts playbooks/subject_shelf_scheduler.yml -e "$(python var.py subject_shelf_scheduler)"
}

function deploy_midas_admin()
{
  myfile='./playbooks/config/midas_admin/war/midas_admin.war'
  if [ -f "$myfile" ];then
  	cp ./playbooks/config/midas_admin/war/midas_admin.war /alidata1/backup/midas_admin-$datestamp.war
  fi
  cp /test_p2p_home/playbooks/config/midas_admin/war/midas_admin.war ./playbooks/config/midas_admin/war/
  ansible-playbook -i hosts playbooks/midas_admin.yml -e "$(python var.py midas_admin)"
}

# delivery scheduler deploy
function deploy_contract_delivery_scheduler()
{
  myfile='./playbooks/config/contract_delivery_scheduler/jar/contract_delivery_scheduler-standalone.jar'
  if [ -f "$myfile" ];then
  	cp ./playbooks/config/contract_delivery_scheduler/jar/contract_delivery_scheduler-standalone.jar /alidata1/backup/contract_delivery_scheduler-$datestamp-standalone.jar
  fi
  cp /test_p2p_home/playbooks/config/contract_delivery_scheduler/jar/contract_delivery_scheduler-standalone.jar ./playbooks/config/contract_delivery_scheduler/jar/
  ansible-playbook -i hosts playbooks/contract_delivery_scheduler.yml -e "$(python var.py contract_delivery_scheduler)"
}

function deploy_voucher_expire_scheduler()
{
cp ./playbooks/config/voucher_expire_scheduler/jar/voucher_expire_scheduler-standalone.jar  /alidata1/backup/voucher_expire_scheduler-standalone.jar.$datestamp
cp  /test_p2p_home/playbooks/config/voucher_expire_scheduler/jar/voucher_expire_scheduler-standalone.jar ./playbooks/config/voucher_expire_scheduler/jar/
ansible-playbook -i hosts playbooks/voucher_expire_scheduler.yml -e "$(python var.py voucher_expire_scheduler)"
}

function deploy_sms_scheduler()
{
scp -r /test_p2p_home/playbooks/config/sms_scheduler/app/sms-template.properties  ./playbooks/config/sms_scheduler/app/

scp -r /test_p2p_home/playbooks/config/sms_scheduler/jar/sms_scheduler-standalone.jar  ./playbooks/config/sms_scheduler/jar/

ansible-playbook -i hosts playbooks/sms_scheduler.yml -e "$(python var.py sms_scheduler)"

}
case "$1" in 
    "deployall" )
    deploy_ums;
	deploy_midas;
	deploy_midas_admin;
    deploy_front;
	deploy_subject_shelf_scheduler;
	deploy_subject_pass_scheduler;
	deploy_contract_settle_scheduler
    deploy_contract_delivery_scheduler;
	deploy_chinapay_deposit_scheduler;
	deploy_chinapay_withdraw_scheduler;
	deploy_chinapay_withdraw;
	deploy_lb;
    ;;
    "deploy_backend" )
    	deploy_ums;
	deploy_midas;
	deploy_midas_admin;
    	deploy_front;
	deploy_lb;
    ;;
    "deployall_scheduler" )
    	deploy_subject_shelf_scheduler;
	deploy_subject_pass_scheduler;
    ;;
    "ums" )
	deploy_ums;
    ;;
    "midas" )
    	deploy_midas;
		 deploy_subject_shelf_scheduler;
		 deploy_subject_pass_scheduler;
		 deploy_contract_settle_scheduler;
		 deploy_contract_delivery_scheduler;
    ;;
    "front" )
    	deploy_front;
    ;;
    "subject_shelf_scheduler" )
    	deploy_subject_shelf_scheduler;
    ;;
    "subject_pass_scheduler" )
	deploy_subject_pass_scheduler;
    ;;
    "midas_admin" )
 	deploy_midas_admin;
    ;;
    "lb" )
    	deploy_lb;
    ;;
    "contract_delivery_scheduler" )
    	deploy_contract_delivery_scheduler;
    ;;
	"chinapay_deposit_scheduler" )
	deploy_chinapay_deposit_scheduler;
	;;
	"chinapay_withdraw_scheduler")
	deploy_chinapay_withdraw_scheduler;
	;;
	"chinapay_withdraw")
	deploy_chinapay_withdraw;
	;;
	"contract_settle_scheduler")
	deploy_contract_settle_scheduler;
	;;
	"voucher")
	deploy_voucher_expire_scheduler;
	;;
	"sms")
	deploy_sms_scheduler;
	;;

esac

