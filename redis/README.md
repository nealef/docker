dockerfiles-clefos-redis
========================

ClefOS 7 dockerfile for redis

To build:

Copy the sources down -

	# docker build -rm -t <username>/redis:clefos7 .

To run:

	# docker run -d -p 6379:6379 <username>/redis:clefos7

To test:

	# nc localhost 6379

