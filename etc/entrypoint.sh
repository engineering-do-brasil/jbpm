#!/bin/bash

export JBPMHOST=$(hostname -i)
sed "s/jbpmhost/$JBPMHOST/g" -i $JBOSS_HOME/standalone/configuration/standalone-full.xml
sed "s/jbpmhost/$JBPMHOST/g" -i /startjboss.sh

/startjboss.sh