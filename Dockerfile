FROM python:2.7-alpine

LABEL Description="Docker"

ADD . /sampleapp
WORKDIR /sampleapp
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    # apk-install python \
    # python-dev \
    py-pip &&\
    pip install -r requirements.txt
CMD ["python", "app.py"]
