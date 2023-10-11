IntroductionIn this challenge will walk you through how to set up a child pipelinesStep 01 - Preparing the child pipelineYour security team got wind of all of the security scanning you added to your pipeline and wants it to be added to a new pipeline that they have access to and can control which jobs are ran. To do this we are going to create a child pipeline that we can link from our existing pipeline. In this case we will just be adding the second pipeline to this project, but it could have been added in a separate project and been linked.To create this pipeline we will first want to click the name of our project in the top left then click Web IDE from the main project page. Once in the IDE at the top level of the project we will want to create a new folder and call it security-pipeline.Within the security-pipeline folder lets go ahead and create a new file as well named security.gitlab-ci.yml. Click into that project.Copy and paste the code into the new pipeline config below. Notice that most of it is pulled from the existing pipeline we have been working on throughout the workshop:image: node:17

variables:
  CS_DOCKERFILE_PATH: "../workshop-project/"

include:
  - template: Code-Quality.gitlab-ci.yml
  - template: Jobs/Dependency-Scanning.gitlab-ci.yml
  - template: Jobs/SAST.gitlab-ci.yml
  - template: Jobs/Secret-Detection.gitlab-ci.ymlThis pipeline now has all it needs to run our security tests.Once added click the source control button on the left hand side, add a quick commit message, then click Commit & Push. On the resulting drop down click no to open a new branch and just commit to main. Once done a popup will appear and we want to click Go to project.Once back in the project use the left hand navigation menu to click through Build > Pipeline editor so we can now set up the connection to our security pipeline.Step 02 - Linking the PipelinesFirst we are going to want to remove all of the duplicated code in our existing pipeline. The code below will be our existing pipeline minus everything the security pipeline now covers:stages:
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
  artifacts:
    paths:
      - dist
    expire_in: 1 hour

unit_test:
  stage: test
  before_script:
    - yarn add chai mocha mocha-simple-html-reporter mocha-junit-reporter chai-http mocha-test-url
  after_script:
        - echo "build_app job has run!"
  script:
    - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-junit-reporter --reporter-options mochaFile=./testresults/test-results.xml
    - ./node_modules/mocha/bin/_mocha "test/*.js" --reporter mocha-simple-html-reporter --reporter-options output=./testresults/test-results.html
  needs: []

code_quality:
  stage: test
  script:
    -  echo "This will run code quality in the future"
    - exit 1
  ### This job can run independently of any previous job completion, i.e. build job, in order to execute
  needs: []
  rules:
    - if: $CI_COMMIT_BRANCH == 'main'
      allow_failure: trueLets start by adding a new stage for our child pipeline. Edit the stage section to be the following:stages:
    - build
    - test
    - extra-securityLets also add a job that calls the child pipeline in the security stage:downstream_security:
  stage: extra-security
  trigger:
    include:
          - local: security-pipeline/security.gitlab-ci.ymlLets go ahead and click Commit Changes and use the left hand menu to click through Build > Pipelines, then click the hyperlink from the most recently kicked off pipeline that starts with #. In the pipeline view as the jobs run click into each of them to see how our added child-security-pipeline have changed the output.If you run into any issues you can use the left hand navigation menu to click through Build > Pipelines, click Run pipeline, select child-security-pipeline and click Run pipeline once again.