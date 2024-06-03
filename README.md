# Simple Java Docker Application

This is a simple Java application that runs inside a Docker container. The application is a basic HTTP server that responds to GET requests. The application is managed by a bash script that communicates with the Docker container through curl.

## Prerequisites

- Java 8 or higher
- Docker
- Bash
- Curl
- Maven

## Project Structure

- `src/main/java/com/myapp/App.java`: This is the main Java application file.
- `Dockerfile`: This file is used to build the Docker image for the application.
- `menu.sh`: This bash script is used to manage the application.
- `pom.xml`: This is the Maven project object model file.
- `README.md`: This file.

## How to Compile

1. Compile the Java application using Maven:

    ```bash
    mvn package
    ```

    This will compile the Java application and package it into a JAR file in the `target` directory.

## How to Deploy

1. Build the Docker image:

    ```bash
    docker build -t my-java-app .
    ```

    This will build the Docker image using the `Dockerfile`.

2. Start the Docker container:

    ```bash
    docker run -d -p 8081:8081 my-java-app
    ```

    This will start the Docker container. The application will be accessible at `http://localhost:8081`.

## How to Use

1. Run the bash script:

    ```bash
    ./menu.sh
    ```

    This will display a menu with options to start, stop, and check the status of the application.

## Note

This is a very basic example and might need to be adjusted based on your specific needs. For instance, error checking is not included in this example and you might want to add that for a production-grade script.

