FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get install -y openjdk-8-jdk openjdk-8-jre python3 vim curl bash && curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup --yes && echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | tee /etc/apt/trusted.gpg.d/sbt.asc && apt-get update && apt-get install -y sbt && useradd -m -g users User

USER User
WORKDIR /home/User

CMD ["bash"]