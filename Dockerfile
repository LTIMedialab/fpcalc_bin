# Pull ray docker image
#FROM rayproject/ray:1.11.0-e2e-py39
FROM rayproject/ray:1.12.0

#
WORKDIR /code

#
COPY ./requirements.txt /code/requirements.txt

# Using root user
USER root

# Download apt-key and add
RUN wget https://packages.cloud.google.com/apt/doc/apt-key.gpg && apt-key add apt-key.gpg

# Update apt-get
RUN apt-get update -y

# Install libmediainfo-dev
RUN apt-get install -y libmediainfo-dev

# Install libchromaprint-tools (fpcalc)
RUN apt-get install libchromaprint-tools --assume-yes

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install requirements
RUN pip install -r /code/requirements.txt