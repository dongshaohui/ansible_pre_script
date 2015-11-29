#!/usr/bin/python
# -*- coding=utf8 -*-
# Author : Dong Shaohui
# Mail : dongsh@jsfund.cn

import sys,os
import DB

# connect to db
def Connent_Online_Mysql_By_DB(hostname,port,username,pwd,dbname,socket):
    db = DB.DB(False,host=hostname, port=port, user=username ,passwd=pwd, db=dbname,charset='gbk', unix_socket=socket) 
    return db


# write into db
def write_record_db(db,list_obj,table_name):
    try:
        db.insert(table_name,list_obj)
        db.commit()
    except Exception,e:
        print e


def load_data(filename):
	f = open(filename,'r')
	rc = f.readlines()[1:]
	rc = map(lambda x: x.strip().split(), rc)
	f.close()
	return rc

def data_trans(db):
	account_data = load_data('accounts.data')
	ums_bank_cards_data = load_data('ums_bank_cards.data')
	ums_regular_users_data = load_data('ums_regular_users.data')
	ums_user_data = load_data('ums_user.data')
	ums_voucher_event_data = load_data('ums_voucher_event.data')
	users_data = load_data('users.data')
	vouchers_data = load_data('vouchers.data')
	

	collect_users_data(db,account_data,ums_regular_users_data,ums_user_data,ums_voucher_event_data,users_data,vouchers_data,ums_bank_cards_data)


def collect_valid_user_info(db):
	all_username = db.select('select username from users')	
	all_mobile = db.select('select phone from ums_regular_users')
	username_list = map(lambda x: x[0],all_username)
	mobile_list = map(lambda x: x[0],all_mobile)
	return username_list,mobile_list

def record_into_db(db,user_data_info,ums_user_data_info,account_data_info,ums_regular_user_data_info,ums_voucher_event_data_info,voucher_data_info,ums_bank_card_data_info):
	# user data 
	user_data = {}
	user_data['USERNAME'] = user_data_info[1]
	user_data['TYPE'] = user_data_info[3]
	user_data['BIND_INFO'] = user_data_info[5].decode('utf-8')
	user_data['BEGINNER_INV_COUNT'] = user_data_info[6]
	user_data['CREATED_AT'] = user_data_info[2] + ' ' + user_data_info[3]
	write_record_db(db,user_data,'users')
	#print user_data
	
	# new midas id
	midas_id = db.select('select id from users where username = ' + "'" + user_data['USERNAME'] + "'")[0][0]
	# ums user data
	ums_user_data = {}
	ums_user_data['USER_ID'] = midas_id
	ums_user_data['NAME'] = ums_user_data_info[2]
	ums_user_data['STATUS'] = ums_user_data_info[3]
	ums_user_data['TYPE'] = ums_user_data_info[4]
	ums_user_data['CREATED_AT'] = ums_user_data_info[5] + ' ' +  ums_user_data_info[6]
	write_record_db(db,ums_user_data,'ums_users')
	# new ums user id 
	ums_user_id = db.select('select id from ums_users where USER_ID = ' + "'" + (str)(midas_id) + "'")[0][0]
	
	#print midas_id,ums_user_id

	# account data
	account_data = {}
	account_data['USER_ID'] = midas_id
	account_data['TYPE'] = account_data_info[2]
	account_data['EXTERNAL_ID'] = account_data_info[3]
	account_data['AUTHORIZED'] = account_data_info[4]
	account_data['BALANCE_AMOUNT'] = account_data_info[5]
	account_data['BALANCE_CURRENCY'] = account_data_info[6]
	account_data['FROZEN_AMOUNT'] = account_data_info[7]
	account_data['FROZEN_CURRENCY'] = account_data_info[8]
	account_data['CREATED_AT'] = account_data_info[9] + " " + account_data_info[10]
	account_data['EXTERNAL_REMARK'] = account_data_info[11]
	write_record_db(db,account_data,'accounts')

	# ums_regular_user
	ums_regular_user = {}
	ums_regular_user['USER_ID'] = ums_user_id
	ums_regular_user['PHONE'] = ums_regular_user_data_info[1]
	ums_regular_user['PWD'] = ums_regular_user_data_info[2]
	ums_regular_user['CERTIFICATE_NAME'] = ums_regular_user_data_info[3].decode('utf-8')
	if ums_regular_user_data_info[4] == 'NULL':
		ums_regular_user['CERTIFIATE_IDENTITY'] = None
	else:
		ums_regular_user['CERTIFIATE_IDENTITY'] = ums_regular_user_data_info[4]
	ums_regular_user['TRANSACTION_PASSWORD'] = ums_regular_user_data_info[5]
	ums_regular_user['OPENID'] = ums_regular_user_data_info[6]
	ums_regular_user['NOTIFY_DEPOSIT_AGREEMENT'] = ums_regular_user_data_info[7]
	write_record_db(db,ums_regular_user,'ums_regular_users')

	# ums_voucher_event_data
	ums_voucher_event_data = {}
	ums_voucher_event_data['UMS_USER_ID'] = ums_user_id
	ums_voucher_event_data['MIDAS_USER_ID'] = midas_id
	ums_voucher_event_data['EVENT_TYPE'] = ums_voucher_event_data_info[3]
	ums_voucher_event_data['VOUCHER_TYPE_CODE'] = ums_voucher_event_data_info[4]
	ums_voucher_event_data['CHANNEL'] = ums_voucher_event_data_info[5]
	ums_voucher_event_data['STATUS'] = ums_voucher_event_data_info[6]
	ums_voucher_event_data['CREATED_AT'] = ums_voucher_event_data_info[7] + " " + ums_voucher_event_data_info[8]
	ums_voucher_event_data['UPDATED_AT'] = ums_voucher_event_data_info[9] + " " + ums_voucher_event_data_info[10]
	write_record_db(db,ums_voucher_event_data,'ums_voucher_event')

	# voucher_data
	for voucher_data_list in voucher_data_info:
		voucher_data = {}
		voucher_data['VOUCHER_TYPE_ID'] = voucher_data_list[1]
		voucher_data['MIDAS_USER_ID'] = midas_id
		voucher_data['STATUS'] = voucher_data_list[3]
		if voucher_data_list[4] == 'NULL':
			voucher_data['USED_HISTORY_ID'] = None
		else:
			voucher_data['USED_HISTORY_ID'] = (int)(voucher_data_list[4])
		voucher_data['CREATED_AT'] = voucher_data_list[5] + " " + voucher_data_list[6]
		voucher_data['UPDATED_AT'] = voucher_data_list[7] + " " + voucher_data_list[8]
		write_record_db(db,voucher_data,'vouchers')
	
	# ums_bank_card_data
	if ums_bank_card_data_info != None:
		ums_bank_card_data = {}
		ums_bank_card_data['USER_ID'] = ums_user_id
		ums_bank_card_data['BANK_ACCOUNT'] = ums_bank_card_data_info[2]
		ums_bank_card_data['BANK_CODE'] = ums_bank_card_data_info[3]
		ums_bank_card_data['CREATED_AT'] = ums_bank_card_data_info[4] + " " + ums_bank_card_data_info[5]
		ums_bank_card_data['VALID'] = ums_bank_card_data_info[6]
		ums_bank_card_data['BANK_NAME'] = ums_bank_card_data_info[7].decode('utf-8')
		ums_bank_card_data['BANK_RESERVED_PHONE'] = ums_bank_card_data_info[8]
		write_record_db(db,ums_bank_card_data,'ums_bank_cards')

