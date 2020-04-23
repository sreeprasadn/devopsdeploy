FROM tomcat:9.0-alpine
#FROM tomcat:9.0-jre8

WORKDIR /usr/local/tomcat/webapps/

COPY build/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

