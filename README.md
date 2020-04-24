```
CFGDIR=$HOME/.jldcfg
cd $HOME
git clone https://github.com/jldeon/config.git $CFGDIR
cd $CFGDIR
git submodule update --init
./install.sh

# Logout/login, or source the shell-specific cfg file:
. $CFGDIR/bash.cfg
```
