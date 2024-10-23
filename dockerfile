FROM ubuntu:24.04	
WORKDIR /app
COPY requirements.txt ./

RUN  apt-get update && \
apt-get upgrade -y && \
apt-get install -y \
python3 \
python3-pip

COPY app/ /app



COPY requirements.txt ./
RUN pip install --break-system-packages -r requirements.txt
# EXPOSE 5000
CMD ["python3" , "-m" ,"flask" , "run" , "--host=0.0.0.0"  ] 
