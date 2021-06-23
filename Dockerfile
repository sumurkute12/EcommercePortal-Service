
FROM openjdk:11
EXPOSE 8000
ADD ./target/e-commerce-portal.war e-commerce-portal.war
ENTRYPOINT ["java","-jar","e-commerce-portal.war"]








