FROM goodtune/prince

MAINTAINER Gary Reynolds <gary@touch.asn.au>

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python
RUN pip install gunicorn==18.0

ADD wsgi.py /opt/html2pdf/wsgi.py
WORKDIR /opt/html2pdf

ENV timeout 300
ENV workers 1

EXPOSE 9999
CMD gunicorn wsgi:application -b :9999 -w ${workers} -t ${timeout}
