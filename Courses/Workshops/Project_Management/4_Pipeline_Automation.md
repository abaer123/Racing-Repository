# Create a .gitlab-ci.yml file to see CI in action

## Theme

Build, test, & scan automation through GitLab CI/CD

## Tasks and Steps

* [ ] Enable GitLab CI/CD
  * Ensure that you are on the ***Leaderboard-Project*** landing page. If you are lost use the breadcrumbs at the top of the page to navigate to ***Tanuki-Racing-Group*** then click into the project.
  * Next to the *Main* branch dropdown, click the **+** dropdown menu and select **New file**
  * Name your file **.gitlab-ci.yml**



  * Navigate to **CI/CD**>**Editor** and then click **Configure pipeline**
  * remove the placeholder code, then copy and paste the below code as the contents of the file:
  
    ```
    # This file is a template, and might need editing before it works on your project.
    # You can copy and paste this template into a new `.gitlab-ci.yml` file.
    # You should not add this template to an existing `.gitlab-ci.yml` file by using the `include:` keyword.
    #
    # To contribute improvements to CI/CD templates, please follow the Development guide at:
    # https://docs.gitlab.com/ee/development/cicd/templates.html
    # This specific template is located at:
    # https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Bash.gitlab-ci.yml

    # See https://docs.gitlab.com/ee/ci/yaml/index.html for all available options

    # you can delete this line if you're not using Docker
    image: busybox:latest

    before_script:
      - echo "Before script section"
      - echo "For example you might run an update here or install a build dependency"
      - echo "Or perhaps you might print out some debugging details"

    after_script:
      - echo "After script section"
      - echo "For example you might do some cleanup here"

    build1:
      stage: build
      script:
        - echo "Do your build here"

    test1:
      stage: test
      script:
        - echo "Do a test here"
        - echo "For example run a test suite"

    test2:
      stage: test
      script:
        - echo "Do another parallel test here"
        - echo "For example run a lint test"

    deploy1:
      stage: deploy
      script:
        - echo "Do your deploy here"
      environment: production
       ```
  * Provide a **Commit message** and click **Commit changes**
* [ ] Verify Pipeline Run & View Logs
  * Navigate to **CI/CD -> Pipelines**
  * Confirm a new pipeline run is listed
  * Select the pipeline by clicking on its status (*pending*, *running*, *passed*) or pipeline ID

  > Example: #525355261

  * Pick a job that has started or passed and view the trace logs for the selected job
* [ ] Add a new job
  * Navigate to **CI/CD**>**Editor**
  * Using the **test2** job as a guide, create another job called **test3** that has script `cat README.md`
  * Click **Visualize** to visualize the new pipeline with the **test3** job in the **Test** stage
  * Provide a **Commit message** and click **Commit changes**

> [Docs for GitLab CICD](https://docs.gitlab.com/ee/ci/)

* [ ] Verify new job executes
  * Click **View pipeline** or navigate to **CI/CD**>**Pipelines** and select the newly executed pipeline
  * Click on the **test3** job to view the trace logs and confirm the **README.md** contents are displayed
* [ ] Advanced CI/CD
  * Navigate to **CI/CD**>**Editor**
  * Add the below code under your image definition and before the before_script:

    ```
    include:
      - template: Auto-DevOps.gitlab-ci.yml
    ```
  * Now if you click the **Tree** icon next to the branch dropdown in the top left you can see all the various jobs brought in by our one includes.
  * Feel free to commit these changes, the pipeline now will not run unless you imported an application written in a language supported by Heroku build packs. You can add your own application post-workshop.
  * Your instructor will show you far more advanced pipelines here: https://gitlab.com/gitlab-org/gitlab/-/pipelines
  * Notice the Show dependencies capabilities
  * Your instructor will also show a completed Auto DevOps pipeline and walk through all of the jobs that were automatically spun up.