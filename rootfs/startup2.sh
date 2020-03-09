#!/bin/bash

if [ -n "$VNC_PASSWORD" ]; then
    echo -n "$VNC_PASSWORD" > /.password1
    x11vnc -storepasswd $(cat /.password1) /.password2
    chmod 400 /.password*
    sed -i 's/^command=x11vnc.*/& -rfbauth \/.password2/' /etc/supervisor/conf.d/supervisord.conf
    export VNC_PASSWORD=
fi

if [ -n "$X11VNC_ARGS" ]; then
    sed -i "s/^command=x11vnc.*/& ${X11VNC_ARGS}/" /etc/supervisor/conf.d/supervisord.conf
fi

if [ -n "$OPENBOX_ARGS" ]; then
    sed -i "s#^command=/usr/bin/openbox.*#& ${OPENBOX_ARGS}#" /etc/supervisor/conf.d/supervisord.conf
fi

if [ -n "$RESOLUTION" ]; then
    sed -i "s/1024x768/$RESOLUTION/" /usr/local/bin/xvfb.sh
fi

USER=${USER:-root}
HOME=/root
if [ "$USER" != "root" ]; then
    echo "* enable custom user: $USER"
    useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $USER
    if [ -z "$PASSWORD" ]; then
        echo "  set default password to \"mizzou\""
        PASSWORD=mizzou
    fi
    HOME=/home/$USER
    echo "$USER:$PASSWORD" | chpasswd
    cp -r /root/{.gtkrc-2.0,.asoundrc} ${HOME}
    [ -d "/dev/snd" ] && chgrp -R adm /dev/snd
fi
sed -i -e "s|%USER%|$USER|" -e "s|%HOME%|$HOME|" /etc/supervisor/conf.d/supervisord.conf

# home folder
if [ ! -x "$HOME/.config/pcmanfm/LXDE/" ]; then
    mkdir -p $HOME/.config/pcmanfm/LXDE/
    ln -sf /usr/local/share/doro-lxde-wallpapers/desktop-items-0.conf $HOME/.config/pcmanfm/LXDE/
    chown -R $USER:$USER $HOME
fi

# home folder setup environment
echo "# >>> conda initialize >>>" >> $HOME/.bashrc
echo "# !! Contents within this block are managed by 'conda init' !!" >> $HOME/.bashrc
echo "__conda_setup=\"\$('/usr/neurotools/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)\"" >> $HOME/.bashrc
echo "if [ $? -eq 0 ]; then" >> $HOME/.bashrc
echo "    eval \"\$__conda_setup\"" >> $HOME/.bashrc
echo "else" >> $HOME/.bashrc
echo "    if [ -f \"/usr/neurotools/conda/etc/profile.d/conda.sh\" ]; then" >> $HOME/.bashrc
echo "        . \"/usr/neurotools/conda/etc/profile.d/conda.sh\"" >> $HOME/.bashrc
echo "    else" >> $HOME/.bashrc
echo "        export PATH=\"/usr/neurotools/conda/bin:\$PATH\"" >> $HOME/.bashrc
echo "    fi" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc
echo "unset __conda_setup" >> $HOME/.bashrc
echo "# <<< conda initialize <<<" >> $HOME/.bashrc

echo "conda activate py36" >> $HOME/.bashrc
echo "source /usr/neurotools/nrnenv" >> $HOME/.bashrc
echo "alias jupyter-notebook='jupyter notebook --ip=127.0.0.1 --allow-root'" >> $HOME/.bashrc
echo "alias update-bmtk='cd /usr/neurotools/bmtk/bmtk && git pull'" >> $HOME/.bashrc
echo "alias update-bmtools='cd /usr/neurotools/bmtools && git pull'" >> $HOME/.bashrc
#chown -R $USER:$USER /usr/neurotools

EXTRA_FILE=/startup_extra.sh
if test -f "$EXTRA_FILE"; then
    echo "executing $EXTRA_FILE"
    /bin/bash $EXTRA_FILE
fi

# nginx workers
sed -i 's|worker_processes .*|worker_processes 1;|' /etc/nginx/nginx.conf

# nginx ssl
if [ -n "$SSL_PORT" ] && [ -e "/etc/nginx/ssl/nginx.key" ]; then
    echo "* enable SSL"
	sed -i 's|#_SSL_PORT_#\(.*\)443\(.*\)|\1'$SSL_PORT'\2|' /etc/nginx/sites-enabled/default
	sed -i 's|#_SSL_PORT_#||' /etc/nginx/sites-enabled/default
fi

# nginx http base authentication
if [ -n "$HTTP_PASSWORD" ]; then
    echo "* enable HTTP base authentication"
    htpasswd -bc /etc/nginx/.htpasswd $USER $HTTP_PASSWORD
	sed -i 's|#_HTTP_PASSWORD_#||' /etc/nginx/sites-enabled/default
fi

# dynamic prefix path renaming
if [ -n "$RELATIVE_URL_ROOT" ]; then
    echo "* enable RELATIVE_URL_ROOT: $RELATIVE_URL_ROOT"
	sed -i 's|#_RELATIVE_URL_ROOT_||' /etc/nginx/sites-enabled/default
	sed -i 's|_RELATIVE_URL_ROOT_|'$RELATIVE_URL_ROOT'|' /etc/nginx/sites-enabled/default
fi

exec /bin/tini -- supervisord -n -c /etc/supervisor/supervisord.conf

#groupadd neuro
#chown -R $USER:neuro /usr/neurotools 

# clearup
PASSWORD=
HTTP_PASSWORD=

#exec /bin/tini -- supervisord -n -c /etc/supervisor/supervisord.conf

