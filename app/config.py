class BotToken:
    def __init__(self, token_file):
        with open(token_file, 'r') as file:
            self.token = file.readline()

botToken = BotToken('.conf/bot_token')

