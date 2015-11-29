#! /bin/bash
    ansible-playbook -i hosts playbooks/midas.yml -e "$(python var.py midas)"
    ansible-playbook -i hosts playbooks/conf_migration.yml -e "$(python var.py conf_migration)"
    ansible-playbook -i hosts playbooks/ums.yml -e "$(python var.py ums)"
    ansible-playbook -i hosts playbooks/yeepay_withdraw_scheduler.yml -e "$(python var.py yeepay_withdraw_scheduler)"
    ansible-playbook -i hosts playbooks/chinapay_withdraw_scheduler.yml -e "$(python var.py chinapay_withdraw_scheduler)"
    ansible-playbook -i hosts playbooks/chinapay_withdraw.yml -e "$(python var.py chinapay_withdraw)"
    ansible-playbook -i hosts playbooks/chinapay_deposit_scheduler.yml -e "$(python var.py chinapay_deposit_scheduler)"
    ansible-playbook -i hosts playbooks/sms_scheduler.yml -e "$(python var.py sms_scheduler)"
    ansible-playbook -i hosts playbooks/subject_pass_scheduler.yml -e "$(python var.py subject_pass_scheduler)"
    ansible-playbook -i hosts playbooks/subject_shelf_scheduler.yml -e "$(python var.py subject_shelf_scheduler)"
    ansible-playbook -i hosts playbooks/contract_settle_scheduler.yml -e "$(python var.py contract_settle_scheduler)"
    ansible-playbook -i hosts playbooks/contract_delivery_scheduler.yml -e "$(python var.py contract_delivery_scheduler)"
    ansible-playbook -i hosts playbooks/yeepay_deposit_notify.yml -e "$(python var.py yeepay_deposit_notify)"
    ansible-playbook -i hosts playbooks/midas_admin.yml -e "$(python var.py midas_admin)"
    ansible-playbook -i hosts playbooks/midas_front.yml -e "$(python var.py midas_front)"
    ansible-playbook -i hosts playbooks/lb.yml
    ansible -i hosts wechat -m command -a "/bin/bash pub_wechat.sh"
    ansible-playbook -i hosts playbooks/voucher_expire_scheduler.yml -e "$(python var.py voucher_expire_scheduler)"
	ssh -i /root/.ssh/root 10.139.106.30 "rm -rf /var/cache/nginx/* && ls -lh /var/cache/nginx"
    ssh -i /root/.ssh/root 10.139.107.58 "rm -rf /var/cache/nginx/* && ls -lh /var/cache/nginx"