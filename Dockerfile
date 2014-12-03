FROM ubuntu:14.04
MAINTAINER Timothy Akampa timothyakampa@gmail.com

ADD . /movies

RUN apt-get -qqy update
RUN apt-get -qqy install nginx
ADD deployment/config/movies.conf  /etc/nginx/conf.d/necoc.conf
RUN sed -i "s/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 64/" /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80 443 7999

CMD "/usr/sbin/nginx"