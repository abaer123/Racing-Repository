* [ ] Step 1: Set Up Merge Request Suggested Reviewers
  * First make sure we are in the **_workshop-project_** you set up during the hands on portion of the lab. Within this project we will want to use the left hand navigation menu to click through **Settings \> Merge requests**
  * Scroll down to the bottom of the page and click the checkbox in the **_Suggested reviewers_** section
  * With our AI features enabled we will now want to Create an MR to be the home of all of the information related to coding changes we make. Go ahead and use the left hand navigation menu again to click through **Repository \> Branches** then click **New branch** in the top right.
  * Name the branch "ai-assisted" then click **Create branch**. After creating there should now be a banner at the top of your screen where you can click **Create merge request**, go ahead and click that.
  * Uncheck **_Mark as draft_**, leave all other settings as is and scroll to the bottom to click **Create merge request**.
  * As you test out various Code Suggestions features make sure to occasionally commit them to the AI assisted branch to generate data for your merge request. Suggested reviewers takes 24 hours to train its model, but after the 24 hours when you try to assign a reviewer it will make judgements based on which parts of the code were made and who has done the most work in those files.

> [Docs for GitLab Suggested Reviewers](https://docs.gitlab.com/ee/user/project/merge_requests/reviews/data_usage.html)

* [ ] Step 2: Summarize Issue Changes
  * This functionality will act very similar to the summarize merge request functionality that was covered during the workshop, just at the issue level. Go ahead and use the left hand navigation menu to click through **Plan \> Issues** then click **New issue.**
  * On the resulting form be as prescriptive as you want and feel free to make the issue about anything. Be sure to fill out as many fields and options as you can to get a good grasp of what is/isnt pulled into the issue summary.
  * When done click **Create issue** at the bottom of the page. This will then open the issue view.
  * You may have to scroll a bit to be right above the **Activity** section, and once there click **View summary.**
  * A summary that is only visible to you will appear that can help you get a quick description of everything that is going on with the issue. You can imagine the value of this tool as issues grow in complexity.
* [ ] Step 3: Summarize My Merge Request Review
  * To get the true value of this feature you will need to involve someone else that also has a GitLab.com account. You will want to add them to your project with at least _Developer_ level access under **Manage \> Members**
  * Once you have done that, navigate to one of the Merge Request you have open (either the one from the workshop or the one for Suggested Reviewers). Make sure you have already made some code changes within the content of the merge request.
  * Have them complete a normal code review on your code, making sure they make multiple comments and suggestions.
  * When they go to click **Finish review** make sure on the resulting popup you also click **Summarize my pending comments.**
  * This will make sure the final review comment is a good summary of all of the changes you have suggested.
  * Click submit review so that other team members involved in the issue can benefit from the summary as well.
* [ ] Step 4: Show Deployment Frequency Forecast
  * We have also applied AI to our current analytics features like a deployment frequency forecast chart. Because we arent doing real development in this demo space it would be difficult to show off, but you can [check out the docs on it here](https://docs.gitlab.com/ee/user/ai_features.html#show-deployment-frequency-forecast)
* [ ] Step 5: Pipeline Root Cause Analysis
  * Lastly we will show off a feature that isnt listed in the docks yet call pipeline root cause analysis. This tool makes troubleshooting a failed pipeline far easier.
  * Use the left hand navigation menu to click through **Build \> Pipeline schedules** and change the pipeline config to be the code below:

  ```yaml
  image: docker:latest
  
  services:
    - docker:dind
  
  variables:
    DOCKER_DRIVER: overlay2
    DOCKER_TLS_CERTDIR: ""  # https://gitlab.com/gitlab-org/gitlab-runner/issues/4501
    ROLLOUT_RESOURCE_TYPE: deployment
    RUNNER_GENERATE_ARTIFACTS_METADATA: "true"
  
  stages:
    - build
    - test
    - feature
    - staging
    - cleanup
    - production
  
  include:
    - template: Jobs/SAST.gitlab-ci.yml
  
  build:
    stage: build
    variables:
      IMAGE: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG:$CI_COMMIT_SHA
    before_script: 
      - apt list --installed 
    script:
      - docker info
      - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
      - docker build -t $IMAGE .
      - docker push $IMAGE
  ```
  * Next scroll down and click **Commit changes**. We then will want to use the left hand navigation menu to click through **Build \> Pipelines** and click into the last kicked off pipeline.
  * We expect the _build_ job to fail, and once it does lets click into the job. At the top of the view we want to click **Root cause analysis,** at which point a pop up will appear on the left hand side of the screen with an in depth analysis on why you job failed. In this case its because of the `apt list --installed` line we added to the build job which our image does not support.