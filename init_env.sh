#!/bin/bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv virtualenv tacotron2
export PYENV_VERSION=tacotron2

pyenv versions
pip install -r $ABSDIR/requirements.txt

echo done.
