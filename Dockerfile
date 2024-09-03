# Use the Alpine base image
FROM alpine:3.20

# Install required packages
RUN apk add --update --no-cache bash \
    python3 && ln -sf python3 /usr/bin/python
RUN apk add --update --no-cache poetry

# Set the working directory
WORKDIR /usr/src/app

COPY pyproject.toml pyproject.toml 
RUN poetry install --no-root -vvv --sync

# Copy the rest of the application
COPY . .

# Expose the application port
EXPOSE 3000

# Set the entry point to run the FastAPI application
ENTRYPOINT ["poetry", "run", "fastapi", "dev", "--host", "0.0.0.0", "--port", "3000", "src/sample_api/main.py"]
