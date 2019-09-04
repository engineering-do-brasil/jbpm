#!/bin/bash

/opt/wildfly-8.2.1.Final/bin/standalone.sh -b jbpmhost --server-config=standalone-full.xml -Dorg.kie.demo=true -Dorg.kie.example=false -Dorg.kie.server.persistence.ds=java:jboss/datasources/jbpmDS > /dev/null 2> /dev/null