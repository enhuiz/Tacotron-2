#!/bin/bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYENV_VERSION=tacotron2
source $ABSDIR/switch_cuda.sh 9.0
