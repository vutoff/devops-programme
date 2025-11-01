FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      python3 python3-pip \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r /tmp/requirements.txt

COPY /app /app
WORKDIR /app

RUN useradd appuser \
 && chown -R appuser:appuser /app
USER appuser

CMD ["python3", "app.py"]