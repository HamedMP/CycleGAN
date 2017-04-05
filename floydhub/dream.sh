#!/bin/bash
set -x
set -e -o pipefail

model=$1
echo "Training model: ${model}"

echo "Installing dependencies..."

luarocks install nngraph
luarocks install class
luarocks install https://raw.githubusercontent.com/szym/display/master/display-scm-0.rockspec

echo "Start training..."

model_name="$1_model"
DATA_ROOT="/input/datasets/$1" \
	name="${model_name}" \
	checkpoints_dir=/output/checkpoints \
	th train.lua


echo "purging intermediate models..."

rm -vf /output/checkpoints/${model_name}/[0-9]*.t7
rm -vf /output/checkpoints/${model_name}/latest_net_D_A.t7
rm -vf /output/checkpoints/${model_name}/latest_net_D_B.t7
