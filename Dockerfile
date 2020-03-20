FROM dorowu/ubuntu-desktop-lxde-vnc
# VERSION 0.1.2
RUN DEBIAN_FRONTEND="noninteractive"
RUN apt update
RUN apt install -y build-essential gcc make perl dkms git vim lib32ncurses5-dev libreadline-dev libx11-dev cmake wget libx11-dev libxcomposite-dev git mailutils ufw
RUN service postfix start

RUN mkdir /usr/neurotools \
    && mkdir /usr/neurotools/nrn \
    && mkdir /usr/neurotools/bmtk
    
#CONDA
RUN cd /usr/neurotools \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x ./Miniconda3-latest-Linux-x86_64.sh \
    && ./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/neurotools/conda \
    &&  rm ./Miniconda3-latest-Linux-x86_64.sh

RUN /usr/neurotools/conda/bin/conda create -y -n py36 python=3.6 anaconda

### NEURON
#Setup

RUN mkdir /usr/neurotools/nrn/neuron_install\
    && cd /usr/neurotools/nrn/neuron_install \
    && wget https://neuron.yale.edu/ftp/neuron/versions/v7.7/nrn-7.7.tar.gz \
    && wget https://neuron.yale.edu/ftp/neuron/versions/v7.7/iv-19.tar.gz \ 
    && tar xzf iv-19.tar.gz \
    && tar xzf nrn-7.7.tar.gz \ 
    && rm iv-19.tar.gz \ 
    && rm nrn-7.7.tar.gz \
    && mv iv-19 iv \
    && mv nrn-7.7 nrn

#IV
RUN cd /usr/neurotools/nrn/neuron_install/iv \
    && ./configure --prefix=`pwd` \
    && make \
    && make install

#NRN
RUN cd /usr/neurotools/nrn/neuron_install/nrn \
    && ./configure --prefix=`pwd` --with-iv=/usr/neurotools/nrn/neuron_install/iv --with-nrnpython=/usr/neurotools/conda/envs/py36/bin/python \
    && make \
    && make install

#NRN PYTHON
RUN cd /usr/neurotools/nrn/neuron_install/nrn/src/nrnpython \
    && /usr/neurotools/conda/envs/py36/bin/python setup.py install

#PERSIST
RUN touch /usr/neurotools/nrnenv \
    && echo "export NRN_INSTALL_DIR=/usr/neurotools/nrn" >> /usr/neurotools/nrnenv \
    && echo "export NRN_DIR=\$NRN_INSTALL_DIR/neuron_install" >> /usr/neurotools/nrnenv \
    && echo "export IV=\$NRN_DIR/iv" >> /usr/neurotools/nrnenv \
    && echo "export N=\$NRN_DIR/nrn" >> /usr/neurotools/nrnenv \
    && echo "export CPU=x86_64" >> /usr/neurotools/nrnenv \
    && echo "export PATH=\"\$IV/\$CPU/bin:\$N/\$CPU/bin:\$PATH\"" >> /usr/neurotools/nrnenv 

#BMTK 
RUN cd /usr/neurotools/bmtk \
    && git clone https://github.com/AllenInstitute/bmtk \
    && cd bmtk \
    && /usr/neurotools/conda/envs/py36/bin/python setup.py develop

#BMTools
RUN cd /usr/neurotools \
    && git clone https://github.com/tjbanks/bmtools \
    && cd bmtools \
    && /usr/neurotools/conda/envs/py36/bin/python setup.py develop

#RUN chmod -v -R 777 /usr/neurotools

#VSCode
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
    && sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ \
    && sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && sudo apt-get install apt-transport-https \
    && sudo apt-get update \
    && sudo apt-get install code

RUN /usr/neurotools/conda/envs/py36/bin/pip install tensorflow keras allensdk

COPY rootfs /
ENTRYPOINT ["/startup2.sh"]

#RUN cd /usr/neurotools/ \
#    && git clone https://github.com/tjbanks/easy-nrn-install \
#    && cd easy-nrn-install \
#    && git checkout mini \ 
#    && ./easy-conda-install.sh /usr/neurotools \
#    && source ~/.bashrc
    
#RUN cd ~/easy-nrn-install \ 
#    && ./easy-nrn-install.sh /usr/neurotools
 
#RUN cd ~/easy-nrn-install \
#    && ./easy-bmtk-install.sh /usr/neurotools