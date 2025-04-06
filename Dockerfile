FROM python:3.9-alpine AS builder

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.9-alpine

WORKDIR /app

COPY --from=builder /app /app
COPY app.py app.py

EXPOSE 5000

CMD ["python", "app.py"]
