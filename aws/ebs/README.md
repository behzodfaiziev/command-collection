# Elastic Beanstalk Deployment

## Table of Contents

- [React TS App Deployment](#React-ts-Deployment)
- [Spring Boot App Deployment](#spring-boot-deployment)

## React-ts-Deployment

### Create Dockerfile in the root of the project
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
          aws_access_key: ${{ secrets.<ENV>_AWS_ACCESS_KEY }}
          aws_secret_key: ${{ secrets.<ENV>_AWS_SECRET_KEY }}
          application_name: <application-name>
          environment_name: <environment-name>
          existing_bucket_name: <bucket-name>
          region: <region>
          version_label: ${{ github.sha }}
          deployment_package: deploy.zip
```

#### Create Dockerrun.aws.json in the root of the project
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

### Configure EC2 Role

- In AWS IAM servıce create a role with `AWS Service`
  in Trusted entities and `EC2` in Use case
- Attach these policies to the role
  - `AWSElasticBeanstalkWorkerTier`
  - `AWSElasticBeanstalkWebTier`
  - `AWSElasticBeanstalkMulticontainerDocker`
- Set the role name
  as ```aws-elasticbeanstalk-ec2-role-<applicationName>-react-<environmentName>```

### Configure IAM User

- In AWS IAM service create a user and attach ```AdministratorAccess-AWSElasticBeanstalk``` policy
- In Security Credentials of created user create an access key and secret key using CLI
- Add these keys to GitHub repository secrets as `<ENV>_AWS_ACCESS_KEY` and `<ENV>_AWS_SECRET_KEY`

### Create Elastic Beanstalk Application

##### Environment tier

- Select Web server environment

#### Application Information

- Enter application name: `<application-name>-React`

#### Environment information

- Enter environment name: `<environment-name>-React`

#### Domain Name

- You can use the default domain name or create a new one

#### Platform

- Select `Docker`
- Select `Docker running on 64bit Amazon Linux 2`
- Platform version: select the latest version

#### Presets

- Select `Single instance (free tier)`

- #### Go to Next Page

#### Service access

- Select `Create and use new service role` in Service role
- Select the role created in the previous step
#### Skip to review
- Review the configuration and click `Create environment`