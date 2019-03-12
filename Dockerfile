FROM python:3.6-slim-stretch
MAINTAINER Dorel Vaida <dorel.vaida@gmail.com>

# Download and install wkhtmltopdf
RUN apt-get update && apt-get install -y wget xfonts-base xfonts-75dpi libxrender1 libxext6 libxcb1 libx11-6 libjpeg62-turbo fontconfig
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

# Install dependencies for running web service
RUN pip3 install werkzeug executor gunicorn

ADD app.py /app.py

ENV PORT=4444
ENV WORKERS=4

ENTRYPOINT []

CMD /bin/bash -c "/usr/local/bin/gunicorn -w $WORKERS -b 0.0.0.0:$PORT app:application"
