FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
EXPOSE 5000
RUN pip --proxy ibinproxy01.itsh.itsh-internal.hu:3128 install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["wsgi.py"]
