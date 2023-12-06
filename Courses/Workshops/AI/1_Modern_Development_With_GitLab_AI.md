# :fox: Welcome to the GitLab Duo Workshop :fox:

[[_TOC_]]

## :dart: Introduction

The goal of this workshop is to give you a look into all of the features the GitLab AI team is developing, not just Code Suggestions. We put a big emphasis on trying to help everyone throughout the entire Software Delivery Life Cycle (SDLC) and not just developers on their coding tasks.

![Screenshot_2023-12-01_at_16.59.02](/uploads/95ba3ed6e0410a83fa513352837f3ed7/Screenshot_2023-12-01_at_16.59.02.png){width="30%"}

## :checkered_flag: Get Started

### 1\. Open GitLab Duo Chat

Throughout this workshop, you will get an AI-generated support from GitLab Duo Chat.

- [ ] :computer: To open the chat,
  - In the lower-left corner, select the `Help` icon.
  - Select `GitLab Duo Chat`. A drawer opens on the right side of your screen.
  - Click on one of the pre-defined questions (or ask your own question)
  - Then clear the context by typing `/reset`
  - Finally, delete all previous conversations with the `/clean` message.

### 2\. Enable Code Suggestions

[GitLab's AI-assisted Code Suggestions](https://about.gitlab.com/solutions/code-suggestions/) needs to be enabled for your own account.

- [ ] :robot: Ask GitLab Duo Chat :robot: and follow the instructions

  ```plaintext
  How to enable Code Suggestions to my own account?
  ```

<details>
<summary>Click here to see the expected instructions</summary>

:computer: To enable Code Suggestions in your own account,

- On the left sidebar, select your avatar.
- Right click `Preferences` and open it in a new tab.
- Scroll down to the `Code Suggestions` section and select the `Enable Code Suggestions` checkbox.
- Click the `Save changes` button.

</details>

### 3\. Generate data for your project

You need to execute the pipeline of the project to populate your project with useful information for the remainder of the workshop (like vulnerability report).

- [ ] :robot: Ask GitLab Duo Chat :robot: and follow the instructions

  ```plaintext
  How to execute a pipeline manually in the main branch of my project?
  ```

<details>
<summary>Click here to see the expected instructions</summary>

:computer: To execute a pipeline manually,

- On the left sidebar, select `Build > Pipelines`.
- Select the `Run pipeline` button located in the top right corner.
- Leave the settings at their default values.
- Click the `Run pipeline` button.

</details>

The pipeline is now running and we will come back to it later in the workshop. In the meantime, let's test out other use cases with GitLab Duo Chat

### 4\. Ask more of GitLab Duo Chat

- [ ] :robot: Ask GitLab Duo Chat :robot: to do things like write us starting pipeline configs.

  ```plaintext
  Create a .gitlab-ci.yml configuration file for testing and building a Ruby Sinatra application in a GitLab CI/CD pipeline
  ```
- [ ] :robot: Ask GitLab Duo Chat :robot: to write documentation for the code.
  - On the left sidebar, select `Code > Repository`.
  - Click through lib/tanukiracing/app.rb
  - First click the project name in the top left, then click through tanuki-racing/lib/tanukiracing/app.rb
  - :robot: Ask GitLab Duo Chat :robot:

    ```plaintext
    write documentation for app.rb
    ```
- [ ] Finally, :robot: Ask GitLab Duo Chat :robot: anything. Please share your best questions/responses by commenting this issue and mentioning your friendly instructors.

### 5\. Validate your progress

Congratulations! You have completed this step. Add the label ~"Workshop::Get Started" in this issue.

## :beetle: Analyse vulnerabilities

### 1\. Understand the security posture of your application

- [ ] :computer: Ensure that the most recent pipeline we kicked off is complete
  - On the left sidebar, select `Build > Pipelines`.
  - Spend some time taking a look at all of the information provided to you, exploring the job results and information tabs.
- [ ] :computer: See the overview of the vulnerabilities of your project
  - On the left sidebar, select `Secure > Vulnerability report` to view the full report
  - First, click into any of the vulnerabilities present. Notice that there are a number of vulnerabilities like token leaks & container issues, all of which GitLab will help you quickly fix through policies and the power of one platform. 
- [ ] :computer: Look for the **Possible SQL Injection** vulnerability  
  - Filter the report as follows:
    - `Severity=Low`
    - `Tool=SAST`. 
  - Select the vulnerability
- [ ] :computer: Get more insight about the vulnerability, how it could be exploited, and how to fix it.  
  - At the bottom of the vulnerability’s page, click the `Try it out` button.
  - A popup will open on the right-hand side and you will get an explanation on what a SQL injection risk is and why our application is vulnerable using [GitLab's Explain This Vulnerability](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/index.html#explaining-a-vulnerability) functionality.
  - Check out the **_Fixed Code_** section and we can see that if we add `sanitize_sql(id)` around our `id` value we will be protected from most attacks. We will use this knowledge later in the workshop.

> If you are curious what triggered this response try clicking **_Show prompt_** to see the full prompt sent to GitLab duo to generate the suggested fix.

### 2\. Understand the context of the vulnerability

- [ ] :computer: What if we wanted more context about the specific function above before we go and make a code change?  
  - Let's click the linked file in the **_Location_** section to be brought to our `db.rb` file.
  - Once in the `db.rb` file locate the line the sql injection vulnerability on line 42 and highlight the whole `get_specific` function.
  - You should then see a small question mark to the left of the code, click it.
  - On the right hand side there will now be a small pop up called `Code Explanation` which explains what your highlighted code does in natural language.
  - Try highlighting other code sections as well.
  - At this point we should be fully aware of why and how our SQL injection vulnerability is occurring. 

### 3\. Validate your progress

Congratulations! You have completed this step. Add the label ~"Workshop::Analyse vulnerabilities" in this issue.

## :memo: Create the issue


## :art: Implement the fix

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

* We are then going to navigate to the **_lib/tanukiracing/app.rb_** file to use the new method that we wrote. On a new line within the class use the prompt below to generate our new delete route:

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

* Click enter and then wait a second for the suggestion to come in. As you are given suggestions, hit the TAB key to accept them. If it ever gets stuck try hitting the spacebar or enter.
* Code suggestions will write a very in depth calculator function and eventually will loop but feel free to stop it after 5 methods.
* Code Suggestions dosent just work for ruby files either, and it supports multiple languages per project. Navigate into the **ai-sandbox/** folder for a list of currently up to date projects.
* Choose one of the projects and test out code suggestions to write a hello world example or something more advanced. Your Instructor will give you time to do this now, but also keep in mind that you have access to the infra for another 48 hours to test what you want.
* Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side and write a commit message. Next click **Commit & Push**.
* Next on the resulting dropdown make sure you click commit to our mr branch, then on the popup click the **Go to merge request** button.

## :microscope: Review the code

* Now that we are back in our MR we should see that our code changes have kicked off another run of our pipeline. We have made a number of changes, so lets use the AI **View summary notes** button to add a detailed comment around all of the changes we have made.
* To do this, locate the three dots button next to _Code_ in the top right of the merge request view. Click it, then on the resulting dropdown click the **View summary notes** option.
* You may need to wait for the pipeline that was kicked off to complete, but once it has there will be a quick write up of all the changes you made in the context of the merge request. This functionality also exists in the content of an issue. You can find steps to test that out within the _optional_ issue of this project.
* Now that we have added code and seen the security results we also want to add some testing to make sure it stays secure.
* If we navigate to the changes tab at the top of the MR view we want to locate the changes we made in our db.rb file.
* Next click the three dots at the top right corner of the view for that file.
* Then click **Suggest test cases**, at which point a pop up on the right hand side will appear to give you a number of suggestions of test cases you could add to your project for unit testing.


## :microscope: Troubleshoot broken pipelines

* [ ] Lastly we will show off a feature that can assist you when writing your own pipelines, root cause analysis. This tool makes troubleshooting a failed pipeline a piece of cake.
  * Use the left hand navigation menu to click through **Build \> Pipeline Editor** and change the pipeline config to be the code below:

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

## :rocket: Conclusion