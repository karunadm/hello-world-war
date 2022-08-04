FROM tomcat:jre8-temurin-focal
ARG TEST=/var/lib
COPY --from=mavenbuilder ${TEST}/target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/
