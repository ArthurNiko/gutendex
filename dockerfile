FROM python:3.5
WORKDIR /app
RUN apt-get update -y && apt-get upgrade -y && apt-get install python-pip -y && pip install --upgrade pip
RUN apt install postgresql -y && apt-get install postgresql-server-dev-11 -y
RUN apt-get install python-dev -y
RUN apt-get install netcat -y
COPY . .
RUN pip install -r requirements.txt
RUN apt install rsync grsync -y
RUN chmod +x ./*
ENTRYPOINT [ "./entrypoint.sh" ]