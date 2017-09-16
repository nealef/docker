dockerfiles-clefos-OwnCloud
===========================

This repo contains a recipe for making Docker container for OwnCloud on ClefOS7. 
The docker file chooses httpd and sqlite for owncloud. These can easily be changed
by changing what rpms get installed. This has been tested with docker 1.0.0 

Check your Docker version

    # docker version

Perform the build

    # docker build -t <yourname>/owncloud:clefos7 .

Check the image out.

    # docker images

Run it:

    # docker run -d -p 443:443 <yourname>/owncloud:clefos7

You should now be able to view the OwnCloud setup page by going to https://localhost/owncloud

NOTE: Ignore the warning about webdav not being set up properly. This is because the SSL 
      certificates aren't set up properly.
