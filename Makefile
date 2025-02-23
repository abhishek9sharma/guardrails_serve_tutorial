help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  build       to build the Docker container for the app"
	@echo "  run         to start the Docker container for the app"
	@echo "  stop        to stop the Docker container for the app"
	@echo "  clean       to remove the Docker container and image"
	@echo "  format      to format the code"
	@echo "  test        to run tests"

#format:
#	docker-compose run --rm app sh -c "pip install black autopep8 flake8 && black src tests && autopep8 --in-place --recursive src tests && flake8 src tests"

# Variables
PYTHON_FILES := $(shell find . -name "*.py")
PYTHON_VERSION := 3.9
format:
	@echo "Formatting Python code..."
	pip3 install black
	pip3 install isort
	black src
	isort src
#   black .  && autopep8 --in-place --recursive . && flake8 src tests"

#	#@black $(PYTHON_FILES)
#	@isort $(PYTHON_FILES)
	@echo "Done!"


# test:
# 	docker-compose run --rm app pytest -v

up_with_build:
	docker-compose up -d --build 

up_with_build-dev:
	docker-compose build --build-arg TARGET=dev
	docker-compose up -d

build:
	docker-compose build

build-dev:
	docker-compose build --build-arg TARGET=dev

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	@ find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
	@ rm -rf *.pyc build dist tests/reports docs/build .pytest_cache .tox .coverage html/


	
# .PHONY: format test build up down run-dev
