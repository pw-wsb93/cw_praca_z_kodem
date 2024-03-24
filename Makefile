install:
	pip install -r requirements.txt
run:
	python -m flask run


test:
	python -m pylint app.py