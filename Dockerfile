FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt /app/
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN mkdir -p /app/uploaded

EXPOSE 5000

CMD ["python", "app.py"]