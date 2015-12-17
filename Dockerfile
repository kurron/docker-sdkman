FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="sdkman" org.kurron.ide.version=2.4.3

RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
    
ENV SDKMAN_DIR=/opt/sdkman
RUN curl --silent http://get.sdkman.io | bash

#source "/opt/sdkman/bin/sdkman-init.sh"

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["source \"/opt/sdkman/bin/sdkman-init.sh\""]
CMD ["sdk version"]
