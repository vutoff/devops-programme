FROM ubuntu:22.04

RUN apt-get update \
	&& apt-get install python3 python3-pip -y \
	&& mkdir /app/ \
	&& mkdir /req/

ADD requirements.txt /req/
RUN pip install -r /req/requirements.txt

ADD app /app

ENTRYPOINT ["python3"]

CMD ["/app/app.py"]
