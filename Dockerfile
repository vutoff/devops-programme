FROM ubuntu:24.04

RUN useradd meto

RUN apt-get update && apt-get install -y python3 python3-pip

COPY requirements.txt .
RUN pip install --break-system-packages -r requirements.txt    
    
WORKDIR /app
COPY app/  /app

USER meto

CMD [ "python3", "app.py" ] 