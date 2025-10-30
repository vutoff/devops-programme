# Use ubuntu as the base image
FROM ubuntu:22.04

# Update the system and install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Assign working directory
WORKDIR /app

# Copy the file
COPY requirements.txt .
# Run requirements
RUN pip3 install -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python3", "app.py"]
