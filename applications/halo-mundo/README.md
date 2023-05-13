

### Python 3.9.16
```Shell
python --version
```

### Setup env
```
pipenv --python 3.9 install flask python-dotenv
```

### 
* Activate the Pipenv shell
```
pipenv shell
```

* Setup environment variables
```
flask run --host=0.0.0.0 --port=3000
```

### Build an image
```
docker build --tag python-docker .
```

### Run the image `localhost:5000`
```
docker run --rm -it -p 5000:5000 python-docker
```