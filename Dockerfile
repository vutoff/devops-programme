FROM ubuntu:22.04

RUN apt-get update \
	&& apt-get install python3 python3-pip -y \
	&& mkdir /app \
	&& useradd -m app

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

COPY app/app.py /app
WORKDIR /app

USER app

EXPOSE 5000

ENTRYPOINT ["python3"]

CMD ["/app/app.py"]
