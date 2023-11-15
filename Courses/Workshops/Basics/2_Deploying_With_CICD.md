## Theme

Use GitLab CICD templates to enhance our already existing cicd pipeline and see how the changes will wrap back up into our merge request

## Key Tasks to Complete

* [ ] Step 1: Enable Auto DevOps
  * First we will want to use the left hand navigation menu to click through **CI/CD > Editor*. Right away we can see that we have a pipeline defined, however most of the jobs that are ran are fake. We will be able to fix this by including a single template. But first we will want to make sure we are not using the main branch, so in the top left click the branch name and select the branch from our merge request.
  * In the top left corner click ensure the tree icon has been clicked so that you can see a list of all included templates. We are going to be adding quite a few in only a few lines of code. Go ahead and replace all of the current cicd text with the code below to bring in GitLab Auto DevOps: 

    ```
    variables:
      REVIEW_DISABLED: "true"


    include:
    - template: Auto-DevOps.gitlab-ci.yml
    ```

    </br>

    We disable the Review app here because we will not be fully deploying out an application in this workshop, but you can learn more about the review app [here](https://docs.gitlab.com/ee/ci/review_apps/) 

    </br>


  * Now your template list view should have a number of deployment, security, and build templates added. You can click an individual template to see what was included, or click the **View merged YAML** tab to get a full view of what our cicd really looks like once all the templates are added. 
  * We can also click the **Visualize** tab to get a visual mapping of the current layout of our CICD pipeline.
  * If we had any issues in our writing of the pipeline you could click the **Validate** tab to get an exact readout of where their may be issues in your config.

> [Docs on Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/)
<br>


* [ ] Step 1: Enable Auto DevOps
  * For now the only pipeline configuration we need is defined in the single template that is included, but we understand that 99% of the time this template is not going to be what you need to be production ready. That is why we suggest using it as a base template to get started, then using the extends, override, or rules functionality of GitLab CICD to get the pipeline to where it needs to be.
  * Go ahead and click back into the **Edit** tab then scroll to the bottom to click **Commit changes**.
  * This will immediately kick off our new pipeline that we can view by using the left hand navigation menu to click through **CI/CD > Pipelines**. Once on the pipeline view you can also click into the pipeline to see all the jobs that are running. Notice that it isnt the same amount of jobs that we saw in the visualize tab because some jobs were not ran based off of the rules defined on them.
  * Next use the left hand navigation menu to click **Merge Requests** then click our merge request. You should also see the pipeline running here. We will go to quick break while we wait for this to run.

> [Docs on Shifting Left](https://about.gitlab.com/topics/ci-cd/shift-left-devops/)
<br>