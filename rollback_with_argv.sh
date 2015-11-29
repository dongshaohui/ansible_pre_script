#!/bin/bash
clear
function deploy_ums()
{
   cp `find /alidata1/backup/|grep 'ums_stand'|sort|tail -n 1` ./playbooks/config/ums/jar/ums-standalone.jar 
   ansible-playbook -i hosts playbooks/ums.yml -e "$(python var.py ums)"
}

function deploy_midas()
{
   cp `find /alidata1/backup/|grep 'midas-standalone'|sort|tail -n 1` ./playbooks/config/midas/jar/midas-standalone.jar 
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
  cp `find /alidata1/backup/|grep 'midas_front'|sort|tail -n 1` ./playbooks/config/midas_front/war/midas_front.war 
  ansible-playbook -i hosts playbooks/midas_front.yml -e "$(python var.py midas_front)"
}

function deploy_subject_pass_scheduler()
{
  	cp `find /alidata1/backup/|grep 'subject_pass_scheduler-stand'|sort|tail -n 1` ./playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar 
  ansible-playbook -i hosts playbooks/subject_pass_scheduler.yml -e "$(python var.py subject_pass_scheduler)"
}

function deploy_subject_shelf_scheduler()
{
  	cp `find /alidata1/backup/|grep 'subject_shelf_scheduler-stand'|sort|tail -n 1` ./playbooks/config/subject_shelf_scheduler/jar/subject_shelf_scheduler-standalone.jar 
  ansible-playbook -i hosts playbooks/subject_shelf_scheduler.yml -e "$(python var.py subject_shelf_scheduler)"
}

function deploy_midas_admin()
{
  	cp `find /alidata1/backup/|grep 'midas_admin'|sort|tail -n 1` ./playbooks/config/midas_admin/war/midas_admin.war 
  ansible-playbook -i hosts playbooks/midas_admin.yml -e "$(python var.py midas_admin)"
}

# delivery scheduler deploy
function deploy_contract_delivery_scheduler()
{
  	cp `find /alidata1/backup/|grep 'contract_delivery_scheduler-stand'|sort|tail -n 1` ./playbooks/config/contract_delivery_scheduler/jar/contract_delivery_scheduler-standalone.jar 
  ansible-playbook -i hosts playbooks/contract_delivery_scheduler.yml -e "$(python var.py contract_delivery_scheduler)"
}

case "$1" in 
    "deployall" )
    	deploy_ums;
	deploy_midas;
	deploy_midas_admin;
    	deploy_front;
	deploy_lb;
	deploy_subject_shelf_scheduler;
	deploy_subject_pass_scheduler;
    	deploy_contract_delivery_scheduler;
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
esac

