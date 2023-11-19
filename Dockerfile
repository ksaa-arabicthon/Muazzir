FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD exec gunicorn -b 0.0.0.0:8000 --workers 1 --threads 8 --timeout 0 main:app
