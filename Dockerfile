FROM ubuntu:22.04	
WORKDIR /app
COPY --chown=user1 requirements.txt ./

# no need to have " / " 

RUN useradd user1 && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3 \
    python3-pip


RUN pip3 install --no-cache-dir  -r requirements.txt

COPY --chown=user1  app/ /app

# EXPOSE 5000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0"  ] 
