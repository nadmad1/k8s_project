FROM almalinux:8
LABEL maintainer="nadmad1@gmail.com"

RUN yum install -y httpd zip unzip

# Copy the pre-downloaded file into the image
COPY carvilla.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip carvilla.zip && ls -l && \
RUN cp -rvf carvilla/* . && \
ls -l && \
RUN rm -rf carvilla carvilla.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
