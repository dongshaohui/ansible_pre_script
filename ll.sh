#!/bin/bash
dt=`date +%F`
#mvp 
#cp -r /test_p2p_home/playbooks/roles/conf.migration/files/sql/MySQL-1_2[7-9]*  ./playbooks/roles/conf.migration/files/sql/
#cp -r /test_p2p_home/playbooks/roles/conf.migration/files/sql/MySQL-1_3[0-2]*  ./playbooks/roles/conf.migration/files/sql/
#cp -r /test_p2p_home/playbooks/config/midas_admin/app/config.js  ./playbooks/config/midas_admin/app/
#cp -r /test_p2p_home/playbooks/config/midas/sql/MySQL-1_59*  ./playbooks/config/midas/sql/
#cp -r /test_p2p_home/playbooks/config/midas/sql/MySQL-1_67*  ./playbooks/config/midas/sql/
#cp -r /test_p2p_home/playbooks/config/midas/app/sms-event.properties  ./playbooks/config/midas/app/
#cp -r  /test_p2p_home/playbooks/config/sms_scheduler/app/sms-template.properties  ./playbooks/config/sms_scheduler/app/
#cp -r /test_p2p_home/playbooks/config/midas/app/error.properties  ./playbooks/config/midas/app/
#cp -r /test_p2p_home/playbooks/config/midas/app/velocity_template/contract_jiashi_v2_voucher.vm  ./playbooks/config/midas/app/velocity_template/
#cp -r /test_p2p_home/playbooks/config/midas/app/velocity_template/contract_jiashi_v5.vm  ./playbooks/config/midas/app/velocity_template/
#cp -r /test_p2p_home/playbooks/config/ums/sql/MySQL-1_27*  ./playbooks/config/ums/sql/
#cp -r /test_p2p_home/playbooks/config/ums/app/error.properties ./playbooks/config/ums/app/
cp /test_p2p_home/playbooks/config/sms_scheduler/sql/MySQL-1_3__alter_sms_record.sql  ./playbooks/config/sms_scheduler/sql/

#midas :/var/lib/jenkins/jobs/jiashi_p2p_midas-dev/workspace/modules
#cp -r /test_p2p_home/playbooks/config/midas/app/sms-event.properties /alidata1/backup/sms-event.properties-$dt
#scp -r root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_midas-dev/workspace/modules/event/src/main/resources/sms-event.properties /test_p2p_home/playbooks/config/midas/app/

#scp -r  root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_midas-dev/workspace/modules/persistence/src/main/resources/db/migration/mysql/MySQL-1_52__add_biz_params_boolean.sql  /test_p2p_home/playbooks/config/midas/sql/

#cp -r /jiashi-cp-ansible/playbooks/config/midas_admin/app/config.js /alidata1/backup/config.js-$dt
#scp -r root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_midas_mvp-dev/workspace/modules/admin/src/main/webapp/js/config/config.js /jiashi-cp-ansible/playbooks/config/midas_admin/app/


#scp -r root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_midas_mvp-dev/workspace/modules/jiashi-agreements/src/main/resources/db/migration/mysql/MySQL-1_25* /pre_p2p_home/playbooks/roles/conf.migration/files/sql/

#cp -r /test_p2p_home/playbooks/config/midas/app/error.properties /alidata1/backup/error.properties-$dt
#scp -r root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_midas_mvp-dev/workspace/modules/jiashi-agreements/src/main/resources/error.properties /test_p2p_home/playbooks/config/midas/app/

#scp -r root@10.139.105.230:/var/lib/jenkins/jobs/jiashi_p2p_ums-dev/workspace/modules/mappers/src/main/resources/db/migration/mysql/MySQL-1_23__add_relieve_bank_card_history.sql /test_p2p_home/playbooks/config/ums/sql/
