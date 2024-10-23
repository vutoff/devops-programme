FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    groupadd -g 1234 notroot && \
    useradd -m -u 1234 -g notroot notroot

WORKDIR /app

COPY --chown=notroot:notroot requirements.txt .

RUN pip install -r requirements.txt

USER notroot

COPY --chown=notroot:notroot app .

EXPOSE 3000

CMD ["python3", "app.py"]