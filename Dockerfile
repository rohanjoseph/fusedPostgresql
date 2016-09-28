From phusion/baseimage
Maintainer Rohan Joseph
RUN apt-get update -y \
    && apt-get upgrade -y \ 
    && apt-get install wget -y \
    && apt-get update -y \
    && apt-get install nginx -y

RUN mkdir -p /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run
EXPOSE 80
CMD ["/sbin/my_init"]

# Cleaning up the APT repo after above steps are done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
