FROM ubuntu:latest
LABEL maintainer="michal.kozak3@pollub.pl"
RUN apt-get update
RUN apt-get install -y apache2 && apt-get clean
RUN sed -s -i -e "s/80/8080/" /etc/apache2/ports.conf /etc/apache2/sites-availa$
EXPOSE 8080
CMD apachectl -D FOREGROUND
