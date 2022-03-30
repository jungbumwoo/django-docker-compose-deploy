FROM python:3.9-alpine3.13
LABEL maintainer="django-jb"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home app # 한 줄로 실행하는게 좋음 도커는 명령마다 새로운 이미지 레이어를 만들기에 이미지를 줄이기 위해선 한 줄에 쭉
# 명령들이 실행되면 여기서 실행됨
ENV PATH="/py/bin:$PATH"
# running as app. not root user
USER app



