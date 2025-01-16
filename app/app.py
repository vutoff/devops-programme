import os

from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/")
def hello_world():
    return "Hello, World!"


if __name__ == "__main__":
    app.run(port=os.environ.get("PORT", 3000), host="0.0.0.0")
