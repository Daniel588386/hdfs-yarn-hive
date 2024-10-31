# Usa la imagen oficial de Hadoop
FROM apache/hadoop:3.3.5

# Establecer la variable de entorno
ENV HADOOP_HOME=/opt/hadoop

# Copiar los archivos necesarios al contenedor
COPY ./hadoop_config /opt/hadoop/etc/hadoop
COPY ./start-hdfs.sh /start-hdfs.sh

# Comando por defecto
CMD ["/bin/bash","/start-hdfs.sh"]
