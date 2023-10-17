# Introduction

This Challenge will build off of the simple pipeline we created in the first track and show how you can modify execution order and create a DAG

# Step 01 - Execution Order

1. If you are coming right from the last track you should still be on the pipeline page. If you navigated away, just go back to your project and use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink starting with **_#_** of the most recently run pipeline.

> Example: **_#577244133_**

2. You can see that our pipeline jobs ran sequentially, but what if we wanted 2 jobs to run parallel? We can do that with the **_needs_** keyword. Lets navigate back to our **_.gitlab-ci.yml_** file to accomplish this.
3. To edit our pipeline use the left hand navigation menu to click through **CI/CD -\> Editor**. Right now we only have the **_test_** job running during the test stage, so let's add the **_super_fast_test_** job below the **_test_** job.:

   ```plaintext
    super_fast_test:
      stage: test
      script:
        - echo "If youre not first youre last"
        - return 0
      needs: []
   ```
4. Now that we have the two jobs we also want to modify the execution order so that they run at the same time. Add the following line to the end of the **_test_** code block:

   ```plaintext
   needs: []
   ```

   The new **_test_** should look like this:

   ```plaintext
    test:
      stage: test
      image: gliderlabs/herokuish:latest
      script:
        - cp -R . /tmp/app
        - /bin/herokuish buildpack test
      after_script:
        - echo "Our race track has been tested!"
      needs: []
   ```

5. Go ahead and click **Commit changes**, then use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink that starts with **_#_** on the most recently kicked off pipeline. As you watch you can see that the two jobs run in parallel.

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_execution-order_** and click **Run pipeline** once again.

# Step 02 - DAG (Directed Acyclic Graph)

1. Now what if we had many stages and relationships between jobs that we wanted to run as soon as possible? We can accomplish this using a DAG. Use the left hand navigation menu to click through **CI/CD -\> Editor** so we can create one.
2. We won't be completing a fully flushed out DAG for this workshop as it is out of scope , instead we will be creating a DAG race. First under the stages section we will want to add a **_deploy_** stage so your code should look like this:

   ```plaintext
   stages:
     - build
     - test
     - race
   ```
3. Below are the jobs we want to add under our **_super_fast_test_** job, there are quite a few so it's better to just copy paste the code:

   ```plaintext
   build_car_a:
    stage: build
    script:
     - echo "build_car_a"
   
   build_car_b:
    stage: build
    script:
     - echo "build_car_b"
   
   build_car_c:
    stage: build
    script:
     - echo "build_car_c"
   
   build_car_d:
    stage: build
    script:
     - echo "build_car_d"
   
   build_car_e:
    stage: build
    script:
     - echo "build_car_e"
   
   build_car_f:
    stage: build
    script:
     - echo "build_car_f"
   
   test_car_a:
    stage: test
    needs: [build_car_a]
    script:
     - echo "test_car_a"
   
   test_car_b:
    stage: test
    needs: [build_car_b]
    script:
     - echo "test_car_b"
   
   test_car_c:
    stage: test
    needs: [build_car_c]
    script:
     - echo "test_car_c"
   
   test_car_d:
    stage: test
    needs: [build_car_d]
    script:
     - echo "test_car_d"
   
   test_car_e:
    stage: test
    needs: [build_car_e]
    script:
     - echo "test_car_e"
   
   test_car_f:
    stage: test
    needs: [build_car_f]
    script:
     - echo "test_car_f"
   
   race_car_a:
    stage: race
    needs: [test_car_a]
    script:
     - echo "race_car_a"
   
   race_car_b:
    stage: race
    needs: [test_car_b]
    script:
     - echo "race_car_b"
   
   race_car_c:
    stage: race
    needs: [test_car_c]
    script:
     - echo "race_car_c"
   
   race_car_d:
    stage: race
    needs: [test_car_d]
    script:
     - echo "race_car_d"
   
   race_car_e:
    stage: race
    needs: [test_car_e]
    script:
     - echo "race_car_e"
   
   race_car_f:
    stage: race
    needs: [test_car_f]
    script:
     - echo "race_car_f"
   ```
4. If you now click the visualize tab you can see just how complex the many stages are. Lets go ahead and go back to the **_Edit_** tab and click **Commit changes**.
5. Once committed use the left hand navigation menu to click through **CI/CD -\> Pipelines** and click the hyperlink starting with **_#_** on the most recently kicked off pipeline. Here we can watch all of our cars race to be the first path done.

> Example: **_#577244133_**

> If you run into any issues you can use the left hand navigation menu to click through **CI/CD -\> Pipelines**, click **Run pipeline**, select **_DAG_** and click **Run pipeline** once again.
