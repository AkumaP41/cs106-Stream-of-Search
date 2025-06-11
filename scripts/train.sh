#!/bin/bash

cd src

accelerate launch --config_file ../configs/accelerate.yaml train.py --config ../configs/sft-mix-4-cd.conf
