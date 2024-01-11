# Welcome to the GitLab Duo Workshop :fox:

[[_TOC_]]

## :dart: Introduction

The goal of this workshop is to give you a look into all of the features the GitLab AI team is developing, not just Code Suggestions. We put a big emphasis on trying to help everyone throughout the entire Software Delivery Life Cycle (SDLC) and not just developers on their coding tasks.

**PLEASE NOTE:** Some of these features are in the [experimental phase](https://docs.gitlab.com/ee/policy/experiment-beta-support.html#experiment), which means they may be prone to outages as the dev team is actively working on enhancing them. Check out our docs [here](https://docs.gitlab.com/ee/user/ai_features.html) to see each feature's Maturity level.

## :checkered_flag: Get Started

### 1\. Open GitLab Duo Chat

Throughout this workshop, you will get AI-generated support from GitLab Duo Chat.

- [ ] To open the chat:
  1. In the lower-left corner, select the `Help` icon.
  2. Select `GitLab Duo Chat`. A drawer opens on the right side of your screen.
  3. Click on one of the predefined questions (or ask your own question)
  4. Then clear the context by typing `/reset`
  5. Finally, delete all previous conversations with the `/clean` message.

### 2\. Enable Code Suggestions

 - All of the AI features have already been [enabled at the top group level](https://docs.gitlab.com/ee/user/ai_features.html#enable-aiml-features).
    - Code Suggestions has to be enabled for at least one top-level group your account belongs to. This has already been taken care of in this environment. If you don’t have a role that lets you view the top-level group’s settings, contact a group owner when implementing this feature in your own context.
    - References:
      - [Code Suggestions on GitLab SaaS](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/saas.html)
      - [Enable Code Suggestions on self-managed GitLab](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/self_managed.html#enable-code-suggestions-on-self-managed-gitlab)

 #### Alternative Option

 Ask GitLab Duo Chat :robot: and follow the instructions

  ```plaintext
  How to enable Code Suggestions to my own account?
  ```

## :memo: Plan Our Work

### 1\. Create the issue

We know from our project manager that our task is to secure our GitLab pipeline and fix any pressing vulnerabilities that we find. We will use GitLab's Plan capabilities to track our work.

- [ ] To create our first issue:

1. Use the left hand navigation menu to click through **Plan > issues**
2. Next click **New Issue**
3. Give our issue a quick name, then click the **tanuki icon** in the description section.
4. On the dropdown click **Generate issue description**, then in the popup write "Secure our CICD pipeline and fix the newfound vulnerabilities"
5. Next click **submit**, then notice that the description is filled in for us.
6. We can then assign the issue to ourselves, set a due date, and click **create issue**

## :checkered_flag: Running Our Pipeline

### 1\. Generate data for your project

You need to execute the pipeline of the project to populate your project with useful information for the remainder of the workshop (like vulnerability report).

- [ ] To execute a pipeline manually:

1. Use the left hand navigation menu to click through **Build \> Pipeline editor** and replace the current pipeline config with the code below:

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
      CI_DEBUG_TRACE: "true"
      SECRET_DETECTION_EXCLUDED_PATHS: "Courses"
      

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
      before_script: 
        - apt list --installed   
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

2. Once changed scroll down and click **Commit changes**. Then let this pipeline run as we will come back to it later in the workshop.

> The pipeline is now running and we will come back to it later in the workshop. In the meantime, let's test out other use cases with GitLab Duo Chat

### 2\. Troubleshoot Broken Pipelines

- [ ] To fix our broken pipeline:

1. Notice that the pipeline we kicked off just failed the build job. We are going to use the new Root Cause Analysis feature to fix this issue.  This tool makes troubleshooting a failed pipeline a piece of cake.
2. Use the left hand navigation menu to click through **Build \> Pipelines** and click into the last kicked off pipeline.
3. We expect the _build_ job to fail, and once it does, let's click into the job. At the top of the view we want to click **Root cause analysis,** at which point a pop up will appear on the left hand side of the screen with an in depth analysis on why your job failed. In this case its because of the `apt list --installed` line we added to the build job which our image does not support.
4. To fix this lets use the left hand navigation menu to click through **Build > Pipeline Editor**, then remove the code on lines 33-34 where the before_script code is located.
5. Lastly we can scroll down and click **Commit changes** to kick off our working pipeline.

### 3\. Ask more of GitLab Duo Chat

- [ ] Ask GitLab Duo Chat :robot: to do things like write us starting pipeline configs.

  ```plaintext
  Create a .gitlab-ci.yml configuration file for testing and building a Ruby Sinatra application in a GitLab CI/CD pipeline
  ```
- [ ] Ask GitLab Duo Chat :robot: to write documentation for the code.
  1. On the left sidebar, select `Code > Repository`.
  2. Click through lib/tanukiracing/app.rb
  3. First click the project name in the top left, then click through tanuki-racing/lib/tanukiracing/app.rb
  4. Ask GitLab Duo Chat :robot:

    ```plaintext
    write documentation for app.rb
    ```
- [ ] Finally, Ask GitLab Duo Chat :robot: anything. Please share your best questions/responses by commenting on this issue and mentioning your friendly instructors.

## :beetle: Analyze vulnerabilities

### 1\. Understand the security posture of your application

- [ ] Ensure that the most recent pipeline we kicked off is complete
  1. On the left sidebar, select `Build > Pipelines`.
  2. Spend some time taking a look at all of the information provided to you, exploring the job results and information tabs.
- [ ] See the overview of the vulnerabilities of your project
  1. On the left sidebar, select `Secure > Vulnerability report` to view the full report
  2. First, click into any of the vulnerabilities present. Notice that there are a number of vulnerabilities like token leaks & container issues, all of which GitLab will help you quickly fix through policies and the power of one platform. 
- [ ] Look for the **Possible SQL Injection** vulnerability  
  1. Filter the report as follows:
    - `Severity=Low`
    - `Tool=SAST`. 
  2. Select the vulnerability
- [ ] Get more insight about the vulnerability, how it could be exploited, and how to fix it.  
  1. At the bottom of the vulnerability’s page, click the `Try it out` button.
  2. A popup will open on the right-hand side and you will get an explanation on what a SQL injection risk is and why our application is vulnerable using [GitLab's Explain This Vulnerability](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/index.html#explaining-a-vulnerability) functionality.
  3. Check out the **_Fixed Code_** section and we can see that if we add `sanitize_sql(id)` around our `id` value we will be protected from most attacks. We will use this knowledge later in the workshop.

> If you are curious what triggered this response try clicking **_Show prompt_** to see the full prompt sent to GitLab duo to generate the suggested fix.

### 2\. Understand the context of the vulnerability

- [ ] What if we wanted more context about the specific function above before we go and make a code change?  
  1. Let's click the linked file in the **_Location_** section to be brought to our `db.rb` file.
  2. Once in the `db.rb` file locate the line the sql injection vulnerability on line 42 and highlight the whole `get_specific` function.
  3. You should then see a small question mark to the left of the code, click it.
  4. On the right hand side there will now be a small pop up called `Code Explanation` which explains what your highlighted code does in natural language.
  5. Try highlighting other code sections as well.
  6. At this point we should be fully aware of why and how our SQL injection vulnerability is occurring. 

## :art: Implement the fix

### 1\. Resolve SQL Injection
- [ ] Now that we have more context around the SQL injection vulnerability lets go try to fix it and do some development with GitLab Code Suggestions:

1. Before we make any code changes we will want to create a merge request to track our work.
2. We already have an issue to track this work, so lets use the left hand navigation to click through **Plan \> Issues**.
3. Click into the issue we created earlier, then click **Create merge request**
4. On the resulting page uncheck **Mark as draft**, leave all other settings as is and scroll to the bottom then click **Create merge request**.
5. Next click **Code** in the top right, then click **Open in Web IDE**.
6. Once in the IDE navigate through **lib/tanukiracing/db.rb** and take a look at the function on line 42. Lets used what we learned using Explain This Vulnerability to change the line of code to this:

```plaintext
Leaderboard.first.where("player = ?", sanitize_sql(id))
```

> Please note that the suggested change my have been different depending on which sql vulnerability you looked at

### 3\. Add A New Method

- [ ] Notice that our db.rb file does not have a delete leader method, lets fix that:

1. Our project manager has made it clear we need this asap to get rid of fake records, so lets go ahead and use the prompt below on a new line after the **get_specific** to generate this function:

```plaintext
# write a delete leaderboard function using active record
```

2. We are then going to navigate to the **_lib/tanukiracing/app.rb_** file to use the new method that we wrote. On a new line within the class use the prompt below to generate our new delete route:

```plaintext
# write a post route that calls the delete_leader function from TanukiRacing::DB
```

> Please note that Code Suggestions uses your current file as reference for how to write the function, so you may need to do some slight editing for the final result

### 3\. Create A New Class

- [ ] Your Project Manager has also asked you to write a brand new calculator class that will eventually be used to add up player track times: 

1. First right click the **lib/tanukiracing** folder then right-click **new file**. Name this new file **_calc.rb_**.
2. We then want to add the prompt below to let Code Suggestions know what we are trying to write:

```plaintext
 #define a calculator class for other functions to use
```

3. Click enter and then wait a second for the suggestion to come in. As you are given suggestions, hit the TAB key to accept them. If it ever gets stuck try hitting the spacebar or enter.
4. Code suggestions will write a very in depth calculator function and eventually will loop but feel free to stop it after 5 methods.
5. Code Suggestions dosent just work for ruby files either, and it supports multiple languages per project. Navigate into the **ai-sandbox/** folder for a list of currently up to date projects.
6. Choose one of the projects and test out code suggestions to write a hello world example or something more advanced. Your Instructor will give you time to do this now, but also keep in mind that you have access to the infra for another 48 hours to test what you want.
7. Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side and write a commit message. Next click **Commit & Push**.
8. Next on the resulting dropdown make sure you click commit to our mr branch, then on the popup click the **Go to merge request** button.

## :microscope: Review the code

### 3\. AI In The MR

- [ ] Now that we are back in our MR we should see that our code changes have kicked off another run of our pipeline:

1. We have made a number of changes, so lets use the AI **View summary notes** button to add a detailed comment around all of the changes we have made.
2. To do this, locate the three dots button next to _Code_ in the top right of the merge request view. Click it, then on the resulting dropdown click the **View summary notes** option.
3. You may need to wait for the pipeline that was kicked off to complete, but once it has there will be a quick write up of all the changes you made in the context of the merge request. This functionality also exists in the content of an issue. You can find steps to test that out within the _optional_ issue of this project.
4. Now that we have added code and seen the security results we also want to add some testing to make sure it stays secure.
5. If we navigate to the changes tab at the top of the MR view we want to locate the changes we made in our db.rb file.
6. Next click the three dots at the top right corner of the view for that file.
7. Then click **Suggest test cases**, at which point a pop up on the right hand side will appear to give you a number of suggestions of test cases you could add to your project for unit testing.


## :rocket: Conclusion

1. That is the end of the hands on portion for this lab, but if you check out the [issues](https://gitlab.com/gitlab-learn-labs/sample-projects/ai-workshop/workshop-project/-/issues) there are additional steps to enable code suggestions in VSC and show off some of our Plan stage AI/ML features
