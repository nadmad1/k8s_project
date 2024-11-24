FROM ubuntu:22.04
LABEL maintainer="nadmad1@gmail.com"

RUN apt update && apt install -y apache2 zip unzip

# Copy the pre-downloaded file into the image
COPY carvilla.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip carvilla.zip && ls -l && \
    cp -rvf carvilla-v1.0/* . && \
    ls -l && \
    rm -rf carvilla-v1.0 carvilla.zip


CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 8
