const fs = require('fs');
const AWS = require('aws-sdk');

const bucketName = process.env.BUCKET_NAME;
const file = process.env.FILE;
const sha = process.env.GITHUB_SHA.substring(0,10);
const repoName = process.env.GITHUB_REPOSITORY.split('/');
const key = repoName[1] + '/' + sha + '.zip';

const s3 = new AWS.S3({});
const uploadFile = (fileName) => {
    // Read content from the file
    const fileContent = fs.readFileSync(fileName);

    // Setting up S3 upload parameters
    const params = {
        Bucket: bucketName,
        Key: key, // File name you want to save as in S3
        Body: fileContent
    };

    // Uploading files to the bucket
    s3.upload(params, function(err, data) {
        if (err) {
            throw err;
        }
        console.log(`File uploaded successfully. ${data.Location}`);
    });
};

uploadFile(file);
