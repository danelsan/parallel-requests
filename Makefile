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
	$(PYTHON) -m parallel_reqs.main


# Pulizia dei file generati
clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete
	rm dist build parallel_reqs/parallel_reqs.egg-info -fr

# Test del progetto (assumendo che i test siano in una directory tests/)
test:
	$(PYTHON) -m unittest discover -s tests

docker:
	docker run --rm -ti -w /app -v $(PWD):/app python /bin/bash

push:
	python setup.py sdist bdist_wheel
	twine upload dist/*

# Visualizzazione delle opzioni disponibili
help:
	@echo "Usage:"
	@echo "  make install   - Install the package and dependencies"
	@echo "  make run       - Run the project"
	@echo "  make clean     - Clean up generated files"
	@echo "  make docker    - Show docker python"
	@echo "  make push      - Upload project on pypi"
	@echo "  make test      - Run the tests"
	@echo "  make help      - Show this help message"

