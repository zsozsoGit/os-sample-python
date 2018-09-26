FROM sergeymakinen/oracle-instant-client:11.2
RUN yum -y install python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["wsgi.py"]
EXPOSE 5000:5000