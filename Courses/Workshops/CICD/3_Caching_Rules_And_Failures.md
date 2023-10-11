IntroductionIn this Challenge we will take our existing pipeline and modify it to show how useful rules and allow_failure can beStep 01 - Adding RulesFirst we need to reset our existing pipeline from the previous track and remove all of the temporary DAG jobs. Make sure your still in your workshop-project project and use the left hand navigation menu to click through CI/CD -> Editor so we can edit our pipeline .yml file.Remove the code that matches the code block below, everything else can stay as is:build_a:
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
  - echo "deploy_f"and fix the stages:stages:
  - build
  - testTo ensure we are all back at the same point here is what your code in .gitlab-ci.yml should be right now:stages:
  - build
  - test

image: node:17

# Cache modules in between jobs
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
  - node_modules/


build_app:
  stage: build
  before_script:
    - export NODE_OPTIONS=--openssl-legacy-provider
  script:
    - yarn install
    - yarn upgrade
    - yarn run build
    - yarn cache clean

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

code_quality:
  stage: test
  script:
    -  echo "This will run code quality in the future"
  ### This job can run independently of any previous job completion, i.e. build job, in order to execute
  needs: []Now it's time to add some rules. Let's start with a basic one on our unit_test job. Let's say we only care about this job running if it is being merged into main. To do this add the rule definition defined below to the end of the unit_test job:rules:
  - if: $CI_COMMIT_BRANCH == 'main'Before committing the changes we are going to add the allow_failure keyword in the next step.🚀 Step 02 - Pipeline Speed With CachingWe saw after committing our last change that the pipeline does take some time to run. Our next few pipelines will build off of our current configuration, so why dont we add some caching for the node_modules so that they dont have to be pulled next time.Lets go ahead add the code below right under our image definition so that our node modules will be cached:# Cache modules in between jobs
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
  - node_modules/Now that this code is added the shared runners will cache this information in S3's for us to pull next time we run the pipeline. Before committing we will complete the next step.Step 03 - Adjusting for FailureWhat if our code_quality job had been failing? Lets add a new line to the script to make it fail:- exit 1What if we also wanted to allow failure on a rule that we had set? Let's test that out on the code_quality job. Change the rules to be the below code:rules:
    - if: $CI_COMMIT_BRANCH == 'main'
      allow_failure: trueYour yaml for the code_quality & unit_test job should look like this:unit_test:
  stage: test
  before_script:
    - yarn add chai mocha mocha-simple-html-reporter mocha-junit-reporter chai-http mocha-test-url
  after_script:
        - echo "build_app job has run!"
  script:
    - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-junit-reporter --reporter-options mochaFile=./testresults/test-results.xml
    - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-simple-html-reporter --reporter-options output=./testresults/test-results.html
  needs: []
  rules:
      - if: $CI_COMMIT_BRANCH == 'main'

code_quality:
  stage: test
  script:
    -  echo "This will run code quality in the future"
    - exit 1
  ### This job can run independently of any previous job completion, i.e. build job, in order to execute
  needs: []
  rules:
    - if: $CI_COMMIT_BRANCH == 'main'
      allow_failure: trueLets go ahead and click Commit Changes and use the left hand menu to click through CI/CD -> Pipelines, then click the hyperlink from the most recently kicked off pipeline that starts with #. In the pipeline view as the jobs run click into each of them to see how our added rules & allow_failure have changed the output. We should also see that the code_quality job fails with a warning but the pipeline succeeds. Later we will add more stages to the pipeline as well so you can see that even though this job fails the pipeline continues to run. Note that if you use the completed rules & allow_failure the target branch for the rule will change.If you run into any issues you can use the left hand navigation menu to click through CI/CD -> Pipelines, click Run pipeline, select rules-and-failures and click Run pipeline once again.