# Introduction

In this challenge will walk you through how to set up a child pipelines

# Step 01 - Preparing the child pipeline

1. Your security team got wind of all of the security scanning you added to your pipeline and wants it to be added to a new pipeline that they have access to and can control which jobs are ran. To do this we are going to create a child pipeline that we can link from our existing pipeline. In this case we will just be adding the second pipeline to this project, but it could have been added in a separate project and been linked.
2. To create this pipeline we will first want to click the name of our project in the top left then click **Web IDE** from the main project page. Once in the IDE at the top level of the project we will want to create a new folder and call it **security-pipeline**.
3. Within the **_security-pipeline_** folder lets go ahead and create a new file as well named **security.gitlab-ci.yml**. Click into that project.
4. Copy and paste the code into the new pipeline config below. Notice that most of it is pulled from the existing pipeline we have been working on throughout the workshop:

   ```plaintext
   image: docker:latest
   
   include:
     - template: Code-Quality.gitlab-ci.yml
     - template: Jobs/Dependency-Scanning.gitlab-ci.yml
     - template: Jobs/SAST.gitlab-ci.yml
     - template: Jobs/Secret-Detection.gitlab-ci.yml
   ```
5. This pipeline now has all it needs to run our security tests.
6. Once added click the source control button on the left hand side, add a quick commit message, then click **Commit & Push**. On the resulting drop down click no to open a new branch and just commit to **_main_**. Once done a popup will appear and we want to click **Go to project**.
7. Once back in the project use the left hand navigation menu to click through **Build \> Pipeline editor** so we can now set up the connection to our security pipeline.

# Step 02 - Linking the Pipelines

1. First we are going to want to remove all of the duplicated code in our existing pipeline. The code below will be our existing pipeline minus everything the security pipeline now covers:

```plaintext
image: docker:latest

cache:
  - key: cache-$CI_COMMIT_REF_SLUG
    fallback_keys:
      - cache-$CI_DEFAULT_BRANCH
      - cache-default
    paths:
      - vendor/ruby

services:
  - docker:dind

variables:
  CS_DEFAULT_BRANCH_IMAGE: $CI_REGISTRY_IMAGE/$CI_DEFAULT_BRANCH:$CI_COMMIT_SHA
  DOCKER_DRIVER: overlay2
  ROLLOUT_RESOURCE_TYPE: deployment
  DOCKER_TLS_CERTDIR: ""  # https://gitlab.com/gitlab-org/gitlab-runner/issues/4501
  RUNNER_GENERATE_ARTIFACTS_METADATA: "true"

stages:
  - build
  - test
 
build:
  stage: build
  variables:
    IMAGE: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG:$CI_COMMIT_SHA
  before_script:
    - docker info
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
  script:
    - docker build -t $IMAGE .
  after_script:
    - docker push $IMAGE
  artifacts:
    paths:
      - Gemfile.lock
    expire_in: 1 hour

test:
 stage: test
 image: gliderlabs/herokuish:latest
 script:
   - cp -R . /tmp/app
   - /bin/herokuish buildpack test
 after_script:
   - echo "Our race track has been tested!"
 needs: []
 rules:
   - if: $CI_COMMIT_BRANCH == 'main'

super_fast_test:
 stage: test
 script:
   - echo "If your not first your last"
   - return 1
 needs: []
 rules:
   - if: $CI_COMMIT_BRANCH == 'main'
     allow_failure: true
```
2. Lets start by adding a new stage for our child pipeline. Edit the stage section to be the following:

   ```plaintext
   stages:
       - build
       - test
       - extra-security
   ```
3. Lets also add a job that calls the child pipeline in the security stage:

   ```plaintext
   downstream_security:
     stage: extra-security
     trigger:
       include:
             - local: security-pipeline/security.gitlab-ci.yml
   ```
4. Lets go ahead and click **Commit Changes** and use the left hand menu to click through **Build \> Pipelines**, then click the hyperlink from the most recently kicked off pipeline that starts with **<span dir="">_#_</span>**. In the pipeline view as the jobs run click into each of them to see how our added **_child-security-pipeline_** have changed the output.

> If you run into any issues you can use the left hand navigation menu to click through **Build \> Pipelines**, click **Run pipeline**, select **_child-security-pipeline_** and click **Run pipeline** once again.
