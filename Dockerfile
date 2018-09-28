FROM sergeymakinen/oracle-instant-client:11.2

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python-dev build-essential

EXPOSE 5000
ENV APP_ROOT=/app \
    USER_NAME=default \
    USER_UID=1001
ENV APP_HOME=${APP_ROOT}/src  PATH=$PATH:${APP_ROOT}/bin
RUN mkdir -p ${APP_HOME}
COPY . /${APP_ROOT}
COPY bin/ ${APP_ROOT}/bin/
RUN chmod -R ug+x ${APP_ROOT}/bin && sync && \
    useradd -l -u ${USER_UID} -r -g 0 -d ${APP_ROOT} -s /sbin/nologin -c "${USER_NAME} user" ${USER_NAME} && \
    chown -R ${USER_UID}:0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}
RUN pip3 install -r /app/requirements.txt
####### Add app-specific needs below. #######
### Containers should NOT run as root as a good practice
USER 1001
WORKDIR ${APP_ROOT}
CMD run

