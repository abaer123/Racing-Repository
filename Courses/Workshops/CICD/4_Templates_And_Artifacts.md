IntroductionIn this challenge we will add security testing to our existing pipelineStep 01 - Preparing the PipelineFirst we need to get back to editing our pipeline from the last track. Make sure your still in your workshop-project space and use the left hand navigation menu to click through Build -> Pipeline editor so we can edit our pipeline .yml file.Under where we define the image for our pipeline we will add the below code to include the SAST template:include:
  - template: Security/SAST.gitlab-ci.ymlTo take a look at the template we just added look near the top of the edit page next to where you can select the branch (branch will show main right now) there will be a tree expand icon we want to click. From here we can see a link to all of the templates we currently have included in our pipeline.We then want to click the link for Jobs/SAST.gitlab-ci.yml that will open a new window where you can view the contents of the job we have included. Spend some time looking this over then close out the window to get back to our pipeline editor screen.You can also click the Full configuration to see the complete yaml output of your .gitlab-ci.yml file plus all templates you have included.Now that we have SAST lets add a few more security templates to our project to confirm that our code is secure. Edit your includes section below to be:variables:
    CS_DOCKERFILE_PATH: "../workshop-project/"

include:
  - template: Code-Quality.gitlab-ci.yml
  - template: Jobs/Dependency-Scanning.gitlab-ci.yml
  - template: Jobs/SAST.gitlab-ci.yml
  - template: Jobs/Secret-Detection.gitlab-ci.ymlWe will also now want to edit our stages to ensure we can run all of these templates:stages:
  - build
  - unit
  - test
  - securityAlso if you click the tree icon or Full configuration tab you should be able to see the content of all of the new security templates we have added. Before committing we will add some inheritance in the next step.Step 02 - Using Inheritance to Enhance Our PipelineNow we will create a new sast job that will overwrite some of the functionality from the template we included. The below code sets up the new job and has it run as soon as the pipeline begins:# overwrite SAST job stage and start job as soon as pipeline begins
sast:
  stage: security
  needs: []Before commiting the code we are going to add the artifact keyword in the next step.Step 03 - Storing with ArtifactsLet's say a requirement comes in that we want to store the results of the build_app job in an artifact. Let's add a change the job to do just that:build_app:
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
    expire_in: 1 hourNow when we go ahead and click Commit Changes and use the left hand menu to click through Build > Pipelines, then click the hyperlink from the most recently kicked off pipeline that starts with #. First we can see the changes that took place by using inheritance on the sast job & we will wait for the pipeline to complete before moving on to the next step. If you got lost at any point you can just merge in the extended-sast branch as well.Note that we have also added a new stage which continues to run even though our code_quality job is still failingWe are then going to grab the build artifact we specified in the pipeline. There are a few different ways to get them, but we are just going to use the left hand menu to click through Build > Pipelines where in the most recent pipeline that kicked off you should see a download icon. Click that icon then click build_app:archive.Go ahead and inspect the artifact you just downloaded, this will be the results of the build_app artifact we added. You can also download and inspect the sast scan results.