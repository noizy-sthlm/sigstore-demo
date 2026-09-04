FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get upgrade -y

RUN pip install --upgrade pip

RUN groupadd web-user && useradd -m -g web-user web-user -s /usr/bin/bash

WORKDIR /home/web-user

COPY --chown=web-user  app/ ./

RUN pip install -r ./requirements.txt

USER web-user

EXPOSE 5000

CMD ["flask", "--app", "hello", "run", "--host=0.0.0.0", "--port=5000"]