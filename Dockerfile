FROM runatlantis/atlantis:v0.8.2

RUN curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl && \
    # curl -o kubectl.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl.sha256 && \
    # openssl sha1 -sha256 kubectl && \
    chmod +x ./kubectl && \
    mkdir -p /usr/local/bin && cp ./kubectl /usr/local/bin/kubectl && export PATH=/usr/local/bin:$PATH && \
    # echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc && \
    kubectl version --short --client

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mkdir -p /usr/local/bin && cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && export PATH=/usr/local/bin:$PATH && \
    aws-iam-authenticator help

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]