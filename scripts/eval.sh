#!/bin/bash

CKPT="outputs/sft-mix-3-cd5e3/checkpoints/checkpoint-2000"
DATA_FILE="val1_b3_t100_n5000_random.json"
DATA_DIR="data/b3_3_random_5e3"
RESULT_DIR="outputs/sft-mix-3-cd5e3/results"
BATCH_SIZE=2
CONTEXT_LENGTH=512

cd src

python eval_neo.py \
    --ckpt "${CKPT}" \
    -n 1000 -o 0 \
    -d "${DATA_FILE}" \
    --temperature 0. \
    --batch_size "${BATCH_SIZE}" \
    --ctx "${CONTEXT_LENGTH}" \
    --data_dir "${DATA_DIR}" \
    --result "${RESULT_DIR}" \
    --gens 1
