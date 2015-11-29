#! /bin/bash
docs=`date +"%Y%m%d"`
cp -f jars_bak/$docs/midas-standalone.jar playbooks/config/midas/jar/midas-standalone.jar
cp -f jars_bak/$docs/ums-standalone.jar playbooks/config/ums/jar/ums-standalone.jar
cp -f jars_bak/$docs/yeepay_withdraw_scheduler-standalone.jar playbooks/config/yeepay_withdraw_scheduler/jar/yeepay_withdraw_scheduler-standalone.jar
cp -f jars_bak/$docs/yeepay_withdraw-standalone.jar playbooks/config/yeepay_withdraw/jar/yeepay_withdraw-standalone.jar
cp -f jars_bak/$docs/sms_scheduler-standalone.jar playbooks/config/sms_scheduler/jar/sms_scheduler-standalone.jar
cp -f jars_bak/$docs/subject_pass_scheduler-standalone.jar playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar
cp -f jars_bak/$docs/contract_settle_scheduler-standalone.jar playbooks/config/contract_settle_scheduler/jar/contract_settle_scheduler-standalone.jar
cp -f jars_bak/$docs/midas_front.war playbooks/config/midas_front/war/midas_front.war
cp -f jars_bak/$docs/yeepay_deposit_notify-standalone.jar playbooks/config/yeepay_deposit_notify/jar/yeepay_deposit_notify-standalone.jar
cp -f jars_bak/$docs/midas_admin.war playbooks/config/midas_admin/war/midas_admin.war
