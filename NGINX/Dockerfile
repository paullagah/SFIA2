FROM nginx:latest

WORKDIR /etc/nginx/

RUN apt update -y
RUN apt install open ssl -y

RUN rm ./sites-available/default

COPY ~/SFIA2/NGINX/reverse_proxy.conf ./sites-available/

