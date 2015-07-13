FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get install -y netbase python
ADD https://raw.github.com/pypa/pip/master/contrib/get-pip.py /get-pip.py    
RUN python /get-pip.py
RUN pip install "devpi-server>=2.1.0" "devpi-client>=2.1.0" \
        "requests>=2.4.0,<2.5"
VOLUME /mnt
EXPOSE 3141
ADD run.sh /
CMD ["/run.sh"]
