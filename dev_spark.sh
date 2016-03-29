#!/bin/bash
# reference: https://mas-dse.github.io/DSE230/installation/linux/
sudo -v

function start_jupyter() {
  # edit IP address: ~/.jupyter/jupyter_notebook_config.py: c.NotebookApp.ip = '0.0.0.0'
  # param: path
  if [[ $# -eq 0 ]] ; then
    echo 'Error: Please specify the work directory.'
    return
  fi

  export SPARK_PATH="/usr"
  export PYSPARK_DRIVER_PYTHON="jupyter"
  export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
  # Uncomment next line if the default python on your system is python3
  # export PYSPARK_PYTHON=python3
  sudo chmod 777 $HOME/.local/
  cd "$1"
  $SPARK_PATH/bin/pyspark --master local[2]
}
