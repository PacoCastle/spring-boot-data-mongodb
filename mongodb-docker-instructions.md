# MongoDB Docker Setup Instructions

## 1. Run MongoDB in Docker

```
docker run --name mongodb-container -d -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=admin \
  mongo
```

This command will start a MongoDB container with username `admin` and password `admin`.

## 2. Create the `java17_mongo_db` Database

1. Connect to the running MongoDB container:
   ```
docker exec -it mongodb-container mongosh -u admin -p admin --authenticationDatabase admin
   ```
2. In the MongoDB shell, create the database (it will be created automatically when you insert data):
   ```
use java17_mongo_db
   ```
   You can now create collections or insert documents to initialize the database.

---

- Make sure your Spring Boot app uses the same credentials and database name as in `application.properties`.
