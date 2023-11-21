### Create a compliance framework that will be enforced when we merge our code into main

### Theme

We are going to be creating a compliance framework that will ensure our pipeline runs the correct jobs in the right order. This ensures no one of the dev team can skip a few steps and introduce a vulnerability

# Step 1: Defining Our Framework

1. First in a new tab navigate [here](https://gitlab.com/gitlab-learn-labs/sample-projects/tanuki-racing-compliance-framework/-/blob/main/.compliance-gitlab-ci.yml) to see the compliance framework we intend on applying to our codebase.
  
2. First take a look at the stages section, where each stage defined must be run in order for each pipeline the framework is applied to. Note that the ***.pre*** stage starts with "." so that it dosent have to be defined to be run.
  
3. Below the stages we define a simple ***compliance_job*** that will run during the ***.pre*** stage that just prints out a message letting the user know the framework has been applied. The ***.post*** job acts similar but print an end message 
  
4. Lastly at the end of the yml the includes section allows pipelines that the framework is applied on to build off of the job definitions. Without it this framework would replace the 
.gitlab-ci.yml file.

> [Docs for Compliance Pipeline](https://docs.gitlab.com/ee/user/group/compliance_frameworks.html#compliance-pipelines)

# Step 2: Applying the framework

1. You can now close this tab and navigate back to your **Workshop Project**. Once there use the left hand navigation menu to click through **Settings > General**. Next scroll down to the ***Compliance framework*** and click the **Choose your framework** dropdown.
  
2. On the resulting drop down select **Tanuki Racing CF** then click **Save changes**.
  
3. Now if you go back to your project home screen by clicking the name of your project in the top left you can see that the framework is applied. Note that our compliance template was defined at the top of the group allowing us to apply it on any projects in the group.