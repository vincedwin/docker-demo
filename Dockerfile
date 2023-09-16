FROM python:3.10-slim

#create a dirc call code, this will be the starting dirc of the pj
WORKDIR /code

#install dependency
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src ./src
#run fastapi => uvicorn main:app --reload
CMD ["uvicorn", "src.main:app", "--host", "loaclhost", "--port", "80", "--reload"]

#tips- this name is best wot hv NAME-image and . for current dirc
#CMD - docker build -t fastapi-image .
#CMD - docker images
#CMD - docker run --name fastapi-container -p 80:80 fastapi-image
#CMD - docker rm fastapi-container
#CMD - docker run --name fastapi-container -p 80:80 -d fastapi-image
#CMD - docker stop fastapi-container
#CMD - docker run --name fastapi-container -p 80:80 -d -v $(pwd):/code fastapi-image
