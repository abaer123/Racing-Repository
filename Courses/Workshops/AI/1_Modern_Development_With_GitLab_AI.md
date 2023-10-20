## Theme

The goal of this workshop is to give you a look into all of the features the GitLab AI team is developing, not just Code Suggestions. We put a big emphasis are trying to help developers throughout the entire SDLC and not just their coding tasks.

**PLEASE NOTE:** Many of these features are in the [experimental phase](https://docs.gitlab.com/ee/policy/experiment-beta-support.html#experiment), which means they may be prone to outages as the dev team is actively working on enhancing them. Additionally there may be a short delay (up to 1 hour) where these features may not appear visual to you as they are being provisioned. If this occurs and you didnt see a feature demo live that you hopped to see, please reach out to the account team and we will provide recordings & additional info on when it may be available.

## Key Tasks to Complete

* [ ] Step 1: Enable Code Suggestions
  * Please notes that a number of top level group settings have been enabled to turn on all of the AI featuers. If you want to do this on your own instance you will have to make sure you enable **Experiment features** and **Third-party AI services** at the top level of your group.
  * **Ensure as a student you complete this step or Code Suggestions will not work for you later on**. In the top left corner and click our profile icon, then right click **preferences** and select **_open in new tab_**.
  * Scroll down to the **_Code Suggestions_** section and click **Enable Code Suggestions**. Then scroll to the end of the page and click **Save changes**. Navigate back to your project screen before moving on.
  * We have now turned all of the existing AI/ML features in our groups & Code Suggestions within the built in Web IDE. If you want to try out Code Suggestions in VSC, there is an optional issue that will walk you through the setup you can do post workshop.

> Presenter: please pause to make sure everyone has enabled code suggestions on their own account as well

* [ ] Step 2: Pipeline Kickoff & GitLab Chat
  * Use the left hand navigation menu to click through **Build \> Pipeline editor** and replace the current pipeline config with the code below:

    ```
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
      # FUZZAPI_PROFILE: Quick-10
      FUZZAPI_POSTMAN_COLLECTION: postman_collection.v2.1.json
      FUZZAPI_TARGET_URL: http://149.248.44.52:7777
      CI_DEBUG_TRACE: "true"
      # CI_PROJECT_PATH_SLUG: "tanukiracing"
      

    stages:
      - build
      - test

    include:
      - template: Jobs/Test.gitlab-ci.yml
      - template: Jobs/Code-Intelligence.gitlab-ci.yml
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

  > Please note you can also merge the **_ai-main-branch_** branch into main as well.
  * Then let this pipeline run as we will come back to it later in the workshop.
  * What if we hadnt known where to access the pipelines from or how to open an MR? You now can use the new AI chat feature called Ask GitLab Duo. Go ahead and click the **? Help** button in the bottom left then select **Ask GitLab Duo**
  * You can ask GitLab Duo any related GitLab questions, but to start lets ask "Where can I find my running pipelines?", to which the chat will respond with the path to the pipelines page. Other examples of questions you can ask are "What is a fork?", "Summarize the issue \<Link to issue\>", or even ask it for quick code suggestions like "Write a tic tac toe game in Javascript". Please note that asking for code suggestions takes a few minutes so it is best to test out post workshop.
  * Next we can ask the chat "Does gitlab have any ai or ml features?" To get linked to the docs that list all of our existing AI features. Keep in mind that you will have a short trial period post workshop with access to this group that has all of the features enabled, so feel free to try any out that we dont directly cover during the workshop.
  * While the pipeline runs your Instructor will take some time to go through the current AI/ML features GitLab offers [here](https://docs.gitlab.com/ee/user/ai_features.html)
* [ ] Step 3: Security Results & AI
  * We can check the status of our pipeline by using the left hand navigation to click through **Build \> Pipelines** the security features the platform offers.
  * Next use the left hand navigation menu to click through **Build \> Pipelines** and ensure that the most recent pipeline we kicked off is complete.
  * Spend some time taking a look at all of the information provided to you, exploring the job results and information tabs.
  * We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Secure -\> Vulnerability report** to view the full report
  * Once in the **_Vulnerability Report_** we first can click into any of the vulnerabilities present. Notice that there are a number of vulnerablilities like token leaks & container issues, all of which GitLab will help you quickly fix through policies and the power of one platform.
  * Next look for the **Possible SQL Injection** vulnerability by filtering the **_Severity_** to ***Low*** and the **_Tool_** to ***SAST***. Click into the vulnerability, then click the **try it out** button for an explanation on what a SQL injection risk is and why our application is vulnerable using GitLab's Explain This Vulnerability funcationality.
  * At the end of the report check out the **_Fixed Code_** section and we can see that if we add `sanitize_sql(id)` around our id value we will be protected from most attacks. We will use this knowledge later in the workshop.
  * If you are curious what triggered this response try clicking ***Show prompt*** to see the full prompt sent to GitLab duo to generate the suggested fix.
* [ ] Step 4: Explain This Code
  * What if we wanted more context about the specific function above before we went and made a code change? Lets click the linked file in the **_Location_** section to be brought to our db.rb file.
  * Once in the db.rb file locate the line the sql injection vulnerability on line 42 and highlight the whole **_get_specific_** function.
  * You should then see a small question mark to the left of the code, click it.
  * On the right hand side there will now be a small pop up to explain what your highlighted code does in natural language. Try highlighting other code sections as well.
  * At this point we should be fully aware of why and how our SQL injection vulnerability is occurring. In the next section we will use Code Suggestions to fix it

> [Docs for GitLab application security](https://docs.gitlab.com/ee/user/application_security/)

* [ ] Step 5: Coding with Code Suggestions
  * Now that we have more context around the SQL injection vulnerability lets go try to fix it and do some development with GitLab Code Suggestions.
  * Before we make any code changes we will want to create a merge request to track our work. Use the left hand navigation to click through **Code \> Branches**.
  * We then want to click **New Branch**, name it **_AI-Test_**, then click **Create branch**. On the resulting page click **Create merge request**.
  * On the resulting page uncheck **Mark as draft**, leave all other settings as is and scroll to the bottom then click **Create merge request**.
  * Next click **Code** in the top right, then click **Open in Web IDE**.
  * Once in the IDE navigate through **lib/tanukiracing/db.rb** and take a look at the function on line 42. Lets used what we learned using Explain This Vulnerability to change the line of code to this:

  ```plaintext
  Leaderboard.first.where("player = ?", sanitize_sql(id))
  ```

  > Please note that the suggested change my have been different depending on which sql vulnerability you looked at
  * Notice that our db.rb file does not have a delete leader method. Our project manager has made it clear we need this asap to get rid of fake records, so lets go ahead and use the prompt below on a new line after the **get_specific** to generate this function:

  ```plaintext
  # write a delete leaderboard function using active record
  ```

  * We are then going to navigate to the ***lib/tanukiracing/app.rb*** file to use the new method that we wrote. On a new line within the class use the prompt below to generate our new delete route:

  ```plaintext
  # write a post route that calls the delete_leader function from TanukiRacing::DB
  ```
  > Please note that Code Suggestions uses your current file as reference for how to write the function, so you may need to do some slight editing for the final result

  * Your Project Manager has also asked you to write a brand new calculator class that will eventually be used to add up player track times.
  * First right click the **lib/tanukiracing** folder then right-click **new file**. Name this new file **_calc.rb_**.
  * We then want to add the prompt below to let Code Suggestions know what we are trying to write:

  ```plaintext
   #define a calculator class for other functions to use
  ```
  * Click enter and then wait a second for the suggestion to come in. As you are given suggestions, hit the TAB key to accept them. If it ever gets stuck try hitting the space bar or enter.
  * Code suggestions will write a very in depth calculator function and eventually will loop but feel free to stop it after 5 methods.
  * Code Suggestions dosent just work for ruby files either, and it supports multiple languages per project. Navigate into the **ai-sandbox/** folder for a list of currently up to date projects.
  * Choose one of the projects and test out code suggestions to write a hello world example or something more advanced. Your Instructor will give you time to do this now, but also keep in mind that you have access to the infra for another 48 hours to test what you want.
  * Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side and write a commit message. Next click **Commit & Push**.
  * Next on the resulting dropdown make sure you click commit to our mr branch, then on the popup click the **Go to merge request** button.
* [ ] Step 6: AI in the Merge Request
  * Now that we are back in our MR we should see that our code changes have kicked off another run of our pipeline. We have made a number of changes, so lets use the AI **View summary notes** button to add a detailed comment around all of the changes we have made.
  * To do this, locate the three dots button next to _Code_ in the top right of the merge request view. Click it, then on the resulting dropdown click the **View summary notes** option.
  * You will may need to wait for the pipeline that was kicked off to complete, but once it has there will be a quick write up of all the changes you made in the context of the merge request. This functionality also exists in the content of an issue. You can find steps to test that out within the _optional_ issue of this project.
  * Now that we have added code and seen the security results we also want to add some testing to make sure it stays secure.
  * If we navigate to the changes tab at the top of the MR view we want to locate the changes we made in our db.rb file.
  * Next click the three dots at the top right corner of the view for that file.
  * Then click **Suggest test cases**, at which point a pop up on the right hand side will appear to give you a number of suggestions of test cases you could add to your project for unit testing.
  
* [ ] Step 7: Pipeline Root Cause Analysis
  * Lastly we will show off a feature can assist you when writting your own pipelines, root cause analysis. This tool makes troubleshooting a failed pipeline a piece of cake.
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
  * That is the end of the hands on portion for this lab, but if you check out the [issues](https://gitlab.com/gitlab-learn-labs/sample-projects/ai-workshop/workshop-project/-/issues) there are additional steps to enable code suggestions in VSC and show off some of our Plan stage AI/ML features



> Plan stage AI features typically have a start up time of 24 hours to train themselves, so if you want to see them in action make sure you start those tasks today

> [Docs for GitLab Code Suggestions](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)
