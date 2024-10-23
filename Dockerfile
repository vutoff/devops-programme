FROM ubuntu:22.04
RUN apt-get update -y &&
RUN apt-get upgrade -y &&
RUN apt-get install -y python3
COPY requirements.txt requirements.txt
RUN `pip install -r requirements.txt`
RUN useradd -ms /bin/bash myuser
USER myuser
COPY app /app
WORKDIR /app
EXPOSE 5000
CMD ["python3", "app.py"]