import os
import subprocess
import sys
import tempfile


def application(environ, start_response):

    html_file = tempfile.NamedTemporaryFile('w', suffix='.html')
    html_file.write(environ['wsgi.input'].read())
    html_file.flush()

    pdf_file = tempfile.NamedTemporaryFile('rb', suffix='.html')

    command = ['prince', '--input=html', html_file.name, '-o', pdf_file.name]

    base_url = environ.get('HTTP_BASE_URL')
    if base_url:
        command.insert(1, '--baseurl=%s' % base_url)

    p = subprocess.Popen(command, stderr=subprocess.PIPE)

    if p.wait() == 0:
        start_response('200 OK', [('Content-Type', 'application/pdf')])
        yield pdf_file.read()

    else:
        start_response('400 Bad Request', [('Content-Type', 'text/plain')])
        yield p.stderr.read()
