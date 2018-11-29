```
CFGDIR=.jldcfg
cd $HOME
git clone https://github.com/jldeon/config.git $CFGDIR
cd $CFGDIR
git submodule init
$CFGDIR/install.sh
. $CFGDIR/bash.cfg

```
