#!bin/bash
# ASTRID - LCP
# author: Alex Carrega <alessandro.carrega@cnit.it>

# Clone the source code from the repository, copy the configuration files and install the dependencies with pip3 (python3 is required).

WORK_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$WORK_PATH/vars.sh"

mkdir -p $COMPONENT_PATH
rm -f $COMPONENT_PATH/$COMPONENT
ln -fs $WORK_PATH $COMPONENT_PATH/$COMPONENT

if [ -d "$INSTALLATION_PATH" ]; then
    git pull
else
    git clone "https://github.com/$PROJECT-project/$COMPONENT" --branch "$VERSION" "$INSTALLATION_PATH"
fi

cp "$WORK_PATH/../settings/$VERSION/config.ini" "$INSTALLATION_PATH/"

cd "$INSTALLATION_PATH"
pip3 install -r requirements.txt
