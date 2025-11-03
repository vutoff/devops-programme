#base image with Python installed
FROM python:3.11-slim

#Set working directory inside container
WORKDIR /app

#Copy app files into container
COPY . .

#Install dependencies
RUN pip install -r requirements.txt

#Command to run when container starts
CMD ["python", "main.py"]