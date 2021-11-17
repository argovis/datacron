FROM python:3.7 as base

WORKDIR /usr/src/argo-database
COPY ./requirements.txt ./requirements.txt
RUN apt-get update && apt-get --assume-yes install libhdf5-serial-dev netcdf-bin libnetcdf-dev nano rsync
RUN pip install -r requirements.txt

FROM argovis/datacron:base-211117 as head
COPY ./*.py .
COPY ./*.nc .
RUN mkdir logs
RUN chown -R 1000830000:1000830000 /usr/src/argo-database
USER 1000830000:1000830000
CMD python add_profiles.py --dbName argo --subset tmp --logName tmp.log --npes 1
