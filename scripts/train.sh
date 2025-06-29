#!/bin/bash

CONFIG_DIR="../configs"
ACCELERATE_CONFIG="$CONFIG_DIR/accelerate.yaml"
TRAIN_CONFIG="$CONFIG_DIR/sft-mix-3-cd5e3.conf"

cd src

accelerate launch \
  --config_file "$ACCELERATE_CONFIG" \
  train.py --config "$TRAIN_CONFIG"
