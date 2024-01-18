### Take a look at the results of our pipeline running for the merge request, then merge the code to generate the security reports

### Theme

Following our shift left trend we will see how security results are included throughout each step of the deployment cycle.

# Step 1: Merge Request Security Results

1. Use the left hand navigation menu to click back into **Merge requests** and then click the merge request we created earlier.

2. Right below the approvals section we can see that our **_Code Quality, License Compliance, & Security scanning_** templates we included have generated full security reports unique to this branch for us to view. These reports are generated with each commit so we always know if we have introduced a new bug before its deployed out and disaster strikes.

3. Go ahead and take some time to expand each report and look through the results, then in the **_Security scanning_** section click on any of the critical/high vulnerabilities.
  
4. From this view we can see exactly where it occurred in the code & read up on why its a risk. After taking a look at this we can click the comment icon at the bottom to state that we checked it out and are not worried, then click **Add comment & dismiss**.

5. Next we will want to scroll down and merge our code. At the bottom of the request click **Merge** to kick off our pipeline.
  
6. Once merged use the left hand navigation menu to click through **Build \> Pipelines** and click into the most recently kicked off pipeline. At this point you will go on a quick break until the pipeline completes.

# Step 2: Parsing the Results

1. Now that your **_main_** pipeline has completed the reports under **_Security & Compliance_** have been generated. These reports will only be generated if you run a pipeline against main.
  
2. Use the left hand navigation menu to click through **Secure-\> Security Dashboard**. This will bring up a dashboard view of all of the security vulnerabilities & their counts over time so you can track your work as you secure your project. This dashboard takes a long time to collect data so if yours still has no results your presenter will show you the dashboard of a deployed Tanuki Racing application [here](https://gitlab.com/gitlab-learn-labs/webinars/tanuki-racing/tanuki-racing-application/-/security/dashboard)
  
3. We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Secure -\> Vulnerability Report** to view the full report
  
4. First change the _All tools_ section under **Tools** to just filter on SAST. We can then click into any of the SAST vulnerabilities shown.
  
5. Inside the vulnerability we will want to click the _Explain vulnerability_ button within the **Explain this vulnerability and how to mitigate it with AI** section. This will result in a popup appearing on the right hand side with some information on what the vulnerability is and how you can fix it. The Explain This Vulnerability feature currently works on any SAST vulnerabilities.

# Step 3: Preventive Security Policies

1. We next want to change **Tool** to _Secret Detection_. Notice that the result list is empty! This means we haven't leaked any secure tokens so far. We surely want to keep it that way - it happens far too often.
  
2. To prevent this from ever happening in the future we can set up a new policy to run on all future merge requests. For our use case leaked tokens are easy mistakes that can lead to massive problems so we will create a quick policy to stop that. Use the left hand navigation menu to click through **Secure \> Policies** and then click **New policy**. On the resulting page click **Select policy** under **_Scan result policy_**.
  
3. Add a **name** to the policy, then under the **_Rules_** section we want to select **Security Scan** in the **When** dropdown list. Then we want to change **All scanners** to be **_Secret Detection_** and **All protected branches** to **default branch**.
  
4. Then under actions choose **individual users** as the **_Choose approver type_** and add **_lfstucker_** as the required approver. Next uncheck **Prevent pushing and force pushing**.

> Please ensure you do this step or you will be blocked later on in the workshop

5. Lastly click **Configure with a merge request**. On the resulting merge request click ***merge*** and you will be brought to your new policy project that is applied to our workshop application. If you were to create another merge request with the leaked token still in the code based merging would be prevented until it was removed or you added your approval.
  
6. Lastly use the breadcrumbs at the top of the screen to click into your group, then once again click into your project.

> [Docs for policies](https://docs.gitlab.com/ee/user/application_security/policies/)

# Step 4: Scan Execution Policy

1. Our new secret detection policy will now be enforced with every commit. However approval mistakes happen, so we are going to set an additional scan execution policy to check for secrets that were mistakenly approved daily. 

2. Once again use the left hand navigation menu to click through **Secure > Policies**, then click **New policy**. On the resulting page click **Select policy** under **_Scan execution policy_**.

3. Add a **name** to the policy, description, then under the **_Actions_** section we want to select _Run a_ **Secret Dectection**. Then we want to scroll to the _Conditions_ section and change _Triggers:_ to _Schedules:_, change _specific protected branches_ to **default** branch, then select your timezone.

5. Lastly click **Configure with a merge request**. On the resulting merge request click ***merge*** and you will be brought to your new policy project that is applied to our workshop application. Now this scan will run daily and alert us if a secret was accidentally approved into our default branch.
  
6. Lastly use the breadcrumbs at the top of the screen to click into your group, then once again click into your project.

# Step 5: Secret Detection In Action

1. Now we want to see our scan results policy working in action for secrets detection. From the main page our project lets go ahead and click **Web IDE** in the **Edit** dropdown list.
  
2. Click into the **_cf-sample-scripts/eks.yaml_** file and add a fake AWS token at the end of the line 6. Change the **description** from **_The name of the IAM role for the EKS service to assume._** to **The name of the IAM role for the EKS service to assume, using aws_key_id AKIAIOSF0DNN7EXAMPLE.**.
  
3. Once added click the source control button on the left hand side, add a quick commit message, then click the **down arrow**.
  
4. On the resulting drop down click **Yes** to open a new branch, then click the **_Enter_** key. A new popup will appear where we want to then click **Create MR**

5. Scroll to the bottom, uncheck **_Delete source branch when merge request is accepted_**, and click **Create merge request**
  
6. On the resulting MR notice that our policy requires approval from **_lfstucker_** and is blocked by our two policies before we are able to merge. Wait for the entire pipeline to finish running.

7. When the pipeline is done running you can see that our scan result policy have been enacted restricting us from committing this code. If we did not add a secret token directly to our source code we would be able to merge our code. (you can come back to this merge request to review the blocked merge after the next section)

> [Docs on automatically revoking secrets](https://docs.gitlab.com/ee/user/application_security/secret_detection/#responding-to-a-leaked-secret)
