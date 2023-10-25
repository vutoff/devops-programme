FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip && mkdir /app
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt

COPY ./app /app
WORKDIR /app
CMD ["python3", "app.py"]