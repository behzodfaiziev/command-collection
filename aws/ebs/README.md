# Elastic Beanstalk Deployment

## Table of Contents

- [React TS App Deployment](#React-ts-Deployment)
- [Configure Nginx Redirection For Reat App](#Configure-Nginx-Redirection-For-React-App)
- [Spring Boot App Deployment](#spring-boot-deployment)

## React-ts-Deployment

### Create Dockerfile in the root of the project
```yaml
name: Deploy to Elastic Beanstalk
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.<ENV>_AWS_ACCESS_KEY }}
          aws-secret-access-key: ${{ secrets.<ENV>_AWS_SECRET_KEY }}
          aws-region: <REGION>

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1
      - name: Build, tag, and push image to Amazon ECR
        env:
          ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
          ECR_REPOSITORY: <REPOSITORY>
          IMAGE_TAG: ${{ github.sha }}
        run: |
          docker build \
          -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG

      - name: Prepare Dockerrun file
        run: |
          export IMAGE_TAG=${{ github.sha }}
          sed -i 's/<version-tag>/'"$IMAGE_TAG"'/g' Dockerrun.aws.json
          zip -r deploy.zip Dockerrun.aws.json .platform/

      - name: Deploy to Elastic Beanstalk
        uses: einaregilsson/beanstalk-deploy@v18
        with:
          aws_access_key: ${{ secrets.<ENV>_AWS_ACCESS_KEY }}
          aws_secret_key: ${{ secrets.<ENV>_AWS_SECRET_KEY }}
          application_name: <Application-Name>
          environment_name: <Environment-Name>
          existing_bucket_name: <SES-Bucket-Name>
          region: <REGION>
          version_label: ${{ github.sha }}
          deployment_package: deploy.zip
```

#### Create Dockerrun.aws.json in the root of the project
```yaml
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "<STRING>.dkr.ecr.<REGION>.amazonaws.com/<APP-NAME>:<version-tag>",
    "Update": "true"
  },
  "Ports": [{
    "ContainerPort": "80"
  }]
}
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



# Configure-Nginx-Redirection-For-React-App

### Create nginx.conf in the root of the project
```yaml
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files $uri /index.html;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

### Add the following lines to Dockerfile before EXPOSE 80
```yaml
COPY nginx.conf /etc/nginx/conf.d/default.conf
```