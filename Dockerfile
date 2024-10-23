FROM ubuntu:22.04
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y python3 && \
    apt-get install python3-pip
COPY requirements.txt requirements.txt
RUN `pip install -r requirements.txt`
RUN useradd -ms /bin/bash myuser
USER myuser
COPY app /app
WORKDIR /app
EXPOSE 5000
CMD ["python3", "app.py"]