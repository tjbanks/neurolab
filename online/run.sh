# Due to issues with newer versions of BMTK and our code we'll be using an older version - (validated by Ziao)
# Must be done before copying the docs to the desktop.
cd /usr/neurotools/bmtk/bmtk/
git checkout 52fee3b230ceb14a666c46f57f2031c38f1ac5b1 .
cd -

cd $HOME
mkdir Desktop 
cd Desktop
git clone https://github.com/tjbanks/Tutorials_S2-S6
git clone https://github.com/chenziao/Computational-Neuroscience-Tutorials
# git clone https://github.com/tjbanks/bmtool-cell-prefab
# git clone https://github.com/tjbanks/two-cell-hco
git clone https://github.com/latimerb/Project_M1
rm ./Project_M1/ProjectM1_Solution.ipynb

mkdir bmtk
cp -r /usr/neurotools/bmtk/bmtk/docs/ ./bmtk/

git clone https://github.com/tjbanks/simagentmpi
cd simagentmpi
git checkout linux
/usr/neurotools/conda/envs/py36/bin/pip install -r requirements.txt

cd ..

chown -R $USER:$USER $HOME/Desktop

mv simagentmpi ..
echo "alias simagent='/usr/neurotools/conda/envs/py36/bin/python $HOME/simagentmpi/SimAgentMPI.py'" >> $HOME/.bashrc
echo "alias simagent-update='cd $HOME/simagentmpi && git pull && cd -'" >> $HOME/.bashrc

/usr/neurotools/conda/envs/py36/bin/pip install --upgrade bmtool

apt-get update
apt-get install zip unzip -qy

# Online learning resource - auto start jupyter notebooks
export SFILE="/etc/init.d/jupyter"

touch $SFILE

echo "#! /bin/sh">>$SFILE
echo "### BEGIN INIT INFO">>$SFILE
echo "# Provides: jupyter">>$SFILE
echo "# Required-Start: \$remote_fs \$syslog">>$SFILE
echo "# Required-Stop: \$remote_fs \$syslog">>$SFILE
echo "# Default-Start: 2 3 4 5">>$SFILE
echo "# Default-Stop: 0 1 6">>$SFILE
echo "# Short-Description: Jupyter">>$SFILE
echo "# Description: This file starts and stops Jupyter server">>$SFILE
echo "# ">>$SFILE
echo "### END INIT INFO">>$SFILE
echo "">>$SFILE
echo "case \"\$1\" in">>$SFILE
echo " start)">>$SFILE
#echo "   su $USER -c \"/usr/neurotools/conda/envs/py36/bin/jupyter notebook --ip=127.0.0.1 --allow-root --no-browser --NotebookApp.token=''\"">>$SFILE
echo "   sh -c \"sleep 1; echo $USER\" | script -qc "su $USER -c \"/usr/neurotools/conda/envs/py36/bin/jupyter notebook --ip=127.0.0.1 --allow-root --no-browser --NotebookApp.token=\'\'\""">>$SFILE
echo "   ;;">>$SFILE
echo " stop)">>$SFILE
echo "   sleep 10">>$SFILE
echo "   ;;">>$SFILE
echo " restart)">>$SFILE
echo "   sleep 20">>$SFILE
echo "   ;;">>$SFILE
echo " *)">>$SFILE
echo "   echo \"Usage: jupyter {start|stop|restart}\" >&2">>$SFILE
echo "   exit 3">>$SFILE
echo "   ;;">>$SFILE
echo "esac">>$SFILE

chmod a+x $SFILE

update-rc.d jupyter defaults





