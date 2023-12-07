## Create a .gitlab-ci.yml file to see CI in action

### Theme

Build, test, & scan automation through GitLab CI/CD

### Tasks and Steps

# Step 1: Enable GitLab CI/CD

1. Ensure that you are on the ***Tanuki-Racing*** project landing page. If you are lost use the breadcrumbs at the top of the page to navigate to ***Tanuki-Racing-Group*** then click into the project.
  
2. In the previous step we made a small change to our existing pipeline. You may have had some issues with trying to make pipeline changes in the Web IDE so this time we are going to show how easy it is to create a similar pipeline using the built in **Pipeline Editor**
  
3. Navigate to **Build**>**Pipeline editor** and notice that we already have a defined pipeline which we have seen run in our MR. 
  
4. Take note of the built in features, namely the **Visualize & Full configuration** options.
  
5. There also is a **Validate** option that could have helped us if we had messed up when editing in the Web IDE.
  
6. To see it in action we are going to delete line 15. Once the line is deleted go ahead and click **Validate** & **Validate pipeline**
  
7. You can then see that the validate tool has identified an issue with your listed stages and that the build stage is needed.
  
8. This next time however we are going to use **GitLab Auto DevOps** to show how we can quickly spin up a secure pipeline.
  
9. Remove the placeholder code so that we have an empty file

# Step 2: Auto DevOps CI/CD

1. While you are still in the pipeline editor with an empty configuration file, we just need to add the line below:

    ```
    include:
      - template: Auto-DevOps.gitlab-ci.yml
    ```

1. Now if you click the **Tree** icon next to the branch dropdown in the top left you can see all the various jobs brought in by our one includes.

1. We can click Full Configuration again to see what rules will actually be applied when our pipeline is ran. 
  
1. Provide a **Commit message** and click **Commit changes**
  
1. Verify Pipeline Run & View Logs
  
1. Navigate to **Build -> Pipelines**
  
1. Confirm a new pipeline run is listed
  
1. Select the pipeline by clicking on its status (*pending*, *running*, *passed*) or pipeline ID `Example: #525355261``

1. Pick a job that has started or passed and view the trace logs for the selected job

> [Docs for Customizing Auto DevOps in GitLab CI/CD](https://docs.gitlab.com/ee/topics/autodevops/customize.html#customize-gitlab-ciyml)





  


