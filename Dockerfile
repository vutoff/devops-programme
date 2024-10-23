#Ubuntu 22.04 base image
FROM ubuntu:22.04

#Copy the requirements file
COPY requirements.txt .

#Install python3
RUN apt-get update && apt-get install -y python3 python3-pip \
    && useradd -m -s /bin/bash nruser \
    && pip install -r requirements.txt \
    && mkdir /app

#Copy app
COPY --chown=nruser app /app

#Switch to the non-root user
USER nruser

#Add work dir
WORKDIR /app

#Expose the port
EXPOSE 5000

#Add entrypoint
ENTRYPOINT [ "python3"]

#Run the app
CMD ["app.py"]