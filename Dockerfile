# step 1
# docker build -t hjklumper/bluesky .
# step 2
# docker run -it hjklumper/bluesky





# Start with a Python image.
FROM python:3.7.0
MAINTAINER Bart Steverink <bart@in2systems.nl>

# Some stuff that everyone has been copy-pasting
# since the dawn of time.
ENV PYTHONUNBUFFERED 1

# Install some necessary things.
RUN apt-get update && apt-get install -y \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

# Copy all our files into the image.
RUN mkdir /bluesky
WORKDIR /bluesky


COPY requirements.txt /bluesky/

# Install our requirements.
RUN pip install -U pip
RUN pip install -r requirements.txt

RUN pip install PyOpenGL==3.1.0

COPY . /bluesky/

# Specify the command to run when the image is run.
CMD ["python"]
