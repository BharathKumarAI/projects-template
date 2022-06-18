# Template

Templates are meant for flexibility. we can adjust or modify this template based on our project needs.

This template is created based on the cookiecutter

```python
# Installing cookiecutter
pip install cookiecutter

# Create a project based on the template
cookiecutter https://github.com/khuyentran1401/data-science-template
```

## References

1. https://towardsdatascience.com/how-to-structure-a-data-science-project-for-readability-and-transparency-360c6716800
2. https://github.com/c17hawke/packaging_template
3. https://github.com/c17hawke/dvc-project-template

## Tools used in this project

- [Poetry](https://towardsdatascience.com/how-to-effortlessly-publish-your-python-package-to-pypi-using-poetry-44b305362f9f): Dependency management - [article](https://towardsdatascience.com/how-to-effortlessly-publish-your-python-package-to-pypi-using-poetry-44b305362f9f)
- [hydra](https://hydra.cc/): Manage configuration files - [article](https://towardsdatascience.com/introduction-to-hydra-cc-a-powerful-framework-to-configure-your-data-science-projects-ed65713a53c6)
- [pre-commit plugins](https://pre-commit.com/): Automate code reviewing formatting - [article](https://towardsdatascience.com/4-pre-commit-plugins-to-automate-code-reviewing-and-formatting-in-python-c80c6d2e9f5?sk=2388804fb174d667ee5b680be22b8b1f)
- [DVC](https://dvc.org/): Data version control - [article](https://towardsdatascience.com/introduction-to-dvc-data-version-control-tool-for-machine-learning-projects-7cb49c229fe0)
- [pdoc](https://github.com/pdoc3/pdoc): Automatically create an API documentation for your project

## Project structure

```bash
.
├── artifacts                       # Intermediate products
├── config
│   ├── main.yaml                   # Main configuration file
│   ├── model                       # Configurations for training model
│   │   ├── model1.yaml             # First variation of parameters to train model
│   │   └── model2.yaml             # Second variation of parameters to train model
│   └── process                     # Configurations for processing data
│       ├── process1.yaml           # First variation of parameters to process data
│       └── process2.yaml           # Second variation of parameters to process data
├── data
│   ├── cleaned                     # data after cleaning (Can be combined with processed)
│   ├── final                       # data after training the model
│   ├── processed                   # data after processing
│   ├── raw                         # raw data
│   ├── test                        # data for testing
│   ├── train                       # data for training
│   └── raw.dvc                     # DVC file of data/raw
├── deploy
│   ├── conda_envs                  # conda enviornment configurations for deployment
│   └── docker                      # docker file
├── docs                            # documentation for your project
├── logs                            # log files
├── dvc.yaml                        # Stages/pipeline - dvc reproduce command will refer to `dvc.yaml` and creates a pipeline. check [dvc.yaml](https://dvc.org/doc/user-guide/project-structure/pipelines-files#pipelines-files-dvcyaml) for more details
├── .flake8                         # configuration for flake8 - a Python formatter tool -
├── .gitignore                      # ignore files for git
├── Makefile                        # store useful commands to set up the environment
├── models                          # store models
├── notebooks                       # store notebooks
│   ├── reference                   # experiment/eda/reference notebooks
├── production                      # production related scripts like scroing/monitoring
├── reports                         # scripts for monitering health of deployed projects
├── .pre-commit-config.yaml         # configurations for pre-commit -- checks code formatting, code style, and code style conventions before committing to Git. See [pre-commit plugins](https://pre-commit.com/).
├── pyproject.toml                  # dependencies for poetry - see [Poetry](https://towardsdatascience.com/how-to-effortlessly-publish-your-python-package-to-pypi-using-poetry-44b305362f9f)
├── README.md                       # describe your project
├── src                             # store source code
│   └── package_name                # in case packaging is needed. replace package_name with actual package name (optional).
│        ├── __init__.py            # make src a Python module
│        ├── process.py             # process data before training model
│        └── train_model.py         # train model
├── tests                           # store tests for your project
│   ├── __init__.py                 # make tests a Python module
│   ├── test_process.py             # test functions for process.py
│   └── test_train_model.py         # test functions for train_model.py
├── LICENCE                         # LICENCE details of the project
├── init_setup.sh                   # script to initiate the project
├── setup.cfg                       # configuration file for setuptools. much of this configuration may be able to move to pyproject.toml. (optional)
└── setup.py                        # build script for setuptools. It tells setuptools about your package (such as the name and version) as well as which code files to include (optional) - converts src as module.
```

**Note:** Refer packaging details [here](https://packaging.python.org/en/latest/tutorials/packaging-projects/)

## Set up the environment

1. Install [Poetry](https://python-poetry.org/docs/#installation)
2. Set up the environment: (we can include this details in `init_setup.sh` and initiate shell script)

```bash
# Direct
make activate
make setup
```

```bash
# initiating through shell script

cd <script_folder>
sh init_setup.sh # include the direct steps in the script
```

## Install new packages

To install new PyPI packages, run:

```bash
poetry add <package-name>
```

## Run the entire pipeline

To run the entire pipeline, type:

```bash
dvc repo
```

## Version your data

Read [this article](https://towardsdatascience.com/introduction-to-dvc-data-version-control-tool-for-machine-learning-projects-7cb49c229fe0) on how to use DVC to version your data.

Basically, you start with setting up a remote storage. The remote storage is where your data is stored. You can store your data on DagsHub, Google Drive, Amazon S3, Azure Blob Storage, Google Cloud Storage, Aliyun OSS, SSH, HDFS, and HTTP.

```bash
dvc remote add -d remote <REMOTE-URL>
```

Commit the config file:

```bash
git commit .dvc/config -m "Configure remote storage"
```

Push the data to remote storage:

```bash
dvc push
```

Add and push all changes to Git:

```bash
git add .
git commit -m 'commit-message'
git push origin <branch>
```

# Auto-generate API documentation

To auto-generate API document for your project, run:

```bash
make docs
```
