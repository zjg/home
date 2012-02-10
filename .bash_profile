# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PYTHONPATH="/usr/lib/python2.6/site-packages"

# prepend_colon(val, var)
prepend_colon() {
  if [ -z "$2" ]; then
    echo $1
  else
    echo $1:$2
  fi
}

# unshift_path(path)
unshift_path() {
  if [ -d $1/sbin ]; then
    export PATH=$(prepend_colon "$1/sbin" $PATH)
  fi
  if [ -d $1/bin ]; then
    export PATH=$(prepend_colon "$1/bin" $PATH)
  fi

  if [ -d $1/share/man ]; then
    export MANPATH=$(prepend_colon "$1/share/man" $MANPATH)
  fi

  if [ -d $1/lib/pkgconfig ]; then
    export PKG_CONFIG_PATH=$(prepend_colon "$1/lib/pkgconfig" $PKG_CONFIG_PATH)
  fi
}

# TABULA RASA
export PATH=""
export MANPATH=""
export PKG_CONFIG_PATH=""

unshift_path ""
unshift_path "/usr"
unshift_path "/usr/local"
unshift_path "/opt/local"
unshift_path "$HOME/local"

export PATH=$(prepend_colon ".local" $PATH)

