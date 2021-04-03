ARG BASE_IMG=quay.io/redhat-github-actions/runner:latest
FROM $BASE_IMG AS java-runner

USER root

RUN dnf install -y java-11-openjdk-devel.x86_64 maven ant apache-ivy unzip wget gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_15.x | sudo -E bash -
RUN dnf install -y nodejs
RUN wget https://downloads.gradle-dn.com/distributions/gradle-6.3-bin.zip \
	&& unzip gradle-6.3-bin.zip && mv gradle-6.3 /usr/local/gradle \
	&& echo "export PATH=/usr/local/gradle/bin:$PATH" > /etc/profile.d/gradle.sh

USER $UID
