FROM goodtune/prince

MAINTAINER Gary Reynolds <gary@touch.asn.au>

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python
RUN pip install gunicorn==18.0

ADD wsgi.py /opt/html2pdf/wsgi.py
WORKDIR /opt/html2pdf

EXPOSE 8000
CMD gunicorn wsgi:application -b :8000
