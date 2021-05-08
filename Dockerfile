ARG BASE_IMG=quay.io/redhat-github-actions/runner:latest
FROM $BASE_IMG AS java-runner

USER root

RUN dnf install -y java-11-openjdk-devel.x86_64 maven ant apache-ivy unzip wget rsync
RUN wget https://downloads.gradle-dn.com/distributions/gradle-6.3-bin.zip \
	&& unzip gradle-6.3-bin.zip && mv gradle-6.3 /usr/local/gradle \
	&& echo "export PATH=/usr/local/gradle/bin:$PATH" > /etc/profile.d/gradle.sh

USER $UID
