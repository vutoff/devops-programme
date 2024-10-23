FROM ubuntu:24.04	
WORKDIR /app
COPY --chown=user1 requirements.txt ./

# no need to have " / " 

RUN useradd user1 
apt-get update && \
apt-get upgrade -y && \
apt-get install -y \
python3 \
python3-pip


RUN pip install --break-system-packages -r requirements.txt

COPY --chown=user1  app/ /app

# EXPOSE 5000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0"  ] 
