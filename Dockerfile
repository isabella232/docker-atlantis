FROM runatlantis/atlantis:v0.8.2

RUN curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl && \
    # curl -o kubectl.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl.sha256 && \
    # openssl sha1 -sha256 kubectl && \
    chmod +x ./kubectl && \
    mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH && \
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc && \
    kubectl version --short --client

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]