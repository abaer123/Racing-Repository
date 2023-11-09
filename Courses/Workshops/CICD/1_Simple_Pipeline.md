# Introduction

This Challenge will walk through the steps of importing your CI/CD pipeline project and creating a basic pipeline

# Step 01 - Importing basic CI/CD application

1. In a new browser window navigate to this url: https://gitlab.com/gitlab-learn-labs/sample-projects/tanuki-racing.
2. Next click **Fork** in the top right of the screen.
3. Then on the fork project screen in the **_Project URL_** section we want to select our existing Learn Labs group we just created through using the redemption code. Change the name of this workshop to **_workshop-project_** as this is how our project will be referenced for the rest of the workshop. Next click **Fork project**.
4. Wait a few minutes then you should be brought to forked project in your recently created group.
5. You should now be on your **_workshop-project_** project homescreen. We dont want to keep the fork relationship so go ahead and use the left hand navigation menu to click through **Settings -\> General**. Once on the settings page scroll to the bottom and click **Expand** next to advanced.
6. Scroll down again and find the **_Remove fork relationship_** section and click **Remove fork relationship**. Enter the project name in the input, then click confirm. Next we will want to click the name of our project in the top left.

# Step 02 - creating a simple pipeline

1. First click **_workshop-project_** in the top left of the screen. Now that we have our project imported, go ahead and take a look at the **_.gitlab-ci.yml_** file.
2. Notice that we have a simple pipeline already defined. We have two stages, **_build & test_**, as well as an **_build_** job that uses the **_before_script , script, & after_script_** keywords.

3. In the **_test_** job we want to use the **_after_script_** keyword to echo out that the test has completed. First to edit the pipeline we need to click **Edit in pipeline editor**. Once there lets go ahead and add an **_after_script_** to the **_test_** job:

   ```plaintext
   after_script:
      - echo "Our race track has been tested!"
   ```

   Your new **_test_** job should look like this:

   ```plaintext
   test:
    stage: test
    image: gliderlabs/herokuish:latest
    script:
      - cp -R . /tmp/app
      - /bin/herokuish buildpack test
    after_script:
      - echo "Our race track has been tested!"
   ```
4. Once you have added the code you can click **Commit changes** which should immediately trigger the pipeline to build no issues were detected in the .yml file. For troubleshooting use the **_Validate_** tab to see where your pipeline is broken.
5. To view the job use the left hand navigation menu to click **CI/CD -\> Pipelines** and click the hyperlink of the most recently ran pipeline.

> Example: **_#577244133_**.

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_simple-pipeline_** and click **Run pipeline** once again.

From here you can watch your pipeline run.

6. Feel free to click into the **_test_** job so see the output and look for the messages that we echoed out.

* [ ] Step 3: Ask GitLab Duo
  * What if we hadnt known where to find our running pipelines? Or we wanted to learn more about the image keyword in the pipeline above? We can use the new GitLab Duo Chatbot to do that and more.
  * Click the **? Help** button in the bottom left of the screen, then click **Ask GitLab Duo.** This will open up a chat prompt on the right hand side of the screen for you to type your questions. Go ahead and type "What CICD keywords can I use in GitLab?"
  * For the rest of the workshop you can use this chat bot to ask any questions that may come up. You can even ask it coding questions if you get stuck!
  
