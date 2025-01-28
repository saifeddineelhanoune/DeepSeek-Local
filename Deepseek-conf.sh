#!/bin/bash

docker run --runtime nvidia --gpus all \
	--name vllm_container \
	-v ~/.cache/huggingface:/root/.cachehuggingface \
	--env "HUGGING_FACE_HUB_TOKEN=<secret>" \
	-p 8000:8000 \
	--ipc=host \ 
	vllm/vllm-openai:latest \
	--model deepseek-ai/DeepSeek-R1

sleep 5

docker exec -it vllm_container bash -c "vllm serve deepseek-ai/DeepSeek-R1"

