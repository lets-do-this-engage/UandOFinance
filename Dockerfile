FROM python:3.6-alpine

RUN adduser -D UandOFinance

WORKDIR /home/UandOFinance
RUN apk add build-base libffi-dev openssl-dev bash
COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn  pymysql

COPY app app
COPY migrations migrations
COPY UandOFinance.py config.py boot.sh .env ./
RUN chmod +x boot.sh

ENV FLASK_APP UandOFinance.py

RUN chown -R UandOFinance:UandOFinance ./
USER UandOFinance

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
