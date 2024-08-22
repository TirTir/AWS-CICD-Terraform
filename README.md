## Terraform을 활용한 AWS 클라우드 기반 CI/CD 파이프라인 코드화 구현

<p align="center">
  <br/>
  <img src="https://github.com/user-attachments/assets/50c8cb95-0eb0-44a1-b45e-a5d960875a3f" width="400" height="170">
  <br/>
</p>

### 프로젝트 소개
---

#### 테라폼이란?
<p>
  <br/>
  <img src="https://github.com/user-attachments/assets/2d2e55da-a7b7-42c6-a7c0-d694e2661512" width="400" height="100">
  <br/>
</p>

클라우드 및 온프레미스 리소스를 안전하고 효율적으로 빌드, 변경 및 버전화할 수 있는 코드형 인프라 도구입니다.

API를 호출해 명령을 실행하는 절차적인 방법과 달리 HCL 언어로 선언적으로 클라우드 리소스를 정의하기 때문에 여러번 테라폼을 실행하더라도 여러 개의 리소스가 만들어지지 않는다는 장점을 가지고 있습니다.

<p>
  <br/>
</p>

#### AWS CI/CD 구성 요소 
<p>
  <br/>
  <img src="https://github.com/user-attachments/assets/845def7f-6257-43d8-b646-2b9dedc4eed0" width="400" height="120">
  <br/>
</p>

AWS에서는 CI/CD를 구축하기 위해 네 가지 서비스를 이용할 수 있습니다.
- CodeCommit : 깃허브에서 AWS CodeCommit으로 소스 코드를 마이그레이션
- CodeBuild : 소스 코드를 컴파일하고 테스트를 실행하며 배포 준비가 된 소프트웨어 패키지를 생성 및 관리
- CodePipeline : 코드를 지속적으로 제공하는 파이프 라인을 구축
- CodeDeploy : 코드를 EC2 서버에 배포

<p>
  <br/>
</p>

### 시스템 구성도

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/70ecdcac-ebff-4674-b222-34d72a778fc2" width="500" height="200">
  <br/>
  <br/>
</p>

#### * ECR (EC2 Container Registry)
개발자가 Docker 컨테이너 이미지를 손쉽게 저장, 관리 및 배포할 수 있게 해주는 완전관리형 Docker 컨테이너 레지스토리

<p>
  <br/>
</p>


### 구현 기능

---

**1. ECR & Git Repository 생성**

```plaintext
app/
└── env/
    └── build/
        ├── Dockerfile
        └── buildspec.yml
```

- 깃허브 레포지토리에 도커파일 스크립트를 올리면, ECR과 연동하여 자동으로 이미지를 빌드하고, 결과를 ECR에 저장할 수 있습니다.

**2. S3 & DynamoDB 생성**

```plaintext
project/
└── s3/
    ├── dynamodb.tf
    ├── outputs.tf
    ├── s3.tf
    └── terraform.tfstate
```

- **Terraform의 상태 파일**(tfstate)을 원격으로 관리하기 위해 **S3 버킷**과 **DynamoDB 테이블**을 생성합니다.
- **S3 버킷**은 **상태 파일을 저장**하는 데 사용되며, **DynamoDB**는 상태 파일에 대한 **잠금 기능**을 제공하여 **다중 사용자의 충돌을 방지**합니다.
- **버킷**은 **버전 관리 및 서버 측 암호화를 활성화**하고, **퍼블릭 액세스를 차단**하는 구성으로 설정됩니다.

**3. 네트워크 구성**

<p align="center">
  <img src="https://github.com/user-attachments/assets/7b19354f-5694-423c-b883-e88d962d22f7" width="400" height="300">
  <br/>
  <br/>
</p>

```plaintext
project/
└── vpc/
    ├── internet-gateway.tf
    ├── nat-gateway.tf
    ├── outputs.tf
    ├── route-table.tf
    ├── subnets.tf
    ├── variable.tf
    └── vpc.tf
```

- 하나의 VPC에 2개의 가용 영역을 생성한 후, **2개의 Public 서브넷과 Private 서브넷**을 위치시킵니다.
- **Nat 게이트웨이**를 통해 인터넷에 접근할 수 있도록 설정하고, **외부로부터 들어오는 트래픽을 ALB로 처리**합니다.

**4. Bastion 인스턴스 생성**

```plaintext
project/
└── ec2/
    ├── instance.tf
    ├── outputs.tf
    ├── terraform.tf
    └── variable.tf
```

- 이미지 생성 및 실행할 Bastion 인스턴스를 생성합니다.

**5. CI/CD 구축**

```plaintext
project/
└── pipeline/
    ├── codebuild.tf
    ├── codepipeline.tf
    ├── outputs.tf
    ├── policy.tf
    ├── role.tf
    ├── variable.tf
    └── webhook.tf
```

- **CodeBuild**와 **CodePipeline**을 사용하여 CI/CD 파이프라인을 구성합니다.
- **CodeBuild**는 **Docker 이미지를 빌드**하는 데 사용되며, GitHub에서 소스 코드를 가져와 빌드 프로세스를 시작합니다.
- **CodePipeline**은 **소스 코드의 변경 사항을 감지**하여 자동으로 파이프라인을 실행하며, **최종 애플리케이션을 배포**합니다.
