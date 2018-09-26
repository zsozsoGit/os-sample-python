FROM sergeymakinen/oracle-instant-client:11.2
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
USER 1001
ENTRYPOINT ["python"]
CMD ["wsgi.py"]