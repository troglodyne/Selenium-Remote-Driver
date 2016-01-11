FROM perl:5.12

RUN git config --global user.name "TravisCI"
RUN git config --global user.email $HOSTNAME":not-for-mail@travis-ci.org"
RUN cpanm -nf Selenium::Remote::Driver
RUN cpanm App::cpanminus

ADD . /root/Selenium-Remote-Driver
WORKDIR /root/Selenium-Remote-Driver
RUN cpanm -n --installdeps .

CMD perl -Ilib t/Firefox-Profile.t