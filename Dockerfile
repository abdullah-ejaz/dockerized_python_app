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
EXPOSE 6379 5000    
CMD ["python", "app.py","redis-server"]
