#!/bin/bash

SEED=4
DATA_DIR="data/b3_3_random_5e3/"
RANGE=3
NUM_SAMPLES=5000

cd src

python countdown_generate.py \
    --seed "$SEED" \
    --data_dir "$DATA_DIR" \
    --min_range "$RANGE" \
    --start_range "$RANGE" \
    --num_samples "$NUM_SAMPLES"