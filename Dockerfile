# step 1
# docker build -t herryklumper/bluesky .
# step 2
# docker run -it herryklumper/bluesky
# docker run herryklumper/bluesky als je een lokaal bestand start
# # docker run -it herryklumper/bluesky /bin/bash


# Start with a Python image.
FROM python:3.7.0
MAINTAINER Herry Klumper<herry.klumper@gmail.com>

# Some stuff that everyone has been copy-pasting
# since the dawn of time.
ENV PYTHONUNBUFFERED 1

# Install some necessary things.
RUN apt-get update && apt-get install -y \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

# Copy all our files into the image.
RUN mkdir /bluesky
WORKDIR /bluesky


COPY requirements.txt /bluesky

# Install our requirements.
RUN pip install -U pip # naar latest version upgrade
RUN pip install -r requirements.txt

COPY . /bluesky

# Specify the command to run when the image is run.
CMD ["python" ,"BlueSky.py"]
