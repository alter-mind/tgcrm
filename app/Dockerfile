# Используем официальный образ Python
FROM python:latest

# Устанавливаем зависимости для Python-приложения
#COPY requirements.txt /app/
WORKDIR /app
#RUN pip install -r requirements.txt

# Копируем исходный код приложения в контейнер
COPY . /app

# Определяем порт, который будет использоваться для взаимодействия с приложением
EXPOSE 5000

# Запускаем Python-приложение при старте контейнера
CMD ["python", "app.py"]