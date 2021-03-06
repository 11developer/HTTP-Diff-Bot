FROM ubuntu:18.04

#FROM python:3.6-alpine



RUN apt update && apt install -y \
    #postgresql \
    #postgresql-dev \
    sqlite3 \
    tor \
    python3 \
    python3-dev \
    python3-pip  \
    ruby \
    rubygems
    #gunicorn

RUN gem install diff-lcs

RUN mkdir /www
WORKDIR /www
COPY requirements_docker.txt /www/
COPY project/local.py /www/project/local.py
RUN pip3 install -r requirements_docker.txt

ENV PYTHONUNBUFFERED 1

COPY . /www/