#### UlboraCMS 2.0 
==============

[![Build Status][travis-image]][travis-url]


[UlboraCMS 2.0](http://www.ulboracms.org) is the first production quality MEAN stack CMS and blog platform.

[Ulbora CMS Forum] (https://groups.google.com/forum/?hl=en#!forum/ulbora-cms-forum)

[Ulbora CMS Help] (https://groups.google.com/forum/?hl=en#!forum/ulbora-cms-help)

UlboraCMS is built with MongoDB, ExpressJS, AngularJS and Node.js.

UlboraCMS lets you choose either Angular templates or templates built with conventional server-side template engines like EJS or Jade.

You can build multiple templates with UlboraCMS and switch between the templates through the administration screen. Templates can even contain both Angular and convention server-side technologies.

New templates can easily be installed by zipping them as tar.gz files and following a simple upload process in the administration screens.


This is currently Release version 2.0.

### Running

To run with the mongodb located in /var/local/mongodb/data and listening on any interface.  The mongodb ports are exposed including the REST interface. UlboraCMS will listen on port 8080:

```docker run --rm -t -i -v /var/local/mongodb/data:/mongodb/data -p 27017:27017 -p 28017:28017 -p 8080:8080 -e ULBORACMS_IP=0.0.0.0 ulboracms-s390x```

[MIT](LICENSE)



[travis-image]: https://img.shields.io/travis/Ulbora/ulboracms.svg?style=flat
[travis-url]: https://travis-ci.org/Ulbora/ulboracms
