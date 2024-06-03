# Elastic Beanstalk Deployment

## Table of Contents

- [React TS App Deployment](#React-ts-Deployment)
- [Spring Boot App Deployment](#spring-boot-deployment)

## React-ts-Deployment
 - Create Dockerfile in the root of the project
```yaml
name: Deploy React App to Elastic Beanstalk
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Build Docker image
        run: docker build -t <repository name> -f Dockerfile .
  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Generate deployment package
        run: zip -r deploy.zip . -x '*.git*'
      - name: Deploy to Elastic Beanstalk
        uses: einaregilsson/beanstalk-deploy@v18
        with:
          aws_access_key: ${{ secrets.AWS_ACCESS_KEY }}
          aws_secret_key: ${{ secrets.AWS_SECRET_KEY }}
          application_name: <application-name>
          environment_name: <environment-name>
          existing_bucket_name: <bucket-name>
          region: <region>
          version_label: ${{ github.sha }}
          deployment_package: deploy.zip
```
 - Create Dockerrun.aws.json in the root of the project
```yaml
version: '3'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - '80:80'
```
 