FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install dependencies needed for awscli + clean cache
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        python3-pip \
        curl \
        unzip \
        ca-certificates && \
    pip install --upgrade pip && \
    pip install awscli && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
