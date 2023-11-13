# Introduction

In this challenge we will add security testing to our existing pipeline

# Step 01 - Root Cause Analysis

1. What if we hadnt known why our pipeline was failing? Lets use the new Root Cause Analysis feature to help explain why our pipeline failed. Still within the pipeline view go ahead and click the failed _super_fast_test_ job.
2. At the top of the job view there should be a button for **Root Cause Analysis**. Go ahead and click it.
3. On the resulting pop up click **Generate root cause Analysis**. This will generate a reason for why our pipeline failed as well as provide solutions to quickly help you with any cicd issues in the future.

# Step 02 - Preparing the Pipeline

1. First we need to get back to editing our pipeline from the last track. Make sure your still in your **_workshop-project_** space and use the left hand navigation menu to click through **Build -\> Pipeline editor** so we can edit our pipeline .yml file.
2. Under where we define the image for our pipeline we will add the below code to include the SAST template:

   ```plaintext
   include:
     - template: Security/SAST.gitlab-ci.yml
   ```
3. To take a look at the template we just added look near the top of the edit page next to where you can select the branch (branch will show **_main_** right now) there will be a **_tree expand icon_** we want to click. From here we can see a link to all of the templates we currently have included in our pipeline.
4. We then want to click the link for **Jobs/SAST.gitlab-ci.yml** that will open a new window where you can view the contents of the job we have included. Spend some time looking this over then close out the window to get back to our pipeline editor screen.
5. You can also click the **_Full configuration_** to see the complete yaml output of your .gitlab-ci.yml file plus all templates you have included.
6. Now that we have SAST lets add a few more security templates to our project to confirm that our code is secure. Edit your **_includes_** section below to be:

   ```plaintext
   include:
     - template: Code-Quality.gitlab-ci.yml
     - template: Jobs/Dependency-Scanning.gitlab-ci.yml
     - template: Jobs/SAST.gitlab-ci.yml
     - template: Jobs/Secret-Detection.gitlab-ci.yml
   ```
7. We will also now want to edit our stages to ensure we can run all of these templates:

   ```plaintext
   stages:
     - build
     - test
     - security
   ```
8. Also if you click the tree icon or **_Full configuration_** tab you should be able to see the content of all of the new security templates we have added. Before committing we will add some inheritance in the next step.

# Step 03 - Using Inheritance to Enhance Our Pipeline

1. Now we will create a new **_sast_** job that will overwrite some of the functionality from the template we included. The below code sets up the new job and has it run as soon as the pipeline begins:

   ```plaintext
   # overwrite SAST job stage and start job as soon as pipeline begins
   sast:
     stage: security
     needs: []
   ```
2. Before commiting the code we are going to add the **_artifact_** keyword in the next step.

# Step 04 - Storing with Artifacts

1. Let's say a requirement comes in that we want to store the results of the **_build_** job in an artifact. Let's add a change the job to do just that:

```plaintext
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
```
2. Now when we go ahead and click **Commit Changes** and use the left hand menu to click through **Build \> Pipelines**, then click the hyperlink from the most recently kicked off pipeline that starts with **<span dir="">_#_</span>**. First we can see the changes that took place by using inheritance on the **_sast_** job & we will wait for the pipeline to complete before moving on to the next step. If you got lost at any point you can just merge in the **_extended-sast_** branch as well.

   > Note that we have also added a new stage which continues to run even though our **_code_quality_** job is still failing
3. We are then going to grab the build artifact we specified in the pipeline. There are a few different ways to get them, but we are just going to use the left hand menu to click through **Build \> Pipelines** where in the most recent pipeline that kicked off you should see a download icon. Click that icon then click **build_app:archive**.
4. Go ahead and inspect the artifact you just downloaded, this will be the results of the **_build_app_** artifact we added. You can also download and inspect the sast scan results.
