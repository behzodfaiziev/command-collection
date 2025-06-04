# 🛠️ Setting Up AWS Elastic Beanstalk in a Private VPC (Without Internet/NAT)

This guide explains how to configure **Elastic Beanstalk (EB)** to run in a **private VPC** by using **VPC endpoints** for AWS service access.

## 🔒 Why This Is Needed

When your EB EC2 instances are in **private subnets** (with **no Internet Gateway** or **NAT Gateway**), they **cannot** connect to AWS services like S3, Elastic Beanstalk, CloudFormation, etc.

To make this work, you must:
- Use **VPC Interface Endpoints** and **Gateway Endpoints**
- Set correct **security group rules**
- Use **internal ALB** for your EB environment

## ✅ Summary of Required VPC Endpoints

| Endpoint Type | Service Name                                        | Purpose                                      |
|---------------|-----------------------------------------------------|----------------------------------------------|
| **Gateway**   | `com.amazonaws.<region>.s3`                         | App bundle downloads/uploads                 |
| **Interface** | `com.amazonaws.<region>.elasticbeanstalk`           | Core EB API                                  |
| **Interface** | `com.amazonaws.<region>.elasticbeanstalk-health`    | Enhanced health reporting                    |
| **Interface** | `ssm`, `ssmmessages`, `ec2messages`                 | SSM Agent (Session Manager, patching, etc.)  |
| **Interface** | `cloudformation`                                    | EB infrastructure provisioning               |
| **Interface** | `logs`, `monitoring`                                | CloudWatch metrics and logs                  |
| **Interface** | `ec2`, `sts`, `autoscaling`, `elasticloadbalancing` | Runtime, role credentials, load balancer ops |

## 🪜 Step-by-Step Setup

### 1. Create Gateway Endpoint for S3

> 📍 Used for code bundles and EB configs (free, required)

1. Go to **VPC → Endpoints → Create Endpoint**
2. **Service category**: AWS services
3. **Service name**: `com.amazonaws.<region>.s3`
4. **Type**: **Gateway**
5. **VPC**: Your EB VPC
6. **Route tables**: Select the route tables for all **private subnets**
7. Click **Create Endpoint**

✅ No SGs required for gateway endpoints.

### 2. Create Interface Endpoints (one per service)

Repeat these steps for each of the required services (listed above):

1. Go to **VPC → Endpoints → Create Endpoint**
2. **Service category**: AWS services
3. Search for the service, e.g. `elasticbeanstalk`
4. **Type**: Interface
5. **VPC**: Your EB VPC
6. **Subnets**: Select your private subnets (same as EB uses)
7. **Security Groups**: Select the **EB EC2 SG** (e.g. `sg-0f33aa4a100bff352`)
8. Enable **Private DNS** (default is checked — leave it enabled)
9. Click **Create Endpoint**

### 3. Update Security Group Rules

If you're assigning the **same SG to the EB EC2 and the endpoint**, you must allow the SG to talk to itself:

1. Go to **EC2 → Security Groups**
2. Find the EB EC2 SG (e.g. `sg-0f33aa4a100bff352`)
3. Click **Edit Inbound Rules**
4. Add:
   ```
   Type: HTTPS
   Protocol: TCP
   Port Range: 443
   Source: sg-0f33aa4a100bff352
   Description: Allow EC2 to reach VPC Interface Endpoints
   ```

📌 This is called a **self-referencing rule** — required when same SG is used by both EC2 and VPC endpoint.

### 4. Choose "Full Access" Endpoint Policy

When creating each endpoint, for **"Policy"**, choose:
```
Policy type: Full Access
```

### 5. Configure Elastic Beanstalk

- Choose **Custom VPC** during environment creation
- Select your **private subnets** for instances and load balancer
- Set **Load Balancer type** = Application
- Choose **"Internal"** ALB scheme

### 6. Test & Rebuild

After setting up endpoints and security groups:

1. Go to **Elastic Beanstalk → Environment**
2. Click **Actions → Rebuild environment**
3. Check **Events tab** for messages like:
   - "Instance is healthy"
   - "Environment health transitioned to Green"

## 🧪 Optional Verifications

- Use **VPC Flow Logs** to confirm traffic from EC2 → VPC endpoint
- Try `curl https://elasticbeanstalk.<region>.amazonaws.com` from within EC2

## 🧰 Tools You Might Need

- **IAM roles** for EC2:
  - `AmazonSSMManagedInstanceCore`
  - `AWSElasticBeanstalkWebTier`
  - `AWSElasticBeanstalkMulticontainerDocker`

- **Security Group ID**: for EC2 and endpoint SG (can be the same SG)

---