FROM ubuntu:22.04

LABEL maintainer="dhd.dimitrov@gmail.com"
LABEL version="5.0"

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
	python3 \
	python3-pip && \
	apt-get clean && \
	groupadd -r appgroup && \
	useradd -r -g appgroup appuser

WORKDIR /app

COPY --chown=appuser:appgroup --chmod=755 ./app .

RUN pip3 install flask==3.0.0 && \
    pip3 install prometheus_flask_exporter

USER appuser

CMD ["python3", "app.py"]
