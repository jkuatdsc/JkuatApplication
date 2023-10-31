# Define variables
PROJECT_NAME = jkuatapp
DOCKER_COMPOSE = docker-compose
DOCKER_EXEC = $(DOCKER_COMPOSE) exec web
PYTHON_MANAGE = $(DOCKER_EXEC) python manage.py

# Default target when running 'make' without arguments
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  help          - Show this help message"
	@echo "  build         - Build the Docker images"
	@echo "  up            - Start the Docker containers"
	@echo "  down          - Stop and remove the Docker containers"
	@echo "  shell         - Open a shell in the web container"
	@echo "  migrate       - Run Django database migrations"
	@echo "  createsuperuser - Create a superuser for Django admin"
	@echo "  test          - Run Django tests"
	@echo "  lint          - Run code linters"
	@echo "  clean         - Remove generated files and directories"

# Build Docker images
.PHONY: build
build:
	$(DOCKER_COMPOSE) build

# Start Docker containers
.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d

# Stop and remove Docker containers
.PHONY: down
down:
	$(DOCKER_COMPOSE) down

# Open a shell in the web container
.PHONY: shell
shell:
	$(DOCKER_EXEC) bash

# Run Django database migrations
.PHONY: migrate
migrate:
	$(PYTHON_MANAGE) migrate

# Create a superuser for Django admin
.PHONY: createsuperuser
createsuperuser:
	$(PYTHON_MANAGE) createsuperuser

# Run Django tests
.PHONY: test
test:
	$(PYTHON_MANAGE) test

# Run code linters
.PHONY: lint
lint:
	$(DOCKER_EXEC) flake8 .

# Remove generated files and directories
.PHONY: clean
clean:
	find . -name "*.pyc" -exec rm -f {} \;
	rm -rf __pycache__ .cache

