# Take a look at the results of our pipeline running for the merge request, then merge the code to generate the security reports

## Theme

Following our shift left trend we will see how security results are included throughout each step of the deployment cycle.

* [ ] Step 1: Merge Request Security Results
  * Use the left hand navigation menu to click back into **Merge requests** and then click the merge request we created earlier.
  * Right below the approvals section we can see that our **_Code Quality, License Compliance, & Security scanning_** templates we included have generated full security reports unique to this branch for us to view. These reports are generated with each commit so we always know if we have introduced a new bug before its deployed out and disaster strikes.
  * Go ahead and take some time to expand each report and look through the results, then in the **_Security scanning_** section click on any of the critical/high vulnerabilities.
  * From this view we can see exactly where it occurred in the code & read up on why its a risk. After taking a look at this we can click the comment icon at the bottom to state that we checked it out and are not worried, then click **Add comment & dismiss**.
  * Next we will want to scroll down and merge our code. At the bottom of the request click **Merge** to kick off our pipeline.
  * Once merged use the left hand navigation menu to click through **Build \> Pipelines** and click into the most recently kicked off pipeline. At this point you will go on a quick break until the pipeline completes.
* [ ] Step 2: Parsing the Results
  * Now that your **_main_** pipeline has completed the reports under **_Security & Compliance_** have been generated. These reports will only be generated if you run a pipeline against main.
  * Use the left hand navigation menu to click through **Secure-\> Security Dashboard**. This will bring up a dashboard view of all of the security vulnerabilities & their counts over time so you can track your work as you secure your project. This dashboard takes a long time to collect data so if yours still has no results check out gitlab.com's security dashboard [here](https://gitlab.com/gitlab-org/gitlab/-/security/dashboard)
  * We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Secure -\> Vulnerability Report** to view the full report
  * First change the _All tools_ section under **Tools** to just filter on SAST. We can then click into any of the SAST vulnerabilities shown.
  * Inside the vulnerability we will want to click the _Try it out_ button within the **Explain this vulnerability** section. This will result in a popup appearing on the right hand side with some information on what the vulnerability is and how you can fix it. The Explain This Vulnerability feature currently works on any SAST vulnerabilities.
* [ ] Step 3: Preventive Security Policies
  * We next want to change the filter for **Severity**  to _critical_ & change **Tool** to _Secret Detection_. We can click into any of the vulnerabilities present. We can see that one of our AWS tokens has already been leaked into the codebase.
  * To prevent this from ever happening in the future we can set up a new policy to run on all future merge requests. For our use case leaked tokens can are easy mistakes that can lead to massive problems so we will create a quick policy to stop that. Use the left hand navigation menu to click through **Secure \> Policies** and then click **New policy**. On the resulting page click **Select policy** under **_Scan result policy_**.
  * Add a name to the policy, then under the **_Rules_** section we want to change **All scanners** to be **_Secret Detection_** and **All protected branches** to **default branch**.
  * Then under actions choose **individual users** as the **_Choose approver type_** and add **_lfstucker_** as the required approver and click **Configure with a merge request**. On the resulting merge request click merge and you will be brought to your new policy project that is applied to our workshop application. If you were to create another merge request with the leaked token still in the code based merging would be prevented until it was removed or you added your approval.
  * Before we move on lets go back to our project. Use the breadcrumbs at the top of the screen to click into your group, then once again click into your project.

> [Docs for policies](https://docs.gitlab.com/ee/user/application_security/policies/)

* [ ] Step 4: Take Action Our Vulnerabilities
  * Now that we have a protective policy in place lets go ahead and ensure it works by removing the Secrets currently in the code base. From the main page our project lets go ahead and click **Web IDE**
  * Click into the **_run.py_** file and add our fake token **_aws_key_id = "AKIAIOSF0DNN7EXAMPLE"_** before line 4. Once added click the source control button on the left hand side, add a quick commit message, then click **Commit & Push**
  * On the resulting drop down click **Yes** to open a new branch, then click the **_Enter_** key. A new popup will appear where we want to then click **Create MR**
  * Scroll to the bottom, uncheck **_Delete source branch when merge request is accepted_**, and click **Create merge request**
  * On the resulting MR notice that our policy requires approval from **_lfstucker_** before we are able to merge. In order for us to merge in the future we will have to remove the token and wait for the full pipeline to run.

> [Docs on automatically revoking secrets](https://docs.gitlab.com/ee/user/application_security/secret_detection/#responding-to-a-leaked-secret)