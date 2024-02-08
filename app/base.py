import pymysql
from config import db_coonection


class Database:
    def __init__(self, connection):
        self.db = pymysql.connect(
            host=connection.host,
            user=connection.user,
            password=connection.password,
            database=connection.database
        )

    def test(self):
        cursor = self.db.cursor()
        cursor.execute("SELECT 'Hello World!';")
        print(cursor.fetchall())
        cursor.close()


db = Database(db_coonection)
