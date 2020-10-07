const fs = require('fs');
const AWS = require('aws-sdk');

const s3 = new AWS.S3({});

const fileName = process.env.FILE;

const uploadFile = () => {
  fs.readFile(fileName, (err, data) => {
     if (err) throw err;
     const params = {
         Bucket: process.env.S3_BUCKET, // pass your bucket name
         Key: process.env.GITHUB_SHA, // file will be saved as testBucket/contacts.csv
         Body: JSON.stringify(data, null, 2)
     };
     s3.upload(params, function(s3Err, data) {
         if (s3Err) throw s3Err
         console.log(`File uploaded successfully at ${data.Location}`)
     });
  });
};

uploadFile();