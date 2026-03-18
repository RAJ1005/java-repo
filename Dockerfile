#FROM iamdevopstrainer/tomcat:base
#COPY addressbook.war /usr/local/tomcat/webapps/
#CMD ["catalina.sh", "run"]

FROM tomcat:9-jdk11
# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy your WAR file into Tomcat webapps
COPY addressbook.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD
