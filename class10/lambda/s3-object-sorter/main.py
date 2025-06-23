import boto3
import os
# list the files in bucket 

bucket=os.getenv('bucket_name', 'anotherdumyybubucket-here-879381241087')  # Use environment variable for bucket name
prefix=os.getenv('prefix', 'incoming/')  # Use environment variable for prefix

# s3 client
s3_client = boto3.client('s3')
def handler(event, context):
    response = s3_client.list_objects(
    Bucket=bucket,
    Prefix=prefix,
    Delimiter="/"  # Use 'prefix' to filter objects under the specified prefix
    ).get('Contents', [])

    for i in response:
        file = i.get('Key')
        if file:
            d = file.split('.txt')[0].split("-")[-1]
            month = file.split('.txt')[0].split("-")[3]
            year = file.split('.txt')[0].split("-")[2]
            filename = file.split('incoming/')[1]
            # print(f"Month: {month}, Year: {year}, day: {d}, file: {filename}, fullpath: {file}")
            
            s3_client.copy_object(
                            Bucket=bucket,
                            CopySource={'Bucket': bucket, 'Key': file},
                            Key=f"{prefix}{year}/{month}/{d}/{filename}"
                        )
            s3_client.delete_object(Bucket=bucket, Key=file)