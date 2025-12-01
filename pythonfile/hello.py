import requests
import json

url = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions"
headers = {
    "Authorization": "Bearer sk-fccb32f7b4ae4969a5e88ec8449e8634",
    "Content-Type": "application/json",
}

payload = {
    "model": "qwen-plus",
    "messages": [
        {"role": "user", "content": "写一个 Hello World"}
    ]
}

response = requests.post(url, headers=headers, json=payload)

print(response.text)
