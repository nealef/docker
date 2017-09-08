# docker

**Docker build scripts for ClefOS**

Files to build Docker containers for ClefOS 7.x

## Images

* ade - IBM Anomaly Detection Engine 

* AMHub - Application Manager Docker Hub

* ansible - Simple IT Automation

* bacula - File Backup and Restore 

* base - ClefOS (CentOS Clone) Base Image

* busybox - The Swiss Army Knife of Linux

* cobol - GNU COBOL Development Environment

* compose-ui - Docker Compose

* couchdb - Apache CouchDB

* django - A high-level Python Web framework

* docker-swarm-visualizer - A visualizer for Docker Swarm Mode 

* earthquake -  A terminal-based Twitter client

* erlang - A general-purpose, concurrent, functional programming language

* fluentd - An open source data collector for unified logging layer

* golang - GO Programming Language Development Environment

* hadoop-openshift - Hadoop for use with OpenShift

* hello-nodejs - A simple Hello World program in Node.js

* httpd - Apache Webserver

* java - IBM Java SDK

* kubernetes - An open source container cluster manager

* lighttpd - A secure, fast, compliant, and very flexible web-server

* mariadb - A community-developed fork of the MySQL relational database management system

* MEAN - MEAN stack

* meanjs - Another MEAN stack

* mediawiki - A free software open source wiki package written in PHP

* memcached - A general-purpose distributed memory caching system

* mongodb - A free and open-source cross-platform document-oriented database program

* mono - .NET development environment

* nginx - A free, open-source, high-performance HTTP server, reverse proxy, and IMAP/POP3 proxy server

* nodejs - A JavaScript runtime built on Chrome's V8 JavaScript engine

* openjdk - OpenJDK Development Environment

* openshift-spark - Spark for OpenShift

* origin - Bootstrap images for build OpenShift Origin

* postgresql - Relational Database Management System

* puppet - A network tool for managing many disparate systems

* qpid - Messaging tools that speak AMQP and support many languages and platforms

* R-base - Base image for the R programming language

* R-devel - R development environment

* redis - An open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker

* registry - Docker registry

* saltmaster - A containerised Salt-Master server

* solr - An open source enterprise search platform written in Java

* spark - A fast and general engine for big data processing, with built-in modules for streaming, SQL, machine learning and graph processing

* spark-ui-proxy - Spark UI with Proxy. For use in OpenShift Origin

* swarm - Docker Cluster Manager

* tomcat - An open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies

* ulboracms - A MEAN stack CMS and blog platform

* watchtower - A process for watching your Docker containers and automatically restarting them whenever their base image is refreshed

* websphere - Websphere Liberty Images

* wildfly - Formerly known as JBoss AS, or simply JBoss, is an application server

* wordpress - A free and open-source content management system (CMS) based on PHP and MySQL. Uses an external database

* wordpress-sa - A self-contained Wordpress container

## Special Requirements

There are additional files required that you will need to supply in the following directories:

* `java` - IBM Java SDK self-installer - see the README in that directory

  * Note, `dummy-java-1.8-0.el7.noarch.rpm` is used to register the presence of the Java SDK as the installation of the IBM SDK is not via an RPM. Consequently, packages (such as tomcat) which check for the presence of the JDK when installed would fail. This RPM will register itself as providing: java-1.8.0 and java-devel-1.8.0.

* `nodejs` - IBM Node.js SDK self-installer - see the README in that directory

* `spark` - IBM Spark SDK self-installer - see the README in that directory