def collect_users_data(db,accounts_data,ums_regular_users_data,ums_users_data,ums_vouchers_event_data,users_data,vouchers_data,ums_bank_cards_data):
	user_info = []
	username_list,mobile_list = collect_valid_user_info(db)
	for user_data in users_data:
		user_data_info = user_data
		midas_user_id = user_data[0]
		ums_user_id = None
		# collect ums user data
		ums_user_data_info = None
		account_data_info = None
		ums_regular_user_data_info = None
		ums_voucher_event_data_info = None
		ums_bank_card_data_info = None
		voucher_data_info = []
		for ums_user_data in ums_users_data:
			if midas_user_id == ums_user_data[1]:
				ums_user_data_info = ums_user_data
				ums_user_id = ums_user_data[0]
				break
		
		for account_data in accounts_data:
			if midas_user_id == account_data[1]:
				account_data_info = account_data
				break
		
		for ums_regular_user_data in ums_regular_users_data:
			if ums_user_id == ums_regular_user_data[0]:
				ums_regular_user_data_info = ums_regular_user_data
				break
		for ums_voucher_event_data in ums_vouchers_event_data:
			if ums_user_id == ums_voucher_event_data[1] or midas_user_id == ums_voucher_event_data[2]:
				ums_voucher_event_data_info = ums_voucher_event_data
				break

		for voucher_data in vouchers_data:
			if midas_user_id == voucher_data[2]:
				voucher_data_info.append(voucher_data)
		
		for ums_bank_card_data in ums_bank_cards_data:
			if ums_user_id == ums_bank_card_data[1]:
				ums_bank_card_data_info = ums_bank_card_data		
				break

		phone = ums_regular_user_data_info[1]
		username = user_data_info[1]
		if phone not in mobile_list and username not in username_list:
			record_into_db(db,user_data_info,ums_user_data_info,account_data_info,ums_regular_user_data_info,ums_voucher_event_data_info,voucher_data_info,ums_bank_card_data_info)
		else:
			print phone,username
		#print phone,username

if __name__ == '__main__':
	db_ceshi = Connent_Online_Mysql_By_DB('rdseq3ujqveuq6f.mysql.rds.aliyuncs.com',3306,'p2p_ceshi','AAaa1234','p2p','/tmp/mysql.sock')
	db_ysc = Connent_Online_Mysql_By_DB('rdsmeene2yuvbfi.mysql.rds.aliyuncs.com',3306,'p2p_ysc','AAaa1234','p2p','/tmp/mysql.sock')
	collect_valid_user_info(db_ysc)
	data_trans(db_ysc)
