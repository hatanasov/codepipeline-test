FROM public.ecr.aws/codebuild/amazonlinux2-x86_64-standard:3.0

### Install wget, unzip, curl, python ###
RUN yum -y install unzip curl; yum clean all

### Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
  && unzip -q /tmp/awscliv2.zip -d /opt \
  && /opt/aws/install \
  && rm  tmp/awscliv2.zip \
  && rm -rf  /opt/aws

RUN curl "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_386.zip" -o "/tmp/terraform_1.1.5_linux_386.zip" \
  && unzip -q /tmp/terraform_1.1.5_linux_386.zip -d /usr/local/bin \ 
  && rm /tmp/terraform_1.1.5_linux_386.zip

