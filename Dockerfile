FROM ubuntu:22.04

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    curl \
    && mkdir /app \
    && useradd -d /app app-user \
    && chown --recursive app-user /app

COPY app/requirements.txt /app/requirements.txt
RUN pip3 install -r app/requirements.txt

COPY app/app.py /app
WORKDIR /app

EXPOSE 5000

USER app-user

CMD [ "python3", "app.py" ]