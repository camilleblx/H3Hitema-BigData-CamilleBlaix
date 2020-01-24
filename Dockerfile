FROM ubuntu
RUN mkdir ./app
COPY . ./app
WORKDIR ./app
RUN apt-get update
RUN apt-get -y install python3.6
RUN apt-get -y install python3-pip git virtualenv -y
RUN virtualenv -p python3 big-data
EXPOSE 8888
RUN /bin/bash -c "source big-data/bin/activate"
RUN pip3 install -r Requierments.txt
CMD [ "jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root"]
