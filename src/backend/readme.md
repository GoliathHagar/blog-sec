# Server side app Blog Api

## Requiriments
* Docker and Docker Compose
* Java 17 or greather
## Instructions
1. Compile api using mavem 
```bash 
./mvnw clean package -DskipTests
```
2. run docker-compose
```bash 
docker-compose up --build --remove-orphans
```
