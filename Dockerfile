FROM sergeymakinen/oracle-instant-client:11.2

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python-dev build-essential
COPY . /app
EXPOSE 5000
RUN pip3 install -r requirements.txt
RUN chgrp -R 0 /app && \
    chmod -R g=u /app
RUN chmod g=u /etc/passwd

USER 1001
WORKDIR /app
ENTRYPOINT [ "uid_entrypoint" ]
CMD ["wsgi.py"]
