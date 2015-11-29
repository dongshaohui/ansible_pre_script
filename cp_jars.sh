#! /bin/bash
docs=`date +"%Y%m%d"`
mkdir jars/$docs
mkdir jars_bak/$docs
cp `find playbooks/|grep 'config'|grep -E '\.jar$|\.war$'` jars_bak/$docs
cd jars/$docs
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/admin/build/libs/midas_admin.war .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/jiashi-agreements/build/libs/midas-standalone.jar .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/scheduler/build/libs/* .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/sms/build/libs/sms_scheduler-standalone.jar .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/withdraw/build/libs/* .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/yeepay-payment/build/libs/yeepay_deposit_notify-standalone.jar .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/chinapay-deposit/build/libs/chinapay_deposit_scheduler-standalone.jar .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/chinapay-withdraw/build/libs/* .
scp -i /root/.ssh/root root@10.139.105.230:/ums-dev/lastStable/archive/modules/api/build/libs/ums-standalone.jar .
scp -i /root/.ssh/root root@10.139.105.230:/mvp-dev/jiashi-front/build/libs/midas_front.war .
scp -i /root/.ssh/root root@10.139.105.230:/alidata1/jobs/jiashi_p2p_midas_mvp-dev/lastStable/archive/*.txt .
scp -i /root/.ssh/root root@10.139.105.230:/alidata1/jobs/jiashi_p2p_ums-dev/lastStable/archive/*.txt .

cd ../..
cp -f jars/$docs/midas-standalone.jar playbooks/config/midas/jar/midas-standalone.jar
cp -f jars/$docs/ums-standalone.jar playbooks/config/ums/jar/ums-standalone.jar
cp -f jars/$docs/yeepay_withdraw_scheduler-standalone.jar playbooks/config/yeepay_withdraw_scheduler/jar/yeepay_withdraw_scheduler-standalone.jar
#cp -f jars/$docs/yeepay_withdraw-standalone.jar playbooks/config/yeepay_withdraw/jar/yeepay_withdraw-standalone.jar
cp -f jars/$docs/chinapay_withdraw-standalone.jar playbooks/config/chinapay_withdraw/jar/chinapay_withdraw-standalone.jar
cp -f jars/$docs/chinapay_withdraw_scheduler-standalone.jar playbooks/config/chinapay_withdraw_scheduler/jar/chinapay_withdraw_scheduler-standalone.jar
cp -f jars/$docs/chinapay_deposit_scheduler-standalone.jar playbooks/config/chinapay_deposit_scheduler/jar/chinapay_deposit_scheduler-standalone.jar
cp -f jars/$docs/sms_scheduler-standalone.jar playbooks/config/sms_scheduler/jar/sms_scheduler-standalone.jar
cp -f jars/$docs/subject_pass_scheduler-standalone.jar playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar
cp -f jars/$docs/contract_settle_scheduler-standalone.jar playbooks/config/contract_settle_scheduler/jar/contract_settle_scheduler-standalone.jar
cp -f jars/$docs/midas_front.war playbooks/config/midas_front/war/midas_front.war
cp -f jars/$docs/yeepay_deposit_notify-standalone.jar playbooks/config/yeepay_deposit_notify/jar/yeepay_deposit_notify-standalone.jar
cp -f jars/$docs/midas_admin.war playbooks/config/midas_admin/war/midas_admin.war

md5sum jars/$docs/yeepay_withdraw_scheduler-standalone.jar playbooks/config/yeepay_withdraw_scheduler/jar/yeepay_withdraw_scheduler-standalone.jar
md5sum jars/$docs/midas_front.war playbooks/config/midas_front/war/midas_front.war
md5sum jars/$docs/yeepay_deposit_notify-standalone.jar playbooks/config/yeepay_deposit_notify/jar/yeepay_deposit_notify-standalone.jar
md5sum jars/$docs/subject_pass_scheduler-standalone.jar playbooks/config/subject_pass_scheduler/jar/subject_pass_scheduler-standalone.jar
md5sum jars/$docs/midas_admin.war playbooks/config/midas_admin/war/midas_admin.war
md5sum jars/$docs/sms_scheduler-standalone.jar playbooks/config/sms_scheduler/jar/sms_scheduler-standalone.jar
md5sum jars/$docs/yeepay_withdraw-standalone.jar playbooks/config/yeepay_withdraw/jar/yeepay_withdraw-standalone.jar
md5sum jars/$docs/ums-standalone.jar playbooks/config/ums/jar/ums-standalone.jar
md5sum jars/$docs/midas-standalone.jar playbooks/config/midas/jar/midas-standalone.jar
md5sum jars/$docs/contract_settle_scheduler-standalone.jar playbooks/config/contract_settle_scheduler/jar/contract_settle_scheduler-standalone.jar
