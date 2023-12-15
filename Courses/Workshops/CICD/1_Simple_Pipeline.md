# Introduction

This Challenge will walk through the steps of importing your CI/CD pipeline project and creating a basic pipeline

# Step 01 - creating a simple pipeline

1. Now that we have our project imported, go ahead and take a look at the **_.gitlab-ci.yml_** file.
2. Notice that we have a simple pipeline already defined. We have two stages, **_build & test_**, as well as an **_build_** job that uses the **_before_script , script, & after_script_** keywords.

3. In the **_test_** job we want to use the **_after_script_** keyword to echo out that the test has completed. First to edit the pipeline we need to click **Edit > Edit in pipeline editor**. Once there lets go ahead and add an **_after_script_** to the **_test_** job:

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
5. To view the job use the left hand navigation menu to click **Build -\> Pipelines** and click the hyperlink of the most recently ran pipeline.

> Example: **_#577244133_**.

> If you run into any issues you can use the left hand navigation menu to click through **Build -\> Pipelines**, click **Run pipeline**, select **_simple-pipeline_** and click **Run pipeline** once again.

From here you can watch your pipeline run.

6. Feel free to click into the **_test_** job so see the output and look for the messages that we echoed out.

# Step 02 - Ask GitLab Duo
  1. What if we hadnt known where to find our running pipelines? Or we wanted to learn more about the image keyword in the pipeline above? We can use the new GitLab Duo Chatbot to do that and more.
  2. Click the **? Help** button in the bottom left of the screen, then click **Ask GitLab Duo.** This will open up a chat prompt on the right hand side of the screen for you to type your questions. Go ahead and type "What CICD keywords can I use in GitLab?"
  3. For the rest of the workshop you can use this chat bot to ask any questions that may come up. You can even ask it coding questions if you get stuck!

# Troubleshooting:

1. If you are experiencing issues with builds failing, check status.gitlab.com for any ongoing incidents with GitLab SaaS Shared Runners. If there is an outage tied to GitLab SaaS Shared Runners, go to **Settings** > **CI/CD** > **Runners** > **Shared Runners** and disable Shared Runners to allow Group and Project Runners in GitLab Learn Labs to take precedence. 
