# Use an official OpenJDK runtime as a parent image
FROM mcr.microsoft.com/openjdk/jdk:21-ubuntu

# Set the working directory in the container
WORKDIR /app

# Install wget to download the Renaissance benchmark
RUN apt-get update && apt-get install -y wget

# Download and extract the Renaissance benchmark
RUN wget https://github.com/renaissance-benchmarks/renaissance/releases/download/v0.15.0/renaissance-gpl-0.15.0.jar && mv renaissance-gpl-0.15.0.jar renaissance.jar

# Set the entry point to run the benchmark
ENTRYPOINT ["java", "-jar", "/app/renaissance.jar"]

# By default, run all benchmarks
CMD ["--raw-list"]

