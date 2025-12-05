import oss2

# 这些需要你自己从阿里云控制台获取 / 设置
access_key_id = ""
access_key_secret = ""
bucket_name = "aigc-public-dataset"
endpoint = "https://oss-cn-shanghai.aliyuncs.com"  # 换成你的地域 endpoint

auth = oss2.Auth(access_key_id, access_key_secret)
bucket = oss2.Bucket(auth, endpoint, bucket_name)

object_key = "huggingface/liveCodeBench/data/biannual_2024_7_12-00000-of-00001.parquet"  # 文件在 bucket 中的路径

try:
    result = bucket.get_object(object_key)
    content = result.read(200)  # 读前 200 字节看看
    print("Read success, first 200 bytes:", content)
except Exception as e:
    print("Error:", e)
