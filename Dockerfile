FROM openshift/python:3.5
RUN yum install -y python-pip python-dev build-essential oracle-instantclient-basic oracle-instantclient
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["wsgi.py"]
EXPOSE 5000:5000