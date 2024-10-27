FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y python3 python3-pip

RUN useradd -m nonrootuser

COPY requirements.txt .

RUN pip3 install -r requirements.txt

WORKDIR /home/nonrootuser/app

COPY . .

RUN chown -R nonrootuser:nonrootuser /home/nonrootuser/app

USER nonrootuser

CMD ["python3", "app/app.py"]