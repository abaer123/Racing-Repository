### Theme

Use GitLab CICD templates to enhance our already existing cicd pipeline and see how the changes will wrap back up into our merge request

### Key Tasks to Complete

# Step 1: Enable Auto DevOps

1. First we will want to use the left hand navigation menu to click through **Build > Pipeline editor*. Right away we can see that we have a pipeline defined, however This only builds our application and runs a unit test. We will be able to upgrade this by including a single template. But first we will want to make sure we are not using the main branch, so in the top left click the branch name and select the branch from our merge request.
  
2. In the top left corner click ensure the tree icon has been clicked so that you can see a list of all included templates. We are going to be adding quite a few in only a few lines of code. Go ahead and the current _stage_ config with the text below: 

    ```
    include:
        - template: Auto-DevOps.gitlab-ci.yml

    stages:
      - build
      - test
      - dast
      - review
      - cleanup
      - staging
      - canary
      - production
      - incremental rollout 10%
      - incremental rollout 25%
      - incremental rollout 50%
      - incremental rollout 100%
      - performance
      - deploy

    ```

    </br>

    We disable the Review app here because we will not be fully deploying out an application in this workshop, but you can learn more about the review app [here](https://docs.gitlab.com/ee/ci/review_apps/) 

    </br>

3. Now your template list view should have a number of deployment, security, and build templates added. You can click an individual template to see what was included, or click the **Full configuration** tab to get a full view of what our cicd really looks like once all the templates are added. 

4. We can also click the **Visualize** tab to get a visual mapping of the current layout of our CICD pipeline.
  
5. If we had any issues in our writing of the pipeline you could click the **Validate** tab to get an exact readout of where their may be issues in your config.

> [Docs on Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/)
<br>


# Step 2: Running Our Pipeline

1. For now the only pipeline configuration we need is defined in the single template that is included, but we understand that 99% of the time this template is not going to be what you need to be production ready. That is why we suggest using it as a base template to get started, then using the extends, override, or rules functionality of GitLab CICD to get the pipeline to where it needs to be.

  > Before doing the next step confirm you are on your merge requests branch and not main

2. Go ahead and click back into the **Edit** tab then scroll to the bottom to click **Commit changes**.

3. This will immediately kick off our new pipeline that we can view by using the left hand navigation menu to click through **Build > Pipelines**. Once on the pipeline view you can also click into the pipeline to see all the jobs that are running. Notice that it isnt the same amount of jobs that we saw in the visualize tab because some jobs were not ran based off of the rules defined on them, specifically that we do not have a deployment path definied or cluster hooked up. We will go to quick break while we wait for this to run.

# Step 3: Root Cause Analysis

1. Now that our pipeline has ran notice that there are two jobs that have already failed! click into either the _dast_ or _code_intelligence_go_ jobs.
  
2. Notice that there are plenty of logs that you could parse through to potentially troubleshoot why these jobs failed, or click **Root cause analysis** for gitlab to tell you why they failed.
  
3. After reading the generated prompt share in the chat why you now feel like your automatically ran job has failed.
  
4. Next we want to use the left hand naviagtion menu to click through **Code > Merge request** and then click into our existing merge request.

> [Docs on Shifting Left](https://about.gitlab.com/topics/ci-cd/shift-left-devops/)
<br>
