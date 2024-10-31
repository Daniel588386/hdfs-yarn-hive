# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Establecer variables de entorno
ENV HADOOP_VERSION 3.3.5
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV HDFS_NAMENODE_USER hadoop
ENV HDFS_DATANODE_USER hadoop
ENV YARN_RESOURCEMANAGER_USER hadoop
ENV YARN_NODEMANAGER_USER hadoop

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    ssh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Hadoop
RUN wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
    tar -xzf hadoop-$HADOOP_VERSION.tar.gz -C /usr/local/ && \
    mv /usr/local/hadoop-$HADOOP_VERSION $HADOOP_HOME && \
    rm hadoop-$HADOOP_VERSION.tar.gz

# Configurar SSH
RUN service ssh start && \
    mkdir -p /home/hadoop/.ssh && \
    chown -R hadoop:hadoop /home/hadoop/.ssh && \
    echo "hadoop" | passwd hadoop --stdin

# Copiar archivos de configuración de Hadoop
COPY config/* $HADOOP_HOME/etc/hadoop/

# Copiar el script de entrada
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Comando de inicio
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
