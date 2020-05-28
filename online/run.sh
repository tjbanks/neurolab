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
#https://stackoverflow.com/questions/14297741/how-to-start-ipython-notebook-server-at-boot-as-daemon
touch /etc/systemd/system/ipython-notebook.service

echo "[Unit]" >> /etc/systemd/system/ipython-notebook.service
echo "Description=IPython notebook" >> /etc/systemd/system/ipython-notebook.service
echo "" >> /etc/systemd/system/ipython-notebook.service
echo "[Service]" >> /etc/systemd/system/ipython-notebook.service
echo "Type=simple" >> /etc/systemd/system/ipython-notebook.service
echo "PIDFile=/var/run/ipython-notebook.pid" >> /etc/systemd/system/ipython-notebook.service
echo "ExecStart=/usr/neurotools/conda/envs/py36/bin/jupyter notebook --ip=127.0.0.1 --allow-root --no-browser" >> /etc/systemd/system/ipython-notebook.service
echo "User=$USER" >> /etc/systemd/system/ipython-notebook.service
echo "Group=$USER" >> /etc/systemd/system/ipython-notebook.service
echo "WorkingDirectory=/home/$USER" >> /etc/systemd/system/ipython-notebook.service
echo "" >> /etc/systemd/system/ipython-notebook.service
echo "[Install]" >> /etc/systemd/system/ipython-notebook.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/ipython-notebook.service

systemctl daemon-reload
systemctl enable ipython-notebook
systemctl start ipython-notebook



