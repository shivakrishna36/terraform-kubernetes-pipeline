## using tomcat as base image with jdk8
FROM tomcat:jdk8
RUN java -version
ADD target/pipeline.war /usr/local/tomcat/webapps/
RUN rm /usr/local/tomcat/conf/tomcat-users.xml
ADD tomcat-users.xml /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]


##without tomcat
#FROM openjdk:8
#RUN java -version
#ADD target/pipeline.war pipeline.war
#EXPOSE 8084
#CMD ["java","-jar","/pipeline.war"]



