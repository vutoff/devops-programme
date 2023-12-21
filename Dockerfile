FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip && mkdir /app
COPY requirements.txt /app/
RUN pip3 install -r /app/requirements.txt
WORKDIR /app
COPY ./app /app

CMD ["python3", "app.py"]