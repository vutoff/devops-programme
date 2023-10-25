FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r /app/requirements.txt 

COPY  app .

EXPOSE 5000

RUN useradd --create-home myuser
USER myuser

CMD [ "python3","app.py" ]

