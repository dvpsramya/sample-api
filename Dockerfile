FROM python:3.12-slim
# Set working directory
WORKDIR /application/
# Prevent Python from writing bytecode and enable unbuffered mode
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"
# Copy only the pyproject.toml and poetry.lock to optimize caching
COPY pyproject.toml poetry.lock ./
# Install Python dependencies using Poetry
RUN poetry config virtualenvs.in-project true \
    && poetry install --no-root --only main
# Copy the source code
COPY src/ .
# Copy the start-local and test scripts
COPY start-local.sh run-unit-tests.sh ./
RUN chmod +x ./start-local.sh ./run-unit-tests.sh
# Expose port 3000 for the FastAPI application
EXPOSE 3000
# Set the start-local and command to start the FastAPI application
ENTRYPOINT ["/application/start-local.sh"]

