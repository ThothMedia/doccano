FROM python:3.6-alpine

COPY . /doccano_data
WORKDIR /doccano_data
RUN apk add  linux-headers libc-dev postgresql-dev gcc

RUN pip install -r requirements.txt 

WORKDIR /doccano_data/app
RUN echo "superuser\nadmin@mail.com\nuserrootroot\nuserrootroot" | python manage.py createsuperuser

CMD [ "python", "manage.py","runserver", "0.0.0.0:8000"]