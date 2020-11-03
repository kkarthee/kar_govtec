FROM python:2-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN rm -f requirements.txt

CMD [ "python", "./app.py" ]

