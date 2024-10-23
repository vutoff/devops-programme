FROM ubuntu:22.04
RUN apt-get update && \
     apt-get install -y && \
     apt-get install python3 -y && \
     apt-get install pip -y && \
     groupadd -g 1234 notroot && \
     useradd -m -u 1234 -g notroot notroot
USER notroot
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app .
EXPOSE 5000
CMD ["python3", "app.py"]