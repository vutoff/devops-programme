FROM ubuntu:22.04

RUN useradd -m nonrootuser && \
    mkdir -p /home/nonrootuser/app && \
    chown -R nonrootuser:nonrootuser /home/nonrootuser/app

WORKDIR /home/nonrootuser/app

COPY requirements.txt ./
 
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y python3 python3-pip && \
    pip3 install -r requirements.txt  

COPY . .
 
USER nonrootuser
 
CMD ["python3", "app/app.py"]