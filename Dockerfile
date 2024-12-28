FROM python:3.9-slim
	
WORKDIR /app
	
RUN apt-get update -y \
   && apt-get upgrade -y \
   && apt-get install -y default-libmysqlclient-dev pkg-config \
   && rm -rf /var/lib/apt/lists/*
	
COPY requirements.txt .
	
RUN apt-get -y update -y
RUN apt-get install python3-dev -y
RUN apt-get install python3-dev default-libmysqlclient-dev build-essential -y
RUN pip install mysqlclient
RUN pip install -r requirements.txt
	
COPY . .
	
CMD ["python","app.py"]

