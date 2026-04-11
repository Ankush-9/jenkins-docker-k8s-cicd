FROM tomcat:latest

LABEL maintainer = "waliaankush0420@gmail.com"

EXPOSE 8080

COPY webapp/target/web-app-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
