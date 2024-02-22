FROM python:3.10-slim

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    netcat-openbsd \
    && apt-get -q clean

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./app /app

EXPOSE 6061

CMD ["uvicorn", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "6061"]
# CMD ["pytest"]