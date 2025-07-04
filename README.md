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
```
### 2️⃣ Dockerize It
Create a Dockerfile:
FROM python:3.11-slim

WORKDIR /usr/src/app

COPY app.py .

RUN pip install flask

EXPOSE 3000

CMD ["python", "app.py"]
Build and test locally:

3️⃣ Push Docker Image to Amazon ECR
Create an ECR Repository
Go to AWS Management Console → ECR → Create Repository.
    Name it e.g., ecs-demo-app-python.
Authenticate Docker with ECR
```
    aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
```
Tag and Push the Image
```
    docker tag ecs-demo-app-python:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/ecs-demo-app-python:latest

    docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/ecs-demo-app-python:latest

```

4️⃣ Create ECS Cluster & Task Definition
Create an ECS cluster with launch type Fargate.
Register a Task Definition using the image you pushed to ECR:
    Container port: 3000.
    Memory: 512 MB, CPU: 256.
Create a Service running the Task Definition.


5️⃣ Set Up Networking
Choose “Application Load Balancer” when creating the Service.
Ensure the Load Balancer security group allows HTTP (port 80).


6️⃣ Access Your App
### Hello from ECS Fargate with Python!

