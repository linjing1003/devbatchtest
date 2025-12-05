import os
import oss2

# 这些需要你自己从阿里云控制台获取 / 设置
ACCESS_KEY_ID = ""
ACCESS_KEY_SECRET = ""
BUCKET_NAME = "aigc-public-dataset"
ENDPOINT = "https://oss-cn-shanghai.aliyuncs.com"  # 换成你的地域 endpoint

if not ACCESS_KEY_ID or not ACCESS_KEY_SECRET:
    raise RuntimeError("请先设置环境变量 ALIBABA_ACCESS_KEY_ID / ALIBABA_ACCESS_KEY_SECRET")

# 要上传的本地文件
LOCAL_FILE_PATH = "/Users/zhangwenbin/Downloads/devdemo/devbatchtest/pythonfile/testfile1.txt"     # 本地文件路径
# 上传到 OSS 里的对象路径（key）
OSS_OBJECT_KEY = "huggingface/liveCodeBench/data/testfile1.txt"

# 创建 Auth 和 Bucket
auth = oss2.Auth(ACCESS_KEY_ID, ACCESS_KEY_SECRET)
bucket = oss2.Bucket(auth, ENDPOINT, BUCKET_NAME)

# 执行上传
with open(LOCAL_FILE_PATH, "rb") as f:
    result = bucket.put_object(OSS_OBJECT_KEY, f)

# 检查结果
print("Status:", result.status)  # 200 表示成功
if result.status == 200:
    url = f"https://{BUCKET_NAME}.oss-cn-shanghai.aliyuncs.com/{OSS_OBJECT_KEY}"
    print("File uploaded to:", url)
