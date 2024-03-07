FROM tomcat:8.0

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Add your WAR file to Tomcat webapps directory
COPY ./sample.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080