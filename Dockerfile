FROM ubuntu:22.04

RUN apt-get update \
	&& apt-get install python3 python3-pip -y \
	&& mkdir /app/ \
	&& useradd -m app

WORKDIR /app

COPY requirements.txt ./
RUN pip install -r /req/requirements.txt

COPY app ./app

USER app

ENTRYPOINT ["python3"]

CMD ["/app/app.py"]
