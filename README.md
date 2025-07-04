# aws-docker-deploy-python

# 🚀 Deploy a Python Docker App on AWS ECS (Beginner Friendly)

This project demonstrates how to deploy a simple Python Flask application in a Docker container to AWS ECS using Fargate.

## 📁 Files

- `app.py`: Python Flask HTTP server.
- `Dockerfile`: Docker build instructions for Python app.
- `README.md`: this documentation.

## ✅ Steps

### 1️⃣ Build the App

Write a simple Flask server in `app.py`:

```python
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from ECS Fargate with Python!\n"

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 3000))
    app.run(host='0.0.0.0', port=port)
