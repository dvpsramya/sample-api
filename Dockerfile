# Use the Alpine base image
FROM alpine:3.20


# Install required packages
RUN apk add --update --no-cache bash \
    python3 && ln -sf python3 /usr/bin/python
RUN apk add --update --no-cache poetry

# Set the working directory
WORKDIR /usr/src/app


# Copy the rest of the application
COPY . .

# Make sure the start-local.sh script is executable
RUN chmod +x start-local.sh run-unit-tests.sh

# Expose the application port
EXPOSE 3000

# Default command to run the application
CMD ["./start-local.sh"]

