# Poor man's DocRaptor

If you can't afford to pay for the DocRaptor service, or you want to run
a similar service to turn your HTML into PDF using the Prince XML engine
then this recipe may be for you.

## wsgi.py

This is a simple wrapper that will drop control out to the ``prince``
executable when you ``POST`` a HTML file to the root URL.

## Configuration

This container supports two environment variables.

  workers (default: 1)

  timeout (default: 300)

