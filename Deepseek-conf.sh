#!/bin/bash

pip install vllm

vllm serve "deepseek-ai/DeepSeek-R1-Zero"

curl -X POST "http://localhost:8000/v1/chat/completions" \
	-H "Content-type: application/json" \
	--data '{
		"model": "deepseek-ai/DeepSeek-R1-Zero",
		"messages": [
			{
				"role": "user",
				"content": "What is the capital of France?"
			}
		]
	}'
