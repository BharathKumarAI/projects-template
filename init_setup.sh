# Shell script to setup the environment for the init script

# Set up the environment
echo "Setting up the environment"
echo "running Makefile"
make activate
make setup

## Set up the environment using requirements.txt
# echo [$(date)]: "START"
# export _VERSION_=3.9
# echo [$(date)]: "creating environment with python ${_VERSION_}"
# conda create --prefix ./env python=${_VERSION_} -y
# echo [$(date)]: "activate environment"
# source activate ./env
# echo [$(date)]: "install requirements"
# pip install -r requirements.txt
# # echo [$(date)]: "export conda environment"
# # conda env export > conda.yaml
# echo [$(date)]: "create an src/utils directory and files"
# mkdir -p src/utils && touch src/__init__.py src/main.py

# to remove everything -
# rm -rf env/ .gitignore conda.yaml README.md .git/