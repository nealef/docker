# docker

**Docker build scripts for ClefOS**

Files to build Docker containers for ClefOS 7.x

## Images

* __ade__ - IBM Anomaly Detection Engine 

* __AMHub__ - Application Manager Docker Hub

* __ansible__ - Simple IT Automation

* __bacula__ - File Backup and Restore 

* __base__ - ClefOS (CentOS Clone) Base Image

* __busybox__ - The Swiss Army Knife of Linux

* __cobol__ - GNU COBOL Development Environment

* __compose-ui__ - Docker Compose

* __couchdb__ - Apache CouchDB

* __django__ - A high-level Python Web framework

* __docker-swarm-visualizer__ - A visualizer for Docker Swarm Mode 

* __earthquake__ -  A terminal-based Twitter client

* __erlang__ - A general-purpose, concurrent, functional programming language

* __fluentd__ - An open source data collector for unified logging layer

* __golang__ - GO Programming Language Development Environment

* __hadoop-openshift__ - Hadoop for use with OpenShift

* __hello-nodejs__ - A simple Hello World program in Node.js

* __httpd__ - Apache Webserver

* __java__ - IBM Java SDK

* __kubernetes__ - An open source container cluster manager

* __lighttpd__ - A secure, fast, compliant, and very flexible web-server

* __mariadb__ - A community-developed fork of the MySQL relational database management system

* __MEAN__ - MEAN stack

* __meanjs__ - Another MEAN stack

* __mediawiki__ - A free software open source wiki package written in PHP

* __memcached__ - A general-purpose distributed memory caching system

* __mongodb__ - A free and open-source cross-platform document-oriented database program

* __mono__ - .NET development environment

* __nginx__ - A free, open-source, high-performance HTTP server, reverse proxy, and IMAP/POP3 proxy server

* __nodejs__ - A JavaScript runtime built on Chrome's V8 JavaScript engine

* __openjdk__ - OpenJDK Development Environment

* __openshift-spark__ - Spark for OpenShift

* __origin__ - Bootstrap images for build OpenShift Origin

* __postgresql__ - Relational Database Management System

* __puppet__ - A network tool for managing many disparate systems

* __qpid__ - Messaging tools that speak AMQP and support many languages and platforms

* __R-base__ - Base image for the R programming language

* __R-devel__ - R development environment

* __redis__ - An open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker

* __registry__ - Docker registry

* __saltmaster__ - A containerised Salt-Master server

* __solr__ - An open source enterprise search platform written in Java

* __spark__ - A fast and general engine for big data processing, with built-in modules for streaming, SQL, machine learning and graph processing

* __spark-ui-proxy__ - Spark UI with Proxy. For use in OpenShift Origin

* __swarm__ - Docker Cluster Manager

* __tomcat__ - An open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies

* __ulboracms__ - A MEAN stack CMS and blog platform

* __watchtower__ - A process for watching your Docker containers and automatically restarting them whenever their base image is refreshed

* __websphere__ - Websphere Liberty Images

* __wildfly__ - Formerly known as JBoss AS, or simply JBoss, is an application server

* __wordpress__ - A free and open-source content management system (CMS) based on PHP and MySQL. Uses an external database

* __wordpress-sa__ - A self-contained Wordpress container

## Special Requirements

There are additional files required that you will need to supply in the following directories:

* `java` - IBM Java SDK self-installer - see the README in that directory

  * Note, `dummy-java-1.8-0.el7.noarch.rpm` is used to register the presence of the Java SDK as the installation of the IBM SDK is not via an RPM. Consequently, packages (such as tomcat) which check for the presence of the JDK when installed would fail. This RPM will register itself as providing: java-1.8.0 and java-devel-1.8.0.

* `nodejs` - IBM Node.js SDK self-installer - see the README in that directory

* `spark` - IBM Spark SDK self-installer - see the README in that directory

