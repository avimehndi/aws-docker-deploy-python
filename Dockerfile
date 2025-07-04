# Use Python base image
FROM python:3.11-slim

WORKDIR /usr/src/app

COPY app.py .

RUN pip install flask

EXPOSE 3000

CMD ["python", "app.py"]
