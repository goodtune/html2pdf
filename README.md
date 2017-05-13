# html2pdf

This container runs a very basic web service which receives HTML or XML input
via a HTTP `VERB` and then returns PDF content as rendered by the excellent
[Prince XML](https://www.princexml.com/) tool.

## prince

The tool used to produce a beautiful PDF from HTML and CSS.

See the [User Guide](https://www.princexml.com/doc/) to learn about the
features available.

# API

The web service expects the HTML content you wish to render as the body of a
HTTP POST request.

On success the response will be a `200 OK` with the body containing the PDF
data. The Content-Type header will be set to `application/pdf`.

If there was an error the response will be `400 Bad Request` and the body will
be textual output detailing the error encountered. The Content-Type header will
be set to `text/plain` in this case.

## Options

You can alter the behaviour of `prince` by providing options as HTTP headers.
Available options are listed below with their corresponding header.

-   `BASE_URL` used to pass the `--baseurl`

If you have suggestions for other options please create an issue or implement
it and create a pull request.
