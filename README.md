# DevOps CI/CD Website

Simple HTML/CSS/JS site deployed to Amazon S3 and CloudFront with GitHub Actions.

## One-time AWS setup

1. Create an S3 bucket (leave **Block Public Access** on).
2. Create a CloudFront distribution:
   - Origin: the S3 bucket, using **Origin Access Control (OAC)**
   - Default root object: `index.html`
   - After the distribution is created, update the S3 bucket policy so CloudFront can read objects
3. Create an IAM user with permission to:
   - upload to that S3 bucket
   - create CloudFront invalidations for that distribution

## GitHub secrets

In the GitHub repo: **Settings → Secrets and variables → Actions**, add:

| Secret | Example |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | IAM access key |
| `AWS_SECRET_ACCESS_KEY` | IAM secret key |
| `AWS_REGION` | `ap-south-1` |
| `S3_BUCKET_NAME` | your bucket name |
| `CLOUDFRONT_DISTRIBUTION_ID` | `E123ABCDEF` |

## Prove CI/CD

1. Push `main` once the secrets exist. The pipeline runs Test → Build → Deploy.
2. Change `Version: 1.0` in `index.html` to `Version: 2.0` and push again.
3. After the workflow finishes, open the CloudFront URL (wait a minute if the old page is cached).
