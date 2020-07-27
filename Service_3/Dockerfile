FROM python:alpine3.12

RUN mkdir -p /opt/SFIA2/

COPY . /opt/SFIA2/

WORKDIR /opt/SFIA2/

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3", "app.py" ]