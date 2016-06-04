FROM perl:5.20
MAINTAINER = Daniel Gempesaw <gempesaw@gmail.com>

# basic perl deps
RUN cpanm --notest --quiet Dist::Zilla
RUN cpanm --notest --quiet --installdeps Selenium::Remote::Driver

# get standalone server
RUN mkdir -p /opt/selenium
RUN wget --no-verbose https://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar -O /opt/selenium/selenium-server-standalone.jar

# get chrome
RUN echo 'deb http://httpredir.debian.org/debian testing main' >> /etc/apt/sources.list && \
        apt-get update && apt-get install -y \
        ca-certificates \
        curl \
        hicolor-icon-theme \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libv4l-0 \
        --no-install-recommends \
        && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
        && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
        && apt-get update && apt-get install -y \
        google-chrome-stable \
        --no-install-recommends

RUN apt-get clean && apt-get update

# get chromedriver
RUN apt-get install unzip
RUN wget -N http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip -P ~/Downloads
RUN unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads
RUN chmod +x ~/Downloads/chromedriver
RUN mv -f ~/Downloads/chromedriver /usr/local/bin/chromedriver

# libpcsclite1 keeps failing when being installed automatically, doing
# it explicitly seems to help
RUN apt-get install -y libpcsclite1

# install firefox, java, xvfb
RUN apt-get install -y iceweasel
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y xvfb

# get the newest version of our code
COPY . /opt/Selenium-Remote-Driver
WORKDIR /opt/Selenium-Remote-Driver
RUN dzil authordeps --missing | xargs -n 5 -P 10 cpanm --notest --quiet

RUN git config --global user.name "docker"
RUN git config --global user.email "docker@example.com"
ENV DISPLAY=:1

CMD ["/bin/bash", "start.sh"]
