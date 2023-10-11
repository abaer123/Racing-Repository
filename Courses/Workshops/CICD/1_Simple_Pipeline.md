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

Logan here

3. In the **_unit_test_** job we want to use the **_after_script_** keyword to echo out that the build has completed. First to edit the pipeline we need to click **Edit in pipeline editor**. Once there lets go ahead and add an **_after_script_** to the **_unit_test_** job:

   ```plaintext
   after_script:
       - echo "build_app job has run!"
   ```

   Your new **_unit_test_** job should look like this:

   ```plaintext
   unit_test:
     stage: test
     before_script:
       - yarn add chai mocha mocha-simple-html-reporter mocha-junit-reporter chai-http mocha-test-url
     script:
       - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-junit-reporter --reporter-options mochaFile=./testresults/test-results.xml
       - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-simple-html-reporter --reporter-options output=./testresults/test-results.html
     after_script:
       - echo "build_app job has run!"
   ```
4. Once you have added the code you can click **Commit changes** which should immediately trigger the pipeline to build no issues were detected in the .yml file. For troubleshooting use the **_Validate_** tab to see where your pipeline is broken.
5. To view the job use the left hand navigation menu to click **CI/CD -\> Pipelines** and click the hyperlink of the most recently ran pipeline.

> Example: **_#577244133_**.

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_simple-pipeline_** and click **Run pipeline** once again.

From here you can watch your pipeline run.

6. Feel free to click into the **_unit_test_** job so see the output and look for the messages that we echoed out.
