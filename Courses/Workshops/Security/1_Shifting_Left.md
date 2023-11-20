# Create a merge request to add security scans to our pipeline

## Theme

This section focuses on shifting left as a security practice and how your code changes will display security results after a commit rather than months down the line

* [ ] Step 1: Adding Security Scans
  * First make sure that you are on the main page of the project you just forked in. It is best if you have these instructions open in a separate tab/screen while completing the tasks.
  * Once ready use the left hand navigation menu to click through **Build \> Pipeline editor**. Here you will see the current set up of our main branch pipeline. Notice that there are two stages, which are further defined below.
  * This pipeline does very little in terms of security scanning and only has a simple unit test defined currently. Lets go ahead and create a new branch to add out changes. Use the left hand navigation menu to click through **Code \> Branches** then click **New branch**. Name the branch **_secure-pipeline_** and make sure it is based off of **_main_**, then click **Create Branch**.
  * Once again use the left hand navigation menu to click through **Build \> Pipeline editor** to get back to the editor page. Then in the top left of the editor view you can click the branch dropdown to then select **_secure-pipeline_**. We then want to change the pipeline yaml to be the code below:

```plaintext
image: docker:latest

services:
  - docker:dind

variables:
  CS_DEFAULT_BRANCH_IMAGE: $CI_REGISTRY_IMAGE/$CI_DEFAULT_BRANCH:$CI_COMMIT_SHA
  DOCKER_DRIVER: overlay2
  ROLLOUT_RESOURCE_TYPE: deployment
  DOCKER_TLS_CERTDIR: ""  # https://gitlab.com/gitlab-org/gitlab-runner/issues/4501
  RUNNER_GENERATE_ARTIFACTS_METADATA: "true"
  DAST_BAS_DISABLED: "true"
  CI_DEBUG_TRACE: "true"
  # CI_PROJECT_PATH_SLUG: "tanukiracing"
  SECRET_DETECTION_EXCLUDED_PATHS: "./Courses/**"
  

stages:
  - build
  - test

include:
  - template: Jobs/Test.gitlab-ci.yml
  - template: Jobs/Container-Scanning.gitlab-ci.yml
  - template: Code-Quality.gitlab-ci.yml
  - template: Jobs/Dependency-Scanning.gitlab-ci.yml
  - template: Jobs/SAST.gitlab-ci.yml
  - template: Jobs/Secret-Detection.gitlab-ci.yml
  - template: Jobs/SAST-IaC.gitlab-ci.yml

build:
  stage: build
  variables:
    IMAGE: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG:$CI_COMMIT_SHA
  script:
    - docker info
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build -t $IMAGE .
    - docker push $IMAGE

sast:
  variables:
      SEARCH_MAX_DEPTH: 12
```

* First looking at the **_include_** section you can see that a number of security templates have been brought into our project. These define different scans and jobs that will now be ran based off of our **_stages_**. To get a better look into the templates you can click **Full configuration** which will show the true pipeline yaml with all of the templates brought in. You can also click the branch icon in the top left to then click into a specific template to get its definition.
* Click **Edit** again to be brought back to our normal editor. Notice that we have defined an additional job to override one of the SAST jobs we have brought in through the **_Jobs/SAST.gitlab-ci.yml_** template.
* Now that our changes are in lets click **Commit changes** at the bottom of the page.

> [Docs for GitLab CICD](https://docs.gitlab.com/ee/ci/)

* [ ] Step 2: Ask GitLab Duo
  * What if we hadnt known where to find our running pipelines? Or we wanted to learn more about the includes keyword in the pipeline above? We can use the new GitLab Duo Chatbot to do that and more.
  * Click the **? Help** button in the bottom left of the screen, then click **Ask GitLab Duo.** This will open up a chat prompt on the right hand side of the screen for you to type your questions. Go ahead and type "What Security features does GitLab have?"
  * For the rest of the workshop you can use this chat bot to ask any questions that may come up. You can even ask it coding questions if you get stuck!
  
* [ ] Step 3: Creating the Merge Request
  * Now to actually merge in the code we want to use the left hand navigation menu to click through **Code \> Branches** & then click **Merge request** in the secure-pipeline section. **ENSURE YOU HAVE REMOVED THE FORK RELATIONSHIP BEFORE DOING THIS**
  * On the resulting page scroll down to the **_Merge options_** and uncheck **Delete source branch when merge request is accepted**. You can leave the rest of the settings as is then click **Create merge request**.
  * first resolve any merge conflicts that may exist, but you should see a pipeline kick off. If you click the hyperlink it will bring you to the pipeline view where you can see all of the various jobs that we added to our yaml file. While this runs we are going to move forward to set up our compliance framework pipeline but we will check back in a bit to see the results of our scanners.
