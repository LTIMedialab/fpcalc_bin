# Pull ray docker image
FROM rayproject/ray:1.11.0-e2e-py39

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
