#!/bin/bash
set -x
set -e -o pipefail

model=$1
echo "Testing model: ${model}"

test_data_dir=$2
echo "Testing data dir: ${test_data_dir}"

echo "Installing dependencies..."

luarocks install nngraph
luarocks install class
luarocks install https://raw.githubusercontent.com/szym/display/master/display-scm-0.rockspec

echo "Start training..."

tmp_data_dir="_tmp_data_dir"
mkdir -p "${tmp_data_dir}"
cp -r "${test_data_dir}" "${tmp_data_dir}/testA"
cp -r "${test_data_dir}" "${tmp_data_dir}/testB"

model_name="${model}_model"
mkdir -p "./checkpoints/${model_name}"
cp "/input/checkpoints/${model_name}/opt_train.txt" \
	"./checkpoints/${model_name}/opt_test.txt"
# TODO: also support B to A
cp "/input/checkpoints/${model_name}/latest_net_G_A.t7" \
	"./checkpoints/${model_name}/latest_net_G.t7"

DATA_ROOT="${tmp_data_dir}" \
	results_dir="/output" \
	name="${model_name}" \
	model=one_direction_test \
	phase=test \
	loadSize=256 fineSize=256 resize_or_crop="scale_width" \
	th test.lua
