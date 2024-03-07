# Makefile for ipyxact
#

test: test-unit test-self-test

test-self-test:
	cd examples/ && ./self_test.sh

test-unit:
	python tests/unit/IpxactInt.py

# Install the package in development mode for testing
install:
	pip install -e .

# Create .venv unless it exists
.venv:
	python3 -m venv .venv

