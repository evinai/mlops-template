install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt


test:
	#python -m pytest -vv --cov=main --cov=mylib test_*.py


format:
	black *.py black mylib/*.py

lint:
	pylint --disable=R,C --extension-pkg-whitelist=pydantic main.py --ignore-patterns=test_.*?py *.py mylib/*.py
	pylint --disable=R,C mylib/*.py


container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile


refactor: format lint


deploy:
	#docker build -t app .
	#docker run -d -p 8000:8000 app

all: install lint test format deploy