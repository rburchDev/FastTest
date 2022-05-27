# Location of python3 artifactory
FROM        artifactory.charterlab.com/docker-public/python:3.9.5

# copy in makefile, requirements, fast.py
COPY        Makefile /
COPY        requirements.txt /
COPY        fast.py /
COPY        /data/salestax.json /data/
COPY        /data/target_urls.txt /data/

# Run updates on linux image before running Makefile
RUN         apt-get update
RUN         apt-get upgrade -y

# Run Makefile to start app
RUN         make venv/bin/activate

# Cmd to execute
Cmd         ./venv/bin/python3 fast.py

EXPOSE      5000
