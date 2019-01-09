FROM python:3

ENV PRINCE 12.4

RUN echo "deb http://ftp.us.debian.org/debian sid main contrib non-free" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y libgif7 ttf-mscorefonts-installer pdftk \
 && wget https://www.princexml.com/download/prince_${PRINCE}-1_debian9.1_amd64.deb \
 && dpkg -i prince_${PRINCE}-1_debian9.1_amd64.deb \
 && rm -rf prince_${PRINCE}-1_debian9.1_amd64.deb /var/lib/apt/lists/*

RUN pip install --no-cache gunicorn

WORKDIR /usr/src/app
ADD wsgi.py /usr/src/app/
ADD mkpdf /usr/local/bin/

CMD ["gunicorn", "wsgi", "-b", "0:8000"]

EXPOSE 8000
