FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN apt-get update && apt-get install -y dnsutils
RUN apt-get update && apt-get install -y curl
RUN curl -v https://pypi.org/simple/
RUN dig pypi.org
RUN pip install --no-cache-dir -r requirements.txt


COPY ./app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]