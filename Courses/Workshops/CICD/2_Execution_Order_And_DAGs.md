# Introduction

This Challenge will build off of the simple pipeline we created in the first track and show how you can modify execution order and create a DAG

# Step 01 - Execution Order

1. If you are coming right from the last track you should still be on the pipeline page. If you navigated away, just go back to your project and use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink starting with **_#_** of the most recently run pipeline.

> Example: **_#577244133_**

2. You can see that our pipeline jobs ran sequentially, but what if we wanted 2 jobs to run parallel? We can do that with the **_needs_** keyword. Lets navigate back to our **_.gitlab-ci.yml_** file to accomplish this.
3. To edit our pipeline use the left hand navigation menu to click through **CI/CD -\> Editor**. Right now we only have the **_unit_test_** job running during the test stage, so let's add the **_code_quality_** job below the **_unit_test_** job.:

   ```plaintext
   code_quality:
     stage: test
     script:
       -  echo "This will run code quality in the future"
     ### This job can run independently of any previous job completion, i.e. build job, in order to execute
     needs: []
   ```
4. Now that we have the two jobs we also want to modify the execution order so that they run at the same time. Add the following line to the end of the **_unit_test_** code block:

   ```plaintext
   needs: []
   ```

   The new **_unit_test_** should look like this:

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
     needs: []
   ```
5. Go ahead and click **Commit changes**, then use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink that starts with **_#_** on the most recently kicked off pipeline. As you watch you can see that the two jobs run in parallel.

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_execution-order_** and click **Run pipeline** once again.

# Step 02 - DAG (Directed Acyclic Graph)

1. Now what if we had many stages and relationships between jobs that we wanted to run as soon as possible? We can accomplish this using a DAG. Use the left hand navigation menu to click through **CI/CD -\> Editor** so we can create one.
2. We won't be completing a fully flushed out DAG for this workshop as it is out of scope so we will need some dummy jobs to create what we need. First under the stages section we will want to add a **_deploy_** stage so your code should look like this:

   ```plaintext
   stages:
     - build
     - test
     - deploy
   ```
3. Below are the jobs we want to add under our **_code_quality_** job, there are quite a few so it's better to just copy paste the code:

   ```plaintext
   build_a:
    stage: build
    script:
     - echo "build_a"
   
   build_b:
    stage: build
    script:
     - echo "build_b"
   
   build_c:
    stage: build
    script:
     - echo "build_c"
   
   build_d:
    stage: build
    script:
     - echo "build_d"
   
   build_e:
    stage: build
    script:
     - echo "build_e"
   
   build_f:
    stage: build
    script:
     - echo "build_f"
   
   test_a:
    stage: test
    needs: [build_a]
    script:
     - echo "test_a"
   
   test_b:
    stage: test
    needs: [build_b]
    script:
     - echo "test_b"
   
   test_c:
    stage: test
    needs: [build_c]
    script:
     - echo "test_c"
   
   test_d:
    stage: test
    needs: [build_d]
    script:
     - echo "test_d"
   
   test_e:
    stage: test
    needs: [build_e]
    script:
     - echo "test_e"
   
   test_f:
    stage: test
    needs: [build_f]
    script:
     - echo "test_f"
   
   deploy_a:
    stage: deploy
    needs: [test_a]
    script:
     - echo "deploy_a"
   
   deploy_b:
    stage: deploy
    needs: [test_b]
    script:
     - echo "deploy_b"
   
   deploy_c:
    stage: deploy
    needs: [test_c]
    script:
     - echo "deploy_c"
   
   deploy_d:
    stage: deploy
    needs: [test_d]
    script:
     - echo "deploy_d"
   
   deploy_e:
    stage: deploy
    needs: [test_e]
    script:
     - echo "deploy_e"
   
   deploy_f:
    stage: deploy
    needs: [test_f]
    script:
     - echo "deploy_f"
   ```
4. If you now click the visualize tab you can see just how complex the many stages are. Lets go ahead and go back to the **_Edit_** tab and click **Commit changes**.
5. Once committed use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink starting with **_#_** on the most recently kicked off pipeline. Here we can watch all of the paths of our DAG run at the same time.

> Example: **_#577244133_**

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_DAG_** and click **Run pipeline** once again.
