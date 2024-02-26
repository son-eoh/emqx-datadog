FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get install -y git wget nano curl zsh
RUN apt-get install -y build-essential supervisor nginx

RUN chsh -s $(which zsh) && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    echo "export PS1=\"(Docker)\$PS1\"" >> /root/.zshrc

RUN mkdir /usr/lib/emqx && mkdir /usr/lib/emqx/data
RUN chmod -R 777 /usr/lib/emqx/data

RUN wget https://www.emqx.com/en/downloads/broker/5.5.0/emqx-5.5.0-ubuntu22.04-amd64.deb && \
    apt-get install ./emqx-5.5.0-ubuntu22.04-amd64.deb

RUN DD_API_KEY=xxx DD_INSTALL_ONLY=true bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"
