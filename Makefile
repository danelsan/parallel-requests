# Nome del pacchetto
PACKAGE_NAME = parallel_requests

# Comandi per Python e pip
PYTHON = python
PIP = pip

# Installazione delle dipendenze
install:
	$(PIP) install .

# Esecuzione del progetto
run:
	$(PYTHON) -m parallel_requests.main

# Pulizia dei file generati
clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete
	rm build parallel_requests.egg-info -fr

# Test del progetto (assumendo che i test siano in una directory tests/)
test:
	$(PYTHON) -m unittest discover -s tests

docker:
	docker run --rm -ti -w /app -v $(PWD):/app python /bin/bash

# Visualizzazione delle opzioni disponibili
help:
	@echo "Usage:"
	@echo "  make install   - Install the package and dependencies"
	@echo "  make run       - Run the project"
	@echo "  make clean     - Clean up generated files"
	@echo "  make test      - Run the tests"
	@echo "  make help      - Show this help message"

