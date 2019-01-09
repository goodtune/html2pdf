import os
import subprocess
import sys
import tempfile


def application(environ, start_response):
    command = ['mkpdf']

    base_url = environ.get('HTTP_BASE_URL')
    if base_url:
        command.append('--baseurl=%s' % base_url)

    try:
        pdf = subprocess.check_output(command, input=environ['wsgi.input'].read())
        start_response('200 OK', [('Content-Type', 'application/pdf')])
        yield pdf
    except subprocess.CalledProcessError as exc:
        start_response('400 Bad Request', [('Content-Type', 'text/plain')])
        yield exc.output
