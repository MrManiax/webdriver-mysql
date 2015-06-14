#!/usr/bin/python
import MySQLdb

db = MySQLdb.connect(host="localhost", 
			user="root",
			passwd="",
			db="webdriver_test");

cur = db.cursor();
