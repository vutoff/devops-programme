FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY app/ /app/
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3", "app.py"]