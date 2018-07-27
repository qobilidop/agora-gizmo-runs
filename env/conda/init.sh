#!/usr/bin/env bash
set -e

echo "Install local Python packages"
source enable-conda
conda env create -f "$REPO_DIR/env/conda/environment.yml" -p "$LOCAL_CONDA_PREFIX"

conda activate "$LOCAL_CONDA_PREFIX"
cd "$REPO_DIR/code"
pip install -e .
