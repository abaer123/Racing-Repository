# Create a .gitlab-ci.yml file to see CI in action

## Theme

Build, test, & scan automation through GitLab CI/CD

## Tasks and Steps

* [ ] Enable GitLab CI/CD
  * Ensure that you are on the ***Tanuki-Racing*** project landing page. If you are lost use the breadcrumbs at the top of the page to navigate to ***Tanuki-Racing-Group*** then click into the project.
  * In the previous step we made a small change to our existing pipeline. You may have had some issues with trying to make pipeline changes in the Web IDE so this time we are going to show how easy it is to create a similar pipeline using the built in **Pipeline Editor**
  * Navigate to **Build**>**Pipeline editor** and notice that we already have a defined pipeline which we have seen run in our MR. 
  * Take note of the built in features, namely the **Visualize & Full configuration** options.
  * There also is a **Validate** option that could have helped us if we had messed up when editing in the Web IDE.
  * To see it in action we are going to delete line 15. Once the line is deleted go ahead and click **Validate** & **Validate pipeline**
  * You can then see that the validate tool has identified an issue with your listed stages and that the build stage is needed.
  * This next time however we are going to use **GitLab Auto DevOps** to show how we can quickly spin up a secure pipeline.
  * Remove the placeholder code so that we have an empty file
* [ ] Advanced CI/CD
  * Still within the editor, we just need to add the line below:

    ```
    include:
      - template: Auto-DevOps.gitlab-ci.yml
    ```
  * As Auto DevOps introduces addtional stages, those stages need to be declared within the **stages** section of the _.gitlab-ci.yml_ file. Therefore, add the following lines to your decared stags:

  ```
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

  * Now if you click the **Tree** icon next to the branch dropdown in the top left you can see all the various jobs brought in by our one includes.
  * We can click Full Configuration again to see what rules will actually be applied when our pipeline is ran. 
  * Provide a **Commit message** and click **Commit changes**
  * [ ] Verify Pipeline Run & View Logs
  * Navigate to **CI/CD -> Pipelines**
  * Confirm a new pipeline run is listed
  * Select the pipeline by clicking on its status (*pending*, *running*, *passed*) or pipeline ID

  > Example: #525355261

  * Pick a job that has started or passed and view the trace logs for the selected job
> [Docs for GitLab CICD](https://docs.gitlab.com/ee/ci/)
  * It is out of scope for this workshop to actively deploy out our application, but your Instructor can show you the deployment pipeline and live application here: https://gitlab.com/gitlab-learn-labs/webinars/tanuki-racing/tanuki-racing-application





  


