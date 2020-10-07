# s3-upload-github-action
Upload github action for sending files to s3


## Usage

A github action to upload zip files for lambda function 
upload the file with the key REPONAME/(first 10 characters of the git sha)


```yaml
# inside .github/workflows/your-action.yml
name: Add File to Bucket
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
   - uses: actions/checkout@master
   
   - name: Upload file to bucket
     uses: kuperiu/s3-upload-github-action@master
     env:
       FILE: ./lambda.zip
       BUCKET_NAME: "artifacts-bucket"
```
