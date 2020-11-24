#!bin/bash
# ASTRID - LCP
# author: Alex Carrega <alessandro.carrega@cnit.it>

# Clone the source code from the repository, copy the configuration files and install the dependencies with pip3 (python3 is required).

WORK_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$WORK_PATH/vars.sh"

git clone https://github.com/$PROJECT-project/$COMPONENT --branch $VERSION $INSTALLATION_PATH

cp "$WORK_PATH/../settings/$VERSION/config.ini" $INSTALLATION_PATH/

cd $INSTALLATION_PATH
pip3 install -r requirements.txt