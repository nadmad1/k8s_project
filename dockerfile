FROM ubuntu:22.04
LABEL maintainer="nadmad1@gmail.com"

RUN apt install -y httpd zip unzip

# Copy the pre-downloaded file into the image
COPY carvilla.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip carvilla.zip
RUN cp -rvf carvilla/* .
RUN rm -rf carvilla carvilla.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 8
