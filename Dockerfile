FROM python:3.8-slim-buster


WORKDIR /usr/src/app
COPY . .
RUN chmod -R 777 /usr/src/app
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Set timezone of the container to Asia/Kolkata
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set default environment to 'dev' and default port on which each container runs to 8501
ENV ENV_TYPE='dev'
ENV PORT=8501
ENV ROOT_PATH='/usr/src/app'
RUN echo "env: $ENV_TYPE , rootpath: $ROOT_PATH ,port: $PORT"


ENTRYPOINT ["./launch_app.sh"]
