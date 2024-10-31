#!/bin/bash

# Iniciar el servicio SSH
service ssh start

# Formatear el Namenode
hdfs namenode -format

# Iniciar el HDFS y YARN
start-dfs.sh
start-yarn.sh

# Mantener el contenedor en ejecución
tail -f /dev/null
