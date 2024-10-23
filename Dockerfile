# Use the official Ubuntu 22.04 as a base image
FROM ubuntu:22.04


# Install Python and pip and create a user for the container
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip --no-install-recommends && \
    groupadd -r appuser && useradd -r -g appuser appuser

# Set the working directory inside the container
WORKDIR /app

# Copy the Python app into the container and change ownership of /app
COPY --chown=appuser:appuser ./app /app

# Create the requirements.txt file in the Docker image
RUN echo "Flask==3.0.0" > /app/requirements.txt

# Install any Python dependencies
RUN pip install -r requirements.txt

# Switch to non-root user
USER appuser

# Expose port 5000 to the host
EXPOSE 5000

# Set the default command to run the app
CMD ["python3", "app.py"]
