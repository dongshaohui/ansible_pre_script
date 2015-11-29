# Services

# Sequence

    midas ->
    ums ->
    yeepay_withdraw_scheduler ->
    yeepay_withdraw ﹣>
    sms_scheduler ->
    subject_pass_scheduler ->
    contract_settle_scheduler ->
    conf.migration ->
    midas_admin ->
    lb

# Example:

    ansible-playbook -i hosts playbooks/midas_admin.yml -e "$(python var.py midas_admin)"


# Note

    1. Redis
    ansible-playbook -i hosts playbooks/redis.yml

    2. UMS
    ansible-playbook -i hosts playbooks/ums.yml -e "$(python var.py ums)"


    the way to deploy redis need to upgrade


# 部署 Redis
   1. 确定master、slave、sentinel的地址
   2. 在hosts中配置：
    [redis_master] [redis_slave] [redis_sentinel]
   3. 配置redis.yml中的参数：
    对于redis_slave: - redis_slave_of: [master的ip地址] 6379
                       - redis_port: 63791
    对于redis_sentinel
                     redis_sentinel_monitors:
                       - name: master01
                         host: [master的ip地址]
   4.修改对应ip地址到share.json


# 部署 Standalone Jar Flow
   1. 确定要部署什么？ UMS
   2. 确保var.json中ums是否配置正确
   3. 确保jar包拷贝到了正确的位置：/playbooks/config/ums/jar/ums-standalone.jar
   4. 确保hosts配置正确:
    [ums]
    10.253.5.212 ansible_ssh_user=root ansible_ssh_pass=AAaa1234
   5. 确保templates中用到的_share参数配置正确
   6. 运行playbook：
    ansible-playbook -i hosts playbooks/ums.yml -e "$(python var.py ums)"
   7. 验证是否正确：
    对于midas：
    curl http://[server]:8081/api/subjects

# 部署 Tomcat War Flow
    1. 确定要部署什么？ midas_admin
    2. 确包var.json中midas_admin是否配置正确
    3. 确保war包拷贝到了正确的位置：/playbooks/config/midas_admin/war/midas_admin.war
    4. 确保hosts配置正确:
       [midas_admin]
    5. 确保templates中用到的_share参数配置正确
    6. 运行playbook:
        ansible-playbook -i hosts playbooks/midas_admin.yml -e "$(python var.py midas_admin)"


