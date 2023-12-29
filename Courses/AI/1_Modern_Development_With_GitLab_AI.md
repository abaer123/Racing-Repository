## Theme

The goal of this workshop is to give you a look into all of the features the GitLab AI team is developing, not just Code Suggestions. We put a big emphasis are trying to help developers throughout the entire SDLC and not just their coding tasks.

**PLEASE NOTE:** Many of these features are in the [experimental phase](https://docs.gitlab.com/ee/policy/experiment-beta-support.html#experiment), which means they may be prone to outages as the dev team is actively working on enhancing them. If this occurs and you didnt see a feature demo live that you hopped to see, please reach out to the account team and we will provide recordings & additional info on when it may be available.

## 1\. Setup your testing environment :tools:

* [ ] **Step 0: Import Project**
  * [ ] Click this link to download the export of this project: 

    [2023-09-07_16-01-235_gitlab-learn-labs_sample-proje_export.tar.gz](/uploads/e57e7b5a351f91638996d990d88f9688/2023-09-07_16-01-235_gitlab-learn-labs_sample-proje_export.tar.gz)
  * [ ] Navigate to the group that you redeemed for this workshop in the pre-work and click **Create new project,** then **Import project,** and lastly the **GitLab export** option
  * [ ] Give your project a name and then click **Import project**. Give it a few seconds and then the project will be imported along with a new set of these issues for you to follow along with.
* [ ] **Step 1: Enable Code Suggestions**
  * [ ] 1.1 (Instructor-only) Enable in the top-level group. 
    * We are going to start by showing you that we have already turned on the needed settings to enable experimental AI features at the top level. This will be a step you can do on your own group later, but for now your presenter will show you how to enable code suggestions at the top level group.
    * Your presenter will ensure they are at the top level of the group, then use the left hand navigation menu to click through **Settings \> General** then expand the **_Permissions and group features_** section.
    * Once here they will scroll down and click the checkbox in **_Code Suggestions_** to enable code suggestions for all projects in the group (including the group you just redeemed)
    * For all experimental AI features they will then want to enable **Experiment features** and **Third-party AI services** as well.
  * [ ] 1.2 Enable code suggestions individually. **This step is required, or Code Suggestions will not work for you later on**
    * [ ] In the top left corner and click our profile icon, then right click **preferences** and select **_open in new tab_**.
    * [ ] Scroll down to the **_Code Suggestions_** section and click **Enable Code Suggestions**. Then scroll to the end of the page and click **Save changes**.
    * [ ] Code Suggestions may now be used in the Web IDE.
  * [ ] 1.3 (Optional) Setup Code Suggestions in your own IDE
    * [ ] After the workshop, if you want to try out Code Suggestions in Visual Studio Code, IntelliJ, or other supported IDEs, [follow our docs](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/#supported-editor-extensions). There is also an optional issue in this project that will walk you through the setup.
    * [ ] In case you run into a bug or don't see the plugin, make sure your IDE and GitLab extension or plugin are up to date

## 2\. Guided Exploration / Workshop :steam_locomotive:

> Presenter: please pause to make sure everyone has enabled code suggestions on their own account as well

* [ ] **Step 2: Pipeline Kickoff & GitLab Chat**``
  * [ ] Use the left hand navigation menu to click through **Build \> Pipelines** and click **Run pipeline** in the top right.
  * [ ] Make sure the **_main_** branch is selected and click **Run pipeline**.
  * [ ] Let these pipelines run as we will come back to it later in the workshop.
  * What if we had not known where to access the pipelines from or how to open an MR? You now can use the new AI chat feature called Ask GitLab Duo. Go ahead and click the **? Help** button in the bottom left then select **Ask GitLab Duo**
  * You can ask GitLab Duo any related GitLab questions, but to start lets ask `Where can I find my running pipelines?`, to which the chat will respond with the path to the pipelines page. Other examples of questions you can ask are `What is a fork?`, `Summarize the issue <Link to issue>`, or even ask it for quick code suggestions like `Write a tic tac toe game in Javascript`. Please note that asking for code suggestions takes a few minutes so it is best to test out post workshop.
  * Next, we can ask the chat `Does gitlab have any ai or ml features?`, to get linked to the docs that list all of our existing AI features. Keep in mind that you will have a short trial period post workshop with access to this group that has all of the features enabled, so feel free to try any out that we dont directly cover during the workshop.
  * While the pipeline runs, your Instructor will take some time to go through the current AI/ML features GitLab offers [here](https://docs.gitlab.com/ee/user/ai_features.html)

* [ ] **Step 3: Security Results & AI**
  * [ ] Use the left hand navigation menu to click through **Build \> Pipelines** and ensure that the most recent pipeline we kicked off on branch **main** is complete.
  * [ ] Spend some time taking a look at all of the information provided to you, exploring the job results and information tabs. The security tab displays the vulnerabilities detected in this specific pipeline.
  * [ ] Use the left hand navigation menu and click through **Secure -\> Vulnerability report** to view the full report.
  * [ ] In the **_Vulnerability Report_** we click into any of the vulnerabilities present.
  * [ ] Look for the **Possible SQL Injection** vulnerability by filtering the **_Severity_** to **_Low_** and the **_Tool_** to **_SAST_**. Click into the vulnerability
  * [ ] Click the **Explain this Vulnerability** button for an explanation on what a SQL injection risk is and why our application is vulnerable.
  * [ ] At the end of the explanation, check out the **_Fixed Code_** section and we can see that if we add `sanitize_sql(id)` around our queries, they will be protected from this kind of attack. **Keep this tab open** as we will use the knowledge later in the workshop.
  * [ ] If you are curious what triggered this response try clicking **_Show prompt_** to see the full prompt sent to GitLab duo to generate the suggested fix.
* [ ] **Step 4: Explain This Code**
  * [ ] What if we wanted more context about the specific function above before we went and made a code change? Under **Location**, click the link to the line of code where the vulnerability appears. This opens a new tab and takes you to the `db.rb` file.
  * [ ] Locate line 42 where the sql injection vulnerability was occurring, and highlight the whole **_get_specific_** function.
  * [ ] You should see a small question mark to the left of the code, click it.
  * [ ] On the right hand side there will now be a small pop up to explain what your highlighted code does in natural language. Try highlighting other code sections as well.

At this point we should be fully aware of why and how our SQL injection vulnerability is occurring. In the next section we will use Code Suggestions to fix it.

> [Docs for GitLab application security](https://docs.gitlab.com/ee/user/application_security/)

* [ ] **Step 5: Coding with Code Suggestions**
  * [ ] Now that we have more context around the SQL injection vulnerability, let's go try to fix it and do some development with GitLab Code Suggestions.
  * [ ] Go back to the tab showing the vulnerability, and duplicate this tab - **right click** / **duplicate** or just copy/paste the url into a new tab. This way you'll keep the vulnerability explanation.
  * [ ] Under **Linked items** click **Create issue.** The issue is populated with the vulnerability link, description, and details. In the issue description, remove `/confidential` at the end, uncheck `This issue is confidential...` and validate with **Create issue**.

    For public projects, you may want to keep security work confidential until vulnerabilities are fixed. For private projects however, it's a good practice to make security work visible. By tracking it with issues, we make sure that everyone can contribute, and is aware of the progress and effort dedicated to remediation.
    * [ ] If you let that `/confidential` part in and created the issue, expand the right sidebar, and under **Confidentiality** :eye:, click **Edit** then **Turn off**. Refresh that page now that confidentiality is off.
  * [ ] Click the blue **Create merge request** button.
  * [ ] On the resulting page uncheck Mark as draft, leave all other settings as is and scroll to the bottom then click **Create merge request**. Note that the link in that MR description links it to the issue, which is itself linked to the vulnerability, making it easy to navigate back and forth.
  * [ ] In the Merge Request, click **Code** in the top right, then click **Open in Web IDE**. Or use the `.` shortcut to achieve the same.
  * [ ] Once in the IDE, navigate through **lib/tanukiracing/db.rb,** line 42. Let's use what we learned using `Explain This Vulnerability` to change the line of code to this:

    ```plaintext
    Leaderboard.first.where("player = ?", sanitize_sql(id))
    ```

    or simply

  ```plaintext
  Leaderboard.first.where("player = ?", id)
  ```

  > Please note that you may see a slightly different suggested explanation or fix as they are generated by an AI. Both options presented above correctly prevent SQL injection.
  * [ ] Notice that our db.rb file does not have a delete leader method. Our project manager has made it clear we need this asap to get rid of fake records, so lets go ahead and use the prompt below on a new line after the **get_specific** to generate this function:

    ```plaintext
    # write a delete leaderboard function using active record
    ```
  * [ ] Navigate to the **_lib/tanukiracing/app.rb_** file to use the new method that we wrote. On a new line within the class, for instance **line 70**, use the prompt below to generate our new delete route:

    ```plaintext
    # write a post route that calls the delete_leader function from TanukiRacing::DB
    ```
  * [ ] Now, let's actually use `Code Suggestions` to add a whole new class. We want to add a calculator class to this application so that we can enable calculations in the notes.
  * [ ] Your Project Manager has also asked you to write a brand new calculator class that will eventually be used to add up player track times.
  * [ ] Right click the `lib/tanukiracing` folder \> **new file**. Name it `calc.rb`.
  * [ ] Add the prompt below to let Code Suggestions know what we are trying to write:

  ```plaintext
   #define a calculator class for other functions to use
  ```
  * [ ] Click enter after the last **_'_** and then wait a second for the suggestion to come in. As you are given suggestions, hit the `TAB` key to accept them. If it ever gets stuck, try hitting the space bar or enter.
  * [ ] Code suggestions will write a very in depth calculator function and eventually will loop but feel free to stop it after 5 methods.
  * [ ] Code Suggestions does not just work for ruby files either, and it supports multiple languages. Navigate into the **ai-sandbox/** folder for a list of currently up to date projects.
  * [ ] Choose one of the projects and test out code suggestions to write a hello world example or something more advanced. Your Instructor will give you time to do this now, but also keep in mind that you have access to the infra for another 48 hours to test further, at your own pace.
  * [ ] Commit this code to `main` by clicking the **Source Control** button on the left hand side. Write a commit message and click **Commit to ...**
  * [ ] On the pop-up, click the **Go to merge request** button.

* [ ] **Step 6: AI in the Merge Request**
  * [ ] Now that we are back in our MR, we should see that our code changes have kicked off another run of our pipeline. We have made a number of changes, so let's unfold the **Latest AI-generated summary** section to display a detailed comment around all of the changes we have made.

    You may need to wait for the pipeline that was kicked off to complete, but once it has there will be a quick write up of all the changes you made in the context of the merge request.
  * [ ] To view the history of such summaries, locate the **three dots** button next to _Code_ in the top right of the merge request view. Click it, then on the resulting dropdown click the **View summary notes** option.
  * [ ] This functionality also exists in the content of an issue. You can find steps to test that out within the _optional_ issue of this project.
  * [ ] Once the pipeline is complete, refresh the **Merge Request** page and note that new widgets appeared. Unfold the **Security scanning** widget, and you should see the `Possible SQL injection` vulnerability is now fixed! :tada:
  * [ ] Now that we have added code and seen the security results, we also want to add some testing to make sure it stays secure. Navigate to the **Changes** tab at the top of the MR view and locate our db.rb file.
  * [ ] Click the **three dots** at the top right corner of the view for that file, then **Suggest test cases**, at which point a pop-up on the right-hand side will appear to give you a number of suggestions of test cases you could add to your project for unit testing.

:trophy: Well done! You completed the hands-on portion for this lab! Thank you for following along! 

### 3\. Free Exploration :surfer_tone3:

* [ ]  Check out the [issues](https://gitlab.com/gitlab-learn-labs/sample-projects/ai-workshop/workshop-project/-/issues) for additional steps to enable code suggestions in Visual Studio Code, and to experiment with some of our Plan stage AI/ML features.

> Plan stage AI features typically have a start up time of 24 hours to train themselves, so if you want to see them in action make sure you start those tasks today

> [Docs for GitLab Code Suggestions](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)

* [ ] Upload your own project on the platform
  * [ ] Please make sure your company policy approves the uploading of this project to the lab environment.
  * [ ] Create a group for your own projects, to keep the workspace tidy
  * [ ] Inside this group, select **New Project** and either
    * [ ] Select `Create blank project` if you want to push a git repo
    * [ ] Select `Import project` to see other options

* [ ] Give us feedback! We'd be delighted to hear back from you. Either on improvements that can be made, issues you faced along the way, or to share the success you were able to achieve while testing those features. 
  * Feel free to create an issue and tag your instructor, in this project or on https://gitlab.com/gitlab-org/gitlab/
  * For feedback on a specific feature, click on it in [this docs page](https://docs.gitlab.com/ee/user/ai_features.html) to find the `feedback issue`. Feel free to add comments, screenshots, to tag your lab instructor as well.
