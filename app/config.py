class BotToken:
    def __init__(self, token_file):
        with open(token_file, 'r') as file:
            self.token = file.readline()


class DatabaseConnection:
    def __init__(self, database_file):
        with open(database_file, 'r') as file:
            self.host = file.readline().rstrip()
            self.user = file.readline().rstrip()
            self.password = file.readline().rstrip()
            self.database = file.readline().rstrip()


botToken = BotToken('.conf/bot_token')
db_coonection = DatabaseConnection('.conf/db_connection')
