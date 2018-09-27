FROM sergeymakinen/oracle-instant-client:11.2
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python-dev build-essential
COPY . /app
RUN useradd -ms /bin/bash  vault
EXPOSE 5000
USER vault
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["wsgi.py"]
