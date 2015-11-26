FROM phusion/baseimage
MAINTAINER Rohan Joseph

#updation on the system as well as on the premises installation of the postgresql
RUN apt-get update -y && \
apt-get install postgresql postgresql-contrib -y

#for a continuos process of running a program
RUN mkdir /etc/service/postgres
ADD postgres.sh /etc/service/postgres/psql
EXPOSE 5432
CMD ["/sbin/my_init"]

# Cleaning up the APT repo after above steps are done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*