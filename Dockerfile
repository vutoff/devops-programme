# Използваме Ubuntu 22.04 като база
FROM ubuntu:22.04

# Обновяваме системата и инсталираме Python + pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Задаваме работна директория
WORKDIR /app

# Копираме файла с зависимостите
COPY requirements.txt .

# Инсталираме зависимостите
RUN pip install --no-cache-dir -r requirements.txt

# Копираме останалия код
COPY . .

# Създаваме non-root потребител
RUN useradd -ms /bin/bash myuser
USER myuser

# Експонираме порт 5000
EXPOSE 5000

# Стартираме приложението
CMD ["python3", "app/app.py"]
