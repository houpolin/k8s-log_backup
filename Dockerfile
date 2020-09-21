FROM centos:7

ENV TERM xterm

RUN rpm --import /etc/pki/rpm-gpg/RPM*
RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime

RUN     yum -y install wget \
	&& cd /etc/yum.repos.d/ \
        && wget http://rpms.adiscon.com/v8-stable/rsyslog.repo

RUN	yum -y install rsyslog\
	&& rm /etc/rsyslog.d/listen.conf

COPY	rsyslog.conf /etc/rsyslog.conf

CMD ["rsyslogd", "-n"]
