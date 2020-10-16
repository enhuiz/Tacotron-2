#!/bin/bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VERSION=tacotron2

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)

source $ABSDIR/switch_cuda.sh 9.0
