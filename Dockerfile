FROM python:2

ENV PRINCE 11.1

RUN echo "deb http://ftp.us.debian.org/debian sid main contrib non-free" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y libgif4 ttf-mscorefonts-installer pdftk \
 && wget https://www.princexml.com/download/prince_${PRINCE}-1_debian8.0_amd64.deb \
 && dpkg -i prince_${PRINCE}-1_debian8.0_amd64.deb \
 && rm -rf prince_${PRINCE}-1_debian8.0_amd64.deb /var/lib/apt/lists/*

RUN pip install --no-cache gunicorn

WORKDIR /usr/src/app
ADD wsgi.py /usr/src/app/

CMD ["gunicorn", "wsgi", "-b", "0:8000"]

EXPOSE 8000
