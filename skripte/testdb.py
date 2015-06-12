#!/usr/bin/python
import MySQLdb

db = MySQLdb.connect(host="localhost", 
			user="root",
			passwd="",
			db="mysql");

cur = db.cursor();
def init():
	cur.execute=("CREATE TABLE sites (name VARCHAR(30), URL VARCHAR(50)");
	return cur;

