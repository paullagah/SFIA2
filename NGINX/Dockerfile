FROM nginx:latest

WORKDIR /etc/nginx/

RUN apt update -y
RUN apt install open ssl -y

RUN rm ./conf.d/default.conf

COPY ./reverse_proxy.conf ./conf.d/

