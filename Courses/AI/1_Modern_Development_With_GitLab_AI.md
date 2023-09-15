## Theme

The goal of this workshop is to give you a look into all of the features the GitLab AI team is developing, not just Code Suggestions. We put a big emphasis are trying to help developers throughout the entire SDLC and not just their coding tasks.

**PLEASE NOTE:** Many of these features are in the [experimental phase](https://docs.gitlab.com/ee/policy/experiment-beta-support.html#experiment), which means they may be prone to outages as the dev team is actively working on enhancing them. If this occurs and you didnt see a feature demo live that you hopped to see, please reach out to the account team and we will provide recordings & additional info on when it may be available.

## Key Tasks to Complete

* [ ] Step 0: Importing Project
  * First please click this link to download the export of this project: 

    [2023-09-07_16-01-235_gitlab-learn-labs_sample-proje_export.tar.gz](/uploads/e57e7b5a351f91638996d990d88f9688/2023-09-07_16-01-235_gitlab-learn-labs_sample-proje_export.tar.gz)
  * Once downloaded, navigate to the group that you redeemed for this workshop in the pre-work and click **Create new project,** then **Import project,** and lastly the **GitLab export** option.
  * Give your project a name and then click **Import project**. Give it a few seconds and then the project will be imported along with a new set of these issues for you to follow along with.
* [ ] Step 1: Enable Code Suggestions
  * We are going to start by showing you that we have already turned on the needed settings to enable experimental AI features at the top level. This will be a step you can do on your own group later, but for now your presenter will show you how to enable code suggestions at the top level group.
  * Your presenter will ensure they are at the top level of the group, then use the left hand navigation menu to click through **Settings \> General** then expand the **_Permissions and group features_** section.
  * Once here they will scroll down and click the checkbox in **_Code Suggestions_** to enable code suggestions for all projects in the group (including the group you just redeemed)
  * For all experimental AI features they will then want to enable **Experiment features** and **Third-party AI services** as well.
  * Now we all of the AI features have been enabled at the top group level, but now we need to enable it for ourselves.
  * **Ensure as a student you complete this step or Code Suggestions will not work for you later on**. In the top left corner and click our profile icon, then right click **preferences** and select **_open in new tab_**.
  * Scroll down to the **_Code Suggestions_** section and click **Enable Code Suggestions**. Then scroll to the end of the page and click **Save changes**. Navigate back to your project screen before moving on.
  * We have now turned all of the existing AI/ML features in our groups & Code Suggestions within the built in Web IDE. If you want to try out Code Suggestions in VSC, there is an optional issue that will walk you through the setup you can do post workshop.

> Presenter: please pause to make sure everyone has enabled code suggestions on their own account as well

* [ ] Step 2: Pipeline Kickoff & GitLab Chat
  * Use the left hand navigation menu to click through **Build \> Pipelines** and click **Run pipeline** in the top right.
  * Make sure the **_main_** branch is selected and click **Run pipeline**.
  * Then let this pipeline run as we will come back to it later in the workshop.
  * What if we hadnt known where to access the pipelines from or how to open an MR? You now can use the new AI chat feature called Ask GitLab Duo. Go ahead and click the **? Help** button in the bottom left then select **Ask GitLab Duo**
  * You can ask GitLab Duo any related GitLab questions, but to start lets ask "Where can I find my running pipelines?", to which the chat will respond with the path to the pipelines page. Other examples of questions you can ask are "What is a fork?", "Summarize the issue \<Link to issue\>", or even ask it for quick code suggestions like "Write a tic tac toe game in Javascript". Please note that asking for code suggestions takes a few minutes so it is best to test out post workshop.
  * Next we can ask the chat "Does gitlab have any ai or ml features?" To get linked to the docs that list all of our existing AI features. Keep in mind that you will have a short trial period post workshop with access to this group that has all of the features enabled, so feel free to try any out that we dont directly cover during the workshop.
  * While the pipeline runs your Instructor will take some time to go through the current AI/ML features GitLab offers [here](https://docs.gitlab.com/ee/user/ai_features.html)
* [ ] Step 3: Security Results & AI
  * We can check the status of our pipeline by using the left hand navigation to click through **Build \> Pipelines** the security features the platform offers.
  * Next use the left hand navigation menu to click through **Build \> Pipelines** and ensure that the most recent pipeline we kicked off is complete.
  * Spend some time taking a look at all of the information provided to you, exploring the job results and information tabs.
  * We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Secure -\> Vulnerability report** to view the full report
  * Once in the **_Vulnerability Report_** we first can click into any of the vulnerabilities present.
  * Next look for the **Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')** or **_CWE-89 in db.py_** vulnerability and click into one of them. We can see that this vulnerability was triggered by a SQL injection risk. Click the **try it out** button for an explanation on what a SQL injection risk is and why our application is vulnerable.
  * At the end of the report check out the **_Fixed Code_** section and we can see that if we add\_ `sql.escape_string(query)`\_ or `sanitize_sql(username)` around our queries they will be safe. We will use this knowledge later in the workshop.
* [ ] Step 4: Explain This Code
  * What if we wanted more context about the specific function above before we went and made a code change? Lets click **project overview** in the top left to get back to the main page of your application. From here we will click through the notes & db.py files, **notes \> db.py**.
  * Once in the db.py file locate the line the sql injection vulnerability was occurring on and highlight the entire function.
  * You should then see a small question mark to the left of the code, click it.
  * On the right hand side there will now be a small pop up to explain what your highlighted code does in natural language. Try highlighting other code sections as well.
  * At this point we should be fully aware of why and how our SQL injection vulnerability is occurring. In the next section we will use Code Suggestions to fix it

> [Docs for GitLab application security](https://docs.gitlab.com/ee/user/application_security/)

* [ ] Step 5: Coding with Code Suggestions
  * Now that we have more context around the SQL injection vulnerability lets go try to fix it and do some development with GitLab Code Suggestions.
  * Before we make any code changes we will want to create a merge request to track our work. Use the left hand navigation to click through **Code \> Branches**.
  * We then want to click **New Branch**, name it **_AI-Test_**, then click **Create branch**. On the resulting page click **Create merge request**.
  * On the resulting page uncheck **Mark as draft**, leave all other settings as is and scroll to the bottom then click **Create merge request**.
  * Next click **Code** in the top right, then click **Open in Web IDE**.
  * Once in the IDE navigate through **notes/db.py** and take a look at the function on line 102. We can see that it is clearly one of the functions that was listed as vulnerable to SQL Injections.
  * Specifically on line 111 lets used what we learned using Explain This Vulnerability to change the line of code to this:

  ```plaintext
  cur.execute(sql.escape_string(query))
  ```

  > Please note that the suggested change my have been different depending on which sql vulnerability you looked at
  * Now lets actually use Code Suggestions to add a whole new class. We want to add a calculator class to this application so that we can enable calculations in the notes.
  * First right click the **notes** folder then click **new file**. Name this new file **_calc.py_**.
  * We then want to add the prompt below to let Code Suggestions know what we are trying to write:

  ```plaintext
   '''
   define a calculator class for other functions to use
   '''
  ```
  * Click enter after the last **_'_** and then wait a second for the suggestion to come in. As you are given suggestions, hit the TAB key to accept them. If it ever gets stuck try hitting the space bar or enter.
  * Code suggestions will write a very in depth calculator function and eventually will loop but feel free to stop it after 5 methods.
  * Code Suggestions dosent just work for python files either, and it supports multiple languages per project. Navigate into the **ai-sandbox/** folder for a list of currently up to date projects.
  * Choose one of the projects and test out code suggestions to write a hello world example or something more advanced. Your Instructor will give you time to do this now, but also keep in mind that you have access to the infra for another 48 hours to test what you want.
  * Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side, start to write a commit message and notice how it will use AI/ML to write a commit message based off of the changes you have made. Add a commit message then click **Commit & Push**.
  * Next on the resulting dropdown make sure you click commit to our mr branch, then on the popup click the **Go to merge request** button.
* [ ] Step 6: AI in the Merge Request
  * Now that we are back in our MR we should see that our code changes have kicked off another run of our pipeline. We have made a number of changes, so lets use the AI **View summary notes** button to add a detailed comment around all of the changes we have made.
  * To do this, locate the three dots button next to _Code_ in the top right of the merge request view. Click it, then on the resulting dropdown click the **View summary notes** option.
  * You will may need to wait for the pipeline that was kicked off to complete, but once it has there will be a quick write up of all the changes you made in the context of the merge request. This functionality also exists in the content of an issue. You can find steps to test that out within the _optional_ issue of this project.
  * Now that we have added code and seen the security results we also want to add some testing to make sure it stays secure.
  * If we navigate to the changes tab at the top of the MR view we want to locate our new calc.py file.
  * Next click the three dots at the top right corner of the view for that file.
  * Then click **Suggest test cases**, at which point a pop up on the right hand side will appear to give you a number of suggestions of test cases you could add to your project for unit testing.
  * That is the end of the hands on portion for this lab, but if you check out the [issues](https://gitlab.com/gitlab-learn-labs/sample-projects/ai-workshop/workshop-project/-/issues) there are additional steps to enable code suggestions in VSC and show off some of our Plan stage AI/ML features

> Plan stage AI features typically have a start up time of 24 hours to train themselves, so if you want to see them in action make sure you start those tasks today

> [Docs for GitLab Code Suggestions](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)