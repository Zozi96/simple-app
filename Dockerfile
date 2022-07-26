FROM python:3.10.5-alpine3.16

EXPOSE 8000

ENV PYTHONUNBUFFERED 1

ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /usr/src/app

COPY code/ .

RUN python -m pip install -r requirements.txt && chmod +x entrypoint.sh

CMD [ "./entrypoint.sh" ]
