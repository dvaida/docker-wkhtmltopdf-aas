FROM dvaida/wkhtmltopdf:0.12.5-1_stretch
MAINTAINER Dorel Vaida <dorel.vaida@gmail.com>

# Install dependencies for running web service
RUN pip3 install werkzeug executor gunicorn

ADD app.py /app.py

ENV PORT=4444
ENV WORKERS=4

ENTRYPOINT []

CMD /bin/bash -c "/usr/local/bin/gunicorn -w $WORKERS -b 0.0.0.0:$PORT app:application"
