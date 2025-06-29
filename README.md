# Stream of Search

## Introduction

This is the **final project for the CS106 - Artificial Intelligence course**.

We conducted a reproduction study and experimentation based on the paper: [Stream of Search: Learning to Search in Language (2024)](https://arxiv.org/abs/2404.03683).

The official source code from the authors is available at: [https://github.com/kanishkg/stream-of-search](https://github.com/kanishkg/stream-of-search).

The model is designed to learn search strategies for combinatorial problems, particularly the **Countdown task**, through three training paradigms:

- **Stream of Search (SoS)**: learning from BFS/DFS search streams.
- **Optimal Paths (OP)**: learning from optimal solutions.
- **Seft-Taught Reasoner (STaR)**: iterative self-improvement using self-generated data.

## Team Members

| Student ID | Name            |
| ---------- | --------------- |
| 22521094   | Trần Tuấn Phong |
| 22520862   | Huỳnh Nhật Minh |
| 20521182   | Đinh Phúc Diên  |

## Installation

### Environment

- OS: **Linux** (or **WSL/Ubuntu** on Windows)
- Python: **3.11**
- Tools: **Conda**, **PyTorch**, **DeepSpeed**

### Setup Instructions

1. **Install conda**

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

2. **Create and activate conda environment**

```bash
conda create -n sos python=3.11
conda activate sos
```

3. **Install the required packages**

```bash
pip install -r requirements.txt
```

**Notes:** Please ensure that your PyTorch version, CUDA Toolkit, and NVIDIA driver are compatible.

## How to Run the project

Note: When prompted by `wanb`, select option `(3) Don't visualize my results` if you don't have a W&B account.

1. Generate the SoS Dataset

```bash
sh scripts/gen_task.sh
```

2. Train the SoS model

```bash
sh scripts/train.sh
```

3. Evaluate the model

```bash
sh scripts/eval.sh
```

4. Generating data for STaR

```bash
sh scripts/gen_star.sh
```

5. Train the model with STaR

```bash
sh scripts/star.sh
```

## Adaptations for Local Laptop Setup

To ensure compatibility with personal laptops (e.g., NVIDIA GeForce MX450), we made the following changes:

- Reduced the Countdown task complexity from 4 numbers to 3 numbers.
- Modified several files to reduce memory usage and improve runtime:
  - `accelerate.yaml`
  - `gpt-neo-s.json`
  - `sft-mix-3-cd5e3.conf`
  - `star1-mix-3-cd5e3.conf`
  - `train.py`
  - `eval_neo.py`
  - `train.sh`
  - `gen_task.sh`
  - `eval.sh`
  - `gen_star.sh`
  - `star.sh`
- Details of the changes are available upon request.

## Project Structure

This repository is structured for efficient development, training, and evaluation:

### `analysis/`

**Purpose**: Contains scripts and tools for analyzing experimental results and generating plots.

### `configs/`

**Purpose**: Houses configuration files for various training settings.

- `gpt-neo-s.json`: For the GPT-Neo transformer model.
- `oft-mix-4-cd.conf`: For the Optimal Path (OP) model.
- `sft-mix-3-cd5e3.conf`: For the Stream of Search (SoS) model using 3-number countdown tasks.
- `star1-mix-3-cd5e3.conf`: For Star iteration 1 model using 3-number countdown tasks.
- `star2-mix-4-cd.conf`: For Star iteration 2 model.
- `star3-mix-4-cd.conf`: For Star iteration 3 model.

### `scripts/`

**Purpose**: Contains scripts for data generation and model training.

- `gen_task.sh`: Generates the 3-number countdown dataset.
- `train.sh`: Trains models for SoS settings.
- `gen_star.sh`: Generates data for Star iterations.
- `star.sh`: Trains models in Star setting.
- `eval.sh`: Evaluates the performance of the models.

### `src/`

**Purpose**: Includes all source code for model training, data generation, and evaluation.

- `countdown.py`: Generates countdown problem scenarios.
- `countdown_bfs.py`: Utilizes BFS for generating search streams.
- `countdown_dfs.py`: Utilizes DFS for generating search streams.
- `countdown_utils.py`: Provides utility functions for countdown scenarios.
- `countdown_generate.py`: Generates the countdown dataset.
- `countdown_optimal.py`: Adds optimal paths to the countdown dataset.
- `eval_neo.py`: Script for model evaluation.
- `train.py`: Executes model training processes.
