import pymysql


class Database:
    def __init__(self):
        self.db = pymysql.connect(
            host='localhost',
            user='root',
            password='root_password',
            database='Crm'
        )

    def test(self):
        cursor = self.db.cursor()
        cursor.execute("SELECT 'Hello World!';")
        print(cursor.fetchall())
        cursor.close()


db = Database()
