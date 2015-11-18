#### dockerfiles-clefos-django
========================

ClefOS 7 dockerfile for django

Tested on Docker 1.8.0

### To build:

Copy the sources down -


\# docker build -rm -t <username>/django .


### To run:


\# docker run -d -p 8000:8000 <username>/django


### To test:


\# docker run <username>/django django-admin --version 

