# ==========================================
# Step 1: Use an official Tomcat runtime image
# ==========================================
FROM tomcat:9.0-jdk11-corretto

LABEL maintainer="smartlearn-admin"

# Remove the default Tomcat webapps to keep our container clean
RUN rm -rf /usr/local/tomcat/webapps/*

# ==========================================
# Step 2: Add MySQL Database Driver Dependencies
# ==========================================
# Download and place the MySQL JDBC Driver directly into Tomcat's global library folder
# This ensures DBConnection.getConnection() can dynamically load the driver class
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar /usr/local/tomcat/lib/

# Ensure permissions are correct on the downloaded driver jar file
RUN chmod 644 /usr/local/tomcat/lib/mysql-connector-j-8.3.0.jar

# ==========================================
# Step 3: Deploy the Application
# ==========================================
# Copy your compiled WAR file from your target/dist directory into Tomcat's deployment folder
# Renaming it to ROOT.war means your application will run directly at http://localhost:8080/ instead of /YourAppName/
COPY dist/softwarearchitecture.war /usr/local/tomcat/webapps/ROOT.war

# Expose standard Tomcat HTTP web server port
EXPOSE 8080

# Launch Tomcat when the container boots up
CMD ["catalina.sh", "run"]