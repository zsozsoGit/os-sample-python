FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential oracle-instantclient-basic oracle-instantclient
COPY . /app
WORKDIR /app
EXPOSE 5000:5000
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["wsgi.py"]
