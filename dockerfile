FROM almalinux:8
LABEL maintainer="nadmad1@gmail.com"

# Install necessary packages
RUN yum install -y httpd zip unzip

# Add the zip file to the container
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html/

WORKDIR /var/www/html/

# Unzip the file and handle directory structure
RUN unzip carvilla.zip && \
    cp -rvf carvilla-v1.0/* . && \
    rm -rf carvilla-v1.0 carvilla.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
