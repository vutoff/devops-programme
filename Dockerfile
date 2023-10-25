FROM ubuntu:22.04

RUN apt update && apt install --assume-yes python3-pip
RUN mkdir /flask/

RUN useradd -ms /bin/bash python_web
USER python_web

COPY . /flask/
RUN pip install -r /flask/requirements.txt
WORKDIR /flask/app/

EXPOSE 5000

CMD ["python3","app.py"]