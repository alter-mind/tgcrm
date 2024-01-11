# Используем официальный образ MySQL
FROM mysql:latest

# Указываем переменные окружения для настройки базы данных
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=my_database
ENV MYSQL_USER=my_user
ENV MYSQL_PASSWORD=my_password

# Копируем SQL-скрипты и конфигурационные файлы в контейнер
# COPY init.sql /docker-entrypoint-initdb.d/
# COPY my.cnf /etc/mysql/my.cnf

# Определяем порт, который будет использоваться для подключения к базе данных
EXPOSE 3306
