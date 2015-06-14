import googleTest as web
import mysql_connector as db


if __name__ == '__main__':
	query = ("SELECT query_string FROM queries")
	db.cur.execute(query)
	for (query_string) in db.cur:
		web.query_google(query_string)

	
