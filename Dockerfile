From ubuntu:latest
Maintainer Rohan Joseph
RUN apt-get install wget -y \
    && apt-get update -y \
    && apt-get install nginx -y

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/nginx
EXPOSE 80
CMD ["/sbin/my_init"]

# Cleaning up the APT repo after above steps are done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
