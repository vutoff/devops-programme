FROM ubuntu:22.04
RUN apt-get update \
	&& apt-get install python3 python3-pip -y \
	 && mkdir /app/ \
	 && mkdir /req/
ADD requirements.txt /req/

WORKDIR /
ADD app /app
RUN pip install -r /req/requirements.txt
ENV FLASK_ENV=DEVELOPMENT
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
CMD ["python3","/app/app.py"]
