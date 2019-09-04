FROM jboss/jbpm-workbench:6.5.0.Final-1

ENV KIE_DEMO true \
    KIE_SERVER_PROFILE standalone-full-jbpm

ADD module/module.xml $JBOSS_HOME/modules/system/layers/base/com/oracle/main/
ADD module/ojdbc7-12.1.0.2.jar $JBOSS_HOME/modules/system/layers/base/com/oracle/main/
ADD etc/standalone-full-jbpm.xml $JBOSS_HOME/standalone/configuration/standalone-full-jbpm.xml
ADD etc/jbpm-users.properties $JBOSS_HOME/standalone/configuration/jbpm-users.properties
ADD etc/jbpm-roles.properties $JBOSS_HOME/standalone/configuration/jbpm-roles.properties
ADD /etc/entrypoint.sh / 
ADD /etc/startjboss.sh /

USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone-full-jbpm.xml && \
    chown jboss:jboss $JBOSS_HOME/standalone/configuration/jbpm-users.properties && \ 
    chown jboss:jboss $JBOSS_HOME/standalone/configuration/jbpm-roles.properties && \
    chown jboss:jboss /entrypoint.sh && chown jboss:jboss /startjboss.sh && \
    chmod +x /entrypoint.sh && chown jboss:jboss /startjboss.sh

USER jboss

EXPOSE 8080
EXPOSE 8001

WORKDIR $JBOSS_HOME/bin/

RUN ./add-user.sh --silent=true -a admin admin -g admin,rest-all

CMD ["./start_jbpm-wb.sh"]