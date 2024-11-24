FROM centos:latest
MAINTAINER nadmad1@gmail.com
RUN yum install -y httpd \
  zip\
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip carvilla.zip
RUN cp -rvf carvilla/* .
RUN rm -rf carvilla carvilla.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
