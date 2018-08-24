FROM python:3.6

ENV PROJECT_DIR=/projects

RUN mkdir ${PROJECT_DIR} \
  && apt-get -y update

# Install TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
  && tar -xvzf ta-lib-0.4.0-src.tar.gz \
  && cd ta-lib/ \
  && ./configure --prefix=/usr \
  && make \
  && make install
RUN rm -R ta-lib ta-lib-0.4.0-src.tar.gz

# Install python packages
RUN pip install --upgrade pip setuptools wheel
RUN pip install numpy==1.14.0 \
  && pip install scipy==1.0.0 \
  && pip install pandas==0.19.2 \
  && pip install enigma-catalyst==0.5.18 \
  && pip install TA-Lib \
  && pip install matplotlib \
  && pip install jupyter

WORKDIR ${PROJECT_DIR}
