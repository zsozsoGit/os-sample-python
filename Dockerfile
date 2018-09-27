FROM sergeymakinen/oracle-instant-client:11.2
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python-dev build-essential
COPY . /app
EXPOSE 5000
USER 10001
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["wsgi.py"]
